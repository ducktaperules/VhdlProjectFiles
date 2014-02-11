# Copyright (C) 1991-2011 Altera Corporation
# Your use of Altera Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License 
# Subscription Agreement, Altera MegaCore Function License 
# Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the 
# applicable agreement for further details.

# Quartus II: Generate Tcl File for Project
# File: DE0_TOP.tcl
# Generated on: Thu Oct 25 14:14:38 2012

# Load Quartus II Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "DE0_TOP"]} {
		puts "Project DE0_TOP is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists DE0_TOP]} {
		project_open -revision DE0_TOP DE0_TOP
	} else {
		project_new -revision DE0_TOP DE0_TOP
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name FAMILY "Cyclone III"
	set_global_assignment -name DEVICE EP3C16F484C6
	set_global_assignment -name ORIGINAL_QUARTUS_VERSION "8.0 SP0.01"
	set_global_assignment -name PROJECT_CREATION_TIME_DATE "21:35:12  MARCH 06, 2009"
	set_global_assignment -name LAST_QUARTUS_VERSION 11.0
	set_global_assignment -name USE_GENERATED_PHYSICAL_CONSTRAINTS OFF -section_id eda_palace
	set_global_assignment -name DEVICE_FILTER_PACKAGE FBGA
	set_global_assignment -name DEVICE_FILTER_PIN_COUNT 484
	set_global_assignment -name DEVICE_FILTER_SPEED_GRADE 6
	set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
	set_global_assignment -name PARTITION_COLOR 14622752 -section_id Top
	set_global_assignment -name LL_ROOT_REGION ON -section_id "Root Region"
	set_global_assignment -name LL_MEMBER_STATE LOCKED -section_id "Root Region"
	set_global_assignment -name CYCLONEII_OPTIMIZATION_TECHNIQUE BALANCED
	set_global_assignment -name STRATIX_DEVICE_IO_STANDARD "2.5 V"
	set_global_assignment -name CYCLONEII_RESERVE_NCEO_AFTER_CONFIGURATION "USE AS REGULAR IO"
	set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
	set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85
	set_global_assignment -name POWER_PRESET_COOLING_SOLUTION "23 MM HEAT SINK WITH 200 LFPM AIRFLOW"
	set_global_assignment -name POWER_BOARD_THERMAL_MODEL "NONE (CONSERVATIVE)"
	set_global_assignment -name CYCLONEIII_CONFIGURATION_SCHEME "ACTIVE SERIAL"
	set_global_assignment -name FORCE_CONFIGURATION_VCCIO ON
	set_global_assignment -name OUTPUT_IO_TIMING_ENDPOINT "NEAR END"
	set_global_assignment -name ON_CHIP_BITSTREAM_DECOMPRESSION ON
	set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id Top
	set_global_assignment -name USE_CONFIGURATION_DEVICE ON
	set_global_assignment -name CRC_ERROR_OPEN_DRAIN OFF
	set_global_assignment -name OUTPUT_IO_TIMING_NEAR_END_VMEAS "HALF VCCIO" -rise
	set_global_assignment -name OUTPUT_IO_TIMING_NEAR_END_VMEAS "HALF VCCIO" -fall
	set_global_assignment -name OUTPUT_IO_TIMING_FAR_END_VMEAS "HALF SIGNAL SWING" -rise
	set_global_assignment -name OUTPUT_IO_TIMING_FAR_END_VMEAS "HALF SIGNAL SWING" -fall
	set_global_assignment -name CYCLONEIII_CONFIGURATION_DEVICE EPCS4
	set_global_assignment -name RESERVE_ALL_UNUSED_PINS_WEAK_PULLUP "AS INPUT TRI-STATED"
	set_global_assignment -name VERILOG_FILE port_a.v
	set_global_assignment -name SOURCE_FILE DE0_SOPC.sopcinfo
	set_global_assignment -name SOPC_FILE DE0_SOPC.sopc
	set_global_assignment -name QUARTUS_PTF_FILE DE0_SOPC.ptf
	set_global_assignment -name SDC_FILE altera_avalon_clock_adapter.sdc
	set_global_assignment -name VERILOG_FILE DE0_SOPC_clock_0.v
	set_global_assignment -name VERILOG_FILE DE0_SOPC_clock_1.v
	set_global_assignment -name VERILOG_FILE sd_wp_n.v
	set_global_assignment -name VERILOG_FILE cpu_jtag_debug_module_tck.v
	set_global_assignment -name VERILOG_FILE cpu_jtag_debug_module_sysclk.v
	set_global_assignment -name VERILOG_FILE profile_timer.v
	set_global_assignment -name VERILOG_FILE cpu.v
	set_global_assignment -name VERILOG_FILE sd_cmd.v
	set_global_assignment -name VERILOG_FILE pll.v
	set_global_assignment -name VERILOG_FILE cpu_test_bench.v
	set_global_assignment -name VERILOG_FILE DE0_SOPC_clock_2.v
	set_global_assignment -name VERILOG_FILE cpu_oci_test_bench.v
	set_global_assignment -name VERILOG_FILE sd_dat.v
	set_global_assignment -name VERILOG_FILE altpllpll_bb.v
	set_global_assignment -name VERILOG_FILE sd_clk.v
	set_global_assignment -name VERILOG_FILE sdram_test_component.v
	set_global_assignment -name VERILOG_FILE sdram.v
	set_global_assignment -name VERILOG_FILE onchip_mem.v
	set_global_assignment -name VERILOG_FILE cpu_jtag_debug_module_wrapper.v
	set_global_assignment -name VHDL_FILE i2c_master_top_0.vhd
	set_global_assignment -name VERILOG_FILE user_timer.v
	set_global_assignment -name VERILOG_FILE uart.v
	set_global_assignment -name VERILOG_FILE timer.v
	set_global_assignment -name VERILOG_FILE sysid.v
	set_global_assignment -name VERILOG_FILE switches.v
	set_global_assignment -name VERILOG_FILE seg7.v
	set_global_assignment -name VERILOG_FILE leds.v
	set_global_assignment -name VERILOG_FILE lcd_light.v
	set_global_assignment -name VERILOG_FILE lcd.v
	set_global_assignment -name VERILOG_FILE jtag_uart.v
	set_global_assignment -name VERILOG_FILE clock_crossing_bridge.v
	set_global_assignment -name VERILOG_FILE buttons.v
	set_global_assignment -name QIP_FILE DE0_SOPC.qip
	set_global_assignment -name SDC_FILE DE0_TOP.sdc
	set_global_assignment -name VERILOG_FILE DE0_TOP.v
	set_global_assignment -name VERILOG_FILE VGA_Gen.v
	set_global_assignment -name VERILOG_FILE PAT_640x480_GEN.v
	set_global_assignment -name CDF_FILE edm1.cdf
	set_global_assignment -name CDF_FILE edm_logic.cdf
	set_global_assignment -name SEARCH_PATH pwm_simple/nios/my_pwm_1/ -tag from_archive
	set_location_assignment PIN_B1 -to LEDG[9]
	set_location_assignment PIN_B2 -to LEDG[8]
	set_location_assignment PIN_C2 -to LEDG[7]
	set_location_assignment PIN_C1 -to LEDG[6]
	set_location_assignment PIN_E1 -to LEDG[5]
	set_location_assignment PIN_F2 -to LEDG[4]
	set_location_assignment PIN_H1 -to LEDG[3]
	set_location_assignment PIN_J3 -to LEDG[2]
	set_location_assignment PIN_J2 -to LEDG[1]
	set_location_assignment PIN_J1 -to LEDG[0]
	set_location_assignment PIN_D2 -to SW[9]
	set_location_assignment PIN_E4 -to SW[8]
	set_location_assignment PIN_E3 -to SW[7]
	set_location_assignment PIN_H7 -to SW[6]
	set_location_assignment PIN_J7 -to SW[5]
	set_location_assignment PIN_G5 -to SW[4]
	set_location_assignment PIN_G4 -to SW[3]
	set_location_assignment PIN_H6 -to SW[2]
	set_location_assignment PIN_H5 -to SW[1]
	set_location_assignment PIN_J6 -to SW[0]
	set_location_assignment PIN_F1 -to BUTTON[2]
	set_location_assignment PIN_G3 -to BUTTON[1]
	set_location_assignment PIN_H2 -to BUTTON[0]
	set_location_assignment PIN_R2 -to FL_ADDR[21]
	set_location_assignment PIN_P3 -to FL_ADDR[20]
	set_location_assignment PIN_P1 -to FL_ADDR[19]
	set_location_assignment PIN_M6 -to FL_ADDR[18]
	set_location_assignment PIN_M5 -to FL_ADDR[17]
	set_location_assignment PIN_AA2 -to FL_ADDR[16]
	set_location_assignment PIN_L6 -to FL_ADDR[15]
	set_location_assignment PIN_L7 -to FL_ADDR[14]
	set_location_assignment PIN_M1 -to FL_ADDR[13]
	set_location_assignment PIN_M2 -to FL_ADDR[12]
	set_location_assignment PIN_M3 -to FL_ADDR[11]
	set_location_assignment PIN_N1 -to FL_ADDR[10]
	set_location_assignment PIN_N2 -to FL_ADDR[9]
	set_location_assignment PIN_P2 -to FL_ADDR[8]
	set_location_assignment PIN_M4 -to FL_ADDR[7]
	set_location_assignment PIN_M8 -to FL_ADDR[6]
	set_location_assignment PIN_N6 -to FL_ADDR[5]
	set_location_assignment PIN_N5 -to FL_ADDR[4]
	set_location_assignment PIN_N7 -to FL_ADDR[3]
	set_location_assignment PIN_P6 -to FL_ADDR[2]
	set_location_assignment PIN_P5 -to FL_ADDR[1]
	set_location_assignment PIN_P7 -to FL_ADDR[0]
	set_location_assignment PIN_AA1 -to FL_BYTE_N
	set_location_assignment PIN_N8 -to FL_CE_N
	set_location_assignment PIN_R7 -to FL_DQ[0]
	set_location_assignment PIN_P8 -to FL_DQ[1]
	set_location_assignment PIN_R8 -to FL_DQ[2]
	set_location_assignment PIN_U1 -to FL_DQ[3]
	set_location_assignment PIN_V2 -to FL_DQ[4]
	set_location_assignment PIN_V3 -to FL_DQ[5]
	set_location_assignment PIN_W1 -to FL_DQ[6]
	set_location_assignment PIN_Y1 -to FL_DQ[7]
	set_location_assignment PIN_T5 -to FL_DQ[8]
	set_location_assignment PIN_T7 -to FL_DQ[9]
	set_location_assignment PIN_T4 -to FL_DQ[10]
	set_location_assignment PIN_U2 -to FL_DQ[11]
	set_location_assignment PIN_V1 -to FL_DQ[12]
	set_location_assignment PIN_V4 -to FL_DQ[13]
	set_location_assignment PIN_W2 -to FL_DQ[14]
	set_location_assignment PIN_R6 -to FL_OE_N
	set_location_assignment PIN_R1 -to FL_RST_N
	set_location_assignment PIN_M7 -to FL_RY
	set_location_assignment PIN_P4 -to FL_WE_N
	set_location_assignment PIN_T3 -to FL_WP_N
	set_location_assignment PIN_Y2 -to FL_DQ[15]
	set_location_assignment PIN_AA11 -to GPIO1_CLKIN[1]
	set_location_assignment PIN_AB11 -to GPIO1_CLKIN[0]
	set_location_assignment PIN_T16 -to GPIO1_CLKOUT[1]
	set_location_assignment PIN_R16 -to GPIO1_CLKOUT[0]
	set_location_assignment PIN_V7 -to GPIO1_D[31]
	set_location_assignment PIN_V6 -to GPIO1_D[30]
	set_location_assignment PIN_U8 -to GPIO1_D[29]
	set_location_assignment PIN_Y7 -to GPIO1_D[28]
	set_location_assignment PIN_T9 -to GPIO1_D[27]
	set_location_assignment PIN_U9 -to GPIO1_D[26]
	set_location_assignment PIN_T10 -to GPIO1_D[25]
	set_location_assignment PIN_U10 -to GPIO1_D[24]
	set_location_assignment PIN_R12 -to GPIO1_D[23]
	set_location_assignment PIN_R11 -to GPIO1_D[22]
	set_location_assignment PIN_T12 -to GPIO1_D[21]
	set_location_assignment PIN_U12 -to GPIO1_D[20]
	set_location_assignment PIN_R14 -to GPIO1_D[19]
	set_location_assignment PIN_T14 -to GPIO1_D[18]
	set_location_assignment PIN_AB7 -to GPIO1_D[17]
	set_location_assignment PIN_AA7 -to GPIO1_D[16]
	set_location_assignment PIN_AA9 -to GPIO1_D[15]
	set_location_assignment PIN_AB9 -to GPIO1_D[14]
	set_location_assignment PIN_V15 -to GPIO1_D[13]
	set_location_assignment PIN_W15 -to GPIO1_D[12]
	set_location_assignment PIN_T15 -to GPIO1_D[11]
	set_location_assignment PIN_U15 -to GPIO1_D[10]
	set_location_assignment PIN_W17 -to GPIO1_D[9]
	set_location_assignment PIN_Y17 -to GPIO1_D[8]
	set_location_assignment PIN_AB17 -to GPIO1_D[7]
	set_location_assignment PIN_AA17 -to GPIO1_D[6]
	set_location_assignment PIN_AA18 -to GPIO1_D[5]
	set_location_assignment PIN_AB18 -to GPIO1_D[4]
	set_location_assignment PIN_AB19 -to GPIO1_D[3]
	set_location_assignment PIN_AA19 -to GPIO1_D[2]
	set_location_assignment PIN_P22 -to PS2_KBCLK
	set_location_assignment PIN_P21 -to PS2_KBDAT
	set_location_assignment PIN_R21 -to PS2_MSCLK
	set_location_assignment PIN_R22 -to PS2_MSDAT
	set_location_assignment PIN_U22 -to UART_RXD
	set_location_assignment PIN_U21 -to UART_TXD
	set_location_assignment PIN_V22 -to UART_RTS
	set_location_assignment PIN_V21 -to UART_CTS
	set_location_assignment PIN_Y21 -to SD_CLK
	set_location_assignment PIN_Y22 -to SD_CMD
	set_location_assignment PIN_AA22 -to SD_DAT
	set_location_assignment PIN_W20 -to SD_WP_N
	set_location_assignment PIN_C20 -to LCD_DATA[7]
	set_location_assignment PIN_D20 -to LCD_DATA[6]
	set_location_assignment PIN_B21 -to LCD_DATA[5]
	set_location_assignment PIN_B22 -to LCD_DATA[4]
	set_location_assignment PIN_C21 -to LCD_DATA[3]
	set_location_assignment PIN_C22 -to LCD_DATA[2]
	set_location_assignment PIN_D21 -to LCD_DATA[1]
	set_location_assignment PIN_D22 -to LCD_DATA[0]
	set_location_assignment PIN_E22 -to LCD_RW
	set_location_assignment PIN_F22 -to LCD_RS
	set_location_assignment PIN_E21 -to LCD_EN
	set_location_assignment PIN_F21 -to LCD_BLON
	set_location_assignment PIN_J21 -to VGA_G[3]
	set_location_assignment PIN_K17 -to VGA_G[2]
	set_location_assignment PIN_J17 -to VGA_G[1]
	set_location_assignment PIN_H22 -to VGA_G[0]
	set_location_assignment PIN_L21 -to VGA_HS
	set_location_assignment PIN_L22 -to VGA_VS
	set_location_assignment PIN_H21 -to VGA_R[3]
	set_location_assignment PIN_H20 -to VGA_R[2]
	set_location_assignment PIN_H17 -to VGA_R[1]
	set_location_assignment PIN_H19 -to VGA_R[0]
	set_location_assignment PIN_K18 -to VGA_B[3]
	set_location_assignment PIN_J22 -to VGA_B[2]
	set_location_assignment PIN_K21 -to VGA_B[1]
	set_location_assignment PIN_K22 -to VGA_B[0]
	set_location_assignment PIN_G21 -to CLOCK_50
	set_location_assignment PIN_E11 -to HEX0_D[0]
	set_location_assignment PIN_F11 -to HEX0_D[1]
	set_location_assignment PIN_H12 -to HEX0_D[2]
	set_location_assignment PIN_H13 -to HEX0_D[3]
	set_location_assignment PIN_G12 -to HEX0_D[4]
	set_location_assignment PIN_F12 -to HEX0_D[5]
	set_location_assignment PIN_F13 -to HEX0_D[6]
	set_location_assignment PIN_D13 -to HEX0_DP
	set_location_assignment PIN_A15 -to HEX1_D[6]
	set_location_assignment PIN_E14 -to HEX1_D[5]
	set_location_assignment PIN_B14 -to HEX1_D[4]
	set_location_assignment PIN_A14 -to HEX1_D[3]
	set_location_assignment PIN_C13 -to HEX1_D[2]
	set_location_assignment PIN_B13 -to HEX1_D[1]
	set_location_assignment PIN_A13 -to HEX1_D[0]
	set_location_assignment PIN_B15 -to HEX1_DP
	set_location_assignment PIN_F14 -to HEX2_D[6]
	set_location_assignment PIN_B17 -to HEX2_D[5]
	set_location_assignment PIN_A17 -to HEX2_D[4]
	set_location_assignment PIN_E15 -to HEX2_D[3]
	set_location_assignment PIN_B16 -to HEX2_D[2]
	set_location_assignment PIN_A16 -to HEX2_D[1]
	set_location_assignment PIN_D15 -to HEX2_D[0]
	set_location_assignment PIN_A18 -to HEX2_DP
	set_location_assignment PIN_G15 -to HEX3_D[6]
	set_location_assignment PIN_D19 -to HEX3_D[5]
	set_location_assignment PIN_C19 -to HEX3_D[4]
	set_location_assignment PIN_B19 -to HEX3_D[3]
	set_location_assignment PIN_A19 -to HEX3_D[2]
	set_location_assignment PIN_F15 -to HEX3_D[1]
	set_location_assignment PIN_B18 -to HEX3_D[0]
	set_location_assignment PIN_G16 -to HEX3_DP
	set_location_assignment PIN_G8 -to DRAM_CAS_N
	set_location_assignment PIN_G7 -to DRAM_CS_N
	set_location_assignment PIN_E5 -to DRAM_CLK
	set_location_assignment PIN_E6 -to DRAM_CKE
	set_location_assignment PIN_B5 -to DRAM_BA_0
	set_location_assignment PIN_A4 -to DRAM_BA_1
	set_location_assignment PIN_F10 -to DRAM_DQ[15]
	set_location_assignment PIN_E10 -to DRAM_DQ[14]
	set_location_assignment PIN_A10 -to DRAM_DQ[13]
	set_location_assignment PIN_B10 -to DRAM_DQ[12]
	set_location_assignment PIN_C10 -to DRAM_DQ[11]
	set_location_assignment PIN_A9 -to DRAM_DQ[10]
	set_location_assignment PIN_B9 -to DRAM_DQ[9]
	set_location_assignment PIN_A8 -to DRAM_DQ[8]
	set_location_assignment PIN_F8 -to DRAM_DQ[7]
	set_location_assignment PIN_H9 -to DRAM_DQ[6]
	set_location_assignment PIN_G9 -to DRAM_DQ[5]
	set_location_assignment PIN_F9 -to DRAM_DQ[4]
	set_location_assignment PIN_E9 -to DRAM_DQ[3]
	set_location_assignment PIN_H10 -to DRAM_DQ[2]
	set_location_assignment PIN_G10 -to DRAM_DQ[1]
	set_location_assignment PIN_D10 -to DRAM_DQ[0]
	set_location_assignment PIN_E7 -to DRAM_LDQM
	set_location_assignment PIN_B8 -to DRAM_UDQM
	set_location_assignment PIN_F7 -to DRAM_RAS_N
	set_location_assignment PIN_D6 -to DRAM_WE_N
	set_location_assignment PIN_B12 -to CLOCK_50_2
	set_location_assignment PIN_C8 -to DRAM_ADDR[12]
	set_location_assignment PIN_A7 -to DRAM_ADDR[11]
	set_location_assignment PIN_B4 -to DRAM_ADDR[10]
	set_location_assignment PIN_B7 -to DRAM_ADDR[9]
	set_location_assignment PIN_C7 -to DRAM_ADDR[8]
	set_location_assignment PIN_A6 -to DRAM_ADDR[7]
	set_location_assignment PIN_B6 -to DRAM_ADDR[6]
	set_location_assignment PIN_C6 -to DRAM_ADDR[5]
	set_location_assignment PIN_A5 -to DRAM_ADDR[4]
	set_location_assignment PIN_C3 -to DRAM_ADDR[3]
	set_location_assignment PIN_B3 -to DRAM_ADDR[2]
	set_location_assignment PIN_A3 -to DRAM_ADDR[1]
	set_location_assignment PIN_C4 -to DRAM_ADDR[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to BUTTON[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to CLOCK_50_2
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_VS
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R[3]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_HS
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G[3]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B[3]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to UART_TXD
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to UART_RXD
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to UART_RTS
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to UART_CTS
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[3]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[4]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[5]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[6]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[7]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[8]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[9]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SD_WP_N
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SD_DAT
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SD_CMD
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SD_CLK
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to PS2_MSDAT
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to PS2_MSCLK
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to PS2_KBDAT
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to PS2_KBCLK
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDG[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDG[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDG[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDG[3]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDG[4]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDG[5]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDG[6]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDG[7]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDG[8]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDG[9]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LCD_RW
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LCD_RS
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LCD_EN
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LCD_DATA[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LCD_DATA[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LCD_DATA[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LCD_DATA[3]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LCD_DATA[4]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LCD_DATA[5]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LCD_DATA[6]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LCD_DATA[7]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LCD_BLON
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3_DP
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3_D[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3_D[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3_D[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3_D[3]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3_D[4]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3_D[5]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3_D[6]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2_DP
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2_D[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2_D[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2_D[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2_D[3]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2_D[4]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2_D[5]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2_D[6]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1_DP
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1_D[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1_D[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1_D[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1_D[3]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1_D[4]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1_D[5]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1_D[6]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0_DP
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0_D[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0_D[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0_D[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0_D[3]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0_D[4]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0_D[5]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0_D[6]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[3]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[4]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[5]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[6]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[7]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[8]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[9]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[10]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[11]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[12]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[13]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[14]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[15]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[16]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[17]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[18]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[19]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[20]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[21]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[22]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[23]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[24]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[25]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[26]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[27]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[28]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[29]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[30]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[31]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_CLKOUT[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_CLKOUT[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_CLKIN[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_CLKIN[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_WP_N
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_WE_N
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_RY
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_RST_N
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_OE_N
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_DQ[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_DQ[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_DQ[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_DQ[3]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_DQ[4]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_DQ[5]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_DQ[6]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_DQ[7]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_DQ[8]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_DQ[9]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_DQ[10]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_DQ[11]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_DQ[12]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_DQ[13]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_DQ[14]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_DQ[15]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_CE_N
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_BYTE_N
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[3]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[4]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[5]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[6]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[7]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[8]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[9]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[10]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[11]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[12]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[13]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[14]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[15]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[16]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[17]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[18]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[19]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[20]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[21]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_WE_N
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_UDQM
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_RAS_N
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_LDQM
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[3]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[4]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[5]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[6]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[7]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[8]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[9]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[10]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[11]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[12]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[13]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[14]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[15]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_CS_N
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_CLK
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_CKE
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_CAS_N
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_BA_1
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_BA_0
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[3]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[4]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[5]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[6]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[7]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[8]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[9]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[10]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[11]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[12]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to CLOCK_50
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to BUTTON[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to BUTTON[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to L_M_PWM
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to R_M_PWM
	set_location_assignment PIN_AA20 -to L_M_PWM
	set_location_assignment PIN_AB20 -to R_M_PWM
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to PORT_A[7]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to PORT_A[6]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to PORT_A[5]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to PORT_A[4]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to PORT_A[3]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to PORT_A[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to PORT_A[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to PORT_A[0]
	set_location_assignment PIN_AA13 -to PORT_A[7]
	set_location_assignment PIN_AB13 -to PORT_A[6]
	set_location_assignment PIN_AB14 -to PORT_A[5]
	set_location_assignment PIN_AA14 -to PORT_A[4]
	set_location_assignment PIN_AB15 -to PORT_A[3]
	set_location_assignment PIN_AA15 -to PORT_A[2]
	set_location_assignment PIN_AA16 -to PORT_A[1]
	set_location_assignment PIN_AB16 -to PORT_A[0]
	set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top

	# Including default assignments
	set_global_assignment -name PROJECT_SHOW_ENTITY_NAME ON
	set_global_assignment -name PROJECT_USE_SIMPLIFIED_NAMES OFF
	set_global_assignment -name ENABLE_REDUCED_MEMORY_MODE OFF
	set_global_assignment -name VER_COMPATIBLE_DB_DIR export_db
	set_global_assignment -name AUTO_EXPORT_VER_COMPATIBLE_DB OFF
	set_global_assignment -name SMART_RECOMPILE OFF
	set_global_assignment -name FLOW_DISABLE_ASSEMBLER OFF
	set_global_assignment -name FLOW_ENABLE_POWER_ANALYZER OFF
	set_global_assignment -name FLOW_ENABLE_HC_COMPARE OFF
	set_global_assignment -name HC_OUTPUT_DIR hc_output
	set_global_assignment -name SAVE_MIGRATION_INFO_DURING_COMPILATION OFF
	set_global_assignment -name FLOW_ENABLE_IO_ASSIGNMENT_ANALYSIS OFF
	set_global_assignment -name RUN_FULL_COMPILE_ON_DEVICE_CHANGE ON
	set_global_assignment -name FLOW_ENABLE_RTL_VIEWER OFF
	set_global_assignment -name READ_OR_WRITE_IN_BYTE_ADDRESS "USE GLOBAL SETTINGS"
	set_global_assignment -name FLOW_HARDCOPY_DESIGN_READINESS_CHECK ON
	set_global_assignment -name FLOW_ENABLE_PARALLEL_MODULES ON
	set_global_assignment -name ENABLE_COMPACT_REPORT_TABLE OFF
	set_global_assignment -name REVISION_TYPE BASE
	set_global_assignment -name DEFAULT_HOLD_MULTICYCLE "SAME AS MULTICYCLE"
	set_global_assignment -name CUT_OFF_PATHS_BETWEEN_CLOCK_DOMAINS ON
	set_global_assignment -name CUT_OFF_READ_DURING_WRITE_PATHS ON
	set_global_assignment -name CUT_OFF_CLEAR_AND_PRESET_PATHS ON
	set_global_assignment -name CUT_OFF_IO_PIN_FEEDBACK ON
	set_global_assignment -name DO_COMBINED_ANALYSIS OFF
	set_global_assignment -name IGNORE_CLOCK_SETTINGS OFF
	set_global_assignment -name ANALYZE_LATCHES_AS_SYNCHRONOUS_ELEMENTS ON
	set_global_assignment -name DO_MINMAX_ANALYSIS_USING_RISEFALL_DELAYS OFF
	set_global_assignment -name ENABLE_RECOVERY_REMOVAL_ANALYSIS OFF
	set_global_assignment -name ENABLE_CLOCK_LATENCY OFF
	set_global_assignment -name USE_TIMEQUEST_TIMING_ANALYZER ON -family "Cyclone III"
	set_global_assignment -name NUMBER_OF_SOURCES_PER_DESTINATION_TO_REPORT 10
	set_global_assignment -name NUMBER_OF_DESTINATION_TO_REPORT 10
	set_global_assignment -name NUMBER_OF_PATHS_TO_REPORT 200
	set_global_assignment -name DO_MIN_ANALYSIS OFF
	set_global_assignment -name DO_MIN_TIMING OFF
	set_global_assignment -name REPORT_IO_PATHS_SEPARATELY OFF
	set_global_assignment -name CLOCK_ANALYSIS_ONLY OFF
	set_global_assignment -name FLOW_ENABLE_TIMING_CONSTRAINT_CHECK OFF
	set_global_assignment -name TIMEQUEST_MULTICORNER_ANALYSIS ON -family "Cyclone III"
	set_global_assignment -name TIMEQUEST_DO_REPORT_TIMING OFF
	set_global_assignment -name TIMEQUEST_REPORT_WORST_CASE_TIMING_PATHS ON -family "Cyclone III"
	set_global_assignment -name TIMEQUEST_REPORT_NUM_WORST_CASE_TIMING_PATHS 100
	set_global_assignment -name TIMEQUEST_DO_CCPP_REMOVAL ON -family "Cyclone III"
	set_global_assignment -name MUX_RESTRUCTURE AUTO
	set_global_assignment -name ENABLE_IP_DEBUG OFF
	set_global_assignment -name SAVE_DISK_SPACE ON
	set_global_assignment -name DISABLE_OCP_HW_EVAL OFF
	set_global_assignment -name EDA_DESIGN_ENTRY_SYNTHESIS_TOOL "<None>"
	set_global_assignment -name VERILOG_INPUT_VERSION VERILOG_2001
	set_global_assignment -name VHDL_INPUT_VERSION VHDL_1993
	set_global_assignment -name COMPILATION_LEVEL FULL
	set_global_assignment -name TRUE_WYSIWYG_FLOW OFF
	set_global_assignment -name SMART_COMPILE_IGNORES_TDC_FOR_STRATIX_PLL_CHANGES OFF
	set_global_assignment -name STATE_MACHINE_PROCESSING AUTO
	set_global_assignment -name SAFE_STATE_MACHINE OFF
	set_global_assignment -name EXTRACT_VERILOG_STATE_MACHINES ON
	set_global_assignment -name EXTRACT_VHDL_STATE_MACHINES ON
	set_global_assignment -name IGNORE_VERILOG_INITIAL_CONSTRUCTS OFF
	set_global_assignment -name VERILOG_CONSTANT_LOOP_LIMIT 5000
	set_global_assignment -name VERILOG_NON_CONSTANT_LOOP_LIMIT 250
	set_global_assignment -name ADD_PASS_THROUGH_LOGIC_TO_INFERRED_RAMS ON
	set_global_assignment -name PARALLEL_SYNTHESIS OFF
	set_global_assignment -name DSP_BLOCK_BALANCING AUTO
	set_global_assignment -name NOT_GATE_PUSH_BACK ON
	set_global_assignment -name ALLOW_POWER_UP_DONT_CARE ON
	set_global_assignment -name REMOVE_REDUNDANT_LOGIC_CELLS OFF
	set_global_assignment -name REMOVE_DUPLICATE_REGISTERS ON
	set_global_assignment -name IGNORE_CARRY_BUFFERS OFF
	set_global_assignment -name IGNORE_CASCADE_BUFFERS OFF
	set_global_assignment -name IGNORE_GLOBAL_BUFFERS OFF
	set_global_assignment -name IGNORE_ROW_GLOBAL_BUFFERS OFF
	set_global_assignment -name IGNORE_LCELL_BUFFERS OFF
	set_global_assignment -name MAX7000_IGNORE_LCELL_BUFFERS AUTO
	set_global_assignment -name IGNORE_SOFT_BUFFERS ON
	set_global_assignment -name MAX7000_IGNORE_SOFT_BUFFERS OFF
	set_global_assignment -name LIMIT_AHDL_INTEGERS_TO_32_BITS OFF
	set_global_assignment -name AUTO_GLOBAL_CLOCK_MAX ON
	set_global_assignment -name AUTO_GLOBAL_OE_MAX ON
	set_global_assignment -name MAX_AUTO_GLOBAL_REGISTER_CONTROLS ON
	set_global_assignment -name AUTO_IMPLEMENT_IN_ROM OFF
	set_global_assignment -name STRATIX_TECHNOLOGY_MAPPER LUT
	set_global_assignment -name MAX7000_TECHNOLOGY_MAPPER "PRODUCT TERM"
	set_global_assignment -name APEX20K_TECHNOLOGY_MAPPER LUT
	set_global_assignment -name MERCURY_TECHNOLOGY_MAPPER LUT
	set_global_assignment -name FLEX6K_TECHNOLOGY_MAPPER LUT
	set_global_assignment -name FLEX10K_TECHNOLOGY_MAPPER LUT
	set_global_assignment -name OPTIMIZATION_TECHNIQUE BALANCED
	set_global_assignment -name STRATIXII_OPTIMIZATION_TECHNIQUE BALANCED
	set_global_assignment -name CYCLONE_OPTIMIZATION_TECHNIQUE BALANCED
	set_global_assignment -name STRATIX_OPTIMIZATION_TECHNIQUE BALANCED
	set_global_assignment -name MAXII_OPTIMIZATION_TECHNIQUE BALANCED
	set_global_assignment -name MAX7000_OPTIMIZATION_TECHNIQUE SPEED
	set_global_assignment -name APEX20K_OPTIMIZATION_TECHNIQUE BALANCED
	set_global_assignment -name MERCURY_OPTIMIZATION_TECHNIQUE AREA
	set_global_assignment -name FLEX6K_OPTIMIZATION_TECHNIQUE AREA
	set_global_assignment -name FLEX10K_OPTIMIZATION_TECHNIQUE AREA
	set_global_assignment -name ALLOW_XOR_GATE_USAGE ON
	set_global_assignment -name AUTO_LCELL_INSERTION ON
	set_global_assignment -name CARRY_CHAIN_LENGTH 48
	set_global_assignment -name FLEX6K_CARRY_CHAIN_LENGTH 32
	set_global_assignment -name FLEX10K_CARRY_CHAIN_LENGTH 32
	set_global_assignment -name MERCURY_CARRY_CHAIN_LENGTH 48
	set_global_assignment -name STRATIX_CARRY_CHAIN_LENGTH 70
	set_global_assignment -name STRATIXII_CARRY_CHAIN_LENGTH 70
	set_global_assignment -name CASCADE_CHAIN_LENGTH 2
	set_global_assignment -name PARALLEL_EXPANDER_CHAIN_LENGTH 16
	set_global_assignment -name MAX7000_PARALLEL_EXPANDER_CHAIN_LENGTH 4
	set_global_assignment -name AUTO_CARRY_CHAINS ON
	set_global_assignment -name AUTO_CASCADE_CHAINS ON
	set_global_assignment -name AUTO_PARALLEL_EXPANDERS ON
	set_global_assignment -name AUTO_OPEN_DRAIN_PINS ON
	set_global_assignment -name REMOVE_DUPLICATE_LOGIC ON
	set_global_assignment -name ADV_NETLIST_OPT_SYNTH_WYSIWYG_REMAP OFF
	set_global_assignment -name ADV_NETLIST_OPT_SYNTH_GATE_RETIME OFF
	set_global_assignment -name ADV_NETLIST_OPT_RETIME_CORE_AND_IO ON
	set_global_assignment -name AUTO_ROM_RECOGNITION ON
	set_global_assignment -name AUTO_RAM_RECOGNITION ON
	set_global_assignment -name AUTO_DSP_RECOGNITION ON
	set_global_assignment -name AUTO_SHIFT_REGISTER_RECOGNITION AUTO
	set_global_assignment -name ALLOW_SHIFT_REGISTER_MERGING_ACROSS_HIERARCHIES AUTO
	set_global_assignment -name AUTO_CLOCK_ENABLE_RECOGNITION ON
	set_global_assignment -name STRICT_RAM_RECOGNITION OFF
	set_global_assignment -name ALLOW_SYNCH_CTRL_USAGE ON
	set_global_assignment -name FORCE_SYNCH_CLEAR OFF
	set_global_assignment -name DONT_TOUCH_USER_CELL OFF
	set_global_assignment -name AUTO_RAM_BLOCK_BALANCING ON
	set_global_assignment -name AUTO_RAM_TO_LCELL_CONVERSION OFF
	set_global_assignment -name IP_SHOW_ANALYSIS_MESSAGES OFF
	set_global_assignment -name AUTO_RESOURCE_SHARING OFF
	set_global_assignment -name USE_NEW_TEXT_REPORT_TABLE_FORMAT OFF
	set_global_assignment -name ALLOW_ANY_RAM_SIZE_FOR_RECOGNITION OFF
	set_global_assignment -name ALLOW_ANY_ROM_SIZE_FOR_RECOGNITION OFF
	set_global_assignment -name ALLOW_ANY_SHIFT_REGISTER_SIZE_FOR_RECOGNITION OFF
	set_global_assignment -name MAX7000_FANIN_PER_CELL 100
	set_global_assignment -name USE_LOGICLOCK_CONSTRAINTS_IN_BALANCING ON
	set_global_assignment -name IGNORE_TRANSLATE_OFF_AND_SYNTHESIS_OFF OFF
	set_global_assignment -name STRATIXGX_BYPASS_REMAPPING_OF_FORCE_SIGNAL_DETECT_SIGNAL_THRESHOLD_SELECT OFF
	set_global_assignment -name SYNTH_TIMING_DRIVEN_REGISTER_DUPLICATION OFF
	set_global_assignment -name SYNTH_TIMING_DRIVEN_BALANCED_MAPPING OFF
	set_global_assignment -name SYNTH_TIMING_DRIVEN_SYNTHESIS OFF -family "Cyclone III"
	set_global_assignment -name REPORT_PARAMETER_SETTINGS ON
	set_global_assignment -name REPORT_SOURCE_ASSIGNMENTS ON
	set_global_assignment -name REPORT_CONNECTIVITY_CHECKS ON
	set_global_assignment -name IGNORE_MAX_FANOUT_ASSIGNMENTS OFF
	set_global_assignment -name SYNCHRONIZATION_REGISTER_CHAIN_LENGTH 2
	set_global_assignment -name OPTIMIZE_POWER_DURING_SYNTHESIS "NORMAL COMPILATION"
	set_global_assignment -name HDL_MESSAGE_LEVEL LEVEL2
	set_global_assignment -name HDL_INTERFACE_OUTPUT_PATH ./
	set_global_assignment -name SUPPRESS_REG_MINIMIZATION_MSG OFF
	set_global_assignment -name USE_HIGH_SPEED_ADDER AUTO
	set_global_assignment -name NUMBER_OF_REMOVED_REGISTERS_REPORTED 5000
	set_global_assignment -name NUMBER_OF_INVERTED_REGISTERS_REPORTED 100
	set_global_assignment -name ENCRYPTED_LUTMASK OFF
	set_global_assignment -name SYNTH_CLOCK_MUX_PROTECTION ON
	set_global_assignment -name SYNTH_GATED_CLOCK_CONVERSION OFF
	set_global_assignment -name BLOCK_DESIGN_NAMING AUTO
	set_global_assignment -name SYNTH_PROTECT_SDC_CONSTRAINT OFF
	set_global_assignment -name SYNTHESIS_EFFORT AUTO
	set_global_assignment -name SHIFT_REGISTER_RECOGNITION_ACLR_SIGNAL ON
	set_global_assignment -name PRE_MAPPING_RESYNTHESIS OFF
	set_global_assignment -name SYNTH_MESSAGE_LEVEL MEDIUM
	set_global_assignment -name DISABLE_MLAB_RAM_USE OFF
	set_global_assignment -name DISABLE_REGISTER_MERGING_ACROSS_HIERARCHIES AUTO
	set_global_assignment -name SYNTH_RESOURCE_AWARE_INFERENCE_FOR_BLOCK_RAM ON -family "Cyclone III"
	set_global_assignment -name RBCGEN_CRITICAL_WARNING_TO_ERROR ON
	set_global_assignment -name SYNTHESIS_SEED 1
	set_global_assignment -name RAPID_RECOMPILE_SYNTHESIS_MODE ON
	set_global_assignment -name FLEX10K_ENABLE_LOCK_OUTPUT OFF
	set_global_assignment -name DISABLE_PLL_COMPENSATION_DELAY_CHANGE_WARNING OFF
	set_global_assignment -name AUTO_MERGE_PLLS ON
	set_global_assignment -name IGNORE_MODE_FOR_MERGE OFF
	set_global_assignment -name TXPMA_SLEW_RATE LOW
	set_global_assignment -name ADCE_ENABLED AUTO
	set_global_assignment -name ROUTER_TIMING_OPTIMIZATION_LEVEL NORMAL
	set_global_assignment -name ROUTER_CLOCKING_TOPOLOGY_ANALYSIS OFF
	set_global_assignment -name PLACEMENT_EFFORT_MULTIPLIER 1.0
	set_global_assignment -name ROUTER_EFFORT_MULTIPLIER 1.0
	set_global_assignment -name FIT_ATTEMPTS_TO_SKIP 0
	set_global_assignment -name ECO_ALLOW_ROUTING_CHANGES OFF
	set_global_assignment -name BASE_PIN_OUT_FILE_ON_SAMEFRAME_DEVICE OFF
	set_global_assignment -name ENABLE_JTAG_BST_SUPPORT OFF
	set_global_assignment -name MAX7000_ENABLE_JTAG_BST_SUPPORT ON
	set_global_assignment -name ENABLE_NCEO_OUTPUT OFF
	set_global_assignment -name RESERVE_NCEO_AFTER_CONFIGURATION "USE AS REGULAR IO"
	set_global_assignment -name STRATIXIII_UPDATE_MODE STANDARD
	set_global_assignment -name STRATIX_UPDATE_MODE STANDARD
	set_global_assignment -name CVP_MODE OFF
	set_global_assignment -name STRATIXV_CONFIGURATION_SCHEME "PASSIVE SERIAL"
	set_global_assignment -name ARRIAV_CONFIGURATION_SCHEME "PASSIVE SERIAL"
	set_global_assignment -name STRATIXIII_CONFIGURATION_SCHEME "PASSIVE SERIAL"
	set_global_assignment -name STRATIXII_CONFIGURATION_SCHEME "PASSIVE SERIAL"
	set_global_assignment -name CYCLONEII_CONFIGURATION_SCHEME "ACTIVE SERIAL"
	set_global_assignment -name APEX20K_CONFIGURATION_SCHEME "PASSIVE SERIAL"
	set_global_assignment -name STRATIX_CONFIGURATION_SCHEME "PASSIVE SERIAL"
	set_global_assignment -name CYCLONE_CONFIGURATION_SCHEME "ACTIVE SERIAL"
	set_global_assignment -name MERCURY_CONFIGURATION_SCHEME "PASSIVE SERIAL"
	set_global_assignment -name FLEX6K_CONFIGURATION_SCHEME "PASSIVE SERIAL"
	set_global_assignment -name FLEX10K_CONFIGURATION_SCHEME "PASSIVE SERIAL"
	set_global_assignment -name APEXII_CONFIGURATION_SCHEME "PASSIVE SERIAL"
	set_global_assignment -name USER_START_UP_CLOCK OFF
	set_global_assignment -name ENABLE_VREFA_PIN OFF
	set_global_assignment -name ENABLE_VREFB_PIN OFF
	set_global_assignment -name ALWAYS_ENABLE_INPUT_BUFFERS OFF
	set_global_assignment -name ENABLE_ASMI_FOR_FLASH_LOADER OFF
	set_global_assignment -name ENABLE_DEVICE_WIDE_RESET OFF
	set_global_assignment -name ENABLE_DEVICE_WIDE_OE OFF
	set_global_assignment -name RESERVE_ALL_UNUSED_PINS "AS OUTPUT DRIVING GROUND"
	set_global_assignment -name ENABLE_INIT_DONE_OUTPUT OFF
	set_global_assignment -name INIT_DONE_OPEN_DRAIN ON
	set_global_assignment -name RESERVE_NWS_NRS_NCS_CS_AFTER_CONFIGURATION "USE AS REGULAR IO"
	set_global_assignment -name RESERVE_RDYNBUSY_AFTER_CONFIGURATION "USE AS REGULAR IO"
	set_global_assignment -name RESERVE_DATA31_THROUGH_DATA16_AFTER_CONFIGURATION "USE AS REGULAR IO"
	set_global_assignment -name RESERVE_DATA15_THROUGH_DATA8_AFTER_CONFIGURATION "USE AS REGULAR IO"
	set_global_assignment -name RESERVE_DATA7_THROUGH_DATA1_AFTER_CONFIGURATION "USE AS REGULAR IO"
	set_global_assignment -name RESERVE_DATA0_AFTER_CONFIGURATION "AS INPUT TRI-STATED"
	set_global_assignment -name RESERVE_DATA1_AFTER_CONFIGURATION "AS INPUT TRI-STATED"
	set_global_assignment -name RESERVE_DATA7_THROUGH_DATA2_AFTER_CONFIGURATION "USE AS REGULAR IO"
	set_global_assignment -name RESERVE_FLASH_NCE_AFTER_CONFIGURATION "AS INPUT TRI-STATED"
	set_global_assignment -name RESERVE_OTHER_AP_PINS_AFTER_CONFIGURATION "USE AS REGULAR IO"
	set_global_assignment -name RESERVE_DCLK_AFTER_CONFIGURATION "USE AS PROGRAMMING PIN"
	set_global_assignment -name CRC_ERROR_CHECKING OFF
	set_global_assignment -name INTERNAL_SCRUBBING OFF
	set_global_assignment -name PR_ERROR_OPEN_DRAIN ON
	set_global_assignment -name PR_READY_OPEN_DRAIN ON
	set_global_assignment -name ENABLE_CVP_CONFDONE OFF
	set_global_assignment -name CVP_CONFDONE_OPEN_DRAIN ON
	set_global_assignment -name OPTIMIZE_HOLD_TIMING "ALL PATHS" -family "Cyclone III"
	set_global_assignment -name OPTIMIZE_MULTI_CORNER_TIMING OFF
	set_global_assignment -name ENABLE_BENEFICIAL_SKEW_OPTIMIZATION_FOR_NON_GLOBAL_CLOCKS OFF
	set_global_assignment -name ENABLE_ADVANCED_IO_DELAY_CHAIN_OPTIMIZATION OFF
	set_global_assignment -name BLOCK_RAM_TO_MLAB_CELL_CONVERSION ON
	set_global_assignment -name BLOCK_RAM_AND_MLAB_EQUIVALENT_POWER_UP_CONDITIONS AUTO
	set_global_assignment -name BLOCK_RAM_AND_MLAB_EQUIVALENT_PAUSED_READ_CAPABILITIES CARE
	set_global_assignment -name PROGRAMMABLE_POWER_TECHNOLOGY_SETTING "FORCE ALL TILES WITH FAILING TIMING PATHS TO HIGH SPEED"
	set_global_assignment -name PROGRAMMABLE_POWER_MAXIMUM_HIGH_SPEED_FRACTION_OF_USED_LAB_TILES 1.0
	set_global_assignment -name GUARANTEE_MIN_DELAY_CORNER_IO_ZERO_HOLD_TIME ON
	set_global_assignment -name OPTIMIZE_POWER_DURING_FITTING "NORMAL COMPILATION"
	set_global_assignment -name OPTIMIZE_SSN OFF
	set_global_assignment -name OPTIMIZE_SSN OFF -family "Cyclone III"
	set_global_assignment -name OPTIMIZE_TIMING "NORMAL COMPILATION"
	set_global_assignment -name ECO_OPTIMIZE_TIMING OFF
	set_global_assignment -name ECO_REGENERATE_REPORT OFF
	set_global_assignment -name OPTIMIZE_IOC_REGISTER_PLACEMENT_FOR_TIMING NORMAL
	set_global_assignment -name FIT_ONLY_ONE_ATTEMPT OFF
	set_global_assignment -name FINAL_PLACEMENT_OPTIMIZATION AUTOMATICALLY
	set_global_assignment -name FITTER_AGGRESSIVE_ROUTABILITY_OPTIMIZATION AUTOMATICALLY
	set_global_assignment -name SEED 1
	set_global_assignment -name SLOW_SLEW_RATE OFF
	set_global_assignment -name PCI_IO OFF
	set_global_assignment -name TURBO_BIT ON
	set_global_assignment -name WEAK_PULL_UP_RESISTOR OFF
	set_global_assignment -name ENABLE_BUS_HOLD_CIRCUITRY OFF
	set_global_assignment -name AUTO_GLOBAL_MEMORY_CONTROLS OFF
	set_global_assignment -name MIGRATION_CONSTRAIN_CORE_RESOURCES ON
	set_global_assignment -name SET_PULSE_WIDTH WIDTH_0
	set_global_assignment -name LOCAL_LINE_DELAY_CHAIN OFF
	set_global_assignment -name AUTO_PACKED_REGISTERS_STRATIXII AUTO
	set_global_assignment -name AUTO_PACKED_REGISTERS_MAXII AUTO
	set_global_assignment -name AUTO_PACKED_REGISTERS_CYCLONE AUTO
	set_global_assignment -name AUTO_PACKED_REGISTERS OFF
	set_global_assignment -name AUTO_PACKED_REGISTERS_STRATIX AUTO
	set_global_assignment -name NORMAL_LCELL_INSERT ON
	set_global_assignment -name CARRY_OUT_PINS_LCELL_INSERT ON
	set_global_assignment -name AUTO_DELAY_CHAINS ON
	set_global_assignment -name AUTO_FAST_INPUT_REGISTERS OFF
	set_global_assignment -name AUTO_FAST_OUTPUT_REGISTERS OFF
	set_global_assignment -name AUTO_FAST_OUTPUT_ENABLE_REGISTERS OFF
	set_global_assignment -name XSTL_INPUT_ALLOW_SE_BUFFER OFF
	set_global_assignment -name TREAT_BIDIR_AS_OUTPUT OFF
	set_global_assignment -name AUTO_TURBO_BIT ON
	set_global_assignment -name PHYSICAL_SYNTHESIS_COMBO_LOGIC_FOR_AREA OFF
	set_global_assignment -name PHYSICAL_SYNTHESIS_COMBO_LOGIC OFF
	set_global_assignment -name PHYSICAL_SYNTHESIS_LOG_FILE OFF
	set_global_assignment -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION OFF
	set_global_assignment -name PHYSICAL_SYNTHESIS_MAP_LOGIC_TO_MEMORY_FOR_AREA OFF
	set_global_assignment -name PHYSICAL_SYNTHESIS_REGISTER_RETIMING OFF
	set_global_assignment -name PHYSICAL_SYNTHESIS_ASYNCHRONOUS_SIGNAL_PIPELINING OFF
	set_global_assignment -name IO_PLACEMENT_OPTIMIZATION ON
	set_global_assignment -name ALLOW_LVTTL_LVCMOS_INPUT_LEVELS_TO_OVERDRIVE_INPUT_BUFFER OFF
	set_global_assignment -name OVERRIDE_DEFAULT_ELECTROMIGRATION_PARAMETERS OFF
	set_global_assignment -name FITTER_EFFORT "AUTO FIT"
	set_global_assignment -name FITTER_AUTO_EFFORT_DESIRED_SLACK_MARGIN "0 ns"
	set_global_assignment -name PHYSICAL_SYNTHESIS_EFFORT NORMAL
	set_global_assignment -name ROUTER_LCELL_INSERTION_AND_LOGIC_DUPLICATION AUTO
	set_global_assignment -name ROUTER_REGISTER_DUPLICATION AUTO
	set_global_assignment -name ALLOW_SERIES_TERMINATION OFF
	set_global_assignment -name ALLOW_SERIES_WITH_CALIBRATION_TERMINATION OFF
	set_global_assignment -name ALLOW_PARALLEL_TERMINATION OFF
	set_global_assignment -name STRATIXGX_ALLOW_CLOCK_FANOUT_WITH_ANALOG_RESET OFF
	set_global_assignment -name AUTO_GLOBAL_CLOCK ON
	set_global_assignment -name AUTO_GLOBAL_OE ON
	set_global_assignment -name AUTO_GLOBAL_REGISTER_CONTROLS ON
	set_global_assignment -name FITTER_EARLY_TIMING_ESTIMATE_MODE REALISTIC
	set_global_assignment -name STRATIXGX_ALLOW_GIGE_UNDER_FULL_DATARATE_RANGE OFF
	set_global_assignment -name STRATIXGX_ALLOW_RX_CORECLK_FROM_NON_RX_CLKOUT_SOURCE_IN_DOUBLE_DATA_WIDTH_MODE OFF
	set_global_assignment -name STRATIXGX_ALLOW_GIGE_IN_DOUBLE_DATA_WIDTH_MODE OFF
	set_global_assignment -name STRATIXGX_ALLOW_PARALLEL_LOOPBACK_IN_DOUBLE_DATA_WIDTH_MODE OFF
	set_global_assignment -name STRATIXGX_ALLOW_XAUI_IN_SINGLE_DATA_WIDTH_MODE OFF
	set_global_assignment -name STRATIXGX_ALLOW_XAUI_WITH_CORECLK_SELECTED_AT_RATE_MATCHER OFF
	set_global_assignment -name STRATIXGX_ALLOW_XAUI_WITH_RX_CORECLK_FROM_NON_TXPLL_SOURCE OFF
	set_global_assignment -name STRATIXGX_ALLOW_GIGE_WITH_CORECLK_SELECTED_AT_RATE_MATCHER OFF
	set_global_assignment -name STRATIXGX_ALLOW_GIGE_WITHOUT_8B10B OFF
	set_global_assignment -name STRATIXGX_ALLOW_GIGE_WITH_RX_CORECLK_FROM_NON_TXPLL_SOURCE OFF
	set_global_assignment -name STRATIXGX_ALLOW_POST8B10B_LOOPBACK OFF
	set_global_assignment -name STRATIXGX_ALLOW_REVERSE_PARALLEL_LOOPBACK OFF
	set_global_assignment -name STRATIXGX_ALLOW_USE_OF_GXB_COUPLED_IOS OFF
	set_global_assignment -name IO_SSO_CHECKING ON
	set_global_assignment -name GENERATE_GXB_RECONFIG_MIF OFF
	set_global_assignment -name GENERATE_GXB_RECONFIG_MIF_WITH_PLL OFF
	set_global_assignment -name UNIPHY_SEQUENCER_DQS_CONFIG_ENABLE OFF
	set_global_assignment -name ENABLE_HOLD_BACK_OFF ON
	set_global_assignment -name CONFIGURATION_VCCIO_LEVEL AUTO
	set_global_assignment -name SYNCHRONIZER_IDENTIFICATION OFF
	set_global_assignment -name ENABLE_BENEFICIAL_SKEW_OPTIMIZATION ON
	set_global_assignment -name OPTIMIZE_FOR_METASTABILITY ON
	set_global_assignment -name RAM_BLOCK_READ_CLOCK_DUTY_CYCLE_DEPENDENCY ON
	set_global_assignment -name M144K_BLOCK_READ_CLOCK_DUTY_CYCLE_DEPENDENCY OFF
	set_global_assignment -name STRATIXIII_MRAM_COMPATIBILITY ON
	set_global_assignment -name STRATIXIII_LUTAB_SLOWDOWN OFF
	set_global_assignment -name FORCE_FITTER_TO_AVOID_PERIPHERY_PLACEMENT_WARNINGS OFF
	set_global_assignment -name AUTO_C3_M9K_BIT_SKIP OFF
	set_global_assignment -name PR_DONE_OPEN_DRAIN ON
	set_global_assignment -name NCEO_OPEN_DRAIN ON
	set_global_assignment -name ENABLE_CRC_ERROR_PIN OFF
	set_global_assignment -name ENABLE_PR_PINS OFF
	set_global_assignment -name CLAMPING_DIODE OFF
	set_global_assignment -name TRI_STATE_SPI_PINS OFF
	set_global_assignment -name EDA_SIMULATION_TOOL "<None>"
	set_global_assignment -name EDA_TIMING_ANALYSIS_TOOL "<None>"
	set_global_assignment -name EDA_BOARD_DESIGN_TIMING_TOOL "<None>"
	set_global_assignment -name EDA_BOARD_DESIGN_SYMBOL_TOOL "<None>"
	set_global_assignment -name EDA_BOARD_DESIGN_SIGNAL_INTEGRITY_TOOL "<None>"
	set_global_assignment -name EDA_BOARD_DESIGN_BOUNDARY_SCAN_TOOL "<None>"
	set_global_assignment -name EDA_BOARD_DESIGN_TOOL "<None>"
	set_global_assignment -name EDA_FORMAL_VERIFICATION_TOOL "<None>"
	set_global_assignment -name EDA_RESYNTHESIS_TOOL "<None>"
	set_global_assignment -name STRATIX_FAST_PLL_INCREASE_LOCK_WINDOW OFF
	set_global_assignment -name COMPRESSION_MODE OFF
	set_global_assignment -name CLOCK_SOURCE INTERNAL
	set_global_assignment -name CONFIGURATION_CLOCK_FREQUENCY "10 MHZ"
	set_global_assignment -name CONFIGURATION_CLOCK_DIVISOR 1
	set_global_assignment -name ENABLE_LOW_VOLTAGE_MODE_ON_CONFIG_DEVICE ON
	set_global_assignment -name FLEX6K_ENABLE_LOW_VOLTAGE_MODE_ON_CONFIG_DEVICE OFF
	set_global_assignment -name FLEX10K_ENABLE_LOW_VOLTAGE_MODE_ON_CONFIG_DEVICE ON
	set_global_assignment -name MAX7000S_JTAG_USER_CODE FFFF
	set_global_assignment -name STRATIX_JTAG_USER_CODE FFFFFFFF
	set_global_assignment -name APEX20K_JTAG_USER_CODE FFFFFFFF
	set_global_assignment -name MERCURY_JTAG_USER_CODE FFFFFFFF
	set_global_assignment -name FLEX10K_JTAG_USER_CODE 7F
	set_global_assignment -name MAX7000_JTAG_USER_CODE FFFFFFFF
	set_global_assignment -name MAX7000_USE_CHECKSUM_AS_USERCODE OFF
	set_global_assignment -name USE_CHECKSUM_AS_USERCODE OFF
	set_global_assignment -name SECURITY_BIT OFF
	set_global_assignment -name STRATIXII_CONFIGURATION_DEVICE AUTO
	set_global_assignment -name APEX20K_CONFIGURATION_DEVICE AUTO
	set_global_assignment -name MERCURY_CONFIGURATION_DEVICE AUTO
	set_global_assignment -name FLEX6K_CONFIGURATION_DEVICE AUTO
	set_global_assignment -name FLEX10K_CONFIGURATION_DEVICE AUTO
	set_global_assignment -name CYCLONE_CONFIGURATION_DEVICE AUTO
	set_global_assignment -name STRATIX_CONFIGURATION_DEVICE AUTO
	set_global_assignment -name APEX20K_CONFIG_DEVICE_JTAG_USER_CODE FFFFFFFF
	set_global_assignment -name STRATIX_CONFIG_DEVICE_JTAG_USER_CODE FFFFFFFF
	set_global_assignment -name MERCURY_CONFIG_DEVICE_JTAG_USER_CODE FFFFFFFF
	set_global_assignment -name FLEX10K_CONFIG_DEVICE_JTAG_USER_CODE FFFFFFFF
	set_global_assignment -name EPROM_USE_CHECKSUM_AS_USERCODE OFF
	set_global_assignment -name AUTO_INCREMENT_CONFIG_DEVICE_JTAG_USER_CODE ON
	set_global_assignment -name DISABLE_NCS_AND_OE_PULLUPS_ON_CONFIG_DEVICE OFF
	set_global_assignment -name GENERATE_TTF_FILE OFF
	set_global_assignment -name GENERATE_RBF_FILE OFF
	set_global_assignment -name GENERATE_HEX_FILE OFF
	set_global_assignment -name HEXOUT_FILE_START_ADDRESS 0
	set_global_assignment -name HEXOUT_FILE_COUNT_DIRECTION UP
	set_global_assignment -name RESERVE_ALL_UNUSED_PINS_NO_OUTPUT_GND "AS OUTPUT DRIVING AN UNSPECIFIED SIGNAL"
	set_global_assignment -name RELEASE_CLEARS_BEFORE_TRI_STATES OFF
	set_global_assignment -name AUTO_RESTART_CONFIGURATION ON
	set_global_assignment -name HARDCOPYII_POWER_ON_EXTRA_DELAY OFF
	set_global_assignment -name STRATIXII_EP2S60ES_ALLOW_MRAM_USAGE OFF
	set_global_assignment -name STRATIXII_ALLOW_DUAL_PORT_DUAL_CLOCK_MRAM_USAGE OFF
	set_global_assignment -name STRATIXII_MRAM_COMPATIBILITY OFF
	set_global_assignment -name CYCLONEII_M4K_COMPATIBILITY ON
	set_global_assignment -name ENABLE_OCT_DONE OFF
	set_global_assignment -name USE_CHECKERED_PATTERN_AS_UNINITIALIZED_RAM_CONTENT OFF
	set_global_assignment -name ARRIAIIGX_RX_CDR_LOCKUP_FIX_OVERRIDE OFF
	set_global_assignment -name START_TIME "0 ns"
	set_global_assignment -name SIMULATION_MODE TIMING
	set_global_assignment -name AUTO_USE_SIMULATION_PDB_NETLIST OFF
	set_global_assignment -name ADD_DEFAULT_PINS_TO_SIMULATION_OUTPUT_WAVEFORMS ON
	set_global_assignment -name SETUP_HOLD_DETECTION OFF
	set_global_assignment -name SETUP_HOLD_DETECTION_INPUT_REGISTERS_BIDIR_PINS_DISABLED OFF
	set_global_assignment -name CHECK_OUTPUTS OFF
	set_global_assignment -name SIMULATION_COVERAGE ON
	set_global_assignment -name SIMULATION_COMPLETE_COVERAGE_REPORT_PANEL ON
	set_global_assignment -name SIMULATION_MISSING_1_VALUE_COVERAGE_REPORT_PANEL ON
	set_global_assignment -name SIMULATION_MISSING_0_VALUE_COVERAGE_REPORT_PANEL ON
	set_global_assignment -name GLITCH_DETECTION OFF
	set_global_assignment -name GLITCH_INTERVAL "1 ns"
	set_global_assignment -name SIM_NO_DELAYS OFF
	set_global_assignment -name SIMULATOR_GENERATE_SIGNAL_ACTIVITY_FILE OFF
	set_global_assignment -name SIMULATION_WITH_GLITCH_FILTERING_WHEN_GENERATING_SAF ON
	set_global_assignment -name SIMULATION_BUS_CHANNEL_GROUPING OFF
	set_global_assignment -name SIMULATION_VDB_RESULT_FLUSH ON
	set_global_assignment -name VECTOR_COMPARE_TRIGGER_MODE INPUT_EDGE
	set_global_assignment -name SIMULATION_NETLIST_VIEWER OFF
	set_global_assignment -name SIMULATION_INTERCONNECT_DELAY_MODEL_TYPE TRANSPORT
	set_global_assignment -name SIMULATION_CELL_DELAY_MODEL_TYPE TRANSPORT
	set_global_assignment -name SIMULATOR_GENERATE_POWERPLAY_VCD_FILE OFF
	set_global_assignment -name SIMULATOR_PVT_TIMING_MODEL_TYPE AUTO
	set_global_assignment -name SIMULATION_WITH_AUTO_GLITCH_FILTERING AUTO
	set_global_assignment -name DRC_TOP_FANOUT 50
	set_global_assignment -name DRC_FANOUT_EXCEEDING 30
	set_global_assignment -name DRC_GATED_CLOCK_FEED 30
	set_global_assignment -name ASSG_CAT ON
	set_global_assignment -name ASSG_RULE_MISSING_FMAX ON
	set_global_assignment -name ASSG_RULE_MISSING_TIMING ON
	set_global_assignment -name HARDCOPY_FLOW_AUTOMATION MIGRATION_ONLY
	set_global_assignment -name ENABLE_DRC_SETTINGS OFF
	set_global_assignment -name CLK_RULE_CLKNET_CLKSPINES_THRESHOLD 25
	set_global_assignment -name TIMING_RULE_SHIFT_REG ON
	set_global_assignment -name TIMING_RULE_COIN_CLKEDGE ON
	set_global_assignment -name DRC_DETAIL_MESSAGE_LIMIT 10
	set_global_assignment -name DRC_VIOLATION_MESSAGE_LIMIT 30
	set_global_assignment -name DRC_DEADLOCK_STATE_LIMIT 2
	set_global_assignment -name MERGE_HEX_FILE OFF
	set_global_assignment -name GENERATE_SVF_FILE OFF
	set_global_assignment -name GENERATE_ISC_FILE OFF
	set_global_assignment -name GENERATE_JAM_FILE OFF
	set_global_assignment -name GENERATE_JBC_FILE OFF
	set_global_assignment -name GENERATE_JBC_FILE_COMPRESSED ON
	set_global_assignment -name GENERATE_CONFIG_SVF_FILE OFF
	set_global_assignment -name GENERATE_CONFIG_ISC_FILE OFF
	set_global_assignment -name GENERATE_CONFIG_JAM_FILE OFF
	set_global_assignment -name GENERATE_CONFIG_JBC_FILE OFF
	set_global_assignment -name GENERATE_CONFIG_JBC_FILE_COMPRESSED ON
	set_global_assignment -name GENERATE_CONFIG_HEXOUT_FILE OFF
	set_global_assignment -name ISP_CLAMP_STATE_DEFAULT "TRI-STATE"
	set_global_assignment -name SIGNALPROBE_ALLOW_OVERUSE OFF
	set_global_assignment -name SIGNALPROBE_DURING_NORMAL_COMPILATION OFF
	set_global_assignment -name HUB_ENTITY_NAME sld_hub
	set_global_assignment -name HUB_INSTANCE_NAME auto_hub
	set_global_assignment -name LOGICLOCK_INCREMENTAL_COMPILE_ASSIGNMENT OFF
	set_global_assignment -name POWER_DEFAULT_TOGGLE_RATE 12.5%
	set_global_assignment -name POWER_DEFAULT_INPUT_IO_TOGGLE_RATE 12.5%
	set_global_assignment -name POWER_USE_PVA ON
	set_global_assignment -name POWER_USE_INPUT_FILE "NO FILE"
	set_global_assignment -name POWER_USE_INPUT_FILES OFF
	set_global_assignment -name POWER_VCD_FILTER_GLITCHES ON
	set_global_assignment -name POWER_REPORT_SIGNAL_ACTIVITY OFF
	set_global_assignment -name POWER_REPORT_POWER_DISSIPATION OFF
	set_global_assignment -name POWER_USE_DEVICE_CHARACTERISTICS TYPICAL
	set_global_assignment -name POWER_AUTO_COMPUTE_TJ ON
	set_global_assignment -name POWER_TJ_VALUE 25
	set_global_assignment -name POWER_USE_TA_VALUE 25
	set_global_assignment -name POWER_USE_CUSTOM_COOLING_SOLUTION OFF
	set_global_assignment -name POWER_BOARD_TEMPERATURE 25
	set_global_assignment -name IGNORE_PARTITIONS OFF
	set_global_assignment -name AUTO_EXPORT_INCREMENTAL_COMPILATION OFF
	set_global_assignment -name RAPID_RECOMPILE_MODE OFF
	set_global_assignment -name QIC_USE_BINARY_DATABASES ON
	set_global_assignment -name ENABLE_ACCELERATED_INCREMENTAL_COMPILE ON
	set_global_assignment -name RTLV_REMOVE_FANOUT_FREE_REGISTERS ON
	set_global_assignment -name RTLV_SIMPLIFIED_LOGIC ON
	set_global_assignment -name RTLV_GROUP_RELATED_NODES ON
	set_global_assignment -name RTLV_GROUP_COMB_LOGIC_IN_CLOUD OFF
	set_global_assignment -name RTLV_GROUP_COMB_LOGIC_IN_CLOUD_TMV OFF
	set_global_assignment -name RTLV_GROUP_RELATED_NODES_TMV ON
	set_global_assignment -name EQC_CONSTANT_DFF_DETECTION ON
	set_global_assignment -name EQC_DUPLICATE_DFF_DETECTION ON
	set_global_assignment -name EQC_BBOX_MERGE ON
	set_global_assignment -name EQC_LVDS_MERGE ON
	set_global_assignment -name EQC_RAM_UNMERGING ON
	set_global_assignment -name EQC_DFF_SS_EMULATION ON
	set_global_assignment -name EQC_RAM_REGISTER_UNPACK ON
	set_global_assignment -name EQC_MAC_REGISTER_UNPACK ON
	set_global_assignment -name EQC_SET_PARTITION_BB_TO_VCC_GND ON
	set_global_assignment -name EQC_STRUCTURE_MATCHING ON
	set_global_assignment -name EQC_AUTO_BREAK_CONE ON
	set_global_assignment -name EQC_POWER_UP_COMPARE OFF
	set_global_assignment -name EQC_AUTO_COMP_LOOP_CUT ON
	set_global_assignment -name EQC_AUTO_INVERSION ON
	set_global_assignment -name EQC_AUTO_TERMINATE ON
	set_global_assignment -name EQC_SUB_CONE_REPORT OFF
	set_global_assignment -name EQC_RENAMING_RULES ON
	set_global_assignment -name EQC_PARAMETER_CHECK ON
	set_global_assignment -name EQC_AUTO_PORTSWAP ON
	set_global_assignment -name EQC_DETECT_DONT_CARES ON
	set_global_assignment -name EQC_SHOW_ALL_MAPPED_POINTS OFF
	set_global_assignment -name TOP_LEVEL_ENTITY DE0_TOP
	set_global_assignment -name PARTITION_PRESERVE_HIGH_SPEED_TILES ON -section_id Top
	set_global_assignment -name PARTITION_IGNORE_SOURCE_FILE_CHANGES OFF -section_id Top
	set_global_assignment -name PARTITION_ALWAYS_USE_QXP_NETLIST OFF -section_id Top
	set_global_assignment -name PARTITION_IMPORT_ASSIGNMENTS ON -section_id Top
	set_global_assignment -name PARTITION_IMPORT_EXISTING_ASSIGNMENTS REPLACE_CONFLICTING -section_id Top
	set_global_assignment -name PARTITION_IMPORT_EXISTING_LOGICLOCK_REGIONS REPLACE_CONFLICTING -section_id Top
	set_global_assignment -name PARTITION_IMPORT_PIN_ASSIGNMENTS ON -section_id Top
	set_global_assignment -name PARTITION_IMPORT_PROMOTE_ASSIGNMENTS ON -section_id Top
	set_global_assignment -name PARTITION_TYPE STANDARD_PARTITION -section_id Top
	set_global_assignment -name ALLOW_MULTIPLE_PERSONAS OFF -section_id Top
	set_global_assignment -name EDA_RTL_SIM_MODE NOT_USED -section_id eda_simulation

	# Commit assignments
	export_assignments

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}
