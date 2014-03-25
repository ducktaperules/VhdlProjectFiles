
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "alt_types.h"
#include "pwm.h"
#include "utilities.h"
#include "math.h" 	//used for round()

/***********************************Initilise PWM Modules*****************************************
 *
 *  Author      : Queron Williams
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
    int address = 0;
    switch (moduleToInitilise)
    {
        case 'B' : // Base
        	address = MY_PWM_5_BASE;
            break;
        case 'S' : //Shoulder1
        	address = MY_PWM_3_BASE;
            break;
        case 's' : //shoulder2
        	address = MY_PWM_4_BASE;
            break;
        case 'E' : //Elbow
        	address = MY_PWM_2_BASE;
            break;
        case 'W' : //Wrist
        	address = MY_PWM_1_BASE;
            break;
        case 'G' : //Gripper
        	address = MY_PWM_0_BASE;
            break;
        default :
        	return 0;
        	break;
    }
		IOWR_ALTERA_AVALON_PWM_CLK_DIV(address,5);//100
		IOWR_ALTERA_AVALON_PWM_DUTY(address, 1500);
		IOWR_ALTERA_AVALON_PWM_PERIOD(address, 20000);//1000
		IOWR_ALTERA_AVALON_PWM_CONTROL(address, 1);

    return 1;
}
/***********************************Set PWM Duty Cycle*****************************************
 *
 *  Author      : Queron Williams
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
int setServoPosition (char servo, float position)
{
	int pulseWidth = round(map(position,-90,90,400,2100));//50 to 250
    switch (servo)
    {
        case 'G' : //Gripper
        	setPwmDutyCycle(1, pulseWidth);
            break;
        case 'W' : //Wrist
        	setPwmDutyCycle(2, pulseWidth);
            break;
        case 'E' : //Elbow
        	setPwmDutyCycle(3, pulseWidth);
            break;
        case 'S' : //Shoulder
        	setPwmDutyCycle(4, pulseWidth);
        	setPwmDutyCycle(5, pulseWidth);
            break;
        case 'B' :	// Base
        	setPwmDutyCycle(6, pulseWidth);
            break;
        default :
            //unrecognised channal selected
            return 0;
    }
    return pulseWidth;
}
