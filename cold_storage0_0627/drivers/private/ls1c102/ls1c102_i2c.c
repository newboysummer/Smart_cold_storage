//#include "Main.h"
#include "Config.h"
#include "ls1c102_i2c.h"
#include "ls1x_latimer.h"

#ifdef IIC_USE_GPIO
//IIC 延时函数
//#define IIC_Delay()  delay_us(1)

void IIC_Delay(void)
{
	int i=1;
	while (i)
	{
		i--;
	}
}

// 初始化IIC
void IIC_Init(void)
{ 
	gpio_pin_remap(I2C_Soft_SCL, GPIO_FUNC_GPIO);
	gpio_pin_remap(I2C_Soft_SDA, GPIO_FUNC_GPIO);

	gpio_set_direction(I2C_Soft_SCL, GPIO_Mode_Out);  
	gpio_set_direction(I2C_Soft_SDA, GPIO_Mode_Out); 

	// 初始上拉，I2C默认空闲状态
	I2C_SCL_HIGH;
	I2C_SDA_HIGH;
}

// IO方向设置
void SDA_IN(void)
{
	gpio_set_direction(I2C_Soft_SDA, GPIO_Mode_In); // 配置输入模式
}

void SDA_OUT(void)
{
	gpio_set_direction(I2C_Soft_SDA, GPIO_Mode_Out); // 配置输出模式
	I2C_SDA_HIGH;
}

// 产生IIC起始信号
void IIC_Start(void)
{
	SDA_OUT(); // sda线输出
	I2C_SDA_HIGH;
	I2C_SCL_HIGH;
    IIC_Delay();
	I2C_SDA_LOW; // START:when CLK is high,DATA change form high to low
	IIC_Delay();
	I2C_SCL_LOW; // 钳住I2C总线，准备发送或接收数据
}
// 产生IIC停止信号
void IIC_Stop(void)
{
	SDA_OUT(); // sda线输出
	I2C_SCL_LOW;
	I2C_SDA_LOW; // STOP:when CLK is high DATA change form low to high
	IIC_Delay();
	I2C_SCL_HIGH;
	I2C_SDA_HIGH; // 发送I2C总线结束信号
	IIC_Delay();
}
// 等待应答信号到来
// 返回值:1，接收应答失败
//       0，接收应答成功
uint8_t IIC_Wait_Ack(void)
{
	uint8_t ucErrTime = 0;
	SDA_IN(); // SDA设置为输入
	I2C_SDA_HIGH;
	IIC_Delay();
	I2C_SCL_HIGH;
	IIC_Delay();
	while (I2C_SDA_READ)
	{
		ucErrTime++;
		if (ucErrTime > 250)
		{
			IIC_Stop();
			return 1;
		}
	}
	I2C_SCL_LOW; // 时钟输出0
	return 0;
}
// 产生ACK应答
void IIC_Ack(void)
{
	I2C_SCL_LOW;
	SDA_OUT();
	I2C_SDA_LOW;
	IIC_Delay();
	I2C_SCL_HIGH;
	IIC_Delay();
	I2C_SCL_LOW;
}
// 不产生ACK应答
void IIC_NAck(void)
{
	I2C_SCL_LOW;
	SDA_OUT();
	I2C_SDA_HIGH;
	IIC_Delay();
	I2C_SCL_HIGH;
	IIC_Delay();
	I2C_SCL_LOW;
}
// IIC发送一个字节
// 返回从机有无应答
// 1，有应答
// 0，无应答
void IIC_Send_Byte(uint8_t txd)
{
	uint8_t t;
	SDA_OUT();
	I2C_SCL_LOW; // 拉低时钟开始数据传输
	for (t = 0; t < 8; t++)
	{
		if ((txd & 0x80) >> 7)
		{
			I2C_SDA_HIGH;
		}
		else
		{
			I2C_SDA_LOW;
		}

		txd <<= 1;

		I2C_SCL_HIGH;
		IIC_Delay();
		I2C_SCL_LOW;
		IIC_Delay();
	}
}
// 读1个字节，ack=1时，发送ACK，ack=0，发送nACK
uint8_t IIC_Read_Byte(unsigned char ack)
{
	unsigned char i, receive = 0;
	SDA_IN(); // SDA设置为输入
	for (i = 0; i < 8; i++)
	{
		I2C_SCL_LOW;
		IIC_Delay();
		I2C_SCL_HIGH;
		receive <<= 1;
		if (I2C_SDA_READ)
			receive++;
		IIC_Delay();
	}
	if (!ack)
		IIC_NAck(); // 发送nACK
	else
		IIC_Ack(); // 发送ACK
	return receive;
}
#endif

/* I2C START mask */
#define I2C_START_Set           ((uint8_t)0x80)
#define I2C_START_Reset         ((uint8_t)0x7F)

/* I2C STOP mask */
#define I2C_STOP_Set            ((uint8_t)0x40)
#define I2C_STOP_Reset          ((uint8_t)0xBF)

/* I2C ACK mask */
#define I2C_ACK_Set             ((uint8_t)0x08)
#define I2C_ACK_Reset           ((uint8_t)0xF7)

/* I2C ADD0 mask */
#define I2C_ADD0_Set            ((uint8_t)0x01)
#define I2C_ADD0_Reset          ((uint8_t)0xFE)


#define FLAG_Mask               ((uint8_t)0xFF)

#define ITEN_Mask               ((uint8_t)0x40)

BOOL STS;

/*****************user add*********************/
void I2C_delay_my(void)
{
    for(volatile int j = 100; j; j--){
        ;
    }
}

/**
  * @brief    Initializes the I2C peripheral according to the specified
  * 		   parameters in the I2C_InitStruct .
  * @param  I2Cx: select the I2Cx peripheral.
   *   This parameter can be I2C.
  * @param  I2C_InitStruct:  pointer to an I2C_InitTypeDef structure
  *         		that contains the configuration information for the specified I2C peripheral.
  * @retval None
  */
void I2C_Init(I2C_TypeDef* I2Cx, I2C_InitTypeDef* I2C_InitStruct)
{
    uint32_t tmp = 0;
//	  uint32_t result = 0x04;
    uint32_t pclk1 = 8000000;
    /* Check the parameters */
    /*---------------------------- I2Cx Configuration ------------------------*/
    I2Cx->CTRL	  = 0x20;        //访问分频寄存器

    tmp=pclk1 / I2C_InitStruct->I2C_ClockSpeed;

    tmp=(tmp >> 2) -1;

    I2Cx->PRERL = tmp;
    /* Enable the selected I2C peripheral */
    I2Cx->PRERH = tmp >> 8;

    I2Cx->CTRL	  = 0x80 | (I2C_InitStruct->I2C_Mode)| (I2C_InitStruct->I2C_BuslockCheckEn)| (I2C_InitStruct->I2C_SlvAutoresetEn) ;

    if (I2C_InitStruct->I2C_BuslockCheckEn)
    {
        I2Cx->CR_SR = 0x04;
    }
    I2Cx->SADDR = I2C_InitStruct->I2C_OwnAddress1;

    I2C_wait(I2C);

}


/**
  * @brief  Fills each I2C_InitStruct member with its default value.
  * @param  I2C_InitStruct: pointer to an I2C_InitTypeDef structure which will be initialized.
  * @retval None
  */
void I2C_StructInit(I2C_InitTypeDef* I2C_InitStruct)
{
    /*---------------- Reset I2C init structure parameters values ----------------*/
    /* initialize the I2C_ClockSpeed member */
    I2C_InitStruct->I2C_ClockSpeed = 100000;
    /* Initialize the I2C_Mode member */
    I2C_InitStruct->I2C_Mode = I2C_Mode_Master;
    //  I2C_InitStruct->I2C_Mode = I2C_Mode_Slave;
    /* Initialize the I2C_OwnAddress1 member */
    I2C_InitStruct->I2C_OwnAddress1 = 0x2A;
    /* Initialize the I2C_Buslock Check */
    I2C_InitStruct->I2C_BuslockCheckEn = I2C_Buslock_Check_Enable;
    /* Initialize the I2C_Slave_Autoreset */
    I2C_InitStruct->I2C_SlvAutoresetEn = I2C_Slv_Autoreset_Disable;
}
/**
 * brief： Enables or disables the specified I2c interrupts.
 * @param  I2Cx: Select the I2c peripheral.
 *   This parameter can be I2C.
 * @param  NewState: new state of the specified I2Cx interrupt.
 *   This parameter can be: ENABLE or DISABLE.
 * @retval None
 */
void I2C_ITConfig(I2C_TypeDef* I2Cx, FunctionalState NewState)
{
    if (NewState != DISABLE)
    {
        /* Enable the selected I2C interrupts */
        I2Cx->CTRL |= 0X40;
    }
    else
    {
        /* Disable the selected I2C interrupts */
        I2Cx->CTRL &= (uint8_t)~0X40;
    }
}


/**
 * brief： Enables or disables the specified I2c interrupts.
 * @param  I2Cx: Select the I2c peripheral.
 *   This parameter can be I2C.
 * @param  NewState: new state of the specified I2Cx interrupt.
 *   This parameter can be: ENABLE or DISABLE.
 * @retval None
 */
void I2C_ITCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
{
    /* set the interrupt*/
    INT_POL |= IRQ_I2C;
    (NewState != DISABLE)? (INT_EN  |= IRQ_I2C) : (INT_EN  &= ~(IRQ_I2C));
}


/**
  * @brief  Generates I2Cx communication START condition.
  * @param  I2Cx: select the I2C peripheral.
  *   This parameter can be I2C.
  * @param  NewState: new state of the I2C START condition generation.
  *   This parameter can be: ENABLE or DISABLE.
  * @retval None.
  */
void I2C_GenerateSTART(I2C_TypeDef* I2Cx, FunctionalState NewState)
{
    if (NewState != DISABLE)
    {
        /* Generate a START condition */
        I2Cx->CR_SR |= I2C_START_Set;
    }
    else
    {
        /* Disable the START condition generation */
        I2Cx->CR_SR &= I2C_START_Reset;
    }
    delay_us(125);
}

/**
  * @brief  Generates I2Cx communication STOP condition.
  * @param  I2Cx: select the I2C peripheral.
  *   This parameter can be I2C.
  * @param  NewState: new state of the I2C STOP condition generation.
  *   This parameter can be: ENABLE or DISABLE.
  * @retval None.
  */
void I2C_GenerateSTOP(I2C_TypeDef* I2Cx, FunctionalState NewState)
{
    if (NewState != DISABLE)
    {
        /* Generate a STOP condition */
        I2Cx->CR_SR |= I2C_STOP_Set;
    }
    else
    {
        /* Disable the STOP condition generation */
        I2Cx->CR_SR &= I2C_STOP_Reset;
    }
    delay_us(125);
}

/**
  * @brief  Enables or disables the specified I2C acknowledge feature.
  * @param  I2Cx: select the I2C peripheral.
  *   This parameter can be I2C.
  * @param  NewState: new state of the I2C Acknowledgement.
  *   This parameter can be: ENABLE or DISABLE.
  * @retval None.
  */
void I2C_AcknowledgeConfig(I2C_TypeDef* I2Cx, FunctionalState NewState)
{
    if (NewState != DISABLE)
    {
        /* Enable the acknowledgement */
        I2Cx->CR_SR |= I2C_ACK_Set;
    }
    else
    {
        /* Disable the acknowledgement */
        I2Cx->CR_SR &= I2C_ACK_Reset;
    }
}



/**
  * @brief  Sends a data byte through the I2Cx peripheral.
  * @param  I2Cx: select the I2C peripheral.
  *   This parameter can be I2C.
  * @param  Data: Byte to be transmitted.
  * @retval None
  */
void I2C_SendData(I2C_TypeDef* I2Cx, uint8_t Data)
{
    /* Write in the DR register the data to be sent */
//  I2Cx->CR_SR |= 0x04;

    I2C_Unlock(I2Cx);

    I2Cx->DR = Data;
    I2C->CR_SR = 0x10;
    delay_us(125);
}
/**
  * @brief  Returns the most recent received data by the I2Cx peripheral.
  * @param  I2Cx: select the I2C peripheral.
  *   This parameter can be I2C.
  * @retval The value of the received data.
  */
void I2C_ReceiveData(I2C_TypeDef* I2Cx, FunctionalState ACK, FunctionalState STOP)
{
    I2C_Unlock(I2Cx);

    /* Return the data in the DR register */
    I2Cx->CR_SR = 0x20 | ACK | STOP;
    return ;

}


/**
  * @brief  Sends a Address byte through the I2Cx peripheral.
  * @param  I2Cx: select the I2C peripheral.
  *   This parameter can be I2C.
  * @param  Address: Address to be transmitted.
  * @param  I2C_Direction: set the direction of the I2Cx next byte transfer.
  *   This parameter can be I2C_Direction_Transmitter or I2C_Direction_Receiver.
  * @retval None
  */


void I2C_Send7bitAddress(I2C_TypeDef* I2Cx, uint8_t Address, uint8_t I2C_Direction)
{
    /* Test on the direction to set/reset the read/write bit */
//  I2Cx->CR_SR |= 0x04;

    I2C_Unlock(I2Cx);

    if (I2C_Direction != I2C_Direction_Transmitter)  //
    {
        /* Set the address bit0 for read */
        Address |= I2C_ADD0_Set;
        printf("\r\n receive addr 0x%02x\r\n", Address);
    }
    else
    {
        /* Reset the address bit0 for write */
        Address &= I2C_ADD0_Reset;
        printf("\r\n trans addr 0x%02x\r\n", Address);
    }
    I2Cx->DR = Address;
    I2C->CR_SR  = 0x90;
    /* Send the address */
}

/**
  * @brief  Reads the specified I2C register and returns its value.
  * @param  I2Cx: select the I2C peripheral.
  *   This parameter can be I2C.
  * @param  I2C_Register: specifies the register to read.
  *   This parameter can be one of the following values:
  *     @arg I2C_Register_PRERL:  PRERL register.
  *     @arg I2C_Register_PRERH:  PRERH register.
  *     @arg I2C_Register_CTRL:	  CTR register.
  *     @arg I2C_Register_DR:	  DR register.
  *     @arg I2C_Register_SR:	  SR register.
  *     @arg I2C_Register_BLTOP:  BLTOP register.
  *     @arg I2C_Register_SADDR:  SADDR register.
  * @retval The value of the read register.
  */
uint8_t I2C_ReadRegister(I2C_TypeDef* I2Cx, uint8_t I2C_Register)
{
    __IO uint32_t tmp = 0;


    tmp = (uint32_t) I2Cx;
    tmp += I2C_Register;

    /* Return the selected register value */
    return (*(__IO uint8_t *) tmp);
}
/**
  * @brief  Clears the I2Cx's flags.
  * @param  I2Cx: select the I2C peripheral.
  *   This parameter can be I2C.
  * @param  I2C_FLAG: specifies the flag to clear.
  *   This parameter can be any combination of the following values:
  *     @arg I2C_FLAG_IT: SMBus Alert flag
  * @retval None
  */
void I2C_ClearFlag(I2C_TypeDef* I2Cx, uint8_t I2C_FLAG)
{
    uint8_t flagpos = 0;
    /* Get the I2C flag position */
    flagpos = I2C_FLAG & FLAG_Mask;
    /* Clear the selected I2C flag */
    I2Cx->CR_SR = (uint8_t)~flagpos;
}
/**
  * @brief  GET the I2C Status.
  * @param  I2Cx: select the I2C peripheral.
  *   This parameter can be I2C.
  * @param  I2C_IT: check the interrupt flag.
  *   This parameter can be I2C_STATE_IF.
  * @retval The new state of I2C_IT (SET or RESET).
  */
ITStatus I2C_GetStatus(I2C_TypeDef* I2Cx, uint8_t I2C_STATUS)
{
    ITStatus bitstatus = RESET;


    /* Get bit[7:0] of the flag */
    I2C_STATUS &= FLAG_Mask;

    /* Check the status of the I2C interrupt flag */
    if (((I2Cx->CR_SR & I2C_STATUS) != (uint8_t)RESET))
    {
        /* I2C_IT is set */
        bitstatus = SET;
    }
    else
    {
        /* I2C_IT is reset */
        bitstatus = RESET;
    }
    /* Return the I2C_IT status */
    return  bitstatus;
}
/**
 *@brief  Clears the I2C's interrupt pending bits.
  * @param  I2Cx: select the I2C peripheral.
  *   This parameter can be I2C.
 *retval None
 */

void I2C_ClearIT(I2C_TypeDef* I2Cx)
{
    I2Cx->CR_SR = 0x01;
    SET_BIT(INT_CLR,IRQ_I2C);

}
/**
 *@brief  Wait for the Master's transmission is completed.
  * @param  I2Cx: select the I2C peripheral.
  *   This parameter can be I2C.
 *retval None
 */
void I2C_wait(I2C_TypeDef* I2Cx)
{
    uint8_t temp;
    temp =I2Cx->CR_SR;
    while (temp & 0x02)      //等待传输完毕
    {
        temp =I2Cx->CR_SR;
    }
}
/**
 *@brief  Wait for the bus until it is idle.
  * @param  I2Cx: select the I2C peripheral.
  *   This parameter can be I2C.
 *retval None
 */
void I2C_BUSY(I2C_TypeDef* I2Cx)
{
    uint8_t temp;
    temp =I2Cx->CR_SR;
    while (temp & 0x40)      //等待总线空闲
    {
        temp =I2Cx->CR_SR;
    }
}
/**
 *@brief  Check for buslock and recover it if so.
  * @param  I2Cx: select the I2C peripheral.
  *   This parameter can be I2C.
 *retval None
 */
void I2C_Unlock(I2C_TypeDef* I2Cx)
{
    uint8_t temp;
    temp =I2Cx->CR_SR;
    if (temp & 0x04)      //等待空闲
    {
        I2Cx->CR_SR |= 0x04;
    }
}

/**
 *@brief  Example of writing data to EEPROM via I2C bus with query mode.
  * @param  Waddr: The operating address.
  *   This parameter can be 0~127.	131072(16Kb/slice)/8(b/BYTE)/16(BYTE/page)=128page
  * @param  Tdata: The data to be written.
  *   This parameter can be uint8 format.
 *retval None
 */
void CAT24_Write(uint16_t Waddr,uint8_t Tdata)
{
    uint8_t Device_Addr;
    Waddr = Waddr & 0x7FF;
    Device_Addr=0xA0 + (Waddr>>7);

    printf("\r\n Device_Addr=0x%2x , Tdata = 0x%2x",Device_Addr,Tdata);

    I2C_Send7bitAddress(I2C, Device_Addr, I2C_Direction_Transmitter);
    I2C_wait(I2C);
    if(I2C->CR_SR & 0x80)
    {
        printf("-----no ack-----\r\n");
    }

    Waddr = Waddr & 0xFF;
    printf("Waddr=0x%x",Waddr);
    I2C_SendData(I2C, Waddr);
    I2C_wait(I2C);
    if(I2C->CR_SR & 0x80)
    {
        printf("-----no ack-----\r\n");
    }

    I2C_SendData(I2C, Tdata);
    I2C_wait(I2C);
    if(I2C->CR_SR & 0x80)
    {
        printf("-----no ack-----\r\n");
    }
    I2C_GenerateSTOP(I2C,ENABLE);
    I2C_wait(I2C);
}
/**
 *@brief  Example of writing data to EEPROM via I2C bus with query mode.
  * @param  Raddr: The operating address.
  *   This parameter can be 0~127.	131072(16Kb/slice)/8(b/BYTE)/16(BYTE/page)=128page
 *retval The value of the read data.
 */
uint8_t CAT24_Read(uint16_t Raddr)
{
    uint8_t tmp;
    uint8_t Device_Addr;
    Raddr = Raddr & 0x7FF;
    Device_Addr=0xA0 + (Raddr>>7);

    printf("\r\n read Device_Addr=0x%2x ",Device_Addr);
    I2C_Send7bitAddress(I2C, Device_Addr, I2C_Direction_Transmitter);
    I2C_wait(I2C);
    if(I2C->CR_SR & 0x80)
    {
        printf("\n no ack \n");
    }

    printf("Raddr=0x%x",Raddr);
    Raddr = Raddr & 0xFF;
    I2C_SendData(I2C, Raddr);
    I2C_wait(I2C);
    if(I2C->CR_SR & 0x80)
    {
        printf("\n no ack \n");
    }
    I2C_Send7bitAddress(I2C, Device_Addr, I2C_Direction_Receiver);
    I2C_wait(I2C);
    if(I2C->CR_SR & 0x80)
    {
        printf("\n no ack \n");
    }
    I2C_ReceiveData(I2C,I2C_NACK,I2C_STOP);
    I2C_wait(I2C);
    tmp=(uint8_t)I2C->DR;

    return tmp;
}

/**
 *@brief  Example of writing data to EEPROM via I2C bus with interrupt mode.
  * @param  Waddr: The operating address.
  *   This parameter can be 0~127.	131072(16Kb/slice)/8(b/BYTE)/16(BYTE/page)=128page
  * @param  Tdata: The data to be written.
  *   This parameter can be uint8 format.
 *retval None
 */
void CAT24_Write_Int(uint16_t Waddr,uint8_t Tdata)
{
    uint8_t Device_Addr;
    Waddr = Waddr & 0x7FF;
    Device_Addr=0xA0 + (Waddr>>7);

    I2C_BUSY(I2C);
    STS=0;
    I2C_Send7bitAddress(I2C, Device_Addr, I2C_Direction_Transmitter);
    while(!STS)//等待从设备地址发送完毕
    {
        delay_us(1);
    }
    STS=0;
    Waddr = Waddr & 0xFF;
    I2C_SendData(I2C, Waddr);
    while(!STS)//等待写入地址发送完毕
    {
        delay_us(1);
    }
    STS=0;
    I2C_SendData(I2C, Tdata);
    while(!STS)//等待数据发送完毕
    {
        delay_us(1);
    }
    STS=0;
    I2C_GenerateSTOP(I2C,ENABLE);
    I2C_wait(I2C);
}

/**
 *@brief  Example of writing data to EEPROM via I2C bus with interrupt mode.
  * @param  Raddr: The operating address.
  *   This parameter can be 0~127.	131072(16Kb/slice)/8(b/BYTE)/16(BYTE/page)=128page
 *retval The value of the read data.
 */
uint8_t CAT24_Read_Int(uint16_t Raddr)
{
    uint8_t tmp;
    uint8_t Device_Addr;
    STS=0;
    I2C_BUSY(I2C);
    STS=0;

    Raddr = Raddr & 0x7FF;
    Device_Addr=0xA0 + (Raddr>>7);

    I2C_Send7bitAddress(I2C, Device_Addr, I2C_Direction_Transmitter);
    while(!STS)//等待从设备地址发送完毕
    {
        delay_us(1);
    }
    STS=0;
    Raddr = Raddr & 0xFF;
    I2C_SendData(I2C, Raddr);
    while(!STS)//等待读取地址发送完毕
    {
        delay_us(1);
    }
    STS=0;
    I2C_Send7bitAddress(I2C, Device_Addr, I2C_Direction_Receiver);
    while(!STS)//等待从设备地址发送完毕
    {
        delay_us(1);
    }
    STS=0;
    I2C_ReceiveData(I2C,I2C_ACK_Set,I2C_STOP_Set);
    while(!STS)//等待数据接收完毕
    {
        delay_us(1);
    }
    tmp=(uint8_t)I2C->DR;

    return tmp;
}


