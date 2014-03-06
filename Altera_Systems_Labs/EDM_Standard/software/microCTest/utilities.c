/*
 * utilities.c
 *
 *  Created on: 25 Feb 2014
 *      Author: Queron
 */

#include "utilities.h"
#include "math.h"

/***********************************Map*****************************************
 *
 *  Author      : Queron Williams
 *  Date        : 25/02/2014
 *  Inputs      : x = value to be mapped. inMin = minimum of value to be mapped.
 *  			  inMax = maximum of value to be mapped. outMin = minimum value of output.
 *  			  outMax = maximum value of output.
 *  Outputs     : Value in the output range proportional to the input value
 *  			  within the input range
 *  Description : This module allows a value between 2 bounds to be linearly mapped
 *  			  from one range to another.
 **************************************************************************************************/

float map(float x, float inMin, float inMax, float outMin, float outMax)
{
  return (float)(x - inMin) * (outMax - outMin) / (inMax - inMin) + outMin;
}

/***********************************smoothstep*****************************************
 *
 *  Author      : Queron Williams
 *  Date        : 25/02/2014
 *  Inputs      : startVal = initial value, endVal = final value,
 *  			  totalItterations = number of steps between input initial and end values,
 *  			  currentItteration =  how many steps into the move
 *  Outputs     : Value between initial value and end value calculated using
 *  			  scalar interpolation
 *
 *  Description : Smoothstep is a scalar interpolation function.
 *  			  The function interpolates smoothly between two input values based
 *  			  on a third one that should be between the first two, this produces an s-curve
 *				  The slope of the smoothstep function tends toward zero at both edges.
 *				  This makes it easy to create a sequence of transitions using smoothstep
 *				  to interpolate each segment rather than using a more sophisticated or
 *				  expensive interpolation technique
 *
 **************************************************************************************************/

float smoothstep(int startVal, int endVal, int totalItterations, int currentItteration)
{
	float v; //temp value for progras through move between 0 and 1
	float v2;
	v = (float)currentItteration / totalItterations;
	v = ((v) * (v) * (3 - 2 * (v)));
	v2 = (endVal * v) + (startVal * (1 - v));
	return  v2;
}
