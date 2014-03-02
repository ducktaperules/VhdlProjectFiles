/*
 * utilities.c
 *
 *  Created on: 25 Feb 2014
 *      Author: Queron
 */

#include "utilities.h"

/***********************************map*****************************************
 *
 *  Author      : Queron Williams
 *  Date        : 25/02/2014
 *  Inputs      : Module_To_Initilise specifies which of the PWM modules to start-up
 *  Outputs     : 1 if module successfully initilised
 *                0 if input is out of range
 *
 *  Description : This module runs the start up sequence for whichever PWM module is specified
 *                by the input variable
 *
 **************************************************************************************************/

long map(long x, long in_min, long in_max, long out_min, long out_max)
{
  return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}

/***********************************smoothstep*****************************************
 *
 *  Author      : Queron Williams
 *  Date        : 25/02/2014
 *  Inputs      : Module_To_Initilise specifies which of the PWM modules to start-up
 *  Outputs     : 1 if module successfully initilised
 *                0 if input is out of range
 *
 *  Description : This module runs the start up sequence for whichever PWM module is specified
 *                by the input variable
 *
 **************************************************************************************************/

int smoothstep(int startVal, int endVal, int totalItterations, int currentItteration)
{
	float v; //temp value for progras through move between 0 and 1
	int v2;
	v = (float)currentItteration / totalItterations;
	v = ((v) * (v) * (3 - 2 * (v)));
	v2 = (int)round(((endVal * v) + (startVal * (1 - v))));
	return  v2;
}
