#include "ls1x.h"
#include "Config.h"
#include "ls1c102_i2c.h"
#include "ls1x_latimer.h"
#include "ls1x_gpio.h"

#define command_once 0x2008 //控制模式
#define command_init 0x2003 //初始模式
#define MSB 0xff00
#define LSB 0x00ff
#define add 0x58 //设备地址

void unsigned_to_string(uint16_t num, char *result) {
    int i = 0;
    
    result[i++] = (num / 10000) + '0';     // 万位
    result[i++] = (num / 1000) % 10 + '0';      // 千位
    result[i++] = (num / 100) % 10 + '0';       // 百位
    result[i++] = (num / 10) % 10 + '0';        // 十位
    result[i++] = num % 10 + '0';               // 个位
}

void sgp30_init(){
    IIC_Start();//启动
    IIC_Send_Byte((add<<1)+0);//发送写地址
    IIC_Wait_Ack();//等待回应
    IIC_Send_Byte((command_init>>8)&0xff);//发送高八位地址
    IIC_Wait_Ack();//等待回应
    IIC_Send_Byte((command_init)&0xff);//发送低八位地址
    IIC_Wait_Ack();//等待回应
    IIC_Stop();//停止
}

void sgp30_do_once(){
    IIC_Start();//启动
    IIC_Send_Byte((add<<1)+0);//发送写地址
    IIC_Wait_Ack();//等待回应
    IIC_Send_Byte((command_once>>8)&0xff);//发送高八位地址
    IIC_Wait_Ack();//等待回应
    IIC_Send_Byte((command_once)&0xff);//发送低八位地址
    IIC_Wait_Ack();//等待回应
    IIC_Stop();//停止
}

uint16_t* sgp30_read_once(){
    static uint16_t data[2]={0,0};
    uint8_t crc[2]={0,0};

    IIC_Start();
    IIC_Send_Byte((add<<1)+1);
    IIC_Wait_Ack();
    
    data[0]=(data[0]&0x00ff)|(IIC_Read_Byte(1)<<8);//读入高八位CO2
    data[0]=(data[0]&0xff00)|(IIC_Read_Byte(1));//读入低八位CO2
    crc[0]=IIC_Read_Byte(1);//校验码

    data[1]=(data[1]&0x00ff)|(IIC_Read_Byte(1)<<8);//读入高八位TVOC
    data[1]=(data[1]&0xff00)|(IIC_Read_Byte(1));//读入低八位TVOC
    crc[1]=IIC_Read_Byte(0);//校验码

    IIC_Stop();
    return data;
}
