#include "ls1x.h"
#include "Config.h"
#include "ls1c102_i2c.h"
#include "ls1x_latimer.h"
#include "ls1x_gpio.h"

#define command_once 0x2008 //����ģʽ
#define command_init 0x2003 //��ʼģʽ
#define MSB 0xff00
#define LSB 0x00ff
#define add 0x58 //�豸��ַ

void unsigned_to_string(uint16_t num, char *result) {
    int i = 0;
    
    result[i++] = (num / 10000) + '0';     // ��λ
    result[i++] = (num / 1000) % 10 + '0';      // ǧλ
    result[i++] = (num / 100) % 10 + '0';       // ��λ
    result[i++] = (num / 10) % 10 + '0';        // ʮλ
    result[i++] = num % 10 + '0';               // ��λ
}

void sgp30_init(){
    IIC_Start();//����
    IIC_Send_Byte((add<<1)+0);//����д��ַ
    IIC_Wait_Ack();//�ȴ���Ӧ
    IIC_Send_Byte((command_init>>8)&0xff);//���͸߰�λ��ַ
    IIC_Wait_Ack();//�ȴ���Ӧ
    IIC_Send_Byte((command_init)&0xff);//���͵Ͱ�λ��ַ
    IIC_Wait_Ack();//�ȴ���Ӧ
    IIC_Stop();//ֹͣ
}

void sgp30_do_once(){
    IIC_Start();//����
    IIC_Send_Byte((add<<1)+0);//����д��ַ
    IIC_Wait_Ack();//�ȴ���Ӧ
    IIC_Send_Byte((command_once>>8)&0xff);//���͸߰�λ��ַ
    IIC_Wait_Ack();//�ȴ���Ӧ
    IIC_Send_Byte((command_once)&0xff);//���͵Ͱ�λ��ַ
    IIC_Wait_Ack();//�ȴ���Ӧ
    IIC_Stop();//ֹͣ
}

uint16_t* sgp30_read_once(){
    static uint16_t data[2]={0,0};
    uint8_t crc[2]={0,0};

    IIC_Start();
    IIC_Send_Byte((add<<1)+1);
    IIC_Wait_Ack();
    
    data[0]=(data[0]&0x00ff)|(IIC_Read_Byte(1)<<8);//����߰�λCO2
    data[0]=(data[0]&0xff00)|(IIC_Read_Byte(1));//����Ͱ�λCO2
    crc[0]=IIC_Read_Byte(1);//У����

    data[1]=(data[1]&0x00ff)|(IIC_Read_Byte(1)<<8);//����߰�λTVOC
    data[1]=(data[1]&0xff00)|(IIC_Read_Byte(1));//����Ͱ�λTVOC
    crc[1]=IIC_Read_Byte(0);//У����

    IIC_Stop();
    return data;
}
