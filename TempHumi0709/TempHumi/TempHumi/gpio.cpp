#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <unistd.h>
#include <QDebug>
#include "gpio.h"

#ifdef _LOG_AUTO_TEST_SOFEWARE_FUNC_
#include "log.h"
#define printf printf_log
#define fprintf fprintf_log
#endif

/*
 * @brief: 登记要操作的GPIO，等同于 echo 505 > /sys/class/gpio/export
 *
 * @param[out]: 参数1(pin_infos)：一个gpio_pin_info实例的指针
 *
 * @return：EXIT_FAILURE代表函数运行失败，EXIT_SUCCESS代表函数运行成功
 */
int export_gpio(gpio_pin_info* pin_info)
{
    int fd = open("/sys/class/gpio/export", O_WRONLY);
    if(fd == -1)
    {
        fprintf(stderr, "error: couldn't open export file!\n");
        return EXIT_FAILURE;
    }

    int res = write(fd,pin_info->gpio_name, strlen(pin_info->gpio_name));
    if(res == -1)
    {
        fprintf(stderr, "error: couldn't write gpio pin to export file!\n");
        close(fd);
        return EXIT_FAILURE;
    }

    close(fd);
    return EXIT_SUCCESS;
}

/*
 * @brief: 注销GPIO的使用 等同于
 *         echo 505 > /sys/class/gpio/unexport
 *
 * @param[out]: 参数1(pin_info)：一个gpio_pin_info实例的指针
 *
 * @return：EXIT_FAILURE代表函数运行失败，EXIT_SUCCESS代表函数运行成功
 */
int unexport_gpio(gpio_pin_info* pin_info)
{
    int fd = open("/sys/class/gpio/unexport",O_WRONLY);
    if(fd == -1)
    {
        fprintf(stderr, "error: couldn't open unexport file\n");
        return EXIT_FAILURE;
    }

    int res = write(fd, pin_info->gpio_name, strlen(pin_info->gpio_name));
    if(res == -1)
    {
        fprintf(stderr, "error: unexport gpio(pin_%d) failed\n", pin_info->gpio_pin);
        return EXIT_FAILURE;
    }

    return EXIT_SUCCESS;
}

/*
 * @brief: 把基值和偏移值相加，写入gpio_pin_info的gpio_name变量
 *
 * @param[out]: 参数1(pin_info)：一个gpio_pin_info实例的指针
 */
void get_gpio_name(gpio_pin_info* pin_info)
{
    memset(pin_info->gpio_name, 0, gpio_name_length);
    snprintf(pin_info->gpio_name, gpio_name_length, "%d", pin_info->gpio_base + pin_info->gpio_pin);
}

/*
 * @brief: 如果对export的操作成功了的话，那么就会产生gpioxxx的文件夹
 *         这个函数作用就是把/sys/class/gpio/gpioxxx/direction文件的路径生成出来
 *         然后写入gpio_pin_info的gpio_direction_file_dir变量
 *
 * @param[out]: 参数1(pin_infos)：一个gpio_pin_info实例的指针
 */
void get_gpio_direction_file_dir(gpio_pin_info* pin_info)
{
    memset(pin_info->gpio_direction_file_dir, 0, gpio_direction_file_dir_length);
    snprintf(pin_info->gpio_direction_file_dir,gpio_direction_file_dir_length,"/sys/class/gpio/gpio%s/direction",pin_info->gpio_name);
}

/*
 * @brief: 如果对export的操作成功了的话，那么就会产生gpioxxx的文件夹
 *         这个函数作用就是把/sys/class/gpio/gpioxxx/value文件的路径生成出来
 *         然后写入gpio_pin_info的gpio_value_file_dir变量
 *
 * @param[out]: 参数1(pin_infos)：一个gpio_pin_info实例的指针
 */
void get_gpio_value_file_dir(gpio_pin_info* pin_info)
{
    memset(pin_info->gpio_value_file_dir, 0, gpio_value_file_dir_length);
    snprintf(pin_info->gpio_value_file_dir,gpio_value_file_dir_length,"/sys/class/gpio/gpio%s/value",pin_info->gpio_name);
}

/*
 * @brief: 设置GPIO的方向，输出还是输入，等同于
 *         echo in > /sys/class/gpio/gpioxxx/direction
 *         echo out > /sys/class/gpio/gpioxxx/direction
 *
 * @param[out]: 参数1(pin_infos)：一个gpio_pin_info实例的指针
 * @param[in]: 参数2(pin_direction)：GPIO的方向
 *
 * @return：EXIT_FAILURE代表函数运行失败，EXIT_SUCCESS代表函数运行成功
 */
int set_gpio_pin_direction(gpio_pin_info* pin_info, enum pin_direction direction)
{
    int res;
    int fd = open(pin_info->gpio_direction_file_dir,O_WRONLY);
    if(fd == -1)
    {
        fprintf(stderr,"error: couldn't open direction file! (%s)\n",pin_info->gpio_direction_file_dir);
        return EXIT_FAILURE;
    }

    if(direction == pin_in)
    {
        res = write(fd,"in",2);
    }
    else if(direction == pin_out)
    {
        res = write(fd,"out",3);
    }
    else
    {
        fprintf(stderr, "error: arg direction invaild\n");
        return EXIT_FAILURE;
    }

    if(res == -1)
    {
        fprintf(stderr, "error: write diretion to gpio failed!\n");
        close(fd);
        return EXIT_FAILURE;
    }
    close(fd);

    return EXIT_SUCCESS;
}

/*
 * @brief: 打开/sys/class/gpio/gpioxxx/value文件
 *
 * @param[out]: 参数1(pin_info)：一个gpio_pin_info实例的指针
 *
 * @return：EXIT_FAILURE代表函数运行失败，EXIT_SUCCESS代表函数运行成功
 */
int open_gpio(gpio_pin_info* pin_info)
{
    pin_info->gpio_value_fd = open(pin_info->gpio_value_file_dir,O_RDWR);
    if(pin_info->gpio_value_fd == -1)
    {
        fprintf(stderr,"error: couldn't open value file! (%s)\n",pin_info->gpio_value_file_dir);
        return EXIT_FAILURE;
    }
    return EXIT_SUCCESS;
}

/*
 * @brief: 关闭/sys/class/gpio/gpioxxx/value文件
 *
 * @param[out]: 参数1(pin_info)：一个gpio_pin_info实例的指针
 */
void close_gpio(gpio_pin_info* pin_info)
{
    close(pin_info->gpio_value_fd);
}


/*
 * @brief: 读取/sys/class/gpio/gpioxxx/value文件，也就是读取gpio的值
 *
 * @param[out]: 参数1(pin_info)：一个gpio_pin_info实例的指针
 *
 * @return：-1代表函数运行失败，0 1代表读取到的gpio的值
 */
int read_gpio(gpio_pin_info* pin_info)
{
    lseek(pin_info->gpio_value_fd,0,SEEK_SET);
    unsigned char value[8];
    int res = read(pin_info->gpio_value_fd,&value,sizeof(value));
    if(res == -1)
    {
        fprintf(stderr, "error: couldn't read gpio value!\n");
        return -1;
    }
    res = atoi((char*) value);
    return res;
}

/*
 * @brief: 写入/sys/class/gpio/gpioxxx/value文件，也就是控制GPIO输出
 *
 * @param[out]: 参数1(pin_info)：一个gpio_pin_info实例的指针
 * @param[in]: 参数2(value)：gpio输出的值 0 1
 *
 * @return：EXIT_FAILURE代表函数运行失败，EXIT_SUCCESS代表函数运行成功
 */
int write_gpio(gpio_pin_info* pin_info,char value)
{
    lseek(pin_info->gpio_value_fd,0,SEEK_SET);
    int res = write(pin_info->gpio_value_fd,&value,1);
    if(res == -1)
    {
        fprintf(stderr, "error: couldn't write value file!\n");
        return EXIT_FAILURE;
    }
    return EXIT_SUCCESS;
}

gpio_pin_info my_init_gpio(int id) {
    gpio_pin_info pin_info;
    pin_info.gpio_base = 0;  // 根据硬件调整
    pin_info.gpio_pin = id;  // 操作 GPIO38

    // 生成路径
    get_gpio_name(&pin_info);
    get_gpio_direction_file_dir(&pin_info);
    get_gpio_value_file_dir(&pin_info);

    // 导出 GPIO
    if (export_gpio(&pin_info) != EXIT_SUCCESS) {
        qDebug() << "导出 GPIO 38 失败！";
        //return 0;
    }

    // 设置为输出模式
    if (set_gpio_pin_direction(&pin_info, pin_out) != EXIT_SUCCESS) {
        qDebug() << "设置方向失败！";
        unexport_gpio(&pin_info);
        //return 0;
    }

    // 打开 GPIO 值文件
    if (open_gpio(&pin_info) != EXIT_SUCCESS) {
        qDebug() << "打开 GPIO 38 失败！";
        unexport_gpio(&pin_info);
        //return 0;
    }
    qDebug() << "GPIO"<<id<<"Init Success!!";
    return pin_info;
}

bool set_high(gpio_pin_info* gpio){
        // 写入高电平
        if (write_gpio(gpio, '1') != EXIT_SUCCESS) {
            qDebug() << "写入高电平失败！";
            return false;
        }
        return true;
}
bool set_low(gpio_pin_info* gpio){
    // 写入高电平
    if (write_gpio(gpio, '0') != EXIT_SUCCESS) {
        qDebug() << "写入low电平失败！";
        return false;
    }
    return true;
}
void my_close_gpio(gpio_pin_info* gpio){
    // 关闭并注销
    close_gpio(gpio);
    unexport_gpio(gpio);
    qDebug() << "GPIO 38 操作完成！";
}

