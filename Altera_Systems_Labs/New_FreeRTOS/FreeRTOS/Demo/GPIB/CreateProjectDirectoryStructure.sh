#!/bin/sh
# This file should be executed from the command line prior to the first
# build.  It will be necessary to refresh the Eclipse project once the
# .bat file has been executed (normally just press F5 to refresh).

# Copies all the required files from their location within the standard
# FreeRTOS directory structure to under the Eclipse project directory.
# This permits the Eclipse project to be used in 'managed' mode and without
# having to setup any linked resources.

# Have the files already been copied?
if [ -d RTOSDemo/FreeRTOS ] 
then 
	echo "directory exists"; exit;
else

	# Create the required directory structure.
	mkdir -pv RTOSDemo/FreeRTOS
	mkdir -pv RTOSDemo/FreeRTOS/include	
	mkdir -pv RTOSDemo/FreeRTOS/portable/GCC/NiosII
	mkdir -pv RTOSDemo/FreeRTOS/portable/MemMang	
	mkdir -pv RTOSDemo/Common_Demo_Tasks
	mkdir -pv RTOSDemo/Common_Demo_Tasks/include
	
	# Copy the core kernel files.
	cp ../../Source/tasks.c RTOSDemo/FreeRTOS
	cp ../../Source/queue.c RTOSDemo/FreeRTOS
	cp ../../Source/list.c RTOSDemo/FreeRTOS
	
	# Copy the common header files

	cp ../../Source/include/*.* RTOSDemo/FreeRTOS/include
	
	# Copy the portable layer files
	cp ../../Source/portable/GCC/NiosII/*.* RTOSDemo/FreeRTOS/portable/GCC/NiosII
	
	# Copy the basic memory allocation files
	cp ../../Source/portable/MemMang/heap_2.c RTOSDemo/FreeRTOS/portable/MemMang

	# Copy the files that define the Common_Demo_Tasks.
#	cp ../Common/Minimal/BlockQ.c RTOSDemo/Common_Demo_Tasks
#	cp ../Common/Minimal/blocktim.c RTOSDemo/Common_Demo_Tasks
#	cp ../Common/Minimal/comtest.c RTOSDemo/Common_Demo_Tasks	
#	cp ../Common/Minimal/countsem.c RTOSDemo/Common_Demo_Tasks
#	cp ../Common/Minimal/death.c RTOSDemo/Common_Demo_Tasks	
#	cp ../Common/Minimal/dynamic.c RTOSDemo/Common_Demo_Tasks	
#	cp ../Common/Minimal/flash.c RTOSDemo/Common_Demo_Tasks
#	cp ../Common/Minimal/GenQTest.c RTOSDemo/Common_Demo_Tasks
#	cp ../Common/Minimal/integer.c RTOSDemo/Common_Demo_Tasks
#	cp ../Common/Minimal/PollQ.c RTOSDemo/Common_Demo_Tasks
#	cp ../Common/Minimal/QPeek.c RTOSDemo/Common_Demo_Tasks
#	cp ../Common/Minimal/recmutex.c RTOSDemo/Common_Demo_Tasks
#	cp ../Common/Minimal/semtest.c RTOSDemo/Common_Demo_Tasks
	
	# Copy the common demo file headers.
	cp ../Common/include/*.* RTOSDemo/Common_Demo_Tasks/include	
fi
