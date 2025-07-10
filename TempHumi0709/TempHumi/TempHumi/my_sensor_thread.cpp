#include "my_sensor_thread.h"
#include <QObject>
#include "gpio.h"
#include "uart.h"
#include "data.h"
#include <QThread>
#include <QDebug>

// my_sensor_thread.cpp
Auto_thread::Auto_thread(serial_dev_info* serial, QObject *parent)
    : QThread(parent), m_serial(serial) {
    }

void Auto_thread::run() {
    m_timer = new QTimer();  // 在子线程中创建 Timer
    connect(m_timer, &QTimer::timeout, this, &Auto_thread::readAllSensors);
    m_timer->start(sensor_frequency*1000);  // 5分钟 = 300000毫秒
    exec();  // 进入事件循环，保持线程运行
}

//void Auto_thread::readAllSensors() {
//    sensor_struct sensor;
//    for (char id : OnlineIds) {
//        if (want_sensor_data(id, m_serial, &sensor)) {
//            PRINT_SENSOR(sensor);
//            saveSensorDataToCSV(sensor);
//            emit dataReady(id, sensor);
//        } else {
//            qWarning() << "Failed to read sensor" << id;
//            emit dataReady(id, sensor);
//            OnlineIds.remove(id);        // remove
//            OfflineIds.append(id);          //add
//        }
//        //QThread::msleep(2000);  // 保持原有的 2秒间隔
//    }
//}
void Auto_thread::readAllSensors() {
    sensor_struct sensor;
    QMutexLocker locker(&m_mutex);  // 加锁保护容器操作
    for (char id : OnlineIds) {
        if (want_sensor_data(id, m_serial, &sensor)) {
            PRINT_SENSOR(sensor);
            saveSensorDataToCSV(sensor);
            emit dataReady(id, sensor);
        } else {
            qWarning() << "Failed to read sensor" << id;
            emit dataReady(id, sensor);
            OnlineIds.removeAll(id);    // QSet 或 removeAll 更安全
            OfflineIds.append(id);
        }
    }
}


void Auto_thread::stopThread() {
    m_timer->stop();  // 停止定时器
    quit();           // 退出事件循环
}

void Auto_thread::setSensorIds(const QVector<char>& ids) {
    m_sensorIds = ids;  // 确保 m_sensorIds 是成员变量
    OnlineIds = ids;  // 确保 m_sensorIds 是成员变量
}

void Auto_thread::setSensorTime(int time) {//second
    sensor_frequency = time;  // 确保 m_sensorIds 是成员变量
}

void Auto_thread::AddSensorId(char id) {
    QMutexLocker locker(&m_mutex);
    if (!m_sensorIds.contains(id)) {
        m_sensorIds.append(id);
        OnlineIds.append(id);
        emit idsUpdated(m_sensorIds);  // 通知主线程
    }
}

void Auto_thread::RemoveSensorId(char id) {
    QMutexLocker locker(&m_mutex);
    if (m_sensorIds.removeAll(id) > 0) {
        OnlineIds.removeAll(id);
        OfflineIds.removeAll(id);
        emit idsUpdated(m_sensorIds);  // 通知主线程
    }
}

void Auto_thread::RenewSensorId(char id) {
    QMutexLocker locker(&m_mutex);
    if (!OnlineIds.contains(id)) {
        OnlineIds.append(id);
        OfflineIds.removeAll(id);
    }
}
