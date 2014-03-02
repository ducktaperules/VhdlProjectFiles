
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "alt_types.h"
#include "pwm.h"
#include "utilities.h"

/***********************************Initilise PWM Modules*****************************************
 *
 *  Author      : Sam Hughes, Queron Williams
 *  Date        : 11/02/2014
 *  Inputs      : Module_To_Initilise specifies which of the PWM modules to start-up
 *  Outputs     : 1 if module successfully initilised
 *                0 if input is out of range
 *
 *  Description : This module runs the start up sequence for whichever PWM module is specified
 *                by the input variable
 *
 **************************************************************************************************/
int initilisePwm(char moduleToInitilise)
{
    switch (moduleToInitilise)
    {
        case 'B' :
            IOWR_ALTERA_AVALON_PWM_CLK_DIV(MY_PWM_5_BASE, 50);
            IOWR_ALTERA_AVALON_PWM_DUTY(MY_PWM_5_BASE, 50);
            IOWR_ALTERA_AVALON_PWM_PERIOD(MY_PWM_5_BASE, 2000);
            IOWR_ALTERA_AVALON_PWM_CONTROL(MY_PWM_5_BASE, 1);
            break;

        case 'S' :
            IOWR_ALTERA_AVALON_PWM_CLK_DIV(MY_PWM_3_BASE, 50);
            IOWR_ALTERA_AVALON_PWM_DUTY(MY_PWM_3_BASE, 50);
            IOWR_ALTERA_AVALON_PWM_PERIOD(MY_PWM_3_BASE, 2000);
            IOWR_ALTERA_AVALON_PWM_CONTROL(MY_PWM_3_BASE, 1);

            IOWR_ALTERA_AVALON_PWM_CLK_DIV(MY_PWM_4_BASE, 50);
            IOWR_ALTERA_AVALON_PWM_DUTY(MY_PWM_4_BASE, 50);
            IOWR_ALTERA_AVALON_PWM_PERIOD(MY_PWM_4_BASE, 2000);
            IOWR_ALTERA_AVALON_PWM_CONTROL(MY_PWM_4_BASE, 1);
            break;

        case 'E' :
            IOWR_ALTERA_AVALON_PWM_CLK_DIV(MY_PWM_2_BASE, 50);
            IOWR_ALTERA_AVALON_PWM_DUTY(MY_PWM_2_BASE, 50);
            IOWR_ALTERA_AVALON_PWM_PERIOD(MY_PWM_2_BASE, 2000);
            IOWR_ALTERA_AVALON_PWM_CONTROL(MY_PWM_2_BASE, 1);
            break;

        case 'W' :
            IOWR_ALTERA_AVALON_PWM_CLK_DIV(MY_PWM_1_BASE, 50);
            IOWR_ALTERA_AVALON_PWM_DUTY(MY_PWM_1_BASE, 50);
            IOWR_ALTERA_AVALON_PWM_PERIOD(MY_PWM_1_BASE, 2000);
            IOWR_ALTERA_AVALON_PWM_CONTROL(MY_PWM_1_BASE, 1);
            break;

        case 'G' :
            IOWR_ALTERA_AVALON_PWM_CLK_DIV(MY_PWM_0_BASE,50);//100
            IOWR_ALTERA_AVALON_PWM_DUTY(MY_PWM_0_BASE, 50);
            IOWR_ALTERA_AVALON_PWM_PERIOD(MY_PWM_0_BASE, 2000);//1000
            IOWR_ALTERA_AVALON_PWM_CONTROL(MY_PWM_0_BASE, 1);
            break;

            default :
            	break;
                return 0;
    }
    return 1;
}
/***********************************Set PWM Duty Cycle*****************************************
 *
 *  Author      : Sam Hughes, Queron Williams
 *  Date        : 11/02/2014
 *  Inputs      : Channel selects which of the six PWM modules should be updated
 *                Duty_Cycle the value that the PWM will be updated to
 *  Outputs     : 1 if module successfully updated
 *                0 if unknown PWM module or selected module has not been initilised
 *
 *  Description : This module updates the duty cycle for the selected PWM module
 *
 **************************************************************************************************/
int setPwmDutyCycle ( int channel, int dutyCycle)
{
    //get address of PWM Channel

    int address = 0;

    switch (channel)
    {
        case 1 :
            address = MY_PWM_0_BASE;
            break;
        case 2 :
            address = MY_PWM_1_BASE;
            break;
        case 3 :
            address = MY_PWM_2_BASE;
            break;
        case 4 :
            address = MY_PWM_3_BASE;
            break;
        case 5 :
            address = MY_PWM_4_BASE;
            break;
        case 6 :
            address = MY_PWM_5_BASE;
            break;
        default :
            //unrecognised channal selected
            return 0;

    }

    //check the desired PWM module is active
    if(IORD_ALTERA_AVALON_PWM_CONTROL(address) == 0)
    {
        return 0;
    }

    //check duty cycle is within bounds (0-100)
    //if(Duty_Cycle > 125) Duty_Cycle = 125;
    //if(Duty_Cycle < 25) Duty_Cycle = 0;
    //set the channel to the desired Duty Cycle
    IOWR_ALTERA_AVALON_PWM_DUTY(address, dutyCycle);

    return 1;
}
/***********************************Set Servo Position*****************************************
 *
 *  Author      : Queron Williams
 *  Date        : 11/02/2014
 *  Inputs      : Channel selects which of the six PWM modules should be updated
 *                Duty_Cycle the value that the PWM will be updated to
 *  Outputs     : Calculated pulse width which was sent to the servo,
 *  			  0 if unknown servo is updated
 *  Description : This module converts an input angle to a pulse width and passes it
 *  			  to the corresponding PWM module
 *
 **************************************************************************************************/
int setServoPosition (char servo, int position)
{
	int pulseWidth = map(position,-90,90,50,250);
    switch (servo)
    {
        case 'G' :
        	setPwmDutyCycle(1, pulseWidth);
            break;
        case 'W' :
        	setPwmDutyCycle(2, pulseWidth);
            break;
        case 'E' :
        	setPwmDutyCycle(3, pulseWidth);
            break;
        case 'S' :
        	setPwmDutyCycle(4, pulseWidth);
        	setPwmDutyCycle(5, pulseWidth);
            break;
        case 'B' :
        	setPwmDutyCycle(6, pulseWidth);
            break;
        default :
            //unrecognised channal selected
            return 0;
    }
    return pulseWidth;
}
