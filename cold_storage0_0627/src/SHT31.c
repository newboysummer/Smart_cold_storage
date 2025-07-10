#include "ls1x.h"
#include "Config.h"
#include "ls1c102_i2c.h"
#include "ls1x_latimer.h"
#include "ls1x_gpio.h"

#define command_once 0x2400 //����ģʽ
#define MSB 0xff00
#define LSB 0x00ff
#define add 0x44 //�豸��ַ

void signed_to_string(int16_t num, char *result) {
    int i = 0;
    
    // �жϷ��Ų��洢����
    if (num < 0) {
        result[i++] = '-';
        num = -num;  // ȡ����ֵ
    } else {
        result[i++] = '+';  // �������Ϸ���
    }

    // ��ȡ��λ��������
    result[i++] = (num / 1000) + '0';  // ǧλ
    result[i++] = (num % 1000) / 100 + '0';  // ��λ
    result[i++] = ((num % 100) / 10) + '0';  // ʮλ
    result[i++] = (num % 10) + '0';  // ��λ

}

void sht31_do_once(){
    IIC_Start();//����
    IIC_Send_Byte((add<<1)+0);//����д��ַ
    IIC_Wait_Ack();//�ȴ���Ӧ
    IIC_Send_Byte((command_once>>8)&0xff);//���͸߰�λ��ַ
    IIC_Wait_Ack();//�ȴ���Ӧ
    IIC_Send_Byte((command_once)&0xff);//���͵Ͱ�λ��ַ
    IIC_Wait_Ack();//�ȴ���Ӧ
    IIC_Stop();//ֹͣ
}

uint16_t* sht31_read_once(){
    static uint16_t data[2]={0,0};
    uint8_t crc[2]={0,0};

    IIC_Start();
    IIC_Send_Byte((add<<1)+1);
    IIC_Wait_Ack();
    
    data[0]=(data[0]&0x00ff)|(IIC_Read_Byte(1)<<8);//����߰�λ�¶�
    data[0]=(data[0]&0xff00)|(IIC_Read_Byte(1));//����Ͱ�λ�¶�
    crc[0]=IIC_Read_Byte(1);//У����

    data[1]=(data[1]&0x00ff)|(IIC_Read_Byte(1)<<8);//����߰�λʪ��
    data[1]=(data[1]&0xff00)|(IIC_Read_Byte(1));//����Ͱ�λʪ��
    crc[1]=IIC_Read_Byte(0);//У����

    IIC_Stop();
    return data;
}

uint16_t* correct(uint16_t* data){
    static uint16_t ans[2]={0,0};

    ans[0]=-450+(1750*data[0])/65535;//�ȳ��ٳ�
    ans[1]=1000*data[1]/65535;//�ȳ��ٳ�

    return ans;
}
