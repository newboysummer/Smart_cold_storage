#ifndef SENSOR_WORKER_H
#define SENSOR_WORKER_H

// sensorworker.h
#include <QObject>
#include "gpio.h"
#include "uart.h"
#include "data.h"
#include <QThread>

class SensorWorker : public QObject
{
    Q_OBJECT
public:
    explicit SensorWorker(serial_dev_info *serial, QObject *parent = nullptr)
        : QObject(parent), m_serial(serial) {}

public slots:
    void doWork() {
        while(!QThread::currentThread()->isInterruptionRequested()) {
            want_sensor_data('A', m_serial, m_sensor);
            emit newDataAvailable(m_sensor[0]);

            QThread::sleep(5); // 休眠5秒
        }
    }

signals:
    void newDataAvailable(const sensor_struct &data);

private:
    serial_dev_info *m_serial;
    sensor_struct m_sensor[10];
};

#endif // SENSOR_WORKER_H
