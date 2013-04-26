/****************************************************************************
 *   $Id:: uart_main.c 4824 2010-09-07 18:47:51Z nxp21346                   $
 *   Project: NXP LPC11xx UART example
 *
 *   Description:
 *     This file contains UART test modules, main entry, to test UART APIs.
 *
 ****************************************************************************
 * Software that is described herein is for illustrative purposes only
 * which provides customers with programming information regarding the
 * products. This software is supplied "AS IS" without any warranties.
 * NXP Semiconductors assumes no responsibility or liability for the
 * use of the software, conveys no license or title under any patent,
 * copyright, or mask work right to the product. NXP Semiconductors
 * reserves the right to make changes in the software without
 * notification. NXP Semiconductors also make no representation or
 * warranty that such application will be suitable for the specified
 * use without further testing or modification.
****************************************************************************/
#include "driver_config.h"
#include "target_config.h"

#include "uart.h"
#include "adc.h"

extern volatile uint32_t UARTCount;
extern volatile uint8_t UARTBuffer[BUFSIZE];

int main (void) {
	  /* Basic chip initialization is taken care of in SystemInit() called
	   * from the startup code. SystemInit() and chip settings are defined
	   * in the CMSIS system_<part family>.c file.
	   */

  /* NVIC is installed inside UARTInit file. */
  UARTInit(UART_BAUD);

#if MODEM_TEST
  ModemInit();
#endif

  int i = 0;
  /* Initialize ADC  */
    ADCInit( ADC_CLK );

  while (1) 
  {
	#if CONFIG_ADC_ENABLE_ADC_IRQHANDLER==1		/* Interrupt driven */
	for ( i = 0; i < ADC_NUM; i++ )
	{
	  ADCRead( i );
	  while ( !ADCIntDone );
	  ADCIntDone = 0;
	}
	#endif
	  /* Loop forever */
	//if ( UARTCount != 0 )
	//{
	  LPC_UART->IER = IER_THRE | IER_RLS;			/* Disable RBR */
	  int sendNumber = ADCValue[0] - 512;

	  uint8_t bytePackage[6];
	  bytePackage[2] = sendNumber;
	  bytePackage[3] = sendNumber >> 8;
	  bytePackage[4] = sendNumber;
	  bytePackage[5] = sendNumber >> 8;
	  bytePackage[0] = 0x77;
	  bytePackage[1] = 0x12;
	  //memcpy (&(bytePackage[2]), sendNumber, 2 );
	  //memcpy (&(bytePackage[4]), sendNumber, 2 );

	  //uint8_t thisUart = 2;
	  //UARTSend( (uint8_t *) &thisUart, 1);
	  UARTSend( (uint8_t *)bytePackage, 6 );
	  //UARTSend( (uint8_t)* &"\n", 2);
	  UARTCount = 0;
	  LPC_UART->IER = IER_THRE | IER_RLS | IER_RBR;	/* Re-enable RBR */
	//}
  }
}
