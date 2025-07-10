#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <unistd.h>
#include <QDebug>
#include "uart.h"

#ifdef _LOG_AUTO_TEST_SOFEWARE_FUNC_
#include "log.h"
#define printf printf_log
#define fprintf fprintf_log
#endif

#define SERIAL_DEVICE  "/dev/ttyS3"   // UART3设备文件
#define SERIAL_DEVICE_rcv  "/dev/ttyS4"   // UART3设备文件

//这是一个宏，在返回结果是EXIT_FAILURE时，当前函数返回EXIT_FAIURE
//用于得到函数结果后，不需要其他操作（例如在if里面不需要输出文本），直接可以返回EXIT_FAILURE的情况。
#define IF_RES_FAIL_RETURN if(res == EXIT_FAILURE)\
{\
	return EXIT_FAILURE;\
}

/*
 * @brief: 打开串口
 *
 * @param[out]: 参数1(serial)：是serial_dev_info的一个实例
 *
 * @return：EXIT_FAILURE代表函数运行失败，EXIT_SUCCESS代表函数运行成功
 */
int open_serial(serial_dev_info* serial)
{
//    serial->fd = open(serial->dev_name, O_RDWR | O_NOCTTY | O_NDELAY);
    serial->fd = open(serial->dev_name, O_RDWR | O_NOCTTY | O_NONBLOCK);
    //printf("%d\n",serial->fd);
    fcntl(serial->fd, F_SETFL, O_NONBLOCK); // 再次确保非阻塞
    //serial->fd = open(serial->dev_name, O_RDWR | O_NOCTTY);
	if(serial->fd < 0)
	{
		fprintf(stderr, "error: open dev(%s) failed!\n", serial->dev_name);
		return EXIT_FAILURE;
	}
	return EXIT_SUCCESS;
}

/*
 * @brief: 关闭串口
 *
 * @param[out]: 参数1(serial)：serial_dev_info的一个实例
 *
 * @return：EXIT_FAILURE代表函数运行失败，EXIT_SUCCESS代表函数运行成功
 */
void close_serial(serial_dev_info* serial)
{
	close(serial->fd);
}

/*
 * @brief: 设置波特率
 *
 * @param[out]: 参数1(op)：这是termios的指针，这是终端端口的参数
 * @param[in]: 参数2(baud)：这是波特率，由于termios里面是采用B115200这样的已定声明来置位的，所以需要从115200转变成B115200
 */
void set_baud(struct termios* op, int baud)
{
	int i;
	int array_len;

	int baud_mode_set[] = {B921600, B460800, B230400, B115200, B57600, B38400, B19200, B9600, B4800, B2400, B1200, B300};
	int baud_speed_set[] = {921600, 460800, 230400, 115200, 57600, 38400, 19200, 9600, 4800, 2400, 1200, 300};

	array_len = sizeof(baud_mode_set) / sizeof(int);

	for(i = 0; i < array_len; ++i)
	{
		if(baud == baud_speed_set[i])
		{
			cfsetispeed(op, baud_mode_set[i]);
			cfsetospeed(op, baud_mode_set[i]);
			return ;
		}
	}
	fprintf(stderr, "warning: set baudrate failed! parameter invalid!\n");
	cfsetispeed(op, baud_mode_set[0]);
	cfsetospeed(op, baud_mode_set[0]);
}

/*
 * @brief: 设置流控制
 *         串口可以有CTS和RTS信号，这样的话，启动需要参数2为0，否则为1，这是硬件流控制
 *         如果没有，那么选择经典输入模式，就是2，这是软件流控制
 *
 * @param[out]: 参数1(op)：这是termios的指针，这是终端端口的参数
 * @param[in]: 参数2(flow_control)：这是流控制参数，意义见于上面，通常为2
 */
void set_flow_ctrl(struct termios* op, int flow_control)
{
    if(flow_control < 0 || flow_control > 2)
	{
		fprintf(stderr, "warning: set flow_control failed! parameter invalid!\n");
		return;
	}
	switch(flow_control)
    {
		case 0:
			op->c_iflag &= ~CRTSCTS;
			break;
		case 1:
			op->c_iflag |= CRTSCTS;
			break;
		case 2:
			op->c_iflag |= IXON;
			op->c_iflag |= IXOFF;
			op->c_iflag |= IXANY;
			break;
	}
}

/*
 * @brief: 设置每一帧的数据位数，通常是8
 *
 * @param[out]: 参数1(op)：这是termios的指针，这是终端端口的参数
 * @param[in]: 参数2(bits_per_frame)：这是帧的数据位的参数，有效是5-8
 */
void set_bits_per_frame(struct termios* op, int bits_per_frame)
{
    if(bits_per_frame < 5 || bits_per_frame > 8)
	{
		fprintf(stderr, "warning: set bits per frame failed! parameter invalid!\n");
		return;
	}
	bits_per_frame -= 5;
	int bits_value_set[] = {CS5, CS6, CS7, CS8};
	op->c_cflag &= ~CSIZE;
	op->c_cflag |= bits_value_set[bits_per_frame];
}

/*
 * @brief: 设置奇偶校验
 *
 * @param[out]: 参数1(op)：这是termios的指针，这是终端端口的参数
 * @param[in]: 参数2(parity)：N是不校验（通常参数是这个）O奇校验 E是偶校验 S是校验位永远为1
 */
void set_parity(struct termios* op, char parity)
{
	if(parity >=  'a' && parity <= 'z')
	{
		parity = (parity - 'a') + 'A';
	}
	switch(parity)
	{
		case 'N':
			op->c_cflag &= ~PARENB;
			op->c_iflag &= ~INPCK;
			break;
		case 'O':
			op->c_cflag |= (PARODD | PARENB);
			op->c_iflag |= INPCK;
			break;
		case 'E':
			op->c_cflag |= PARENB;
			op->c_cflag &= ~PARODD;
			op->c_iflag |= INPCK;
			break;
		case 'S':
			op->c_cflag &= ~PARENB;
			op->c_cflag &= ~CSTOPB;
			break;
        default:
			fprintf(stderr, "warning: set parity failed! parameter invalid!\n");
			return;
	}
}

/*
 * @brief: 设置有多少个停止位
 *
 * @param[out]: 参数1(op)：这是termios的指针，这是终端端口的参数
 * @param[in]: 参数2(stop_bits)：0是一个停止位，1是两个停止位
 */
void set_stop_bits(struct termios* op, int stop_bits)
{
	// 设置停止位
	switch (stop_bits)
	{
		case 1:
			op->c_cflag &= ~CSTOPB; break;
		case 2:
			op->c_cflag |= CSTOPB; break;
		default:
			fprintf(stderr, "warning: set stop_bits failed! parameter invalid!\n");
			return;
	}
}

int rs485_setup(serial_dev_info* serial)
{
	struct serial_rs485 rs485conf;

	rs485conf.flags = 0;
	/* Enable RS485 mode: */
	rs485conf.flags |= SER_RS485_ENABLED;

	/* Set logical level for RTS pin equal to 1 when sending: */
	rs485conf.flags |= SER_RS485_RTS_ON_SEND;
	/* or, set logical level for RTS pin equal to 0 when sending: */
	rs485conf.flags &= ~(SER_RS485_RTS_ON_SEND);

	/* Set logical level for RTS pin equal to 1 after sending: */
	rs485conf.flags |= SER_RS485_RTS_AFTER_SEND;
	/* or, set logical level for RTS pin equal to 0 after sending: */
	rs485conf.flags &= ~(SER_RS485_RTS_AFTER_SEND);

	/* Set rts delay before send, if needed: */
	rs485conf.delay_rts_before_send = 5;

	/* Set rts delay after send, if needed: */
	rs485conf.delay_rts_after_send = 5;

	/* Set this flag if you want to receive data even while sending data */
	rs485conf.flags |= SER_RS485_RX_DURING_TX;

	if (ioctl (serial->fd, TIOCSRS485, &rs485conf) < 0) {
		/* Error handling. See errno. */
		printf("rs485 setup failed\n");
		return EXIT_FAILURE;
	}

	return EXIT_SUCCESS;
}

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
int set_serial_parameter(serial_dev_info* serial, int baud, int flow_control, int bits_per_frame, char parity, int stop_bits)
{
	int res;
	//从fd里面获得serial_termios
	struct termios serial_options;
	res = tcgetattr(serial->fd, &serial_options);
	if(res != 0)
	{
		fprintf(stderr, "error: couldn't get cur serial parameter!\n");
		return EXIT_FAILURE;
	}

	set_baud(&serial_options, baud);
	serial_options.c_cflag |= CLOCAL; //修改控制模式，保证程序不会占用串口
	serial_options.c_cflag |= CREAD; //修改控制模式，使得能够从串口中读取输入数据
	set_flow_ctrl(&serial_options, flow_control);
	set_bits_per_frame(&serial_options, bits_per_frame);
	set_parity(&serial_options, parity);
	set_stop_bits(&serial_options, stop_bits);

	//修改输出模式，原始数据输出
	serial_options.c_oflag &= ~OPOST;
	serial_options.c_lflag &= ~(ICANON | ECHO | ECHOE | ISIG);

	//设置串口参数
	tcflush(serial->fd,TCIFLUSH); //刷新输出队列
	if (tcsetattr(serial->fd,TCSANOW,&serial_options) != 0)
	{
		fprintf(stderr,"couldn't get cur serial parameter!\n");
		return EXIT_FAILURE;
	}
	return EXIT_SUCCESS;
}

/*
 * @brief: 从串口接收数据
 *
 * @param[out]: 参数1(serial)：serial_dev_info的一个实例
 *
 * @return：EXIT_FAILURE代表函数运行失败，EXIT_SUCCESS代表函数运行成功
 */
int recv_serial(serial_dev_info* serial)
{
	int res;
    //printf("%s,%d\n",serial->dev_name,serial->fd);
	res = read(serial->fd,serial->rx_buf,serial_buffer_size);
	if(res < 0)
	{
        //fprintf(stderr,"couldn't recv data from serial!\n");
		return EXIT_FAILURE;
	}
	serial->rx_buf[res] = '\0';
	return EXIT_SUCCESS;
}

/*
 * @brief: 从串口发送数据
 *
 * @param[out]: 参数1(serial)：serial_dev_info的一个实例
 *
 * @return：EXIT_FAILURE代表函数运行失败，EXIT_SUCCESS代表函数运行成功
 */
int send_serial(serial_dev_info* serial)
{
	int res;
	res = write(serial->fd, serial->tx_buf, strlen(serial->tx_buf));
	if(res < 0)
	{
		fprintf(stderr,"couldn't send data from serial!\n");
		return EXIT_FAILURE;
	}
	return EXIT_SUCCESS;
}

int send(serial_dev_info* serial,char ch) {
    int res;

    if (serial == NULL || serial->tx_buf == NULL) {
            fprintf(stderr, "Invalid serial device or buffer!\n");
            return -1;
    }

    //strcpy(serial->tx_buf, str);  // 准备要发送的数据
    serial->tx_buf[0]=ch;
    serial->tx_buf[1]='\0';

    res = send_serial(serial);
    if(res == EXIT_FAILURE) {
        fprintf(stderr, "Failed to send data!\n");
        return -1;
    }
    printf("Uart:%s,Sent: %s\n", serial->dev_name,serial->tx_buf);

    return 0;
}


int uart_init(serial_dev_info* serial){
    int res;

    // 1. 初始化串口设备信息
    strcpy(serial->dev_name, SERIAL_DEVICE);

    // 2. 打开串口
    res = open_serial(serial);
    PRINT_SERIAL(serial);
    if(res == EXIT_FAILURE) {
        fprintf(stderr, "Failed to open serial port!\n");
        return -1;
    }

    // 3. 配置串口参数
    // 参数：波特率115200，软件流控制，8数据位，无校验，1停止位
    res = set_serial_parameter(serial, 115200, 2, 8, 'N', 1);
    if(res == EXIT_FAILURE) {
        fprintf(stderr, "Failed to set serial parameters!\n");
        close_serial(serial);
        return -1;
    }

    return 0;
}


int recv(serial_dev_info* serial) {
    int res;
    memset(serial->rx_buf, 0, sizeof(serial->rx_buf));  // 清空接收缓冲区

    //printf("Waiting for data...\n");
    while(1) {
        res = recv_serial(serial);
        if(res == EXIT_FAILURE) {
            //fprintf(stderr, "there is no data!\n");
            return -1;
        }

        if(strlen(serial->rx_buf) > 0) {
            printf("Received: %s\n", serial->rx_buf);
            break;
        }
    }

    return 0;
}
