#include "ls1x.h"
#include "Config.h"
#include "ls1c102_i2c.h"
#include "ls1x_latimer.h"
#include "ls1x_gpio.h"


#ifndef SHT31_H_    // ����Ƿ��Ѿ������
#define SHT31_H_    // ���û�ж����������ú�

// ͷ�ļ�����
void sht31_do_once();
uint16_t* sht31_read_once();
uint16_t* correct(uint16_t* data);
void signed_to_string(int16_t num, char *result);

#endif  // ������������