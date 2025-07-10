#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include "data.h"
#include "uart.h"
#include <time.h>
#include <unistd.h>
#include <fstream>
#include <iostream>
#include <chrono>
#include <iomanip>
#include <sstream>
#include <ctime>

#define MAX_STR_LEN 128
#define sensor_time_out 7
#define sensor_offline_gate 3
#define rcv_string_len 18

void updateSensorWithLocalTime(sensor_struct* sensor) {
    // 获取当前系统时间
    time_t rawtime;
    struct tm* timeinfo;

    time(&rawtime);              // 获取Unix时间戳
    timeinfo = localtime(&rawtime); // 转换为本地时间结构体

    // 更新传感器数据结构
    sensor->renew_time = (int)(timeinfo->tm_hour * 10000 + timeinfo->tm_min*100+timeinfo->tm_sec); // 编码为HHMM格式
    // 示例输出：14:30 → 1430 (char)
}

/**
 * @brief 从字符串中提取传感器数据
 * @param str 输入字符串
 * @param Temperature 温度输出指针
 * @param Humidity 湿度输出指针
 * @param CO2 CO2浓度输出指针
 * @param ID 传感器ID输出指针
 * @return 成功返回true，失败返回false
 */
bool data_extract(const char* str, sensor_struct* sensor_data) {
    // 参数有效性检查
    if (str == NULL || sensor_data== NULL) {
        fprintf(stderr, "Error: NULL pointer argument\n");
        return false;
    }

    int len=127;

    for (int index = 0; index <= len - 17; index++) {
        if (str[index] == 's') {  // 找到传感器数据起始标记
            // 提取传感器ID
            sensor_data->ID = str[index + 1];

            // 提取温度（带符号）
            int sign = (str[index + 2] == '-') ? -1 : 1;
            sensor_data->Temperature = sign * (
                (str[index + 3] - '0') * 1000 +
                (str[index + 4] - '0') * 100 +
                (str[index + 5] - '0') * 10 +
                (str[index + 6] - '0'));

            // 提取湿度（带符号）
            sign = (str[index + 7] == '-') ? -1 : 1;
            sensor_data->Humidity = sign * (
                (str[index + 8] - '0') * 1000 +
                (str[index + 9] - '0') * 100 +
                (str[index + 10] - '0') * 10 +
                (str[index + 11] - '0'));

            // 提取CO2浓度
            sensor_data->CO2 = (
                (str[index + 12] - '0') * 10000 +
                (str[index + 13] - '0') * 1000 +
                (str[index + 14] - '0') * 100 +
                (str[index + 15] - '0') * 10 +
                (str[index + 16] - '0'));

            //sensor online
            sensor_data->if_online=1;

            //renew time
            updateSensorWithLocalTime(sensor_data);

            // 验证数据结束标记
            if (index + 17 < len && str[index + 17] == 'p') {
                return true;
            }

            fprintf(stderr, "Error: Invalid data format at position %d\n", index);
            return false;
        }
    }

    fprintf(stderr, "Error: Sensor data marker 's' not found\n");
    return false;
}

char cat_name(std::string str){

    char name=0;

    int len=127;
    for (int index = 0; index <= len - rcv_string_len; index++) {
        if (str[index] == 's') {  // 找到传感器数据起始标记
            if(str[index+17] == 'p'){ //find the end mark
                // 提取传感器ID
                name = str[index + 1];
                printf("Data from node:\"%c\"\n",name);
                return name;
            }
            //fprintf(stderr, "Error: Sensor data marker 'p' not found\n");
            return 0;
        }
    }

    fprintf(stderr, "Error: Sensor data marker 's' not found\n");
    return 0;
}

bool wakeup_sensor_node(serial_dev_info* serial,char target){
    int res;
    res=send(serial,target);
    if(res<0){
        printf("Wakeup failure because of send failure!\n");
        return false;
    }
    return true;
}

bool receive_sensor_node(serial_dev_info* serial, char* rcv_buffer, char wanted_name) {
    if (!serial || !rcv_buffer) {
        fprintf(stderr, "Error: Invalid serial or buffer!\n");
        return false;
    }

    time_t start_time = time(NULL);  // 记录开始时间
    const int TIMEOUT_SEC = sensor_time_out;       // 设置超时时间（5秒）
    std::string temp;
    std::string buffer;
    memset(rcv_buffer, 0, 128);  // 清空缓冲区
    buffer.clear();

    while (1) {
        int res = recv(serial);      // 尝试接收数据
        if (res == 0) {              // 成功接收到数据
            temp.clear();
            temp=serial->rx_buf;
            buffer+=temp;
            char sensor_name = cat_name(buffer);  // 解析传感器名称

            if (sensor_name == wanted_name) {           // 检查是否匹配                
                strcpy(rcv_buffer, buffer.c_str()); // c_str() 返回 const char*
                printf("Uart Received: %s\n", rcv_buffer);
                return true;
            }else if(sensor_name!=0){
                size_t pos = buffer.find('s');  // 找到第一个 's' 的位置
                if (pos != std::string::npos) {
                    buffer.erase(pos, 1);  // 删除该位置的字符
                }
            }
        }

        // 检查是否超时
        if (time(NULL) - start_time >= TIMEOUT_SEC) {
            fprintf(stderr, "Timeout: No matching data received!\n");
            return false;
        }

        // 避免CPU占用过高
        usleep(10000);  // 休眠10ms
    }
}

bool want_sensor_data(char name, serial_dev_info* serial, sensor_struct* sensor_data) {
    if (!serial || !sensor_data || !name) {
        printf("Error: NULL parameter!\n");
        return false;
    }

    char rcv_buffer[128] = {0};
    const int max_retries = 3;  // 最大重试次数
    int total_attempts = 0;

    while (total_attempts < max_retries) {
        total_attempts++;
        printf("Attempt %d/%d\n", total_attempts, max_retries);

        // 阶段1：发送命令
        bool send_success = false;
        int send_attempts = 0;
        while (!send_success && send_attempts < 10) {
            send_success = wakeup_sensor_node(serial, name);
            if (send_success) {
                printf("Send command success!\n");
                break;
            }
            send_attempts++;
            usleep(100000);  // 100ms延迟
        }

        if (!send_success) {
            printf("Failed to send command after %d attempts. Retrying...\n", send_attempts);
            continue;  // 直接开始下一次循环
        }

        // 阶段2：接收数据
        bool receive_success = false;
        int receive_attempts = 0;
        sleep(2);  // 等待传感器响应

        //while (!receive_success && receive_attempts < sensor_offline_gate) {
        while (!receive_success && receive_attempts < 1) {
            receive_success = receive_sensor_node(serial, rcv_buffer, name);
            if (receive_success) {
                printf("Receive data success: %s\n", rcv_buffer);

                // 阶段3：解析数据
                if (data_extract(rcv_buffer, sensor_data)) {
                    return true;  // 完全成功
                }
                printf("Data extraction failed. Restarting...\n");
                break;  // 跳出接收循环，重新开始
            }
            receive_attempts++;
            usleep(200000);  // 200ms延迟
        }

        if (!receive_success) {
            printf("Failed to receive data after %d attempts. Restarting...\n", receive_attempts);
        }
    }

    printf("Failed after %d total attempts,consider the node offline!\n", max_retries);
    sensor_offline(sensor_data,name);
    PRINT_SENSOR(*sensor_data);
    return false;
}

// 获取日期字符串的函数
std::string getCurrentDateString() {
    auto now = std::chrono::system_clock::now();
    auto in_time_t = std::chrono::system_clock::to_time_t(now);
    std::tm tm_buf;
    localtime_r(&in_time_t, &tm_buf);

    std::stringstream ss;
    ss << std::put_time(&tm_buf, "%Y%m%d"); // 仅保留日期
    return ss.str();
}


//creat a journal per day to save the historic sensor data
void saveSensorDataToCSV(sensor_struct& data) {
    // 生成带时间戳的文件名
    std::string filename = "history_data/sensor_data_" + getCurrentDateString() + ".csv";

    // 写入CSV文件（首次写入时包含表头）
    std::ofstream file(filename, std::ios::app); // 追加模式
    if (file.is_open()) {
        // 如果是新文件，先写入表头
        static bool is_first_write = true;
        if (is_first_write) {
            file << "Time,RenewTime,ID,Online,Temperature,Humidity,CO2\n";
            is_first_write = false;
        }

        // 写入数据行
        file << getCurrentDateString() << ","  // 当前时间
             << static_cast<int>(data.renew_time) << ","
             << data.ID << ","
             << static_cast<int>(data.if_online) << ","
             << data.Temperature << ","
             << data.Humidity << ","
             << data.CO2 << "\n";
        file.close();
        std::cout << "数据已保存到: " << filename << std::endl;
    } else {
        std::cerr << "无法创建文件: " << filename << std::endl;
    }
}

void sensor_offline(sensor_struct* sensor,char name){

    updateSensorWithLocalTime(sensor);
    sensor->ID=name;
    sensor->if_online=0;
    sensor->CO2=0;
    sensor->Humidity=0;
    sensor->Temperature=0;

}



















