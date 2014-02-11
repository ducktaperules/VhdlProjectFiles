
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "alt_types.h"
#include "pwm.h"


Initilise_PWM(int Modules_To_Initilise)
{
    switch (Modules_To_Initilise)
    {
        case 6 :
            IOWR_ALTERA_AVALON_PWM_CLK_DIV(PWM_5_BASE, 200);
            IOWR_ALTERA_AVALON_PWM_DUTY(PWM_5_BASE, 50);
            IOWR_ALTERA_AVALON_PWM_PERIOD(PWM_5_BASE, 1000);
            IOWR_ALTERA_AVALON_PWM_CONTROL(PWM_5_BASE, 1);
        
        case 5 :
            IOWR_ALTERA_AVALON_PWM_CLK_DIV(PWM_4_BASE, 200);
            IOWR_ALTERA_AVALON_PWM_DUTY(PWM_4_BASE, 50);
            IOWR_ALTERA_AVALON_PWM_PERIOD(PWM_4_BASE, 1000);
            IOWR_ALTERA_AVALON_PWM_CONTROL(PWM_4_BASE, 1);
        
        case 4 :
            IOWR_ALTERA_AVALON_PWM_CLK_DIV(PWM_3_BASE, 200);
            IOWR_ALTERA_AVALON_PWM_DUTY(PWM_3_BASE, 50);
            IOWR_ALTERA_AVALON_PWM_PERIOD(PWM_3_BASE, 1000);
            IOWR_ALTERA_AVALON_PWM_CONTROL(PWM_3_BASE, 1);
        
        case 3 :
            IOWR_ALTERA_AVALON_PWM_CLK_DIV(PWM_2_BASE, 200);
            IOWR_ALTERA_AVALON_PWM_DUTY(PWM_2_BASE, 50);
            IOWR_ALTERA_AVALON_PWM_PERIOD(PWM_2_BASE, 1000);
            IOWR_ALTERA_AVALON_PWM_CONTROL(PWM_2_BASE, 1);
        
        case 2 :
            IOWR_ALTERA_AVALON_PWM_CLK_DIV(PWM_1_BASE, 200);
            IOWR_ALTERA_AVALON_PWM_DUTY(PWM_1_BASE, 50);
            IOWR_ALTERA_AVALON_PWM_PERIOD(PWM_1_BASE, 1000);
            IOWR_ALTERA_AVALON_PWM_CONTROL(PWM_1_BASE, 1);
        
        case 1 :    
            IOWR_ALTERA_AVALON_PWM_CLK_DIV(PWM_0_BASE, 200);
            IOWR_ALTERA_AVALON_PWM_DUTY(PWM_0_BASE, 50);
            IOWR_ALTERA_AVALON_PWM_PERIOD(PWM_0_BASE, 1000);
            IOWR_ALTERA_AVALON_PWM_CONTROL(PWM_0_BASE, 1);
    }
    return 1;   
}