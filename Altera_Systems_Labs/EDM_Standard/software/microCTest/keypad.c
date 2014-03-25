/*****************************************************************************
*                                                                            *
* File Name   : keypad.c                                                     *
* Author      : Queron Williams                                              *
* Date        : 01/03/2014                                                   *
* Requires    : <stdio.h>                                                    *
*               "system.h"                                                   *
*               "altera_avalon_pio_regs.h"                                   *
*               "keypad.h"  
*             	requires an aray int button[17] to be declared as gloablal   *
* Description : This file contains all of the functions needed to setup      *
*               the ports that connect to the keypad;                        *
*               PORTA - input from rows,                                     *
*               KEYOUT - input to the columns.                               *
*               And to read values from the keypad. The keypad buttons       *
*               are identified as shown below                                *
*				                                                             *
* Keypad layout :-                                                           *
*               *************                                                *
*	  			*1  2  3  4 *                                                *
*	  			*5  6  7  8 *                                                *
*	  			*9  10 11 12*                                                *
*	  			*13 14 15 16*                                                *
*               *************                                                *
******************************************************************************/
#include <stdio.h>
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "keypad.h"

#define CHECK_BIT(var,pos) !!((var) & (1<<(pos)))//macro for checking single bit

/*****************************************************************************
*                                                                            *
* Function    : Initilise_Keypad                                             *
* Author      : Queron Williams                                              *
* Date        : 02/03/2014                                                   *
* Inputs      : N/A                                                          *
* Outputs     : N/A                                                          *
* Description : Sets up the keypad ready for use by enabling PORTA to        *
*               be used as an input                                          *
*                                                                            *
******************************************************************************/
void Initilise_Keypad()
{
	/* set portA to be used as an input */
	IOWR_ALTERA_AVALON_PIO_DIRECTION(PORT_A_BASE, ALTERA_AVALON_PIO_DIRECTION_INPUT);
}

/*****************************************************************************
*                                                                            *
* Function    : checkKeypad                                                  *
* Author      : Queron Williams                                              *
* Date        : 03/03/2014                                                   *
* Inputs      : N/A                                                          *
* Outputs     : N/A                                                          *
* Description : Checks each colum of the keypad and modify a global variable *
*               stating whether each button is pushed                        *
*                                                                            *
******************************************************************************/

void checkKeypad()
{
	memset(button, 0, sizeof(int)*17); //quickley resets the  button array
	int temp = 0;
	int temp2 = 0;
	button[PRESSED] = 0;

	IOWR_ALTERA_AVALON_PIO_DATA(KEY_OUT_BASE, 0x01); // enable first colum
	temp = IORD_ALTERA_AVALON_PIO_DATA(PORT_A_BASE);//read button inputs
	if ( temp != 0  ) {
		button[PRESSED] =  1;	// check if any butons pressed.
		button[M1] = CHECK_BIT(temp, 0);
		button[UPLEFT] = CHECK_BIT(temp, 1);
		button[LEFT] = CHECK_BIT(temp, 2);
		button[DOWNLEFT] = CHECK_BIT(temp, 3);
	}
	IOWR_ALTERA_AVALON_PIO_DATA(KEY_OUT_BASE, 0x02); // enable 2nd colum
	temp = IORD_ALTERA_AVALON_PIO_DATA(PORT_A_BASE);//read button inputs
	if ( temp != 0  ) {
		button[PRESSED] = 1;	// check if any butons pressed.
		button[M2] = CHECK_BIT(temp, 0);
		button[UP] = CHECK_BIT(temp, 1);
		button[STOP] = CHECK_BIT(temp, 2);
		button[DOWN] = CHECK_BIT(temp, 3);
	}
	IOWR_ALTERA_AVALON_PIO_DATA(KEY_OUT_BASE, 0x04); // enable 3rd colum
	temp = IORD_ALTERA_AVALON_PIO_DATA(PORT_A_BASE);//read button inputs
	if ( temp != 0  ) {
		button[PRESSED] = 1;	// check if any butons pressed.
		button[M3] = CHECK_BIT(temp, 0);
		button[UPRIGHT] = CHECK_BIT(temp, 1);
		button[RIGHT] = CHECK_BIT(temp, 2);
		button[DOWNRIGHT] = CHECK_BIT(temp, 3);
	}
	IOWR_ALTERA_AVALON_PIO_DATA(KEY_OUT_BASE, 0x08); // enable last colum
	temp = IORD_ALTERA_AVALON_PIO_DATA(PORT_A_BASE);//read button inputs
	if ( temp != 0  ) {
		button[PRESSED] = 1;	// check if any butons pressed.
		button[DELETE] = CHECK_BIT(temp, 0);
		button[PLAY] = CHECK_BIT(temp, 1);
		button[RECORD] = CHECK_BIT(temp, 2);
		button[SHIFT] = CHECK_BIT(temp, 3);
	}
	return;
}
