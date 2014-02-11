#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "alt_types.h"
#include "pwm.h"
/*
* This is a freestanding application, so we want to use alt_main
* as the entry point. However, if the debugger is run on this
* application, it will try to set a breakpoint at main, which
* the application does not contain. The below line creates an
* alias so the debugger is able to set a breakpoint at main,
* yet the application retains alt_main as its entry point.
*/
int main (void) __attribute__ ((weak, alias ("alt_main")));
/*
* Use alt_main as entry point for this free-standing application
*/
int alt_main (void)
{
alt_u16 pwm = 50;
alt_u8 dir = 0;
volatile int i;

    IOWR_ALTERA_AVALON_PWM_CLK_DIV(PWM_0_BASE, 200);
    IOWR_ALTERA_AVALON_PWM_DUTY(PWM_0_BASE, 100);
    IOWR_ALTERA_AVALON_PWM_PERIOD(PWM_0_BASE, 1000);
    IOWR_ALTERA_AVALON_PWM_CONTROL(PWM_0_BASE, 1);
    
    IOWR_ALTERA_AVALON_PWM_CLK_DIV(PWM_1_BASE, 200);
    IOWR_ALTERA_AVALON_PWM_DUTY(PWM_1_BASE, 100);
    IOWR_ALTERA_AVALON_PWM_PERIOD(PWM_1_BASE, 1000);
    IOWR_ALTERA_AVALON_PWM_CONTROL(PWM_1_BASE, 1);
    
    IOWR_ALTERA_AVALON_PWM_CLK_DIV(PWM_2_BASE, 200);
    IOWR_ALTERA_AVALON_PWM_DUTY(PWM_2_BASE, 100);
    IOWR_ALTERA_AVALON_PWM_PERIOD(PWM_2_BASE, 1000);
    IOWR_ALTERA_AVALON_PWM_CONTROL(PWM_2_BASE, 1);
    
    IOWR_ALTERA_AVALON_PWM_CLK_DIV(PWM_3_BASE, 200);
    IOWR_ALTERA_AVALON_PWM_DUTY(PWM_3_BASE, 100);
    IOWR_ALTERA_AVALON_PWM_PERIOD(PWM_3_BASE, 1000);
    IOWR_ALTERA_AVALON_PWM_CONTROL(PWM_3_BASE, 1);
    
    IOWR_ALTERA_AVALON_PWM_CLK_DIV(PWM_4_BASE, 200);
    IOWR_ALTERA_AVALON_PWM_DUTY(PWM_4_BASE, 100);
    IOWR_ALTERA_AVALON_PWM_PERIOD(PWM_4_BASE, 1000);
    IOWR_ALTERA_AVALON_PWM_CONTROL(PWM_4_BASE, 1);
    
    IOWR_ALTERA_AVALON_PWM_CLK_DIV(PWM_5_BASE, 200);
    IOWR_ALTERA_AVALON_PWM_DUTY(PWM_5_BASE, 100);
    IOWR_ALTERA_AVALON_PWM_PERIOD(PWM_5_BASE, 1000);
    IOWR_ALTERA_AVALON_PWM_CONTROL(PWM_5_BASE, 1);
    

    
/*
* Infinitely shift a variable with one bit set back and forth, and write
* it to the LED PIO. Software loop provides delay element.
*/
    while (1)
    {
        if (pwm == 100 || pwm == 0)
        {
            dir = (dir ^ 0x1);
        }
        if (dir)
        {
            pwm++;
        }
        else
        {
            pwm--;
        }
        /*
        IOWR_ALTERA_AVALON_PIO_DATA(PWM_BASE_BASE, pwm);
        IOWR_ALTERA_AVALON_PIO_DATA(PWM_SHOULDER_BASE, 50);
        IOWR_ALTERA_AVALON_PIO_DATA(PWM_ELBOW_BASE, 100);
        IOWR_ALTERA_AVALON_PIO_DATA(PWM_WRIST_BASE, 150);
        IOWR_ALTERA_AVALON_PIO_DATA(PWM_GRIPPER_BASE, 200);
        IOWR_ALTERA_AVALON_PIO_DATA(PWM_AUX_BASE, 250);
*/

            IOWR_ALTERA_AVALON_PWM_DUTY(PWM_0_BASE, pwm);
//        IOWR_ALTERA_AVALON_PIO_DATA(MY_PWM_1_BASE, pwm);
//        IOWR_ALTERA_AVALON_PIO_DATA(MY_PWM_2_BASE, pwm);
        
 //       IOWR_ALTERA_AVALON_PIO_DATA(MY_PWM_3_BASE, pwm);
 //       IOWR_ALTERA_AVALON_PIO_DATA(MY_PWM_4_BASE, pwm);
 //       IOWR_ALTERA_AVALON_PIO_DATA(MY_PWM_5_BASE, pwm);


        i = 0;
        while (i<2000)
        {
         i++;
        }
    }
    return 0;
}
