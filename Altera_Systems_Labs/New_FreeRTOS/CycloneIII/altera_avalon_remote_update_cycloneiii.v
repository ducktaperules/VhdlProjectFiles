
/*****************************************************************************/
// altera_avalon_remote_update_cycloneiii.v
//
// This verilog file is a lightweight wrapper for the Cyclone III remote_update
// block.  Using this wrapper, the remote update block can be imported into 
// SOPC Builder using Component Editor.
//  
// Modifications made with this wrapper:
//
// 1.) The data_in and data_out ports of the remote update block have been 
//     expanded to 32-bits to comply with SOPC Builder 
// 2.) A register has been added so that the reconfig and reset_timer control 
//     bits of the remote update block can be controlled from an Avalon master
//     (such as NiosII)
// 3.) The param and read_source lines have been combined into a single address
//     bus so each register from each configuration state has a unique address
//
/*****************************************************************************/


module altera_avalon_remote_update_cycloneiii (
  clk,
  reset,
  writedata,
  readdata,
  address,
  chipselect,
  write,
  read,
  waitrequest );
  
  
  input clk;
  input reset;
  input [31:0] writedata;
  output [31:0] readdata;
  input [5:0] address;
  input chipselect;
  input write;
  input read;
  output waitrequest;
  

  /************************************************************************
  **  Address[2:0] description
  *************************************************************************

    000 - Master State Machine Current State Mode - width of 2
    001 - Force early CONF_DONE (Cd_early) check - width of 1
    010 - Watchdog Timeout Value - width of 12 when reading and
          width of 29 when writing
    011 - Watchdog Enable - width of 1
    100 - Boot Address- width of 24 when reading and width of 22
          when writing
    101 - (illegal value)
    110 - Force the internal oscillator as startup state machine clock
          (Osc_int) option bit - width of 1
    111 - Reconfiguration trigger conditions - width of 5
    
  *************************************************************************
  **  Address[4:3] description
  *************************************************************************
    
    00 Current State Contents in Status Register
    01 Previous State Register 1 Contents in Status Register
    10 Previous State Register 2 Contents in Status Register
    11 Illegal
    
  
  *************************************************************************
  **  Address[5] description
  *************************************************************************

		Enables access to control_status_reg
		  -Used to control 'reconfig' and 'reset_timer' signals from Avalon
		  
  ************************************************************************/

  wire [2:0] param_wire = address[2:0];
  wire [1:0] read_source = address[4:3];
  wire read_param;
  wire write_param;
  wire [21:0] data_in = writedata[21:0];
  wire [28:0] data_out;
  wire reconfig;
  wire reset_timer;
  wire reset_n = ~reset;
  wire waitrequest;
  wire busy;

	reg readorwritelastclock;
  reg [31:0] readdata;
  reg [31:0] control_status_reg;

  assign read_param = chipselect & read & ~address[5] & ~readorwritelastclock;
  assign write_param = chipselect & write & ~address[5] & ~readorwritelastclock;
	assign waitrequest = ( busy ^ (( write | read ) & ~readorwritelastclock ));

  /*****************************************************************************/
  // General Purpose Register - Read/Writeable by Avalon master
  // Currently used to provide bus access to Reconfig / Watchdog Reset bits
  //  Offset = 0x10000
  /*****************************************************************************/
  always @(posedge clk or negedge reset_n)
  if (~reset_n)
    control_status_reg <= 0;
  else if ( chipselect & write & ( address == 6'b100000 ))
    control_status_reg <= writedata;
  else
    control_status_reg <= control_status_reg;


  // Register read logic
  always @(posedge clk or negedge reset_n)
    if( ~reset_n )
      readdata <= 0;
    else if( chipselect & read & ~address[5] )
      readdata <= {4'b0000, data_out};
    else if( chipselect & read & ( address == 6'b100000 ))
      readdata <= control_status_reg;
    else
      readdata <= readdata;
      
//  assign readdata = address[5] ? control_status_reg: {4'b0000, data_out} ;

  // Delayed 'OR' of the read and write signals
  // Used to pulse the read_param/write_param signals for just one clock cycle
  always @(posedge clk or negedge reset_n)
  if (~reset_n)
    readorwritelastclock <= 0;
  else 
    readorwritelastclock <= ( read | write );

  
  assign reconfig = control_status_reg[0];
  assign reset_timer = control_status_reg[1];

`ifdef QUARTUS__SIMGEN
`else
  /*****************************************************************************/
  // Instantiation of remote update funciton.
  /*****************************************************************************/
  remote_update_rmtupdt_e0l remote_update_rmtupdt_e0l_component (
        .reconfig (reconfig),
        .read_source (read_source),
        .param (param_wire),
        .reset_timer (reset_timer),
        .read_param (read_param),
        .reset (reset),
        .data_in (writedata[21:0]),
        .clock (clk),
        .write_param (write_param),
        .busy (busy),
        .data_out (data_out));
`endif

endmodule


/*****************************************************************************/
// IMPORTANT!!
// Everything below here was spawned by the megafunction wizard.  I havent 
// touched it.  I just pasted it here and instantiate it from above
//  -Nate
/*****************************************************************************/

// megafunction wizard: %ALTREMOTE_UPDATE%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: altremote_update 

// ============================================================
// File Name: remote_update.v
// Megafunction Name(s):
// 			altremote_update
//
// Simulation Library Files(s):
// 			cycloneiii;lpm
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 7.1 Build 155 04/25/2007 SJ Full Version
// ************************************************************


//Copyright (C) 1991-2007 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, Altera MegaCore Function License 
//Agreement, or other applicable license agreement, including, 
//without limitation, that your use is for the sole purpose of 
//programming logic devices manufactured by Altera and sold by 
//Altera or its authorized distributors.  Please refer to the 
//applicable agreement for further details.


//altremote_update CBX_AUTO_BLACKBOX="ALL" DEVICE_FAMILY="Cyclone III" in_data_width=22 operation_mode="remote" out_data_width=29 busy clock data_in data_out param read_param read_source reconfig reset reset_timer write_param
//VERSION_BEGIN 7.1 cbx_altremote_update 2007:02:23:17:47:32:SJ cbx_cycloneii 2007:01:23:09:39:40:SJ cbx_lpm_add_sub 2007:01:08:11:15:18:SJ cbx_lpm_compare 2007:02:05:11:33:54:SJ cbx_lpm_counter 2007:03:22:23:17:10:SJ cbx_lpm_decode 2006:11:21:10:27:00:SJ cbx_mgl 2007:04:03:14:06:46:SJ cbx_stratix 2007:04:12:16:43:52:SJ cbx_stratixii 2007:02:12:17:08:26:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463


//synthesis_resources = cycloneiii_rublock 1 lpm_counter 2 reg 60 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on

module  remote_update_rmtupdt_e0l
	( 
	busy,
	clock,
	data_in,
	data_out,
	param,
	read_param,
	read_source,
	reconfig,
	reset,
	reset_timer,
	write_param) /* synthesis synthesis_clearbox=1 */;
	output   busy;
	input   clock;
	input   [21:0]  data_in;
	output   [28:0]  data_out;
	input   [2:0]  param;
	input   read_param;
	input   [1:0]  read_source;
	input   reconfig;
	input   reset;
	input   reset_timer;
	input   write_param;

	reg	dffe10;
	reg	dffe11;
	reg	dffe12;
	reg	dffe13;
	reg	dffe14;
	reg	dffe15;
	reg	dffe16;
	reg	dffe17;
	reg	dffe18;
	reg	dffe19;
	reg	[0:0]	dffe1a0;
	reg	[0:0]	dffe1a1;
	wire	[1:0]	wire_dffe1a_ena;
	reg	dffe20;
	reg	dffe21;
	reg	dffe22;
	reg	dffe23;
	reg	[6:0]	dffe24a;
	reg	[0:0]	dffe2a0;
	reg	[0:0]	dffe2a1;
	reg	[0:0]	dffe2a2;
	wire	[2:0]	wire_dffe2a_ena;
	reg	[0:0]	dffe3a0;
	reg	[0:0]	dffe3a1;
	reg	[0:0]	dffe3a2;
	wire	[2:0]	wire_dffe3a_ena;
	reg	[28:0]	dffe7a;
	wire	[28:0]	wire_dffe7a_clrn;
	wire	[28:0]	wire_dffe7a_ena;
	reg	dffe8;
	reg	dffe9;
	wire  [5:0]   wire_cntr5_q;
	wire  [4:0]   wire_cntr6_q;
	wire  wire_sd4_regout;
	wire  bit_counter_all_done;
	wire  bit_counter_clear;
	wire  bit_counter_enable;
	wire  [5:0]  bit_counter_param_start;
	wire  bit_counter_param_start_match;
	wire  [6:0]  combine_port;
	wire  global_gnd;
	wire  global_vcc;
	wire  idle;
	wire  [6:0]  param_decoder_param_latch;
	wire  [17:0]  param_decoder_select;
	wire  power_up;
	wire  read_data;
	wire  read_init;
	wire  read_init_counter;
	wire  read_post;
	wire  read_pre_data;
	wire  read_source_update;
	wire  rsource_load;
	wire  [1:0]  rsource_parallel_in;
	wire  rsource_serial_out;
	wire  rsource_shift_enable;
	wire  [2:0]  rsource_state_par_ini;
	wire  rsource_update_done;
	wire  rublock_captnupdt;
	wire  rublock_clock;
	wire  rublock_reconfig;
	wire  rublock_regin;
	wire  rublock_regout;
	wire  rublock_regout_reg;
	wire  rublock_shiftnld;
	wire  select_shift_nloop;
	wire  shift_reg_clear;
	wire  shift_reg_load_enable;
	wire  shift_reg_serial_in;
	wire  shift_reg_serial_out;
	wire  shift_reg_shift_enable;
	wire  [5:0]  start_bit_decoder_out;
	wire  [17:0]  start_bit_decoder_param_select;
	wire  [4:0]  w190w;
	wire  [4:0]  w202w;
	wire  [4:0]  w214w;
	wire  [4:0]  w227w;
	wire  [4:0]  w237w;
	wire  [4:0]  w250w;
	wire  [4:0]  w263w;
	wire  [4:0]  w275w;
	wire  [4:0]  w288w;
	wire  [4:0]  w300w;
	wire  [4:0]  w312w;
	wire  [4:0]  w325w;
	wire  [4:0]  w337w;
	wire  [4:0]  w349w;
	wire  [4:0]  w362w;
	wire  [4:0]  w374w;
	wire  [4:0]  w387w;
	wire  [4:0]  w398w;
	wire  [5:0]  w411w;
	wire  [5:0]  w422w;
	wire  [5:0]  w438w;
	wire  [5:0]  w44w;
	wire  [5:0]  w450w;
	wire  [5:0]  w466w;
	wire  [5:0]  w478w;
	wire  [5:0]  w490w;
	wire  [5:0]  w506w;
	wire  [5:0]  w520w;
	wire  [5:0]  w536w;
	wire  [5:0]  w549w;
	wire  [5:0]  w563w;
	wire  [5:0]  w579w;
	wire  [5:0]  w592w;
	wire  [5:0]  w605w;
	wire  [5:0]  w621w;
	wire  [5:0]  w634w;
	wire  [5:0]  w648w;
	wire  [4:0]  w74w;
	wire  w889w;
	wire  width_counter_all_done;
	wire  width_counter_clear;
	wire  width_counter_enable;
	wire  [4:0]  width_counter_param_width;
	wire  width_counter_param_width_match;
	wire  [4:0]  width_decoder_out;
	wire  [17:0]  width_decoder_param_select;
	wire  write_data;
	wire  write_init;
	wire  write_init_counter;
	wire  write_load;
	wire  write_post_data;
	wire  write_pre_data;
	wire  write_source_update;
	wire  write_wait;
	wire  [2:0]  wsource_state_par_ini;
	wire  wsource_update_done;

	// synopsys translate_off
	initial
		dffe10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) dffe10 <= 1'b0;
		else  dffe10 <= ((read_init | read_source_update) & (~ rsource_update_done));
	// synopsys translate_off
	initial
		dffe11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) dffe11 <= 1'b0;
		else  dffe11 <= rsource_update_done;
	// synopsys translate_off
	initial
		dffe12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) dffe12 <= 1'b0;
		else  dffe12 <= ((read_init_counter & (~ bit_counter_param_start_match)) | (read_pre_data & (~ bit_counter_param_start_match)));
	// synopsys translate_off
	initial
		dffe13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) dffe13 <= 1'b0;
		else  dffe13 <= (((read_init_counter & bit_counter_param_start_match) | (read_pre_data & bit_counter_param_start_match)) | ((read_data & (~ width_counter_param_width_match)) & (~ width_counter_all_done)));
	// synopsys translate_off
	initial
		dffe14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) dffe14 <= 1'b0;
		else  dffe14 <= (((read_data & width_counter_param_width_match) & (~ width_counter_all_done)) | (read_post & (~ width_counter_all_done)));
	// synopsys translate_off
	initial
		dffe15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) dffe15 <= 1'b0;
		else  dffe15 <= (idle & write_param);
	// synopsys translate_off
	initial
		dffe16 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) dffe16 <= 1'b0;
		else  dffe16 <= ((write_init | write_source_update) & (~ wsource_update_done));
	// synopsys translate_off
	initial
		dffe17 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) dffe17 <= 1'b0;
		else  dffe17 <= wsource_update_done;
	// synopsys translate_off
	initial
		dffe18 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) dffe18 <= 1'b0;
		else  dffe18 <= ((write_init_counter & (~ bit_counter_param_start_match)) | (write_pre_data & (~ bit_counter_param_start_match)));
	// synopsys translate_off
	initial
		dffe19 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) dffe19 <= 1'b0;
		else  dffe19 <= (((write_init_counter & bit_counter_param_start_match) | (write_pre_data & bit_counter_param_start_match)) | ((write_data & (~ width_counter_param_width_match)) & (~ bit_counter_all_done)));
	// synopsys translate_off
	initial
		dffe1a0 = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		if (wire_dffe1a_ena[0:0] == 1'b1)   dffe1a0 <= ((rsource_load & rsource_parallel_in[0]) | ((~ rsource_load) & dffe1a1[0:0]));
	// synopsys translate_off
	initial
		dffe1a1 = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		if (wire_dffe1a_ena[1:1] == 1'b1)   dffe1a1 <= (rsource_parallel_in[1] & rsource_load);
	assign
		wire_dffe1a_ena = {2{(rsource_load | rsource_shift_enable)}};
	// synopsys translate_off
	initial
		dffe20 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) dffe20 <= 1'b0;
		else  dffe20 <= (((write_data & width_counter_param_width_match) & (~ bit_counter_all_done)) | (write_post_data & (~ bit_counter_all_done)));
	// synopsys translate_off
	initial
		dffe21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) dffe21 <= 1'b0;
		else  dffe21 <= ((write_data & bit_counter_all_done) | (write_post_data & bit_counter_all_done));
	// synopsys translate_off
	initial
		dffe22 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) dffe22 <= 1'b0;
		else  dffe22 <= write_load;
	// synopsys translate_off
	initial
		dffe23 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) dffe23 <= 1'b0;
		else  dffe23 <= rublock_regout;
	// synopsys translate_off
	initial
		dffe24a = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) dffe24a <= 7'b0;
		else if  (w889w == 1'b1)   dffe24a <= combine_port;
	// synopsys translate_off
	initial
		dffe2a0 = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		if (wire_dffe2a_ena[0:0] == 1'b1)   dffe2a0 <= ((rsource_load & rsource_state_par_ini[0]) | ((~ rsource_load) & dffe2a1[0:0]));
	// synopsys translate_off
	initial
		dffe2a1 = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		if (wire_dffe2a_ena[1:1] == 1'b1)   dffe2a1 <= ((rsource_load & rsource_state_par_ini[1]) | ((~ rsource_load) & dffe2a2[0:0]));
	// synopsys translate_off
	initial
		dffe2a2 = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		if (wire_dffe2a_ena[2:2] == 1'b1)   dffe2a2 <= (rsource_state_par_ini[2] & rsource_load);
	assign
		wire_dffe2a_ena = {3{(rsource_load | global_vcc)}};
	// synopsys translate_off
	initial
		dffe3a0 = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		if (wire_dffe3a_ena[0:0] == 1'b1)   dffe3a0 <= ((rsource_load & wsource_state_par_ini[0]) | ((~ rsource_load) & dffe3a1[0:0]));
	// synopsys translate_off
	initial
		dffe3a1 = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		if (wire_dffe3a_ena[1:1] == 1'b1)   dffe3a1 <= ((rsource_load & wsource_state_par_ini[1]) | ((~ rsource_load) & dffe3a2[0:0]));
	// synopsys translate_off
	initial
		dffe3a2 = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		if (wire_dffe3a_ena[2:2] == 1'b1)   dffe3a2 <= (wsource_state_par_ini[2] & rsource_load);
	assign
		wire_dffe3a_ena = {3{(rsource_load | global_vcc)}};
	// synopsys translate_off
	initial
		dffe7a[0:0] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge wire_dffe7a_clrn[0:0])
		if (wire_dffe7a_clrn[0:0] == 1'b0) dffe7a[0:0] <= 1'b0;
		else if  (wire_dffe7a_ena[0:0] == 1'b1)   dffe7a[0:0] <= ((shift_reg_load_enable & data_in[0]) | ((~ shift_reg_load_enable) & dffe7a[1:1]));
	// synopsys translate_off
	initial
		dffe7a[1:1] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge wire_dffe7a_clrn[1:1])
		if (wire_dffe7a_clrn[1:1] == 1'b0) dffe7a[1:1] <= 1'b0;
		else if  (wire_dffe7a_ena[1:1] == 1'b1)   dffe7a[1:1] <= ((shift_reg_load_enable & data_in[1]) | ((~ shift_reg_load_enable) & dffe7a[2:2]));
	// synopsys translate_off
	initial
		dffe7a[2:2] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge wire_dffe7a_clrn[2:2])
		if (wire_dffe7a_clrn[2:2] == 1'b0) dffe7a[2:2] <= 1'b0;
		else if  (wire_dffe7a_ena[2:2] == 1'b1)   dffe7a[2:2] <= ((shift_reg_load_enable & data_in[2]) | ((~ shift_reg_load_enable) & dffe7a[3:3]));
	// synopsys translate_off
	initial
		dffe7a[3:3] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge wire_dffe7a_clrn[3:3])
		if (wire_dffe7a_clrn[3:3] == 1'b0) dffe7a[3:3] <= 1'b0;
		else if  (wire_dffe7a_ena[3:3] == 1'b1)   dffe7a[3:3] <= ((shift_reg_load_enable & data_in[3]) | ((~ shift_reg_load_enable) & dffe7a[4:4]));
	// synopsys translate_off
	initial
		dffe7a[4:4] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge wire_dffe7a_clrn[4:4])
		if (wire_dffe7a_clrn[4:4] == 1'b0) dffe7a[4:4] <= 1'b0;
		else if  (wire_dffe7a_ena[4:4] == 1'b1)   dffe7a[4:4] <= ((shift_reg_load_enable & data_in[4]) | ((~ shift_reg_load_enable) & dffe7a[5:5]));
	// synopsys translate_off
	initial
		dffe7a[5:5] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge wire_dffe7a_clrn[5:5])
		if (wire_dffe7a_clrn[5:5] == 1'b0) dffe7a[5:5] <= 1'b0;
		else if  (wire_dffe7a_ena[5:5] == 1'b1)   dffe7a[5:5] <= ((shift_reg_load_enable & data_in[5]) | ((~ shift_reg_load_enable) & dffe7a[6:6]));
	// synopsys translate_off
	initial
		dffe7a[6:6] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge wire_dffe7a_clrn[6:6])
		if (wire_dffe7a_clrn[6:6] == 1'b0) dffe7a[6:6] <= 1'b0;
		else if  (wire_dffe7a_ena[6:6] == 1'b1)   dffe7a[6:6] <= ((shift_reg_load_enable & data_in[6]) | ((~ shift_reg_load_enable) & dffe7a[7:7]));
	// synopsys translate_off
	initial
		dffe7a[7:7] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge wire_dffe7a_clrn[7:7])
		if (wire_dffe7a_clrn[7:7] == 1'b0) dffe7a[7:7] <= 1'b0;
		else if  (wire_dffe7a_ena[7:7] == 1'b1)   dffe7a[7:7] <= ((shift_reg_load_enable & data_in[7]) | ((~ shift_reg_load_enable) & dffe7a[8:8]));
	// synopsys translate_off
	initial
		dffe7a[8:8] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge wire_dffe7a_clrn[8:8])
		if (wire_dffe7a_clrn[8:8] == 1'b0) dffe7a[8:8] <= 1'b0;
		else if  (wire_dffe7a_ena[8:8] == 1'b1)   dffe7a[8:8] <= ((shift_reg_load_enable & data_in[8]) | ((~ shift_reg_load_enable) & dffe7a[9:9]));
	// synopsys translate_off
	initial
		dffe7a[9:9] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge wire_dffe7a_clrn[9:9])
		if (wire_dffe7a_clrn[9:9] == 1'b0) dffe7a[9:9] <= 1'b0;
		else if  (wire_dffe7a_ena[9:9] == 1'b1)   dffe7a[9:9] <= ((shift_reg_load_enable & data_in[9]) | ((~ shift_reg_load_enable) & dffe7a[10:10]));
	// synopsys translate_off
	initial
		dffe7a[10:10] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge wire_dffe7a_clrn[10:10])
		if (wire_dffe7a_clrn[10:10] == 1'b0) dffe7a[10:10] <= 1'b0;
		else if  (wire_dffe7a_ena[10:10] == 1'b1)   dffe7a[10:10] <= ((shift_reg_load_enable & data_in[10]) | ((~ shift_reg_load_enable) & dffe7a[11:11]));
	// synopsys translate_off
	initial
		dffe7a[11:11] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge wire_dffe7a_clrn[11:11])
		if (wire_dffe7a_clrn[11:11] == 1'b0) dffe7a[11:11] <= 1'b0;
		else if  (wire_dffe7a_ena[11:11] == 1'b1)   dffe7a[11:11] <= ((shift_reg_load_enable & data_in[11]) | ((~ shift_reg_load_enable) & dffe7a[12:12]));
	// synopsys translate_off
	initial
		dffe7a[12:12] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge wire_dffe7a_clrn[12:12])
		if (wire_dffe7a_clrn[12:12] == 1'b0) dffe7a[12:12] <= 1'b0;
		else if  (wire_dffe7a_ena[12:12] == 1'b1)   dffe7a[12:12] <= ((shift_reg_load_enable & data_in[12]) | ((~ shift_reg_load_enable) & dffe7a[13:13]));
	// synopsys translate_off
	initial
		dffe7a[13:13] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge wire_dffe7a_clrn[13:13])
		if (wire_dffe7a_clrn[13:13] == 1'b0) dffe7a[13:13] <= 1'b0;
		else if  (wire_dffe7a_ena[13:13] == 1'b1)   dffe7a[13:13] <= ((shift_reg_load_enable & data_in[13]) | ((~ shift_reg_load_enable) & dffe7a[14:14]));
	// synopsys translate_off
	initial
		dffe7a[14:14] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge wire_dffe7a_clrn[14:14])
		if (wire_dffe7a_clrn[14:14] == 1'b0) dffe7a[14:14] <= 1'b0;
		else if  (wire_dffe7a_ena[14:14] == 1'b1)   dffe7a[14:14] <= ((shift_reg_load_enable & data_in[14]) | ((~ shift_reg_load_enable) & dffe7a[15:15]));
	// synopsys translate_off
	initial
		dffe7a[15:15] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge wire_dffe7a_clrn[15:15])
		if (wire_dffe7a_clrn[15:15] == 1'b0) dffe7a[15:15] <= 1'b0;
		else if  (wire_dffe7a_ena[15:15] == 1'b1)   dffe7a[15:15] <= ((shift_reg_load_enable & data_in[15]) | ((~ shift_reg_load_enable) & dffe7a[16:16]));
	// synopsys translate_off
	initial
		dffe7a[16:16] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge wire_dffe7a_clrn[16:16])
		if (wire_dffe7a_clrn[16:16] == 1'b0) dffe7a[16:16] <= 1'b0;
		else if  (wire_dffe7a_ena[16:16] == 1'b1)   dffe7a[16:16] <= ((shift_reg_load_enable & data_in[16]) | ((~ shift_reg_load_enable) & dffe7a[17:17]));
	// synopsys translate_off
	initial
		dffe7a[17:17] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge wire_dffe7a_clrn[17:17])
		if (wire_dffe7a_clrn[17:17] == 1'b0) dffe7a[17:17] <= 1'b0;
		else if  (wire_dffe7a_ena[17:17] == 1'b1)   dffe7a[17:17] <= ((shift_reg_load_enable & data_in[17]) | ((~ shift_reg_load_enable) & dffe7a[18:18]));
	// synopsys translate_off
	initial
		dffe7a[18:18] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge wire_dffe7a_clrn[18:18])
		if (wire_dffe7a_clrn[18:18] == 1'b0) dffe7a[18:18] <= 1'b0;
		else if  (wire_dffe7a_ena[18:18] == 1'b1)   dffe7a[18:18] <= ((shift_reg_load_enable & data_in[18]) | ((~ shift_reg_load_enable) & dffe7a[19:19]));
	// synopsys translate_off
	initial
		dffe7a[19:19] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge wire_dffe7a_clrn[19:19])
		if (wire_dffe7a_clrn[19:19] == 1'b0) dffe7a[19:19] <= 1'b0;
		else if  (wire_dffe7a_ena[19:19] == 1'b1)   dffe7a[19:19] <= ((shift_reg_load_enable & data_in[19]) | ((~ shift_reg_load_enable) & dffe7a[20:20]));
	// synopsys translate_off
	initial
		dffe7a[20:20] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge wire_dffe7a_clrn[20:20])
		if (wire_dffe7a_clrn[20:20] == 1'b0) dffe7a[20:20] <= 1'b0;
		else if  (wire_dffe7a_ena[20:20] == 1'b1)   dffe7a[20:20] <= ((shift_reg_load_enable & data_in[20]) | ((~ shift_reg_load_enable) & dffe7a[21:21]));
	// synopsys translate_off
	initial
		dffe7a[21:21] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge wire_dffe7a_clrn[21:21])
		if (wire_dffe7a_clrn[21:21] == 1'b0) dffe7a[21:21] <= 1'b0;
		else if  (wire_dffe7a_ena[21:21] == 1'b1)   dffe7a[21:21] <= ((shift_reg_load_enable & data_in[21]) | ((~ shift_reg_load_enable) & dffe7a[22:22]));
	// synopsys translate_off
	initial
		dffe7a[22:22] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge wire_dffe7a_clrn[22:22])
		if (wire_dffe7a_clrn[22:22] == 1'b0) dffe7a[22:22] <= 1'b0;
		else if  (wire_dffe7a_ena[22:22] == 1'b1)   dffe7a[22:22] <= ((~ shift_reg_load_enable) & dffe7a[23:23]);
	// synopsys translate_off
	initial
		dffe7a[23:23] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge wire_dffe7a_clrn[23:23])
		if (wire_dffe7a_clrn[23:23] == 1'b0) dffe7a[23:23] <= 1'b0;
		else if  (wire_dffe7a_ena[23:23] == 1'b1)   dffe7a[23:23] <= ((~ shift_reg_load_enable) & dffe7a[24:24]);
	// synopsys translate_off
	initial
		dffe7a[24:24] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge wire_dffe7a_clrn[24:24])
		if (wire_dffe7a_clrn[24:24] == 1'b0) dffe7a[24:24] <= 1'b0;
		else if  (wire_dffe7a_ena[24:24] == 1'b1)   dffe7a[24:24] <= ((~ shift_reg_load_enable) & dffe7a[25:25]);
	// synopsys translate_off
	initial
		dffe7a[25:25] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge wire_dffe7a_clrn[25:25])
		if (wire_dffe7a_clrn[25:25] == 1'b0) dffe7a[25:25] <= 1'b0;
		else if  (wire_dffe7a_ena[25:25] == 1'b1)   dffe7a[25:25] <= ((~ shift_reg_load_enable) & dffe7a[26:26]);
	// synopsys translate_off
	initial
		dffe7a[26:26] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge wire_dffe7a_clrn[26:26])
		if (wire_dffe7a_clrn[26:26] == 1'b0) dffe7a[26:26] <= 1'b0;
		else if  (wire_dffe7a_ena[26:26] == 1'b1)   dffe7a[26:26] <= ((~ shift_reg_load_enable) & dffe7a[27:27]);
	// synopsys translate_off
	initial
		dffe7a[27:27] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge wire_dffe7a_clrn[27:27])
		if (wire_dffe7a_clrn[27:27] == 1'b0) dffe7a[27:27] <= 1'b0;
		else if  (wire_dffe7a_ena[27:27] == 1'b1)   dffe7a[27:27] <= ((~ shift_reg_load_enable) & dffe7a[28:28]);
	// synopsys translate_off
	initial
		dffe7a[28:28] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge wire_dffe7a_clrn[28:28])
		if (wire_dffe7a_clrn[28:28] == 1'b0) dffe7a[28:28] <= 1'b0;
		else if  (wire_dffe7a_ena[28:28] == 1'b1)   dffe7a[28:28] <= ((~ shift_reg_load_enable) & shift_reg_serial_in);
	assign
		wire_dffe7a_ena = {29{(shift_reg_load_enable | shift_reg_shift_enable)}},
		wire_dffe7a_clrn = {29{(~ (shift_reg_clear | reset))}};
	// synopsys translate_off
	initial
		dffe8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) dffe8 <= {1{1'b1}};
		else  dffe8 <= ((((((idle & (~ read_param)) & (~ write_param)) | write_wait) | (read_data & width_counter_all_done)) | (read_post & width_counter_all_done)) | power_up);
	// synopsys translate_off
	initial
		dffe9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) dffe9 <= 1'b0;
		else  dffe9 <= (idle & read_param);
	lpm_counter   cntr5
	( 
	.clock(clock),
	.cnt_en(bit_counter_enable),
	.cout(),
	.eq(),
	.q(wire_cntr5_q),
	.sclr(bit_counter_clear)
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.aload(1'b0),
	.aset(1'b0),
	.cin(1'b1),
	.clk_en(1'b1),
	.data({6{1'b0}}),
	.sload(1'b0),
	.sset(1'b0),
	.updown(1'b1)
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_on
	`endif
	);
	defparam
		cntr5.lpm_direction = "UP",
		cntr5.lpm_port_updown = "PORT_UNUSED",
		cntr5.lpm_width = 6,
		cntr5.lpm_type = "lpm_counter";
	lpm_counter   cntr6
	( 
	.clock(clock),
	.cnt_en(width_counter_enable),
	.cout(),
	.eq(),
	.q(wire_cntr6_q),
	.sclr(width_counter_clear)
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.aload(1'b0),
	.aset(1'b0),
	.cin(1'b1),
	.clk_en(1'b1),
	.data({5{1'b0}}),
	.sload(1'b0),
	.sset(1'b0),
	.updown(1'b1)
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_on
	`endif
	);
	defparam
		cntr6.lpm_direction = "UP",
		cntr6.lpm_port_updown = "PORT_UNUSED",
		cntr6.lpm_width = 5,
		cntr6.lpm_type = "lpm_counter";
	cycloneiii_rublock   sd4
	( 
	.captnupdt(rublock_captnupdt),
	.clk(rublock_clock),
	.rconfig(rublock_reconfig),
	.regin(rublock_regin),
	.regout(wire_sd4_regout),
	.rsttimer(reset_timer),
	.shiftnld(rublock_shiftnld));
	defparam
//synthesis read_comments_as_HDL on
//              sd4.operation_mode = "remote",
//              sd4.sim_init_page_select = 0,
//synthesis read_comments_as_HDL off  	
		sd4.sim_init_config = "factory",
		sd4.sim_init_status = 0,
		sd4.sim_init_watchdog_value = 0,
		sd4.lpm_type = "cycloneiii_rublock";
	assign
		bit_counter_all_done = (((((wire_cntr5_q[0] & (~ wire_cntr5_q[1])) & (~ wire_cntr5_q[2])) & wire_cntr5_q[3]) & (~ wire_cntr5_q[4])) & wire_cntr5_q[5]),
		bit_counter_clear = (rsource_update_done | wsource_update_done),
		bit_counter_enable = (((((((((rsource_update_done | wsource_update_done) | read_init_counter) | write_init_counter) | read_pre_data) | write_pre_data) | read_data) | write_data) | read_post) | write_post_data),
		bit_counter_param_start = start_bit_decoder_out,
		bit_counter_param_start_match = ((((((~ w44w[0]) & (~ w44w[1])) & (~ w44w[2])) & (~ w44w[3])) & (~ w44w[4])) & (~ w44w[5])),
		busy = (~ idle),
		combine_port = {read_param, write_param, read_source, param},
		data_out = dffe7a,
		global_gnd = 1'b0,
		global_vcc = 1'b1,
		idle = dffe8,
		param_decoder_param_latch = dffe24a,
		param_decoder_select = {(((((((~ param_decoder_param_latch[0]) & param_decoder_param_latch[1]) & param_decoder_param_latch[2]) & (~ param_decoder_param_latch[3])) & (~ param_decoder_param_latch[4])) & param_decoder_param_latch[5]) & (~ param_decoder_param_latch[6])), (((((((~ param_decoder_param_latch[0]) & (~ param_decoder_param_latch[1])) & param_decoder_param_latch[2]) & (~ param_decoder_param_latch[3])) & (~ param_decoder_param_latch[4])) & param_decoder_param_latch[5]) & (~ param_decoder_param_latch[6])), ((((((param_decoder_param_latch[0] & param_decoder_param_latch[1]) & (~ param_decoder_param_latch[2])) & (~ param_decoder_param_latch[3])) & (~ param_decoder_param_latch[4])) & param_decoder_param_latch[5]) & (~ param_decoder_param_latch[6])), (((((((~ param_decoder_param_latch[0]) & param_decoder_param_latch[1]) & (~ param_decoder_param_latch[2])) & (~ param_decoder_param_latch[3])) & (~ param_decoder_param_latch[4])) & param_decoder_param_latch[5]) & (~ param_decoder_param_latch[6])), ((((((param_decoder_param_latch[0] & (~ param_decoder_param_latch[1])) & (~ param_decoder_param_latch[2])) & (~ param_decoder_param_latch[3])) & (~ param_decoder_param_latch[4])) & param_decoder_param_latch[5]) & (~ param_decoder_param_latch[6])), ((((((param_decoder_param_latch[0] & param_decoder_param_latch[1]) & param_decoder_param_latch[2]) & (~ param_decoder_param_latch[3])) & param_decoder_param_latch[4]) & (~ param_decoder_param_latch[5])) & param_decoder_param_latch[6]), (((((((~ param_decoder_param_latch[0]) & (~ param_decoder_param_latch[1])) & param_decoder_param_latch[2]) & (~ param_decoder_param_latch[3])) & param_decoder_param_latch[4]) & (~ param_decoder_param_latch[5])) & param_decoder_param_latch[6]), (((((((~ param_decoder_param_latch[0]) & (~ param_decoder_param_latch[1])) & (~ param_decoder_param_latch[2])) & (~ param_decoder_param_latch[3])) & param_decoder_param_latch[4]) & (~ param_decoder_param_latch[5])) & param_decoder_param_latch[6]), ((((((param_decoder_param_latch[0] & param_decoder_param_latch[1]
) & param_decoder_param_latch[2]) & param_decoder_param_latch[3]) & (~ param_decoder_param_latch[4])) & (~ param_decoder_param_latch[5])) & param_decoder_param_latch[6]), (((((((~ param_decoder_param_latch[0]) & (~ param_decoder_param_latch[1])) & param_decoder_param_latch[2]) & param_decoder_param_latch[3]) & (~ param_decoder_param_latch[4])) & (~ param_decoder_param_latch[5])) & param_decoder_param_latch[6]), (((((((~ param_decoder_param_latch[0]) & (~ param_decoder_param_latch[1])) & (~ param_decoder_param_latch[2])) & param_decoder_param_latch[3]) & (~ param_decoder_param_latch[4])) & (~ param_decoder_param_latch[5])) & param_decoder_param_latch[6]), (((((((~ param_decoder_param_latch[0]) & (~ param_decoder_param_latch[1])) & param_decoder_param_latch[2]) & (~ param_decoder_param_latch[3])) & param_decoder_param_latch[4]) & (~ param_decoder_param_latch[5])) & param_decoder_param_latch[6]), (((((((~ param_decoder_param_latch[0]) & (~ param_decoder_param_latch[1])) & (~ param_decoder_param_latch[2])) & (~ param_decoder_param_latch[3])) & param_decoder_param_latch[4]) & (~ param_decoder_param_latch[5])) & param_decoder_param_latch[6]), ((((((param_decoder_param_latch[0] & param_decoder_param_latch[1]) & (~ param_decoder_param_latch[2])) & param_decoder_param_latch[3]) & (~ param_decoder_param_latch[4])) & (~ param_decoder_param_latch[5])) & param_decoder_param_latch[6]), (((((((~ param_decoder_param_latch[0]) & param_decoder_param_latch[1]) & (~ param_decoder_param_latch[2])) & param_decoder_param_latch[3]) & (~ param_decoder_param_latch[4])) & (~ param_decoder_param_latch[5])) & param_decoder_param_latch[6]), (((((((~ param_decoder_param_latch[0]) & (~ param_decoder_param_latch[1])) & (~ param_decoder_param_latch[2])) & param_decoder_param_latch[3]) & (~ param_decoder_param_latch[4])) & (~ param_decoder_param_latch[5])) & param_decoder_param_latch[6]), (((((((~ param_decoder_param_latch[0]) & (~ param_decoder_param_latch[1])) & param_decoder_param_latch[2]) & (~ param_decoder_param_latch[3])) & (~ param_decoder_param_latch[4]
)) & (~ param_decoder_param_latch[5])) & param_decoder_param_latch[6]), (((((((~ param_decoder_param_latch[0]) & (~ param_decoder_param_latch[1])) & (~ param_decoder_param_latch[2])) & (~ param_decoder_param_latch[3])) & (~ param_decoder_param_latch[4])) & (~ param_decoder_param_latch[5])) & param_decoder_param_latch[6])},
		power_up = (((((((((((((((~ idle) & (~ read_init)) & (~ read_source_update)) & (~ read_init_counter)) & (~ read_pre_data)) & (~ read_data)) & (~ read_post)) & (~ write_init)) & (~ write_init_counter)) & (~ write_source_update)) & (~ write_pre_data)) & (~ write_data)) & (~ write_post_data)) & (~ write_load)) & (~ write_wait)),
		read_data = dffe13,
		read_init = dffe9,
		read_init_counter = dffe11,
		read_post = dffe14,
		read_pre_data = dffe12,
		read_source_update = dffe10,
		rsource_load = (idle & (write_param | read_param)),
		rsource_parallel_in = {((read_source[1] & read_param) | write_param), ((read_source[0] & read_param) | write_param)},
		rsource_serial_out = dffe1a0[0:0],
		rsource_shift_enable = (read_source_update | write_source_update),
		rsource_state_par_ini = {read_param, {2{global_gnd}}},
		rsource_update_done = dffe2a0[0:0],
		rublock_captnupdt = (~ write_load),
		rublock_clock = (((~ clock) & (~ idle)) & (~ write_wait)),
		rublock_reconfig = (idle & reconfig),
		rublock_regin = (((((rublock_regout_reg & (~ select_shift_nloop)) & (~ read_source_update)) & (~ write_source_update)) | (((shift_reg_serial_out & select_shift_nloop) & (~ read_source_update)) & (~ write_source_update))) | ((read_source_update | write_source_update) & rsource_serial_out)),
		rublock_regout = wire_sd4_regout,
		rublock_regout_reg = dffe23,
		rublock_shiftnld = (((((((read_pre_data | write_pre_data) | read_data) | write_data) | read_post) | write_post_data) | read_source_update) | write_source_update),
		select_shift_nloop = ((read_data & (~ width_counter_param_width_match)) | (write_data & (~ width_counter_param_width_match))),
		shift_reg_clear = read_init,
		shift_reg_load_enable = (idle & write_param),
		shift_reg_serial_in = (rublock_regout_reg & select_shift_nloop),
		shift_reg_serial_out = dffe7a[0:0],
		shift_reg_shift_enable = (((read_data | write_data) | read_post) | write_post_data),
		start_bit_decoder_out = (((((((((((((((((w411w | w422w) | w438w) | w450w) | w466w) | w478w) | w490w) | w506w) | w520w) | w536w) | w549w) | w563w) | w579w) | w592w) | w605w) | w621w) | w634w) | {start_bit_decoder_param_select[17], {2{1'b0}}, start_bit_decoder_param_select[17], {2{1'b0}}}),
		start_bit_decoder_param_select = param_decoder_select,
		w190w = {{3{1'b0}}, width_decoder_param_select[0], 1'b0},
		w202w = {{2{width_decoder_param_select[1]}}, {3{1'b0}}},
		w214w = {{3{1'b0}}, width_decoder_param_select[2], 1'b0},
		w227w = {{3{width_decoder_param_select[3]}}, 1'b0, width_decoder_param_select[3]},
		w237w = {{4{1'b0}}, width_decoder_param_select[4]},
		w250w = {{3{1'b0}}, width_decoder_param_select[5], 1'b0},
		w263w = {{2{width_decoder_param_select[6]}}, {3{1'b0}}},
		w275w = {{3{1'b0}}, width_decoder_param_select[7], 1'b0},
		w288w = {{2{width_decoder_param_select[8]}}, {3{1'b0}}},
		w300w = {{2{1'b0}}, width_decoder_param_select[9], 1'b0, width_decoder_param_select[9]},
		w312w = {{3{1'b0}}, width_decoder_param_select[10], 1'b0},
		w325w = {{2{width_decoder_param_select[11]}}, {3{1'b0}}},
		w337w = {{2{1'b0}}, width_decoder_param_select[12], 1'b0, width_decoder_param_select[12]},
		w349w = {{4{1'b0}}, width_decoder_param_select[13]},
		w362w = {1'b0, {2{width_decoder_param_select[14]}}, {2{1'b0}}},
		w374w = {{4{1'b0}}, width_decoder_param_select[15]},
		w387w = {width_decoder_param_select[16], 1'b0, {2{width_decoder_param_select[16]}}, 1'b0},
		w398w = {{4{1'b0}}, width_decoder_param_select[17]},
		w411w = {1'b0, {4{start_bit_decoder_param_select[0]}}, 1'b0},
		w422w = {6{1'b0}},
		w438w = {1'b0, {4{start_bit_decoder_param_select[2]}}, 1'b0},
		w44w = (wire_cntr5_q ^ bit_counter_param_start),
		w450w = {6{1'b0}},
		w466w = {1'b0, {3{start_bit_decoder_param_select[4]}}, 1'b0, start_bit_decoder_param_select[4]},
		w478w = {1'b0, {4{start_bit_decoder_param_select[5]}}, 1'b0},
		w490w = {6{1'b0}},
		w506w = {1'b0, {2{start_bit_decoder_param_select[7]}}, {3{1'b0}}},
		w520w = {6{1'b0}},
		w536w = {1'b0, {2{start_bit_decoder_param_select[9]}}, 1'b0, start_bit_decoder_param_select[9], 1'b0},
		w549w = {1'b0, {2{start_bit_decoder_param_select[10]}}, {3{1'b0}}},
		w563w = {6{1'b0}},
		w579w = {1'b0, {2{start_bit_decoder_param_select[12]}}, 1'b0, start_bit_decoder_param_select[12], 1'b0},
		w592w = {start_bit_decoder_param_select[13], {2{1'b0}}, start_bit_decoder_param_select[13], 1'b0, start_bit_decoder_param_select[13]},
		w605w = {6{1'b0}},
		w621w = {start_bit_decoder_param_select[15], {3{1'b0}}, {2{start_bit_decoder_param_select[15]}}},
		w634w = {{2{1'b0}}, {2{start_bit_decoder_param_select[16]}}, {2{1'b0}}},
		w648w = {start_bit_decoder_param_select[17], {2{1'b0}}, start_bit_decoder_param_select[17], {2{1'b0}}},
		w74w = (wire_cntr6_q ^ width_counter_param_width),
		w889w = (idle & (write_param | read_param)),
		width_counter_all_done = (((((~ wire_cntr6_q[0]) & (~ wire_cntr6_q[1])) & wire_cntr6_q[2]) & wire_cntr6_q[3]) & wire_cntr6_q[4]),
		width_counter_clear = (rsource_update_done | wsource_update_done),
		width_counter_enable = ((read_data | write_data) | read_post),
		width_counter_param_width = width_decoder_out,
		width_counter_param_width_match = (((((~ w74w[0]) & (~ w74w[1])) & (~ w74w[2])) & (~ w74w[3])) & (~ w74w[4])),
		width_decoder_out = (((((((((((((((((w190w | w202w) | w214w) | w227w) | w237w) | w250w) | w263w) | w275w) | w288w) | w300w) | w312w) | w325w) | w337w) | w349w) | w362w) | w374w) | w387w) | {{4{1'b0}}, width_decoder_param_select[17]}),
		width_decoder_param_select = param_decoder_select,
		write_data = dffe19,
		write_init = dffe15,
		write_init_counter = dffe17,
		write_load = dffe21,
		write_post_data = dffe20,
		write_pre_data = dffe18,
		write_source_update = dffe16,
		write_wait = dffe22,
		wsource_state_par_ini = {write_param, {2{global_gnd}}},
		wsource_update_done = dffe3a0[0:0];
endmodule //remote_update_rmtupdt_e0l
//VALID FILE

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone III"
// Retrieval info: PRIVATE: SIM_INIT_CONFIG_COMBO STRING "FACTORY"
// Retrieval info: PRIVATE: SIM_INIT_PAGE_SELECT_COMBO STRING "0"
// Retrieval info: PRIVATE: SIM_INIT_STAT_BIT0_CHECK STRING "0"
// Retrieval info: PRIVATE: SIM_INIT_STAT_BIT1_CHECK STRING "0"
// Retrieval info: PRIVATE: SIM_INIT_STAT_BIT2_CHECK STRING "0"
// Retrieval info: PRIVATE: SIM_INIT_STAT_BIT3_CHECK STRING "0"
// Retrieval info: PRIVATE: SIM_INIT_STAT_BIT4_CHECK STRING "0"
// Retrieval info: PRIVATE: SIM_INIT_WATCHDOG_VALUE_EDIT STRING "1"
// Retrieval info: PRIVATE: SUPPORT_WRITE_CHECK STRING "1"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: WATCHDOG_ENABLE_CHECK STRING "0"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Cyclone III"
// Retrieval info: CONSTANT: IN_DATA_WIDTH NUMERIC "22"
// Retrieval info: CONSTANT: OPERATION_MODE STRING "REMOTE"
// Retrieval info: CONSTANT: OUT_DATA_WIDTH NUMERIC "29"
// Retrieval info: USED_PORT: busy 0 0 0 0 OUTPUT NODEFVAL "busy"
// Retrieval info: USED_PORT: clock 0 0 0 0 INPUT NODEFVAL "clock"
// Retrieval info: USED_PORT: data_in 0 0 22 0 INPUT NODEFVAL "data_in[21..0]"
// Retrieval info: USED_PORT: data_out 0 0 29 0 OUTPUT NODEFVAL "data_out[28..0]"
// Retrieval info: USED_PORT: param 0 0 3 0 INPUT NODEFVAL "param[2..0]"
// Retrieval info: USED_PORT: read_param 0 0 0 0 INPUT NODEFVAL "read_param"
// Retrieval info: USED_PORT: read_source 0 0 2 0 INPUT NODEFVAL "read_source[1..0]"
// Retrieval info: USED_PORT: reconfig 0 0 0 0 INPUT NODEFVAL "reconfig"
// Retrieval info: USED_PORT: reset 0 0 0 0 INPUT NODEFVAL "reset"
// Retrieval info: USED_PORT: reset_timer 0 0 0 0 INPUT NODEFVAL "reset_timer"
// Retrieval info: USED_PORT: write_param 0 0 0 0 INPUT NODEFVAL "write_param"
// Retrieval info: CONNECT: @data_in 0 0 22 0 data_in 0 0 22 0
// Retrieval info: CONNECT: @reset_timer 0 0 0 0 reset_timer 0 0 0 0
// Retrieval info: CONNECT: @reset 0 0 0 0 reset 0 0 0 0
// Retrieval info: CONNECT: @read_source 0 0 2 0 read_source 0 0 2 0
// Retrieval info: CONNECT: @read_param 0 0 0 0 read_param 0 0 0 0
// Retrieval info: CONNECT: @write_param 0 0 0 0 write_param 0 0 0 0
// Retrieval info: CONNECT: data_out 0 0 29 0 @data_out 0 0 29 0
// Retrieval info: CONNECT: @clock 0 0 0 0 clock 0 0 0 0
// Retrieval info: CONNECT: @param 0 0 3 0 param 0 0 3 0
// Retrieval info: CONNECT: busy 0 0 0 0 @busy 0 0 0 0
// Retrieval info: CONNECT: @reconfig 0 0 0 0 reconfig 0 0 0 0
// Retrieval info: GEN_FILE: TYPE_NORMAL remote_update.v TRUE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL remote_update.inc FALSE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL remote_update.cmp FALSE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL remote_update.bsf TRUE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL remote_update_inst.v FALSE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL remote_update_bb.v TRUE FALSE
// Retrieval info: LIB_FILE: cycloneiii
// Retrieval info: LIB_FILE: lpm
