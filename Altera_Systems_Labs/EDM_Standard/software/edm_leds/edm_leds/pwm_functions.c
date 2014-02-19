
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "alt_types.h"
#include "pwm.h"

/***********************************Initilise PWM Modules*****************************************
 * 
 *  Author      : Sam Hughes
 *  Date        : 11/02/2014 
 *  Inputs      : Module_To_Initilise specifies which of the PWM modules to start-up
 *  Outputs     : 1 if module successfully initilised
 *                0 if input is out of range 
 * 
 *  Description : This module runs the start up sequence for whichever PWM module is specified 
 *                by the input variable
 *  
 **************************************************************************************************/
Initilise_PWM(int Module_To_Initilise)
{
    switch (Module_To_Initilise)
    {
        case 6 :
            IOWR_ALTERA_AVALON_PWM_CLK_DIV(PWM_5_BASE, 200);
            IOWR_ALTERA_AVALON_PWM_DUTY(PWM_5_BASE, 50);
            IOWR_ALTERA_AVALON_PWM_PERIOD(PWM_5_BASE, 1000);
            IOWR_ALTERA_AVALON_PWM_CONTROL(PWM_5_BASE, 1);
            break;
        
        case 5 :
            IOWR_ALTERA_AVALON_PWM_CLK_DIV(PWM_4_BASE, 200);
            IOWR_ALTERA_AVALON_PWM_DUTY(PWM_4_BASE, 50);
            IOWR_ALTERA_AVALON_PWM_PERIOD(PWM_4_BASE, 1000);
            IOWR_ALTERA_AVALON_PWM_CONTROL(PWM_4_BASE, 1);
            break;
        
        case 4 :
            IOWR_ALTERA_AVALON_PWM_CLK_DIV(PWM_3_BASE, 200);
            IOWR_ALTERA_AVALON_PWM_DUTY(PWM_3_BASE, 50);
            IOWR_ALTERA_AVALON_PWM_PERIOD(PWM_3_BASE, 1000);
            IOWR_ALTERA_AVALON_PWM_CONTROL(PWM_3_BASE, 1);
            break;
        
        case 3 :
            IOWR_ALTERA_AVALON_PWM_CLK_DIV(PWM_2_BASE, 200);
            IOWR_ALTERA_AVALON_PWM_DUTY(PWM_2_BASE, 50);
            IOWR_ALTERA_AVALON_PWM_PERIOD(PWM_2_BASE, 1000);
            IOWR_ALTERA_AVALON_PWM_CONTROL(PWM_2_BASE, 1);
            break;
        
        case 2 :
            IOWR_ALTERA_AVALON_PWM_CLK_DIV(PWM_1_BASE, 200);
            IOWR_ALTERA_AVALON_PWM_DUTY(PWM_1_BASE, 50);
            IOWR_ALTERA_AVALON_PWM_PERIOD(PWM_1_BASE, 1000);
            IOWR_ALTERA_AVALON_PWM_CONTROL(PWM_1_BASE, 1);
            break;
        
        case 1 :    
            IOWR_ALTERA_AVALON_PWM_CLK_DIV(PWM_0_BASE, 200);
            IOWR_ALTERA_AVALON_PWM_DUTY(PWM_0_BASE, 50);
            IOWR_ALTERA_AVALON_PWM_PERIOD(PWM_0_BASE, 1000);
            IOWR_ALTERA_AVALON_PWM_CONTROL(PWM_0_BASE, 1);
            break;
            
            case default :
                return 0;
    }
    return 1;   
}
/***********************************Initilise PWM Modules*****************************************
 * 
 *  Author      : Sam Hughes
 *  Date        : 11/02/2014 
 *  Inputs      : Channel selects which of the six PWM modules should be updated
 *                Duty_Cycle the value that the PWM will be updated to 
 *  Outputs     : 1 if module successfully updated
 *                0 if unknown PWM module or selected module has not been initilised 
 * 
 *  Description : This module updates the duty cycle for the selected PWM module
 *  
 **************************************************************************************************/
int Set_PWM_Duty_Cycle ( int Channel, int Duty_Cycle)
{
    //get address of PWM Channel
    
    int Address = 0;
    
    switch (Channel)
    {
        case 1 :
            Address = PWM_0_BASE;
            break;
        case 2 :
            Address = PWM_1_BASE;
            break;
        case 3 :
            Address = PWM_2_BASE;
            break;       
        case 4 :
            Address = PWM_3_BASE;
            break;
        case 5 :
            Address = PWM_4_BASE;
            break;
        case 6 :
            Address = PWM_5_BASE;
            break;
        case default :
            //unrecognised channal selected 
            return 0;
           
    }
    
    //check the desired PWM module is active
    if(IORD_ALTERA_AVALON_PWM_CONTROL(Address) == 0)
    {
        return 0;
    }
    
    //check duty cycle is within bounds (0-100)
    if(Duty_Cycle > 100) Duty_Cycle = 100;
    if(Duty_Cycle < 0) Duty_Cycle = 0;
    //set the channel to the desired Duty Cycle
    IOWR_ALTERA_AVALON_PWM_DUTY(Address, Duty_Cycle);
    
    return 1;   
}