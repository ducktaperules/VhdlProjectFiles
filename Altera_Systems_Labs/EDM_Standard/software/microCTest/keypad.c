/*****************************************************************************
*                                                                            *
* File Name   : keypad.c                                                     *
* Author      : Sam Hughes                                                   *
* Date        : 01/03/2014                                                   *
* Requires    : <stdio.h>                                                    *
*               "system.h"                                                   *
*               "altera_avalon_pio_regs.h"                                   *
*               "keypad.h"                                                   *
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

#define CHECK_BIT(var,pos) !!((var) & (1<<(pos)))



/*****************************************************************************
*                                                                            *
* Function    : Initilise_Keypad                                             *
* Author      : Sam Hughes                                                   *
* Date        : 01/03/2014                                                   *
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
* Function    : Check_Keypad                                                 *
* Author      : Sam Hughes                                                   *
* Date        : 01/03/2014                                                   *
* Inputs      : N/A                                                          *
* Outputs     : 0 if no button detected as pressed                           *
*               1 -> 16 representing which key has been pressed, with        *
*               reference to the keypad layout diagram shown below.          *
*               Keypad layout :-                                             *
*                            *************                                   *
*	  			             *1  2  3  4 *                                   *
*	  			             *5  6  7  8 *                                   *
*	  			             *9  10 11 12*                                   *
*	  			             *13 14 15 16*                                   *
*                            *************                                   *
* Description : This function applys a rolling 1 to the columns of the       *
*               4x4 matrix keypad, each column is set high, then each row    *
*               is read. If A row is detected as high the key in that        *
*               row at the corrosponding column position must be pressed     *
*               The value of the pressed key is returned as the output       *
*                                                                            *
******************************************************************************/

int Check_Keypad()
{
	int keypad_Val = 0;

	int col;
	/* run through each row until we find a button that has been pressed     *
	 * or, if no button found return 0                                       */
	for(col = 0; col < 4; col++)
	{
		/* enable the row */
		Enable_Keypad_Col(col);
		/* read the row buttons */
		keypad_Val = Read_Keypad_Col(col);
		/* if the returned value is not 0 a key in this row is pressed       *
		 * so stop looking                                                   */
		if(keypad_Val != 0)
		{
			break;
		}

		/*usleep(100);*/
	}

	return keypad_Val;
}

/*****************************************************************************
*
******************************************************************************/
void Enable_Keypad_Col(int col)
{
	/* value that will set the correct column high */
	int enable_Value = 0;

	switch (col)
	{
	case 0 :
		/*set the first bit high 1000 */
		enable_Value = 0x1;
	break;
	case 1 :
		/*set the second bit high 0100 */
		enable_Value = 0x2;
		break;
	case 2 :
		/*set the third bit high 0010 */
		enable_Value = 0x4;
		break;
	case 3 :
		/*set the fourth bit high 0001 */
		enable_Value = 0x8;
		break;
	default :
		/*the value specified is not valid*/
		enable_Value = 0x00;
		break;
	}
	/*if the value is valid (not 0) send value to key_out port*/
	if(enable_Value != 0)
	{
		IOWR_ALTERA_AVALON_PIO_DATA(KEY_OUT_BASE, enable_Value);
	}

}

/*****************************************************************************
*                                                                            *
* Function    : Read_Keypad_Col                                              *
* Author      : Sam Hughes                                                   *
* Date        : 01/03/2014                                                   *
* Inputs      : col specifies which column of the keypad is currently high   *
* Outputs     : 0 if no button is pressed                                    *
*               1 - 16 if a button is pressed representing the pressed       *
*               key according to the keypad layout                           *
* Description : This function detects if a key in the active column is       *
*				pressed, and if identifies where on the keypad it is.        *
*                                                                            *
*				        Keypad layout :-                                     *
*                                *************                               *
*	  			                 *1  2  3  4 *                               *
*	  			                 *5  6  7  8 *                               *
*	  			                 *9  10 11 12*                               *
*	  			                 *13 14 15 16*                               *
*                                *************                               *
*                                                                            *
******************************************************************************/
int Read_Keypad_Col(int col)
{
	int col_Val = 0;
	int col_Button = 0;
	int button = 0;
	/*read port a*/
	col_Val = IORD_ALTERA_AVALON_PIO_DATA(PORT_A_BASE);
	/*if all values are not high (0x0F) a button is pressed*/

		/*find which button is pressed by finding
		 * which bit is low*/
		switch (col_Val)
		{
		/*port a value is 0111*/
		case  0x01 :
			col_Button = 1;
			break;
		/*port a value is 1011*/
		case  0x02 :
			col_Button = 2;
			break;
		/*port a value is 1101*/
		case  0x04 :
			col_Button = 3;
			break;
		/*port a value is 1110*/
		case  0x08 :
			col_Button = 4;
			break;
			/*button value is unknown - ie more than one button
			 * in the row is pressed or no button is pressed*/
		default :
			col_Button = 0;
		}
		/* based on row assign the button a value between 0 and 16*/
		/* if unrecognised (ie multiple buttons act as though none
		 * have been pressed
		 */
		if(col_Button == 0)
		{
			button = 0;
		}
		else
		{
			/* find the identifier for the currently pressed key */
			button = (col + 1) + (col_Button - 1) * 4;
		}

	return button;
}

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
		button[SHIFT] = CHECK_BIT(temp, 0);
		button[UPLEFT] = CHECK_BIT(temp, 1);
		button[LEFT] = CHECK_BIT(temp, 2);
		button[DOWNLEFT] = CHECK_BIT(temp, 3);
	}
	IOWR_ALTERA_AVALON_PIO_DATA(KEY_OUT_BASE, 0x02); // enable 2nd colum
	temp = IORD_ALTERA_AVALON_PIO_DATA(PORT_A_BASE);//read button inputs
	if ( temp != 0  ) {
		button[PRESSED] = 1;	// check if any butons pressed.
		button[M1] = CHECK_BIT(temp, 0);
		button[UP] = CHECK_BIT(temp, 1);
		button[STOP] = CHECK_BIT(temp, 2);
		button[DOWN] = CHECK_BIT(temp, 3);
	}
	IOWR_ALTERA_AVALON_PIO_DATA(KEY_OUT_BASE, 0x04); // enable 3rd colum
	temp = IORD_ALTERA_AVALON_PIO_DATA(PORT_A_BASE);//read button inputs
	if ( temp != 0  ) {
		button[PRESSED] = 1;	// check if any butons pressed.
		button[M2] = CHECK_BIT(temp, 0);
		button[UPRIGHT] = CHECK_BIT(temp, 1);
		button[RIGHT] = CHECK_BIT(temp, 2);
		button[DOWNRIGHT] = CHECK_BIT(temp, 3);
	}
	IOWR_ALTERA_AVALON_PIO_DATA(KEY_OUT_BASE, 0x08); // enable last colum
	temp = IORD_ALTERA_AVALON_PIO_DATA(PORT_A_BASE);//read button inputs
	if ( temp != 0  ) {
		button[PRESSED] = 1;	// check if any butons pressed.
		button[M3] = CHECK_BIT(temp, 0);
		button[MENU] = CHECK_BIT(temp, 1);
		button[RECORD] = CHECK_BIT(temp, 2);
		button[PLAY] = CHECK_BIT(temp, 3);
	}
	return;
}
