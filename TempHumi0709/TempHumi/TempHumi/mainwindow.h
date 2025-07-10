#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QDebug>
#include "gpio.h"
#include "my_sensor_thread.h"
#include "uart.h"
#include <QDebug>
#include "nodecard.h"
#include <QVector>
#include <QGridLayout>
#include <QTcpSocket>


QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow {
    Q_OBJECT
public:
    explicit MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:
    void handleSensorData(char id, const sensor_struct &data);  // 新增槽函数
    void onIdsUpdated(const QVector<char>& ids);  // 槽函数：处理子线程的数据更新
    void onReadyRead();

signals:
    void requestAddId(char id);                         //add sensor node
    void requestRemoveId(char id);                      //remove sensor node
    void requestRenewId(char id);                      //remove sensor node

private:
    Ui::MainWindow *ui;
    serial_dev_info m_serial;           // 主线程维护的设备实例
    Auto_thread *m_sensorThread;        // 子线程指针
    QVector<NodeCard*> nodeCards;
    QGridLayout *gridLayout;
    QVector<char*> Ids;
    QStringList nodeNames;              // 将nodeNames改为成员变量
    QTcpSocket* socket;                 // 添加socket成员
    gpio_pin_info gpio;
};

#endif // MAINWINDOW_H
