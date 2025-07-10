#include "mainwindow.h"
#include "gpio.h"
#include "uart.h"
#include "data.h"
#include <QApplication>
#include <QThread>
#include "my_sensor_thread.h"

void init(serial_dev_info* serial);


serial_dev_info serial;
sensor_struct sensor[10];

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    qRegisterMetaType<sensor_struct>("sensor_struct");

    MainWindow w;
    w.show();

    return a.exec();
}




