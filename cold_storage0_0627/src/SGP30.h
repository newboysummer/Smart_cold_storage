#include "ls1x.h"
#include "Config.h"
#include "ls1c102_i2c.h"
#include "ls1x_latimer.h"
#include "ls1x_gpio.h"


#ifndef SGP30_H_    // 检查是否已经定义过
#define SGP30_H_    // 如果没有定义过，则定义该宏

// 头文件内容
void unsigned_to_string(uint16_t num, char *result);
void sgp30_init();
void sgp30_do_once();
uint16_t* sgp30_read_once();

#endif  // 结束条件编译