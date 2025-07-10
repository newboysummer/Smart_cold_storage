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
 * 本测试程序只提供了串口的回环测试，即同一个串口TXD接在RXD上
 * 需要注意的是在2K板上测试的话，由于有UART1和UART2的串口和DVO0复用，
 * 也就是说
 * UART1和UART2拓展出来的串口只能和LVDS输出（LCD屏幕显示）二选一，
 * 具体是J11 和 J12放置跳帽就是选择LVDS。(见于2K板的用户手册22页末)
 * 所以2K板测试的话，建议选用UART3、UART4、UART5这几个从UART0出来的串口
 * 也就是default_dev_name这个变量建议是ttyS3 ttyS4 ttyS5
 */


#ifndef __UART_H_
#define __UART_H_

#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <termios.h>
#include <sys/ioctl.h>
#include <linux/serial.h>
#include <asm-generic/ioctls.h>

//测试的串口名字
#define uart_dev_name_length 32
#define serial_buffer_size 128

#define PRINT_SERIAL(dev) \
    printf("Serial Device Info:\n"); \
    printf("  Device Name: %s\n", (dev)->dev_name); \
    printf("  File Descriptor: %d\n", (dev)->fd)

//串口的相关变量的结构体
typedef struct serial_dev_info
{
	char dev_name[uart_dev_name_length + 1];
	int fd;
	char tx_buf[serial_buffer_size + 1];
	char rx_buf[serial_buffer_size + 1];
} serial_dev_info;

// int open_serial(serial_dev_info* serial);
// void close_serial(serial_dev_info* serial);

// void set_baud(struct termios* op, int baud);
// void set_flow_ctrl(struct termios* op, int flow_control);
// void set_bits_per_frame(struct termios* op, int bits_per_frame);
// void set_parity(struct termios* op, char parity);
// void set_stop_bits(struct termios* op, int stop_bits);
// int set_serial_parameter(serial_dev_info* serial,int baud,int flow_control, int bits_per_frame, char parity, int stop_bits);

// int recv_serial(serial_dev_info* serial);
// int send_serial(serial_dev_info* serial);

int send(serial_dev_info* serial,char ch);
int recv(serial_dev_info* serial);
int uart_init(serial_dev_info* serial);

/*
 * @brief: 打开串口
 *
 * @param[out]: 参数1(serial)：是serial_dev_info的一个实例
 *
 * @return：EXIT_FAILURE代表函数运行失败，EXIT_SUCCESS代表函数运行成功
 */
int open_serial(serial_dev_info* serial);

/*
 * @brief: 关闭串口
 *
 * @param[out]: 参数1(serial)：serial_dev_info的一个实例
 *
 * @return：EXIT_FAILURE代表函数运行失败，EXIT_SUCCESS代表函数运行成功
 */
void close_serial(serial_dev_info* serial);
/*
 * @brief: 设置波特率
 *
 * @param[out]: 参数1(op)：这是termios的指针，这是终端端口的参数
 * @param[in]: 参数2(baud)：这是波特率，由于termios里面是采用B115200这样的已定声明来置位的，所以需要从115200转变成B115200
 */
void set_baud(struct termios* op, int baud);

/*
 * @brief: 设置流控制
 *         串口可以有CTS和RTS信号，这样的话，启动需要参数2为0，否则为1，这是硬件流控制
 *         如果没有，那么选择经典输入模式，就是2，这是软件流控制
 *
 * @param[out]: 参数1(op)：这是termios的指针，这是终端端口的参数
 * @param[in]: 参数2(flow_control)：这是流控制参数，意义见于上面，通常为2
 */
void set_flow_ctrl(struct termios* op, int flow_control);

/*
 * @brief: 设置每一帧的数据位数，通常是8
 *
 * @param[out]: 参数1(op)：这是termios的指针，这是终端端口的参数
 * @param[in]: 参数2(bits_per_frame)：这是帧的数据位的参数，有效是5-8
 */
void set_bits_per_frame(struct termios* op, int bits_per_frame);

/*
 * @brief: 设置奇偶校验
 *
 * @param[out]: 参数1(op)：这是termios的指针，这是终端端口的参数
 * @param[in]: 参数2(parity)：N是不校验（通常参数是这个）O奇校验 E是偶校验 S是校验位永远为1
 */
void set_parity(struct termios* op, char parity);

/*
 * @brief: 设置有多少个停止位
 *
 * @param[out]: 参数1(op)：这是termios的指针，这是终端端口的参数
 * @param[in]: 参数2(stop_bits)：0是一个停止位，1是两个停止位
 */
void set_stop_bits(struct termios* op, int stop_bits);

int rs485_setup(serial_dev_info* serial);

/*
 * @brief: 设置串口的参数，用serial中的fd获得termios后，对其的值进行修改,最后写回serial中的fd里。
 *
 * @param[out]: 参数1(serial)：serial_dev_info的一个实例
 * @param[in]: 参数2(baud)：波特率
 * @param[in]: 参数3(flow_control): 流控制，通常为2，软件流控制
 * @param[in]: 参数4(bits_per_frame)：每一帧的数据有多位，5 - 8 通常为8
 * @param[in]: 参数5(parity)：奇偶位设置，通常为N
 * @param[in]: 参数6(stop_bits)：停止位一位还是两位，通常为1
 *
 * @return：EXIT_FAILURE代表函数运行失败，EXIT_SUCCESS代表函数运行成功
 */
int set_serial_parameter(serial_dev_info* serial, int baud, int flow_control, int bits_per_frame, char parity, int stop_bits);

/*
 * @brief: 从串口接收数据
 *
 * @param[out]: 参数1(serial)：serial_dev_info的一个实例
 *
 * @return：EXIT_FAILURE代表函数运行失败，EXIT_SUCCESS代表函数运行成功
 */
int recv_serial(serial_dev_info* serial);

/*
 * @brief: 从串口发送数据
 *
 * @param[out]: 参数1(serial)：serial_dev_info的一个实例
 *
 * @return：EXIT_FAILURE代表函数运行失败，EXIT_SUCCESS代表函数运行成功
 */
int send_serial(serial_dev_info* serial);

#endif
