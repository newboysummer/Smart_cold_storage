#ifndef DATA_H
#define DATA_H

#include "uart.h"
#include <fstream>
#include <iostream>

//sensor data parameter
typedef struct sensor_struct
{
    int renew_time;
    char ID;
    char if_online;
    int Temperature;
    int Humidity;
    int CO2;
}sensor_struct;

#define PRINT_SENSOR(sensor) \
    printf("--------------------------------------------\n" \
           "\033[1;36mSensor Data:\033[0m\n" \
           "  \033[1;32mTime:\033[0m %02d:%02d:%02d\n" \
           "  \033[1;32mID:\033[0m %c\n" \
           "  \033[1;32mStatus:\033[0m %s\n" \
           "  \033[1;32mTemperature:\033[0m %.1f°C\n" \
           "  \033[1;32mHumidity:\033[0m %.1f%%\n" \
           "  \033[1;32mCO2:\033[0m %dppm\n" \
           "---------------------------------------------\n", \
           /* 时间分解：HH:MM:SS */ \
           ((sensor).renew_time / 10000) % 100, \
           ((sensor).renew_time / 100) % 100, \
           (sensor).renew_time % 100, \
           /* 传感器ID */ \
           (sensor).ID, \
           /* 在线状态（带颜色） */ \
           (sensor).if_online ? "\033[1;32mOnline\033[0m" : "\033[1;31mOffline\033[0m", \
           /* 温湿度（除以10保留1位小数） */ \
           float((sensor).Temperature)/10, \
           float((sensor).Humidity)/10, \
           /* CO2浓度 */ \
           (sensor).CO2)

bool data_extract(const char* str, sensor_struct* sensor_data);
char cat_name(std::string str);
bool wakeup_sensor_node(serial_dev_info* serial,char target);
bool receive_sensor_node(serial_dev_info* serial, const char* rcv_buffer, char wanted_name);
bool want_sensor_data(char name ,serial_dev_info* serial ,sensor_struct* sensor_data);
std::string getCurrentDateString();
void saveSensorDataToCSV(sensor_struct& data);
void updateSensorWithLocalTime(sensor_struct* sensor);
void sensor_offline(sensor_struct* sensor,char name);

#endif
