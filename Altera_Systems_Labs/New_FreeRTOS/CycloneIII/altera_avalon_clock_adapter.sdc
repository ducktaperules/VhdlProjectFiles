# $Id: //depot/code/8.0-r/components/altera_avalon_clock_adapter/altera_avalon_clock_adapter.sdc#2 $
# $Revision: #2 $
# $Date: 2008/03/31 $
#-------------------------------------------------------------------------------
# TimeQuest constraints to cut all false timing paths across async clock domains

# synchronizers for handshake signals

set_false_path -from [get_registers *] -to [get_pins -no_case -compatibility_mode *the*clock*\|unxmaster*donex*\|*data*] 
set_false_path -from [get_registers *] -to [get_pins -no_case -compatibility_mode *the*clock*\|unxslave*requestx*\|*data*]

# datapath signals protected by handshake logic

set_false_path -from [get_pins -no_case -compatibility_mode *the*clock*\|slave_writedata_d1*\|*] -to [get_registers *] 
set_false_path -from [get_pins -no_case -compatibility_mode *the*clock*\|slave_readdata_p1*\|*] -to [get_registers *]
set_false_path -from [get_pins -no_case -compatibility_mode *the*clock*\|slave_address*\|*] -to [get_registers *] 
set_false_path -from [get_pins -no_case -compatibility_mode *the*clock*\|slave_byteenable*\|*] -to [get_registers *]  
set_false_path -from [get_pins -no_case -compatibility_mode *the*clock*\|slave_nativeaddress_d1*\|*] -to [get_registers *]



