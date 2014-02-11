/******************************************
*
* Interface code for the AD7918 ADC fitted to the Nial Stewart Developments Ltd 
* General Purpose Interface Board (GPIB).
* Author:   N Gunton
* Org:      Dept. Engineering Design & Mathematics, UWE, Bristol
* Date:     01/04/10
* Platform: Altera Cyclone III starter board + FreeRTOS
*
* Defines from system.h ( subject to change )
* #define AD7928_NAME "/dev/ad7928"
* #define AD7928_BASE 0x09000060
* #define AD7928_SPAN 32
* #define AD7928_IRQ 3
* #define AD7928_DATABITS 8 IS THIS RIGHT????
* #define AD7928_DATAWIDTH 16
* clock is 10 MHz
* #define AD7928_NUMSLAVES 1
* #define AD7928_ISMASTER 1
* #define AD7928_CLOCKPOLARITY 0 this isn't what I set in SOPC should be 1?
* #define AD7928_CLOCKPHASE 0
* #define AD7928_LSBFIRST 0 msb first
* #define AD7928_EXTRADELAY 0
* #define AD7928_TARGETSSDELAY 0.0 should be 10 ns
* #define ALT_MODULE_CLASS_ad7928 altera_avalon_spi
* 
* functions provided by altera_avalon_spi.h
* IORD_ALTERA_AVALON_SPI_RXDATA(base)
* IOWR_ALTERA_AVALON_SPI_TXDATA(base, data)
* IORD_ALTERA_AVALON_SPI_STATUS(base)
* IOWR_ALTERA_AVALON_SPI_STATUS(base, data)
* IORD_ALTERA_AVALON_SPI_CONTROL(base)
* IOWR_ALTERA_AVALON_SPI_CONTROL(base, data)
* IOWR_ALTERA_AVALON_SPI_SLAVE_SEL(base, data)
* 
* There is a complete set of named masks for control and status bits also.
* 
* Note there are two seperate issues here. Setting up and handling the SPI
* interface; controlling the ADC via the SPI
*
**************************************************/

/*************************************************
 * 
 * Register details for ADC7918
 * Control: 12 bits wide, first 12 of 16 bits used
 * ___________________________________________________________________
 * |write|SEQ|don'tcare|ADD2|ADD1|ADD0|PM1|PM0 |SHADOW|DC|RANGE|CODING|
 * | 11  |10 | 9       | 8  | 7  | 6  | 5 | 4  |  3   |2 |  1  |  0   |
 * |1=wr |n1 |         |ch to convert |pwr mode| n1   |  | n2  | n3   |
 * 
 * n1: selects the mode of channel sampling 00= addressed channel only
 * n2: 0 = 0v to 2*REFin, 1 = 0v to REFin
 * n3: 0 = two's comp output, 1 = raw binary
 * 
 * default control setting is 0x8310= write, addr 000, full power, no seq, 
 * full range, straight binary. don't cares = 0
 * 
 * Sequence register is 16 bits (2*8), order of channel sampling
 */ 

/* Scheduler includes. */
#include "FreeRTOS.h"
#include "task.h"
#include "stdio.h"

/* Demo app includes. */
#include "system.h"
#include "altera_avalon_spi_regs.h"
#include "altera_avalon_spi.h"

#define ADC_DEFAULT 0x8310




/*****************************
 * 
 * vAdcInitialise:
 * Must do two dummy conversions after power up to ensure that the ADC is 
 * in a valid state. See ADC data sheet p22-23
 * 
 * ***************************/
void vAdcInitialise(void)
{
    unsigned portSHORT i = 0;
    unsigned portBASE_TYPE status;
    
    IOWR_ALTERA_AVALON_SPI_CONTROL(AD7928_BASE, 0); /* disable interrupts */
    IOWR_ALTERA_AVALON_SPI_SLAVE_SEL(AD7928_BASE, 1);
    /* no need to setup slave select register as only one slave but just in case*/
    
    for (i = 0; i<2; i++)
    {
        do
        { 
            status = IORD_ALTERA_AVALON_SPI_STATUS(AD7928_BASE);
        }
        while ( (status & ALTERA_AVALON_SPI_STATUS_TRDY_MSK) == 0)
     ; /* wait for tx_ready bit to go high, SPI master  */
     
     
     IOWR_ALTERA_AVALON_SPI_TXDATA(AD7928_BASE,0xFFFF ); /* 2 dummy writes to ADC to initialise it */
    }      
     do
        { 
            status = IORD_ALTERA_AVALON_SPI_STATUS(AD7928_BASE);
        }
     while ( (status & ALTERA_AVALON_SPI_STATUS_TRDY_MSK) == 0);
    
     IOWR_ALTERA_AVALON_SPI_TXDATA(AD7928_BASE,ADC_DEFAULT );
}

/*****************************************************
 *
 * If there is a sample waiting then return it immediately
 * else do a blank Tx and return the received sample.  
 ****************************************************/
void vAdcRx(unsigned short *psRxData)
{
    unsigned int status;

    do
        { 
            status = IORD_ALTERA_AVALON_SPI_STATUS(AD7928_BASE);
        }
     while (    ((status & ALTERA_AVALON_SPI_STATUS_RRDY_MSK ) == 0)  
             && ((status & ALTERA_AVALON_SPI_STATUS_TRDY_MSK )== 0)
           );
           
    if ((status & ALTERA_AVALON_SPI_STATUS_TRDY_MSK) != 0)
    {
       IOWR_ALTERA_AVALON_SPI_TXDATA(AD7928_BASE, 0 );
    }
    if ((status & ALTERA_AVALON_SPI_STATUS_RRDY_MSK) != 0)
    {
        *psRxData = IORD_ALTERA_AVALON_SPI_RXDATA(AD7928_BASE); /* return sample */
    }
} 



