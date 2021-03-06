/*************************************************************************
* Copyright (c) 2004 Altera Corporation, San Jose, California, USA.      *
* All rights reserved. All use of this software and documentation is     *
* subject to the License Agreement located at the end of this file below.*
**************************************************************************
* Description:                                                           *
* The following is a simple hello world program running MicroC/OS-II.The * 
* purpose of the design is to be a very simple application that just     *
* demonstrates MicroC/OS-II running on NIOS II.The design doesn't account*
* for issues such as checking system call return codes. etc.             *
*                                                                        *
* Requirements:                                                          *
*   -Supported Example Hardware Platforms                                *
*     Standard                                                           *
*     Full Featured                                                      *
*     Low Cost                                                           *
*   -Supported Development Boards                                        *
*     Nios II Development Board, Stratix II Edition                      *
*     Nios Development Board, Stratix Professional Edition               *
*     Nios Development Board, Stratix Edition                            *
*     Nios Development Board, Cyclone Edition                            *
*   -System Library Settings                                             *
*     RTOS Type - MicroC/OS-II                                           *
*     Periodic System Timer                                              *
*   -Know Issues                                                         *
*     If this design is run on the ISS, terminal output will take several*
*     minutes per iteration.                                             *
**************************************************************************/


#include <stdio.h>
#include "includes.h"
#include <stdlib.h>
#include <unistd.h> // usleep()
#include "pwm.h"
#include "lcd.h"
#include "keypad.h"
#include "utilities.h"
#include "IK.h"

/* Definition of Task Stacks */
#define   TASK_STACKSIZE       2048
OS_STK    task1_stk[TASK_STACKSIZE];
OS_STK    filterOut_stk[TASK_STACKSIZE];
OS_STK    keypadCheck_stk[TASK_STACKSIZE];

/* Definition of Task Priorities */

#define TASK1_PRIORITY      3
#define KEYPADCHECK_PRIORITY      2
#define FILTEROUT_PRIORITY      1

/* Global varables go here */
float solution2[5];
int program = 1; //varable used to track which program is in use
int move = 1; //varable used to track which current move is

/* Prints "Hello World" and sleeps for three seconds */
void task1(void* pdata)
{
	initilisePwm('W');
	initilisePwm('E');
	initilisePwm('S');
	initilisePwm('s');
	initilisePwm('B');
	////printf("initialise\n");
	int mode = 2; //1to enable IK mode, 2 to enable keypad
	int program = 1; //varable used to track which program is in use
	extern int move;
	float lengths[5]; //in cm
				lengths[0] = 0;
				lengths[1] = 40;
				lengths[2] = 120;
				lengths[3] = 120;
				lengths[4] = 120;

	int noOfPositions = 14;
	int positions3d[14][6] = {{ 0,150,150,0,0, 10 },	//x,y,x,phi,gripper,time
							{ 0,250,150,0,20, 10 },
							{ 0,100,150,0,0, 10 },
							{ 150,100,150,0,0, 10 },
							{ -150,100,150,0,0, 10 },
							{ 0,100,150,0,0, 10 },
							{ 0,200,150,0,0, 10 },
							{ 0,200,250,0,0, 10 },
							{ 0,200,50,0,0, 10 },
							{ 0,200,150,0,0, 10 },
							{ 0,200,150,35,0, 10 },
							{ 0,200,150,-35,0, 40 },
							{ 0,200,150,0,0, 10 },
							{ 0,150,150,0,0, 10 }};

	while (1) {
		if(mode==1)
		{
			while (1){
				moveArm(positions3d,program,move);
				move=move+1;
				if(move>=noOfPositions){move=0;}
				printf("here %d \n",move);
				OSTimeDlyHMSM(0, 0, 1, 0);
				if ( button[RECORD] == 1 ) {break;}
			}
			move = 0;
			mode = 2;
		}
		if(mode==2)
		{
			if ( button[PRESSED] == 1 ) {
				if ( button[SHIFT] == 0 ) {
					if ( button[UP] == 1 ) {positions3d[move][1]-=10;}
					if ( button[DOWN] == 1 ) {positions3d[move][1]+=10;}
					if ( button[LEFT] == 1 ) {positions3d[move][0]-=10;}
					if ( button[RIGHT] == 1 ) {positions3d[move][0]+=10;}
					if ( button[UPLEFT] == 1 ) {positions3d[move][2]-=10;}
					if ( button[UPRIGHT] == 1 ) {positions3d[move][2]+=10;}
					if ( button[DOWNLEFT] == 1 ) {positions3d[move][3]+=1;}
					if ( button[DOWNRIGHT] == 1 ) {positions3d[move][3]-=1;}
				}else if ( button[SHIFT] == 1 ) {
					if ( button[UP] == 1 ) {positions3d[move][3]+=1;}
					if ( button[STOP] == 1 ) {positions3d[move][3]-=1;}
					if ( button[LEFT] == 1 ) {positions3d[move][4]-=10;}
					if ( button[RIGHT] == 1 ) {positions3d[move][4]+=10;}
				}
				if ( button[DOWNLEFT] == 1 ) {move--;OSTimeDlyHMSM(0, 0, 0, 500);}
				if ( button[DOWNRIGHT] == 1 ) {move++;OSTimeDlyHMSM(0, 0, 0, 500);}
				if ( move<=-1 ) {move=0;}
				if ( button[PLAY] == 1 ) {mode=1;}
			}

			float buf[4];
			moveArmDirect(positions3d, program, move);
			OSTimeDlyHMSM(0, 0, 0, 100);
		}
	}
}
/* Task that runs in background smoothing pwm outputs to arm. */
void filterOut(void* pdata)
{
  while (1)
  { 
	extern float solution2[5];
	static int count = 0;
	int number = 100;
	int i;

	if (count >= number){count = 0;}

	static float filter[4][100];

	float output[3] = {0,0,0,0};

	filter[0][count]=solution2[0];
	filter[1][count]=solution2[1];
	filter[2][count]=solution2[2];
	filter[3][count]=solution2[3];

	for (i = 0; i < number; i++){output[0] += filter[0][i];}
	output[0] = output[0] / number;
	for (i = 0; i < number; i++){output[1] += filter[1][i];}
	output[1] = output[1] / number;
	for (i = 0; i < number; i++){output[2] += filter[2][i];}
	output[2] = output[2] / number;
	for (i = 0; i < number; i++){output[3] += filter[3][i];}
	output[3] = output[3] / number;

	setServoPosition('B', output[0]);
	setServoPosition('S', output[1]);
	setServoPosition('E', output[2]);
	setServoPosition('W', output[3]);
	setServoPosition('G', solution2[4]);
	//printf(" %f    %f\n",solution2[1],output[1]);
	count++;
    OSTimeDlyHMSM(0, 0, 0, 10);
  }
}
/* Task that runs in background smoothing pwm outputs to arm. */
void keypadCheck(void* pdata)
{
	extern int program;
	extern int menu;
	char key_Val = 0;
	char* str[32];
	while (1)
	{
		/* read the keypad */
		checkKeypad();
		//printf("%d\n", key_Val);
		//sprintf(str, "%d%d%d%d   %d\n %d%d%d%d", button[SHIFT],button[M1],button[M2],button[M3],OSCPUUsage, button[UPLEFT],button[UP],button[UPRIGHT],button[MENU]);
		sprintf(str, "P=%d M=%d\n X=   Y=   Z=   ", program,move);
		Write_To_Lcd(str);
		OSTimeDlyHMSM(0, 0, 0, 100);
	}
}
/* The main function creates two task and starts multi-tasking */
int main(void)
{

  OSTaskCreateExt(keypadCheck,
				  NULL,
				  (void *)&keypadCheck_stk[TASK_STACKSIZE-1],
				  KEYPADCHECK_PRIORITY,
				  KEYPADCHECK_PRIORITY,
				  keypadCheck_stk,
				  TASK_STACKSIZE,
				  NULL,
				  0);
  
  OSTaskCreateExt(task1,
				  NULL,
				  (void *)&task1_stk[TASK_STACKSIZE-1],
				  TASK1_PRIORITY,
				  TASK1_PRIORITY,
				  task1_stk,
				  TASK_STACKSIZE,
				  NULL,
				  0);

  OSTaskCreateExt(filterOut,
                  NULL,
                  (void *)&filterOut_stk[TASK_STACKSIZE-1],
                  FILTEROUT_PRIORITY,
                  FILTEROUT_PRIORITY,
                  filterOut_stk,
                  TASK_STACKSIZE,
                  NULL,
                  0);

  Initilise_Keypad();
  Initilise_Lcd();
  //OSStatInit();   //settup os statistics  THIS IS UNTESTED
  OSStart();
  return 0;
}

/******************************************************************************
*                                                                             *
* License Agreement                                                           *
*                                                                             *
* Copyright (c) 2004 Altera Corporation, San Jose, California, USA.           *
* All rights reserved.                                                        *
*                                                                             *
* Permission is hereby granted, free of charge, to any person obtaining a     *
* copy of this software and associated documentation files (the "Software"),  *
* to deal in the Software without restriction, including without limitation   *
* the rights to use, copy, modify, merge, publish, distribute, sublicense,    *
* and/or sell copies of the Software, and to permit persons to whom the       *
* Software is furnished to do so, subject to the following conditions:        *
*                                                                             *
* The above copyright notice and this permission notice shall be included in  *
* all copies or substantial portions of the Software.                         *
*                                                                             *
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  *
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,    *
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE *
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER      *
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING     *
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER         *
* DEALINGS IN THE SOFTWARE.                                                   *
*                                                                             *
* This agreement shall be governed in all respects by the laws of the State   *
* of California and by the laws of the United States of America.              *
* Altera does not recommend, suggest or require that this reference design    *
* file be used in conjunction or combination with any other product.          *
******************************************************************************/
