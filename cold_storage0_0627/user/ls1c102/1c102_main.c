#include "ls1x.h"
#include "Config.h"
#include "ls1c102_i2c.h"
#include "ls1x_latimer.h"
#include "ls1x_gpio.h"
#include "ls1x_uart.h"
#include "SHT31.h"
#include "SGP30.h"

#define name 'A' 

int main(){

    #ifdef IIC_USE_GPIO
        IIC_Init();
    #else
        gpio_pin_remap(GPIO_PIN_4,GPIO_FUNC_MAIN);
        gpio_pin_remap(GPIO_PIN_5,GPIO_FUNC_MAIN);
        I2C_InitTypeDef I2C_InitStruct0;
        I2C_StructInit(&I2C_InitStruct0);

        I2C_Init(I2C, &I2C_InitStruct0);
        delay_ms(100);
    #endif

    uint16_t* shtdata=NULL;
    uint16_t* sgpdata=NULL;
    uint16_t sec_counter = 0;
    uint16_t* shtans=NULL;
    uint8_t flag=0;
    unsigned char i=0;

    char s[19]={'s',name,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','p','\0'};

    Uart2_init(9600);
    sgp30_init();
    delay_s(15);

    while(1){
        delay_s(1);
        //sec_counter++;
        if (UART2_LSR & 0x01) {
            flag=x_getchar();
            if(flag==name){
                //sec_counter = 0;
                goto measure;
            }
        }
        // if (sec_counter >= 5) {
        //     sec_counter = 0;
        //     goto measure;
        // }

        continue;
        measure:
                sht31_do_once();
                delay_ms(20);
                shtdata=sht31_read_once();
                delay_s(1);
                sgp30_do_once();
                delay_ms(50);
                sgpdata=sgp30_read_once();
                shtans=correct(shtdata);

                signed_to_string(shtans[0],s+2);
                signed_to_string(shtans[1],s+7);
                unsigned_to_string(sgpdata[0],s+12);

                printf2(2,"%s",s);
}
    return 0;
}
