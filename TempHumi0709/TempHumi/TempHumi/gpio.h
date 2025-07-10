/*
* Copyright (c) 2021 Loongson(GD) Inc. SANCOG Inc
* Author: loongson-gz, sancog
*
* This program is free software; you can redistribute  it and/or modify it
* under  the terms of  the GNU General  Public License as published by the
* Free Software Foundation;  either version 2 of the  License, or (at your
* option) any later version.
*/

/*
 * 本测试程序提供了GPIO的测试
 * 本程序使用2对GPIO来进行输出输入测试
 * 逻辑如下：
 * 一对GPIO中有2个GPIO，一个GPIO作输出，下面称之为GPIO_in，一个GPIO作输入，下面称之为GPIO_out。
 * 然后物理上将其连接。
 * 然后GPIO_in输出0，检测GPIO_out的值。然后GPIO_in输出1，检测GPIO_out的值。
 * 一共有两个对GPIO来完成上述的检测动作。
 */


#ifndef __GPIO_H__
#define __GPIO_H__

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>

//这是一个宏，在返回结果是EXIT_FAILURE时，当前函数返回EXIT_FAIURE
//用于得到函数结果后，不需要其他操作（例如在if里面不需要输出文本），直接可以返回EXIT_FAILURE的情况。
#ifndef IF_RES_FAIL_RETURN
#define IF_RES_FAIL_RETURN if(res == EXIT_FAILURE)\
{\
	return EXIT_FAILURE;\
}
#endif

//这个是操作的gpio的值的文本长度 比如基值是488，偏移是27 那么就是515(488+27)
#define gpio_name_length 16
//这个是生成的gpioxx文件中的direction文件的路径 /sys/class/gpio/gpio27/direction
#define gpio_direction_file_dir_length 128
//这个是生成的gpioxx文件中的value文件的路径 /sys/class/gpio/gpio27/value
#define gpio_value_file_dir_length 128

//GPIO的方向做一个枚举，也可以用宏来代替
enum pin_direction
{
	pin_in = 0,
	pin_out,
};

//一个GPIO端口对应一个gpio_pin_info
//里面包括：
//gpio_pin: gpio的编号
//gpio_name: gpio结合基值的得到的具体值
//gpio_direction_file_dir: 写入gpio_name到export文件后，生成的文件夹gpioX里面的direction文件的绝对地址
//gpio_value_file_dir：写入gpio_name到export文件后，生成的文件夹gpioX里面的value文件的绝对地址
//gpioX里面的value文件打开的时候的设备文件号
typedef struct gpio_pin_info
{
	int gpio_base;
	int gpio_pin;
	char gpio_name[gpio_name_length];
	char gpio_direction_file_dir[gpio_direction_file_dir_length];
	char gpio_value_file_dir[gpio_value_file_dir_length];
	int gpio_value_fd;
}gpio_pin_info;

gpio_pin_info my_init_gpio(int id);
bool set_high(gpio_pin_info* gpio);
bool set_low(gpio_pin_info* gpio);
void my_close_gpio(gpio_pin_info* gpio);

/*
 * @brief: 登记要操作的GPIO，等同于 echo 505 > /sys/class/gpio/export
 *
 * @param[out]: 参数1(pin_infos)：一个gpio_pin_info实例的指针
 *
 * @return：EXIT_FAILURE代表函数运行失败，EXIT_SUCCESS代表函数运行成功
 */
int export_gpio(gpio_pin_info* pin_info);

/*
 * @brief: 注销GPIO的使用 等同于
 *         echo 505 > /sys/class/gpio/unexport
 *
 * @param[out]: 参数1(pin_info)：一个gpio_pin_info实例的指针
 *
 * @return：EXIT_FAILURE代表函数运行失败，EXIT_SUCCESS代表函数运行成功
 */
int unexport_gpio(gpio_pin_info* pin_info);

/*
 * @brief: 把基值和偏移值相加，写入gpio_pin_info的gpio_name变量
 *
 * @param[out]: 参数1(pin_info)：一个gpio_pin_info实例的指针
 */
void get_gpio_name(gpio_pin_info* pin_info);

/*
 * @brief: 如果对export的操作成功了的话，那么就会产生gpioxxx的文件夹
 *         这个函数作用就是把/sys/class/gpio/gpioxxx/direction文件的路径生成出来
 *         然后写入gpio_pin_info的gpio_direction_file_dir变量
 *
 * @param[out]: 参数1(pin_infos)：一个gpio_pin_info实例的指针
 */
void get_gpio_direction_file_dir(gpio_pin_info* pin_info);

/*
 * @brief: 如果对export的操作成功了的话，那么就会产生gpioxxx的文件夹
 *         这个函数作用就是把/sys/class/gpio/gpioxxx/value文件的路径生成出来
 *         然后写入gpio_pin_info的gpio_value_file_dir变量
 *
 * @param[out]: 参数1(pin_infos)：一个gpio_pin_info实例的指针
 */
void get_gpio_value_file_dir(gpio_pin_info* pin_info);

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
int set_gpio_pin_direction(gpio_pin_info* pin_info, enum pin_direction direction);

/*
 * @brief: 打开/sys/class/gpio/gpioxxx/value文件
 *
 * @param[out]: 参数1(pin_info)：一个gpio_pin_info实例的指针
 *
 * @return：EXIT_FAILURE代表函数运行失败，EXIT_SUCCESS代表函数运行成功
 */
int open_gpio(gpio_pin_info* pin_info);

/*
 * @brief: 关闭/sys/class/gpio/gpioxxx/value文件
 *
 * @param[out]: 参数1(pin_info)：一个gpio_pin_info实例的指针
 */
void close_gpio(gpio_pin_info* pin_info);

/*
 * @brief: 读取/sys/class/gpio/gpioxxx/value文件，也就是读取gpio的值
 *
 * @param[out]: 参数1(pin_info)：一个gpio_pin_info实例的指针
 *
 * @return：-1代表函数运行失败，0 1代表读取到的gpio的值
 */
int read_gpio(gpio_pin_info* pin_info);

/*
 * @brief: 写入/sys/class/gpio/gpioxxx/value文件，也就是控制GPIO输出
 *
 * @param[out]: 参数1(pin_info)：一个gpio_pin_info实例的指针
 * @param[in]: 参数2(value)：gpio输出的值 0 1
 *
 * @return：EXIT_FAILURE代表函数运行失败，EXIT_SUCCESS代表函数运行成功
 */
int write_gpio(gpio_pin_info* pin_info, char value);
#endif
