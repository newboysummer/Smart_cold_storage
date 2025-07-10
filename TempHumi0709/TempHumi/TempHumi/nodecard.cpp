#include "nodecard.h"
#include <QPainter>
#include <QPainterPath>
#include <cmath>

NodeCard::NodeCard(QString name, QWidget *parent) : QWidget(parent) {
    // 关键：让 widget 背景透明，圆角才生效
    setAttribute(Qt::WA_TranslucentBackground);
    setFixedSize(320, 240);

    QVBoxLayout *mainLayout = new QVBoxLayout(this);
    mainLayout->setSpacing(8);
    mainLayout->setContentsMargins(20, 20, 20, 12);

    QHBoxLayout *topLayout = new QHBoxLayout();
    dotLabel = new QLabel();
    dotLabel->setFixedSize(16, 16);
    dotLabel->setStyleSheet("background-color: gray; border-radius: 8px;");
    topLayout->addWidget(dotLabel);

    labelName = new QLabel(name);
    QFont titleFont("Arial", 16, QFont::Bold);
    labelName->setFont(titleFont);
    labelName->setStyleSheet("color: black;");
    topLayout->addWidget(labelName);
    topLayout->addStretch();

    mainLayout->addLayout(topLayout);

    QFont font("Arial", 14);

    labelTemp = new QLabel("Temp: -- °C");
    labelTemp->setFont(font);
    labelTemp->setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Preferred);
    mainLayout->addWidget(labelTemp);

    labelHumi = new QLabel("Humi: -- %");
    labelHumi->setFont(font);
    labelHumi->setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Preferred);
    mainLayout->addWidget(labelHumi);

    labelCo2 = new QLabel("CO2: -- ppm");
    labelCo2->setFont(font);
    labelCo2->setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Preferred);
    mainLayout->addWidget(labelCo2);

    labelTime = new QLabel("Time: --:--:--");
    labelTime->setFont(font);
    labelTime->setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Preferred);
    mainLayout->addWidget(labelTime);

    mainLayout->addSpacing(4);

    isOnline = false;
}

void NodeCard::paintEvent(QPaintEvent *event) {
    Q_UNUSED(event);

        QPainter painter(this);
        painter.setRenderHint(QPainter::Antialiasing);

        // 背景固定为灰色
        QColor backgroundColor("#D3D3D3");

        QPainterPath path;
        path.addRoundedRect(rect(), 20, 20);
        painter.fillPath(path, backgroundColor);
}

void NodeCard::setOnline(bool online) {
    isOnline = online;

    if (online) {
        dotLabel->setStyleSheet("background-color: green; border-radius: 8px;");
        labelTemp->setStyleSheet("color: black;");
        labelHumi->setStyleSheet("color: black;");
        labelCo2->setStyleSheet("color: black;");
        labelTime->setStyleSheet("color: black;");
    } else {
        dotLabel->setStyleSheet("background-color: gray; border-radius: 8px;");
        labelTemp->setText("Temp: -- °C");
        labelHumi->setText("Humi: -- %");
        labelCo2->setText("CO2: -- ppm");
        labelTime->setText("Time: --:--:--");
        labelTemp->setStyleSheet("color: gray;");
        labelHumi->setStyleSheet("color: gray;");
        labelCo2->setStyleSheet("color: gray;");
        labelTime->setStyleSheet("color: gray;");
    }

    update();
}

void NodeCard::setData(int renewTime, float temp, float humi, float co2) {
    //labelTime->setText(QString("时间：%1").arg(renewTime, 6, 10, QChar('0')));
    labelTemp->setText(QString("温度：%1 °C")
                       .arg(std::isnan(temp) ? "--" : QString::number(temp, 'f', 1)));
    labelHumi->setText(QString("湿度：%1 %RH")
                       .arg(std::isnan(humi) ? "--" : QString::number(humi, 'f', 1)));
    labelCo2->setText(QString("CO₂：%1 ppm")
                      .arg(std::isnan(co2) ? "--" : QString::number(co2, 'f', 0)));

    int h = renewTime / 10000;
    int m = (renewTime / 100) % 100;
    int s = renewTime % 100;
    labelTime->setText(QString("时间：%1:%2:%3")
                       .arg(h, 2, 10, QLatin1Char('0'))
                       .arg(m, 2, 10, QLatin1Char('0'))
                       .arg(s, 2, 10, QLatin1Char('0')));

//    QString timeStr = QString("Time: %1:%2:%3")
//                          .arg(h, 2, 10, QLatin1Char('0'))
//                          .arg(m, 2, 10, QLatin1Char('0'))
//                          .arg(s, 2, 10, QLatin1Char('0'));
}
