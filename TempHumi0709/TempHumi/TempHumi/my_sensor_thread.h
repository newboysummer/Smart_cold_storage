#ifndef MY_SENSOR_THREAD_H
#define MY_SENSOR_THREAD_H
#include <QObject>
#include "gpio.h"
#include "uart.h"
#include "data.h"
#include <QThread>
#include <QDebug>
#include <QTimer>
#include <QMutex>


// my_sensor_thread.h
#include <atomic>

class Auto_thread : public QThread {
    Q_OBJECT
public:
    explicit Auto_thread(serial_dev_info* serial, QObject *parent = nullptr);
    void stopThread();
    void setSensorIds(const QVector<char>& ids);
    void setSensorTime(int time);
    void AddSensorId(char id);      // 添加数据的槽
    void RemoveSensorId(char id);   // 删除数据的槽
    void RenewSensorId(char id);    // renew


public slots:
    void readAllSensors();

signals:
    void dataReady(char id, const sensor_struct& data); //
    void idsUpdated(const QVector<char>& ids);         //renew ids success signal

protected:
    void run() override;

private:
    serial_dev_info* m_serial;  // 只读指针，指向主线程初始化的设备
    QVector<char> m_sensorIds;
    QVector<char> OnlineIds;
    QVector<char> OfflineIds;
    QMutex m_mutex;
    bool m_running=true;
    QTimer* m_timer = nullptr;  // 初始化
    int sensor_frequency;
};

#endif // MY_SENSOR_THREAD_H
