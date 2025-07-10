#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QDebug>
#include "gpio.h"
#include "my_sensor_thread.h"
#include "uart.h"
#include "nodecard.h"
#include <QTcpSocket>


#define updata_frequency updata_gap;
#define sensor_frequency wakeup_gap;
int wakeup_gap=60;//second
int updata_gap=60;//second

// mainwindow.cpp
MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent), ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    QWidget *centralWidget = new QWidget(this);
    gridLayout = new QGridLayout(centralWidget);
    gridLayout->setSpacing(30);
    gridLayout->setAlignment(Qt::AlignCenter);
    centralWidget->setLayout(gridLayout);
    setCentralWidget(centralWidget);
    this->showFullScreen();
    nodeNames.append("A");

    for (int i = 0; i < nodeNames.size(); ++i) {
        NodeCard *card = new NodeCard(QString("Node %1").arg(nodeNames[i]), this);
        nodeCards.append(card);
        gridLayout->addWidget(card, i / 2, i % 2);
    }

    // 连接到 Python 服务器
    socket = new QTcpSocket(this);
    socket->connectToHost("127.0.0.1", 12345);
    if (!socket->waitForConnected(1000)) {
        qDebug() << "连接Python后台服务失败";
        //socket->deleteLater();
        //return;
    }

    // 当有数据到来，触发 onReadyRead
    connect(socket, &QTcpSocket::readyRead,
           this, &MainWindow::onReadyRead,Qt::DirectConnection);

    // 1. 初始化串口设备（主线程）
    if (uart_init(&m_serial)) {
        qCritical() << "Failed to initialize serial port";
        return;
    }
    gpio=my_init_gpio(38);

    // 2. 创建并配置子线程
    m_sensorThread = new Auto_thread(&m_serial, this);  // 传递设备指针
    connect(m_sensorThread, &Auto_thread::dataReady,
            this, &MainWindow::handleSensorData);
    connect(this, &MainWindow::requestAddId,
            m_sensorThread, &Auto_thread::AddSensorId);
    connect(this, &MainWindow::requestRemoveId,
            m_sensorThread, &Auto_thread::RemoveSensorId);
    connect(this, &MainWindow::requestRenewId,
            m_sensorThread, &Auto_thread::RenewSensorId);
    connect(m_sensorThread, &Auto_thread::idsUpdated,
            this, &MainWindow::onIdsUpdated);

    // 3. 设置要读取的传感器ID（例如'A','B','C'）
    m_sensorThread->setSensorIds({'A'});
    m_sensorThread->setSensorTime(wakeup_gap);

    // 4. 启动线程
    m_sensorThread->start();
}

MainWindow::~MainWindow()
{
    if (m_sensorThread) {
        m_sensorThread->stopThread();  // 使用公共方法替代直接访问
        m_sensorThread->quit();
        m_sensorThread->wait(1000);
        delete m_sensorThread;
    }
    my_close_gpio(&gpio);
    delete ui;
}

void MainWindow::handleSensorData(char id, const sensor_struct &data)
{
    QString idStr(id);
    int index = nodeNames.indexOf(idStr);
    if (index >= 0 && index < nodeCards.size()) {
        if (data.if_online) {
            nodeCards[index]->setOnline(true);
            nodeCards[index]->setData(
                data.renew_time,
                float(data.Temperature) / 10,
                float(data.Humidity) / 10,
                float(data.CO2)
            );
        } else {
            nodeCards[index]->setOnline(false);
            nodeCards[index]->setData(
                data.renew_time,
                NAN,
                NAN,
                NAN
            );
        }
    } else {
        qDebug() << "❌ 未找到 ID 对应的 NodeCard:" << idStr;
    }

    // 无论在线/离线都发给 Python
    if (socket && socket->state() == QAbstractSocket::ConnectedState) {
        QString dataStr = QString("%1 %2 %3 %4 %5\n")
            .arg(id)
            .arg(data.Temperature / 10.0)
            .arg(data.Humidity / 10.0)
            .arg(data.CO2)
            .arg(static_cast<int>(data.if_online));
        socket->write(dataStr.toUtf8());
        socket->flush();
        socket->waitForBytesWritten(1000);
        qDebug() << "发送数据到Python后台:" << dataStr;
    } else {
        qDebug() << "❌ socket 未连接，无法发送数据";
    }
}

void MainWindow::onIdsUpdated(const QVector<char>& ids) {

    QStringList newNames;
    for (char id : ids) {
        newNames << QString(id);
    }
    newNames.sort();

    QVector<NodeCard*> newCards;

    for (const QString& name : newNames) {
        int oldIndex = nodeNames.indexOf(name);
        if (oldIndex >= 0) {
            // 旧的卡片，保留
            newCards.append(nodeCards[oldIndex]);
        } else {
            // 新的卡片
            NodeCard* card = new NodeCard(QString("Node %1").arg(name), this);
            newCards.append(card);
        }
    }

    // 删除旧中不存在的新卡片
    for (int i = 0; i < nodeCards.size(); ++i) {
        QString id = nodeNames[i];
        if (!newNames.contains(id)) {
            gridLayout->removeWidget(nodeCards[i]);
            delete nodeCards[i];
        }
    }

    nodeNames = newNames;
    nodeCards = newCards;

    // 清空 gridLayout 再重新 add
    QLayoutItem* item;
    while ((item = gridLayout->takeAt(0)) != nullptr) {
        // nothing
    }
    for (int i = 0; i < nodeCards.size(); ++i) {
        gridLayout->addWidget(nodeCards[i], i/2, i%2);
    }

    centralWidget()->update();
}

void MainWindow::onReadyRead()
{
    QByteArray data = socket->readAll();           // 读所有收到的数据
    QString msg = QString::fromUtf8(data).trimmed();

    qDebug() << "收到数据:" << msg;

    if (msg.startsWith("ADD ")) {
        QString value = msg.mid(4).trimmed();
        qDebug() << "✅ 收到 ADD 命令，参数:" << value;

        // 确保字符串非空且第一个字符有效
        if (!value.isEmpty()) {
            char idChar = value.at(0).toLatin1(); // 获取第一个字符转为char
            emit requestAddId(idChar); // 发射信号
        } else {
            qWarning() << "ADD 命令后缺少参数!";
        }
    }
    if (msg.startsWith("DEL ")) {
        QString value = msg.mid(4).trimmed();
        qDebug() << "✅ 收到 DEL 命令，参数:" << value;

        // 确保字符串非空且第一个字符有效
        if (!value.isEmpty()) {
            char idChar = value.at(0).toLatin1(); // 获取第一个字符转为char
            emit requestRemoveId(idChar); // 发射信号
        } else {
            qWarning() << "ADD 命令后缺少参数!";
        }
    }
    if (msg.startsWith("RENEW ")) {
        QString value = msg.mid(6).trimmed();
        qDebug() << "✅ 收到 RENEW 命令，参数:" << value;

        // 确保字符串非空且第一个字符有效
        if (!value.isEmpty()) {
            char idChar = value.at(0).toLatin1(); // 获取第一个字符转为char
            emit requestRenewId(idChar); // 发射信号
        } else {
            qWarning() << "ADD 命令后缺少参数!";
        }
    }
    if (msg.startsWith("START")) {
        qDebug() << "✅ 收到 START 命令";
        set_high(&gpio);
    }
    if (msg.startsWith("STOP")) {
        qDebug() << "✅ 收到 STOP 命令";
        set_low(&gpio);
    }
}

