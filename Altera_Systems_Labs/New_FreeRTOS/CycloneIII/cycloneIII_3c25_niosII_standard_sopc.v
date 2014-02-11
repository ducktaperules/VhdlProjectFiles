//megafunction wizard: %Altera SOPC Builder%
//GENERATION: STANDARD
//VERSION: WM1.0


//Legal Notice: (C)2009 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module button_pio_s1_arbitrator (
                                  // inputs:
                                   button_pio_s1_irq,
                                   button_pio_s1_readdata,
                                   clk,
                                   reset_n,
                                   slow_peripheral_bridge_m1_address_to_slave,
                                   slow_peripheral_bridge_m1_latency_counter,
                                   slow_peripheral_bridge_m1_nativeaddress,
                                   slow_peripheral_bridge_m1_read,
                                   slow_peripheral_bridge_m1_write,
                                   slow_peripheral_bridge_m1_writedata,

                                  // outputs:
                                   button_pio_s1_address,
                                   button_pio_s1_chipselect,
                                   button_pio_s1_irq_from_sa,
                                   button_pio_s1_readdata_from_sa,
                                   button_pio_s1_reset_n,
                                   button_pio_s1_write_n,
                                   button_pio_s1_writedata,
                                   d1_button_pio_s1_end_xfer,
                                   slow_peripheral_bridge_m1_granted_button_pio_s1,
                                   slow_peripheral_bridge_m1_qualified_request_button_pio_s1,
                                   slow_peripheral_bridge_m1_read_data_valid_button_pio_s1,
                                   slow_peripheral_bridge_m1_requests_button_pio_s1
                                )
;

  output  [  1: 0] button_pio_s1_address;
  output           button_pio_s1_chipselect;
  output           button_pio_s1_irq_from_sa;
  output  [  3: 0] button_pio_s1_readdata_from_sa;
  output           button_pio_s1_reset_n;
  output           button_pio_s1_write_n;
  output  [  3: 0] button_pio_s1_writedata;
  output           d1_button_pio_s1_end_xfer;
  output           slow_peripheral_bridge_m1_granted_button_pio_s1;
  output           slow_peripheral_bridge_m1_qualified_request_button_pio_s1;
  output           slow_peripheral_bridge_m1_read_data_valid_button_pio_s1;
  output           slow_peripheral_bridge_m1_requests_button_pio_s1;
  input            button_pio_s1_irq;
  input   [  3: 0] button_pio_s1_readdata;
  input            clk;
  input            reset_n;
  input   [  8: 0] slow_peripheral_bridge_m1_address_to_slave;
  input            slow_peripheral_bridge_m1_latency_counter;
  input   [  6: 0] slow_peripheral_bridge_m1_nativeaddress;
  input            slow_peripheral_bridge_m1_read;
  input            slow_peripheral_bridge_m1_write;
  input   [ 31: 0] slow_peripheral_bridge_m1_writedata;

  wire    [  1: 0] button_pio_s1_address;
  wire             button_pio_s1_allgrants;
  wire             button_pio_s1_allow_new_arb_cycle;
  wire             button_pio_s1_any_bursting_master_saved_grant;
  wire             button_pio_s1_any_continuerequest;
  wire             button_pio_s1_arb_counter_enable;
  reg              button_pio_s1_arb_share_counter;
  wire             button_pio_s1_arb_share_counter_next_value;
  wire             button_pio_s1_arb_share_set_values;
  wire             button_pio_s1_beginbursttransfer_internal;
  wire             button_pio_s1_begins_xfer;
  wire             button_pio_s1_chipselect;
  wire             button_pio_s1_end_xfer;
  wire             button_pio_s1_firsttransfer;
  wire             button_pio_s1_grant_vector;
  wire             button_pio_s1_in_a_read_cycle;
  wire             button_pio_s1_in_a_write_cycle;
  wire             button_pio_s1_irq_from_sa;
  wire             button_pio_s1_master_qreq_vector;
  wire             button_pio_s1_non_bursting_master_requests;
  wire    [  3: 0] button_pio_s1_readdata_from_sa;
  reg              button_pio_s1_reg_firsttransfer;
  wire             button_pio_s1_reset_n;
  reg              button_pio_s1_slavearbiterlockenable;
  wire             button_pio_s1_slavearbiterlockenable2;
  wire             button_pio_s1_unreg_firsttransfer;
  wire             button_pio_s1_waits_for_read;
  wire             button_pio_s1_waits_for_write;
  wire             button_pio_s1_write_n;
  wire    [  3: 0] button_pio_s1_writedata;
  reg              d1_button_pio_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_button_pio_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             slow_peripheral_bridge_m1_arbiterlock;
  wire             slow_peripheral_bridge_m1_arbiterlock2;
  wire             slow_peripheral_bridge_m1_continuerequest;
  wire             slow_peripheral_bridge_m1_granted_button_pio_s1;
  wire             slow_peripheral_bridge_m1_qualified_request_button_pio_s1;
  wire             slow_peripheral_bridge_m1_read_data_valid_button_pio_s1;
  wire             slow_peripheral_bridge_m1_requests_button_pio_s1;
  wire             slow_peripheral_bridge_m1_saved_grant_button_pio_s1;
  wire             wait_for_button_pio_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~button_pio_s1_end_xfer;
    end


  assign button_pio_s1_begins_xfer = ~d1_reasons_to_wait & ((slow_peripheral_bridge_m1_qualified_request_button_pio_s1));
  //assign button_pio_s1_readdata_from_sa = button_pio_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign button_pio_s1_readdata_from_sa = button_pio_s1_readdata;

  assign slow_peripheral_bridge_m1_requests_button_pio_s1 = ({slow_peripheral_bridge_m1_address_to_slave[8 : 4] , 4'b0} == 9'h180) & (slow_peripheral_bridge_m1_read | slow_peripheral_bridge_m1_write);
  //button_pio_s1_arb_share_counter set values, which is an e_mux
  assign button_pio_s1_arb_share_set_values = 1;

  //button_pio_s1_non_bursting_master_requests mux, which is an e_mux
  assign button_pio_s1_non_bursting_master_requests = slow_peripheral_bridge_m1_requests_button_pio_s1;

  //button_pio_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign button_pio_s1_any_bursting_master_saved_grant = 0;

  //button_pio_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign button_pio_s1_arb_share_counter_next_value = button_pio_s1_firsttransfer ? (button_pio_s1_arb_share_set_values - 1) : |button_pio_s1_arb_share_counter ? (button_pio_s1_arb_share_counter - 1) : 0;

  //button_pio_s1_allgrants all slave grants, which is an e_mux
  assign button_pio_s1_allgrants = |button_pio_s1_grant_vector;

  //button_pio_s1_end_xfer assignment, which is an e_assign
  assign button_pio_s1_end_xfer = ~(button_pio_s1_waits_for_read | button_pio_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_button_pio_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_button_pio_s1 = button_pio_s1_end_xfer & (~button_pio_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //button_pio_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign button_pio_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_button_pio_s1 & button_pio_s1_allgrants) | (end_xfer_arb_share_counter_term_button_pio_s1 & ~button_pio_s1_non_bursting_master_requests);

  //button_pio_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          button_pio_s1_arb_share_counter <= 0;
      else if (button_pio_s1_arb_counter_enable)
          button_pio_s1_arb_share_counter <= button_pio_s1_arb_share_counter_next_value;
    end


  //button_pio_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          button_pio_s1_slavearbiterlockenable <= 0;
      else if ((|button_pio_s1_master_qreq_vector & end_xfer_arb_share_counter_term_button_pio_s1) | (end_xfer_arb_share_counter_term_button_pio_s1 & ~button_pio_s1_non_bursting_master_requests))
          button_pio_s1_slavearbiterlockenable <= |button_pio_s1_arb_share_counter_next_value;
    end


  //slow_peripheral_bridge/m1 button_pio/s1 arbiterlock, which is an e_assign
  assign slow_peripheral_bridge_m1_arbiterlock = button_pio_s1_slavearbiterlockenable & slow_peripheral_bridge_m1_continuerequest;

  //button_pio_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign button_pio_s1_slavearbiterlockenable2 = |button_pio_s1_arb_share_counter_next_value;

  //slow_peripheral_bridge/m1 button_pio/s1 arbiterlock2, which is an e_assign
  assign slow_peripheral_bridge_m1_arbiterlock2 = button_pio_s1_slavearbiterlockenable2 & slow_peripheral_bridge_m1_continuerequest;

  //button_pio_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign button_pio_s1_any_continuerequest = 1;

  //slow_peripheral_bridge_m1_continuerequest continued request, which is an e_assign
  assign slow_peripheral_bridge_m1_continuerequest = 1;

  assign slow_peripheral_bridge_m1_qualified_request_button_pio_s1 = slow_peripheral_bridge_m1_requests_button_pio_s1 & ~((slow_peripheral_bridge_m1_read & ((slow_peripheral_bridge_m1_latency_counter != 0))));
  //local readdatavalid slow_peripheral_bridge_m1_read_data_valid_button_pio_s1, which is an e_mux
  assign slow_peripheral_bridge_m1_read_data_valid_button_pio_s1 = slow_peripheral_bridge_m1_granted_button_pio_s1 & slow_peripheral_bridge_m1_read & ~button_pio_s1_waits_for_read;

  //button_pio_s1_writedata mux, which is an e_mux
  assign button_pio_s1_writedata = slow_peripheral_bridge_m1_writedata;

  //master is always granted when requested
  assign slow_peripheral_bridge_m1_granted_button_pio_s1 = slow_peripheral_bridge_m1_qualified_request_button_pio_s1;

  //slow_peripheral_bridge/m1 saved-grant button_pio/s1, which is an e_assign
  assign slow_peripheral_bridge_m1_saved_grant_button_pio_s1 = slow_peripheral_bridge_m1_requests_button_pio_s1;

  //allow new arb cycle for button_pio/s1, which is an e_assign
  assign button_pio_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign button_pio_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign button_pio_s1_master_qreq_vector = 1;

  //button_pio_s1_reset_n assignment, which is an e_assign
  assign button_pio_s1_reset_n = reset_n;

  assign button_pio_s1_chipselect = slow_peripheral_bridge_m1_granted_button_pio_s1;
  //button_pio_s1_firsttransfer first transaction, which is an e_assign
  assign button_pio_s1_firsttransfer = button_pio_s1_begins_xfer ? button_pio_s1_unreg_firsttransfer : button_pio_s1_reg_firsttransfer;

  //button_pio_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign button_pio_s1_unreg_firsttransfer = ~(button_pio_s1_slavearbiterlockenable & button_pio_s1_any_continuerequest);

  //button_pio_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          button_pio_s1_reg_firsttransfer <= 1'b1;
      else if (button_pio_s1_begins_xfer)
          button_pio_s1_reg_firsttransfer <= button_pio_s1_unreg_firsttransfer;
    end


  //button_pio_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign button_pio_s1_beginbursttransfer_internal = button_pio_s1_begins_xfer;

  //~button_pio_s1_write_n assignment, which is an e_mux
  assign button_pio_s1_write_n = ~(slow_peripheral_bridge_m1_granted_button_pio_s1 & slow_peripheral_bridge_m1_write);

  //button_pio_s1_address mux, which is an e_mux
  assign button_pio_s1_address = slow_peripheral_bridge_m1_nativeaddress;

  //d1_button_pio_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_button_pio_s1_end_xfer <= 1;
      else if (1)
          d1_button_pio_s1_end_xfer <= button_pio_s1_end_xfer;
    end


  //button_pio_s1_waits_for_read in a cycle, which is an e_mux
  assign button_pio_s1_waits_for_read = button_pio_s1_in_a_read_cycle & button_pio_s1_begins_xfer;

  //button_pio_s1_in_a_read_cycle assignment, which is an e_assign
  assign button_pio_s1_in_a_read_cycle = slow_peripheral_bridge_m1_granted_button_pio_s1 & slow_peripheral_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = button_pio_s1_in_a_read_cycle;

  //button_pio_s1_waits_for_write in a cycle, which is an e_mux
  assign button_pio_s1_waits_for_write = button_pio_s1_in_a_write_cycle & 0;

  //button_pio_s1_in_a_write_cycle assignment, which is an e_assign
  assign button_pio_s1_in_a_write_cycle = slow_peripheral_bridge_m1_granted_button_pio_s1 & slow_peripheral_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = button_pio_s1_in_a_write_cycle;

  assign wait_for_button_pio_s1_counter = 0;
  //assign button_pio_s1_irq_from_sa = button_pio_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign button_pio_s1_irq_from_sa = button_pio_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //button_pio/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_jtag_debug_module_arbitrator (
                                          // inputs:
                                           clk,
                                           cpu_data_master_address_to_slave,
                                           cpu_data_master_byteenable,
                                           cpu_data_master_debugaccess,
                                           cpu_data_master_latency_counter,
                                           cpu_data_master_read,
                                           cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register,
                                           cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register,
                                           cpu_data_master_read_data_valid_slow_peripheral_bridge_s1_shift_register,
                                           cpu_data_master_write,
                                           cpu_data_master_writedata,
                                           cpu_instruction_master_address_to_slave,
                                           cpu_instruction_master_latency_counter,
                                           cpu_instruction_master_read,
                                           cpu_instruction_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register,
                                           cpu_instruction_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register,
                                           cpu_jtag_debug_module_readdata,
                                           cpu_jtag_debug_module_resetrequest,
                                           reset_n,

                                          // outputs:
                                           cpu_data_master_granted_cpu_jtag_debug_module,
                                           cpu_data_master_qualified_request_cpu_jtag_debug_module,
                                           cpu_data_master_read_data_valid_cpu_jtag_debug_module,
                                           cpu_data_master_requests_cpu_jtag_debug_module,
                                           cpu_instruction_master_granted_cpu_jtag_debug_module,
                                           cpu_instruction_master_qualified_request_cpu_jtag_debug_module,
                                           cpu_instruction_master_read_data_valid_cpu_jtag_debug_module,
                                           cpu_instruction_master_requests_cpu_jtag_debug_module,
                                           cpu_jtag_debug_module_address,
                                           cpu_jtag_debug_module_begintransfer,
                                           cpu_jtag_debug_module_byteenable,
                                           cpu_jtag_debug_module_chipselect,
                                           cpu_jtag_debug_module_debugaccess,
                                           cpu_jtag_debug_module_readdata_from_sa,
                                           cpu_jtag_debug_module_reset,
                                           cpu_jtag_debug_module_reset_n,
                                           cpu_jtag_debug_module_resetrequest_from_sa,
                                           cpu_jtag_debug_module_write,
                                           cpu_jtag_debug_module_writedata,
                                           d1_cpu_jtag_debug_module_end_xfer
                                        )
;

  output           cpu_data_master_granted_cpu_jtag_debug_module;
  output           cpu_data_master_qualified_request_cpu_jtag_debug_module;
  output           cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  output           cpu_data_master_requests_cpu_jtag_debug_module;
  output           cpu_instruction_master_granted_cpu_jtag_debug_module;
  output           cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  output           cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  output           cpu_instruction_master_requests_cpu_jtag_debug_module;
  output  [  8: 0] cpu_jtag_debug_module_address;
  output           cpu_jtag_debug_module_begintransfer;
  output  [  3: 0] cpu_jtag_debug_module_byteenable;
  output           cpu_jtag_debug_module_chipselect;
  output           cpu_jtag_debug_module_debugaccess;
  output  [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  output           cpu_jtag_debug_module_reset;
  output           cpu_jtag_debug_module_reset_n;
  output           cpu_jtag_debug_module_resetrequest_from_sa;
  output           cpu_jtag_debug_module_write;
  output  [ 31: 0] cpu_jtag_debug_module_writedata;
  output           d1_cpu_jtag_debug_module_end_xfer;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_debugaccess;
  input            cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register;
  input            cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register;
  input            cpu_data_master_read_data_valid_slow_peripheral_bridge_s1_shift_register;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 26: 0] cpu_instruction_master_address_to_slave;
  input            cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input            cpu_instruction_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register;
  input            cpu_instruction_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register;
  input   [ 31: 0] cpu_jtag_debug_module_readdata;
  input            cpu_jtag_debug_module_resetrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_cpu_jtag_debug_module;
  wire             cpu_data_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_data_master_requests_cpu_jtag_debug_module;
  wire             cpu_data_master_saved_grant_cpu_jtag_debug_module;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_cpu_jtag_debug_module;
  wire             cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_instruction_master_requests_cpu_jtag_debug_module;
  wire             cpu_instruction_master_saved_grant_cpu_jtag_debug_module;
  wire    [  8: 0] cpu_jtag_debug_module_address;
  wire             cpu_jtag_debug_module_allgrants;
  wire             cpu_jtag_debug_module_allow_new_arb_cycle;
  wire             cpu_jtag_debug_module_any_bursting_master_saved_grant;
  wire             cpu_jtag_debug_module_any_continuerequest;
  reg     [  1: 0] cpu_jtag_debug_module_arb_addend;
  wire             cpu_jtag_debug_module_arb_counter_enable;
  reg              cpu_jtag_debug_module_arb_share_counter;
  wire             cpu_jtag_debug_module_arb_share_counter_next_value;
  wire             cpu_jtag_debug_module_arb_share_set_values;
  wire    [  1: 0] cpu_jtag_debug_module_arb_winner;
  wire             cpu_jtag_debug_module_arbitration_holdoff_internal;
  wire             cpu_jtag_debug_module_beginbursttransfer_internal;
  wire             cpu_jtag_debug_module_begins_xfer;
  wire             cpu_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_jtag_debug_module_byteenable;
  wire             cpu_jtag_debug_module_chipselect;
  wire    [  3: 0] cpu_jtag_debug_module_chosen_master_double_vector;
  wire    [  1: 0] cpu_jtag_debug_module_chosen_master_rot_left;
  wire             cpu_jtag_debug_module_debugaccess;
  wire             cpu_jtag_debug_module_end_xfer;
  wire             cpu_jtag_debug_module_firsttransfer;
  wire    [  1: 0] cpu_jtag_debug_module_grant_vector;
  wire             cpu_jtag_debug_module_in_a_read_cycle;
  wire             cpu_jtag_debug_module_in_a_write_cycle;
  wire    [  1: 0] cpu_jtag_debug_module_master_qreq_vector;
  wire             cpu_jtag_debug_module_non_bursting_master_requests;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  reg              cpu_jtag_debug_module_reg_firsttransfer;
  wire             cpu_jtag_debug_module_reset;
  wire             cpu_jtag_debug_module_reset_n;
  wire             cpu_jtag_debug_module_resetrequest_from_sa;
  reg     [  1: 0] cpu_jtag_debug_module_saved_chosen_master_vector;
  reg              cpu_jtag_debug_module_slavearbiterlockenable;
  wire             cpu_jtag_debug_module_slavearbiterlockenable2;
  wire             cpu_jtag_debug_module_unreg_firsttransfer;
  wire             cpu_jtag_debug_module_waits_for_read;
  wire             cpu_jtag_debug_module_waits_for_write;
  wire             cpu_jtag_debug_module_write;
  wire    [ 31: 0] cpu_jtag_debug_module_writedata;
  reg              d1_cpu_jtag_debug_module_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_cpu_jtag_debug_module;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module;
  reg              last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module;
  wire    [ 27: 0] shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master;
  wire    [ 26: 0] shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master;
  wire             wait_for_cpu_jtag_debug_module_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~cpu_jtag_debug_module_end_xfer;
    end


  assign cpu_jtag_debug_module_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_cpu_jtag_debug_module | cpu_instruction_master_qualified_request_cpu_jtag_debug_module));
  //assign cpu_jtag_debug_module_readdata_from_sa = cpu_jtag_debug_module_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_jtag_debug_module_readdata_from_sa = cpu_jtag_debug_module_readdata;

  assign cpu_data_master_requests_cpu_jtag_debug_module = ({cpu_data_master_address_to_slave[27 : 11] , 11'b0} == 28'h2000800) & (cpu_data_master_read | cpu_data_master_write);
  //cpu_jtag_debug_module_arb_share_counter set values, which is an e_mux
  assign cpu_jtag_debug_module_arb_share_set_values = 1;

  //cpu_jtag_debug_module_non_bursting_master_requests mux, which is an e_mux
  assign cpu_jtag_debug_module_non_bursting_master_requests = cpu_data_master_requests_cpu_jtag_debug_module |
    cpu_instruction_master_requests_cpu_jtag_debug_module |
    cpu_data_master_requests_cpu_jtag_debug_module |
    cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu_jtag_debug_module_any_bursting_master_saved_grant mux, which is an e_mux
  assign cpu_jtag_debug_module_any_bursting_master_saved_grant = 0;

  //cpu_jtag_debug_module_arb_share_counter_next_value assignment, which is an e_assign
  assign cpu_jtag_debug_module_arb_share_counter_next_value = cpu_jtag_debug_module_firsttransfer ? (cpu_jtag_debug_module_arb_share_set_values - 1) : |cpu_jtag_debug_module_arb_share_counter ? (cpu_jtag_debug_module_arb_share_counter - 1) : 0;

  //cpu_jtag_debug_module_allgrants all slave grants, which is an e_mux
  assign cpu_jtag_debug_module_allgrants = |cpu_jtag_debug_module_grant_vector |
    |cpu_jtag_debug_module_grant_vector |
    |cpu_jtag_debug_module_grant_vector |
    |cpu_jtag_debug_module_grant_vector;

  //cpu_jtag_debug_module_end_xfer assignment, which is an e_assign
  assign cpu_jtag_debug_module_end_xfer = ~(cpu_jtag_debug_module_waits_for_read | cpu_jtag_debug_module_waits_for_write);

  //end_xfer_arb_share_counter_term_cpu_jtag_debug_module arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_cpu_jtag_debug_module = cpu_jtag_debug_module_end_xfer & (~cpu_jtag_debug_module_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //cpu_jtag_debug_module_arb_share_counter arbitration counter enable, which is an e_assign
  assign cpu_jtag_debug_module_arb_counter_enable = (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & cpu_jtag_debug_module_allgrants) | (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & ~cpu_jtag_debug_module_non_bursting_master_requests);

  //cpu_jtag_debug_module_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_arb_share_counter <= 0;
      else if (cpu_jtag_debug_module_arb_counter_enable)
          cpu_jtag_debug_module_arb_share_counter <= cpu_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu_jtag_debug_module_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_slavearbiterlockenable <= 0;
      else if ((|cpu_jtag_debug_module_master_qreq_vector & end_xfer_arb_share_counter_term_cpu_jtag_debug_module) | (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & ~cpu_jtag_debug_module_non_bursting_master_requests))
          cpu_jtag_debug_module_slavearbiterlockenable <= |cpu_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu/data_master cpu/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = cpu_jtag_debug_module_slavearbiterlockenable & cpu_data_master_continuerequest;

  //cpu_jtag_debug_module_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign cpu_jtag_debug_module_slavearbiterlockenable2 = |cpu_jtag_debug_module_arb_share_counter_next_value;

  //cpu/data_master cpu/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = cpu_jtag_debug_module_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master cpu/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = cpu_jtag_debug_module_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master cpu/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = cpu_jtag_debug_module_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted cpu/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module <= 0;
      else if (1)
          last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module <= cpu_instruction_master_saved_grant_cpu_jtag_debug_module ? 1 : (cpu_jtag_debug_module_arbitration_holdoff_internal | ~cpu_instruction_master_requests_cpu_jtag_debug_module) ? 0 : last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module & cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu_jtag_debug_module_any_continuerequest at least one master continues requesting, which is an e_mux
  assign cpu_jtag_debug_module_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_cpu_jtag_debug_module = cpu_data_master_requests_cpu_jtag_debug_module & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0) | (|cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register) | (|cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register) | (|cpu_data_master_read_data_valid_slow_peripheral_bridge_s1_shift_register))) | cpu_instruction_master_arbiterlock);
  //local readdatavalid cpu_data_master_read_data_valid_cpu_jtag_debug_module, which is an e_mux
  assign cpu_data_master_read_data_valid_cpu_jtag_debug_module = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_read & ~cpu_jtag_debug_module_waits_for_read;

  //cpu_jtag_debug_module_writedata mux, which is an e_mux
  assign cpu_jtag_debug_module_writedata = cpu_data_master_writedata;

  assign cpu_instruction_master_requests_cpu_jtag_debug_module = (({cpu_instruction_master_address_to_slave[26 : 11] , 11'b0} == 27'h2000800) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted cpu/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module <= 0;
      else if (1)
          last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module <= cpu_data_master_saved_grant_cpu_jtag_debug_module ? 1 : (cpu_jtag_debug_module_arbitration_holdoff_internal | ~cpu_data_master_requests_cpu_jtag_debug_module) ? 0 : last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module & cpu_data_master_requests_cpu_jtag_debug_module;

  assign cpu_instruction_master_qualified_request_cpu_jtag_debug_module = cpu_instruction_master_requests_cpu_jtag_debug_module & ~((cpu_instruction_master_read & ((cpu_instruction_master_latency_counter != 0) | (|cpu_instruction_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register) | (|cpu_instruction_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register))) | cpu_data_master_arbiterlock);
  //local readdatavalid cpu_instruction_master_read_data_valid_cpu_jtag_debug_module, which is an e_mux
  assign cpu_instruction_master_read_data_valid_cpu_jtag_debug_module = cpu_instruction_master_granted_cpu_jtag_debug_module & cpu_instruction_master_read & ~cpu_jtag_debug_module_waits_for_read;

  //allow new arb cycle for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_master_qreq_vector[0] = cpu_instruction_master_qualified_request_cpu_jtag_debug_module;

  //cpu/instruction_master grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_instruction_master_granted_cpu_jtag_debug_module = cpu_jtag_debug_module_grant_vector[0];

  //cpu/instruction_master saved-grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_instruction_master_saved_grant_cpu_jtag_debug_module = cpu_jtag_debug_module_arb_winner[0] && cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu/data_master assignment into master qualified-requests vector for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_master_qreq_vector[1] = cpu_data_master_qualified_request_cpu_jtag_debug_module;

  //cpu/data_master grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_data_master_granted_cpu_jtag_debug_module = cpu_jtag_debug_module_grant_vector[1];

  //cpu/data_master saved-grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_data_master_saved_grant_cpu_jtag_debug_module = cpu_jtag_debug_module_arb_winner[1] && cpu_data_master_requests_cpu_jtag_debug_module;

  //cpu/jtag_debug_module chosen-master double-vector, which is an e_assign
  assign cpu_jtag_debug_module_chosen_master_double_vector = {cpu_jtag_debug_module_master_qreq_vector, cpu_jtag_debug_module_master_qreq_vector} & ({~cpu_jtag_debug_module_master_qreq_vector, ~cpu_jtag_debug_module_master_qreq_vector} + cpu_jtag_debug_module_arb_addend);

  //stable onehot encoding of arb winner
  assign cpu_jtag_debug_module_arb_winner = (cpu_jtag_debug_module_allow_new_arb_cycle & | cpu_jtag_debug_module_grant_vector) ? cpu_jtag_debug_module_grant_vector : cpu_jtag_debug_module_saved_chosen_master_vector;

  //saved cpu_jtag_debug_module_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_saved_chosen_master_vector <= 0;
      else if (cpu_jtag_debug_module_allow_new_arb_cycle)
          cpu_jtag_debug_module_saved_chosen_master_vector <= |cpu_jtag_debug_module_grant_vector ? cpu_jtag_debug_module_grant_vector : cpu_jtag_debug_module_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign cpu_jtag_debug_module_grant_vector = {(cpu_jtag_debug_module_chosen_master_double_vector[1] | cpu_jtag_debug_module_chosen_master_double_vector[3]),
    (cpu_jtag_debug_module_chosen_master_double_vector[0] | cpu_jtag_debug_module_chosen_master_double_vector[2])};

  //cpu/jtag_debug_module chosen master rotated left, which is an e_assign
  assign cpu_jtag_debug_module_chosen_master_rot_left = (cpu_jtag_debug_module_arb_winner << 1) ? (cpu_jtag_debug_module_arb_winner << 1) : 1;

  //cpu/jtag_debug_module's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_arb_addend <= 1;
      else if (|cpu_jtag_debug_module_grant_vector)
          cpu_jtag_debug_module_arb_addend <= cpu_jtag_debug_module_end_xfer? cpu_jtag_debug_module_chosen_master_rot_left : cpu_jtag_debug_module_grant_vector;
    end


  assign cpu_jtag_debug_module_begintransfer = cpu_jtag_debug_module_begins_xfer;
  //assign lhs ~cpu_jtag_debug_module_reset of type reset_n to cpu_jtag_debug_module_reset_n, which is an e_assign
  assign cpu_jtag_debug_module_reset = ~cpu_jtag_debug_module_reset_n;

  //cpu_jtag_debug_module_reset_n assignment, which is an e_assign
  assign cpu_jtag_debug_module_reset_n = reset_n;

  //assign cpu_jtag_debug_module_resetrequest_from_sa = cpu_jtag_debug_module_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_jtag_debug_module_resetrequest_from_sa = cpu_jtag_debug_module_resetrequest;

  assign cpu_jtag_debug_module_chipselect = cpu_data_master_granted_cpu_jtag_debug_module | cpu_instruction_master_granted_cpu_jtag_debug_module;
  //cpu_jtag_debug_module_firsttransfer first transaction, which is an e_assign
  assign cpu_jtag_debug_module_firsttransfer = cpu_jtag_debug_module_begins_xfer ? cpu_jtag_debug_module_unreg_firsttransfer : cpu_jtag_debug_module_reg_firsttransfer;

  //cpu_jtag_debug_module_unreg_firsttransfer first transaction, which is an e_assign
  assign cpu_jtag_debug_module_unreg_firsttransfer = ~(cpu_jtag_debug_module_slavearbiterlockenable & cpu_jtag_debug_module_any_continuerequest);

  //cpu_jtag_debug_module_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_reg_firsttransfer <= 1'b1;
      else if (cpu_jtag_debug_module_begins_xfer)
          cpu_jtag_debug_module_reg_firsttransfer <= cpu_jtag_debug_module_unreg_firsttransfer;
    end


  //cpu_jtag_debug_module_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign cpu_jtag_debug_module_beginbursttransfer_internal = cpu_jtag_debug_module_begins_xfer;

  //cpu_jtag_debug_module_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign cpu_jtag_debug_module_arbitration_holdoff_internal = cpu_jtag_debug_module_begins_xfer & cpu_jtag_debug_module_firsttransfer;

  //cpu_jtag_debug_module_write assignment, which is an e_mux
  assign cpu_jtag_debug_module_write = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_write;

  assign shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master = cpu_data_master_address_to_slave;
  //cpu_jtag_debug_module_address mux, which is an e_mux
  assign cpu_jtag_debug_module_address = (cpu_data_master_granted_cpu_jtag_debug_module)? (shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master >> 2) :
    (shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master >> 2);

  assign shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master = cpu_instruction_master_address_to_slave;
  //d1_cpu_jtag_debug_module_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_cpu_jtag_debug_module_end_xfer <= 1;
      else if (1)
          d1_cpu_jtag_debug_module_end_xfer <= cpu_jtag_debug_module_end_xfer;
    end


  //cpu_jtag_debug_module_waits_for_read in a cycle, which is an e_mux
  assign cpu_jtag_debug_module_waits_for_read = cpu_jtag_debug_module_in_a_read_cycle & cpu_jtag_debug_module_begins_xfer;

  //cpu_jtag_debug_module_in_a_read_cycle assignment, which is an e_assign
  assign cpu_jtag_debug_module_in_a_read_cycle = (cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_read) | (cpu_instruction_master_granted_cpu_jtag_debug_module & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cpu_jtag_debug_module_in_a_read_cycle;

  //cpu_jtag_debug_module_waits_for_write in a cycle, which is an e_mux
  assign cpu_jtag_debug_module_waits_for_write = cpu_jtag_debug_module_in_a_write_cycle & 0;

  //cpu_jtag_debug_module_in_a_write_cycle assignment, which is an e_assign
  assign cpu_jtag_debug_module_in_a_write_cycle = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cpu_jtag_debug_module_in_a_write_cycle;

  assign wait_for_cpu_jtag_debug_module_counter = 0;
  //cpu_jtag_debug_module_byteenable byte enable port mux, which is an e_mux
  assign cpu_jtag_debug_module_byteenable = (cpu_data_master_granted_cpu_jtag_debug_module)? cpu_data_master_byteenable :
    -1;

  //debugaccess mux, which is an e_mux
  assign cpu_jtag_debug_module_debugaccess = (cpu_data_master_granted_cpu_jtag_debug_module)? cpu_data_master_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu/jtag_debug_module enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_cpu_jtag_debug_module + cpu_instruction_master_granted_cpu_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_cpu_jtag_debug_module + cpu_instruction_master_saved_grant_cpu_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module button_pio_s1_irq_from_sa_clock_crossing_cpu_data_master_module (
                                                                         // inputs:
                                                                          clk,
                                                                          data_in,
                                                                          reset_n,

                                                                         // outputs:
                                                                          data_out
                                                                       )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else if (1)
          data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else if (1)
          data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module high_res_timer_s1_irq_from_sa_clock_crossing_cpu_data_master_module (
                                                                             // inputs:
                                                                              clk,
                                                                              data_in,
                                                                              reset_n,

                                                                             // outputs:
                                                                              data_out
                                                                           )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else if (1)
          data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else if (1)
          data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module jtag_uart_avalon_jtag_slave_irq_from_sa_clock_crossing_cpu_data_master_module (
                                                                                       // inputs:
                                                                                        clk,
                                                                                        data_in,
                                                                                        reset_n,

                                                                                       // outputs:
                                                                                        data_out
                                                                                     )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else if (1)
          data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else if (1)
          data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sys_clk_timer_s1_irq_from_sa_clock_crossing_cpu_data_master_module (
                                                                            // inputs:
                                                                             clk,
                                                                             data_in,
                                                                             reset_n,

                                                                            // outputs:
                                                                             data_out
                                                                          )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else if (1)
          data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else if (1)
          data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_data_master_arbitrator (
                                    // inputs:
                                     button_pio_s1_irq_from_sa,
                                     clk,
                                     cpu_data_master_address,
                                     cpu_data_master_byteenable,
                                     cpu_data_master_granted_cpu_ddr_clock_bridge_s1,
                                     cpu_data_master_granted_cpu_jtag_debug_module,
                                     cpu_data_master_granted_flash_ssram_pipeline_bridge_s1,
                                     cpu_data_master_granted_slow_peripheral_bridge_s1,
                                     cpu_data_master_qualified_request_cpu_ddr_clock_bridge_s1,
                                     cpu_data_master_qualified_request_cpu_jtag_debug_module,
                                     cpu_data_master_qualified_request_flash_ssram_pipeline_bridge_s1,
                                     cpu_data_master_qualified_request_slow_peripheral_bridge_s1,
                                     cpu_data_master_read,
                                     cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1,
                                     cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register,
                                     cpu_data_master_read_data_valid_cpu_jtag_debug_module,
                                     cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1,
                                     cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register,
                                     cpu_data_master_read_data_valid_slow_peripheral_bridge_s1,
                                     cpu_data_master_read_data_valid_slow_peripheral_bridge_s1_shift_register,
                                     cpu_data_master_requests_cpu_ddr_clock_bridge_s1,
                                     cpu_data_master_requests_cpu_jtag_debug_module,
                                     cpu_data_master_requests_flash_ssram_pipeline_bridge_s1,
                                     cpu_data_master_requests_slow_peripheral_bridge_s1,
                                     cpu_data_master_write,
                                     cpu_data_master_writedata,
                                     cpu_ddr_clock_bridge_s1_readdata_from_sa,
                                     cpu_ddr_clock_bridge_s1_waitrequest_from_sa,
                                     cpu_jtag_debug_module_readdata_from_sa,
                                     d1_cpu_ddr_clock_bridge_s1_end_xfer,
                                     d1_cpu_jtag_debug_module_end_xfer,
                                     d1_flash_ssram_pipeline_bridge_s1_end_xfer,
                                     d1_slow_peripheral_bridge_s1_end_xfer,
                                     flash_ssram_pipeline_bridge_s1_readdata_from_sa,
                                     flash_ssram_pipeline_bridge_s1_waitrequest_from_sa,
                                     high_res_timer_s1_irq_from_sa,
                                     jtag_uart_avalon_jtag_slave_irq_from_sa,
                                     pll_c0_out,
                                     pll_c0_out_reset_n,
                                     reset_n,
                                     slow_peripheral_bridge_s1_readdata_from_sa,
                                     slow_peripheral_bridge_s1_waitrequest_from_sa,
                                     sys_clk_timer_s1_irq_from_sa,

                                    // outputs:
                                     cpu_data_master_address_to_slave,
                                     cpu_data_master_irq,
                                     cpu_data_master_latency_counter,
                                     cpu_data_master_readdata,
                                     cpu_data_master_readdatavalid,
                                     cpu_data_master_waitrequest
                                  )
;

  output  [ 27: 0] cpu_data_master_address_to_slave;
  output  [ 31: 0] cpu_data_master_irq;
  output           cpu_data_master_latency_counter;
  output  [ 31: 0] cpu_data_master_readdata;
  output           cpu_data_master_readdatavalid;
  output           cpu_data_master_waitrequest;
  input            button_pio_s1_irq_from_sa;
  input            clk;
  input   [ 27: 0] cpu_data_master_address;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_granted_cpu_ddr_clock_bridge_s1;
  input            cpu_data_master_granted_cpu_jtag_debug_module;
  input            cpu_data_master_granted_flash_ssram_pipeline_bridge_s1;
  input            cpu_data_master_granted_slow_peripheral_bridge_s1;
  input            cpu_data_master_qualified_request_cpu_ddr_clock_bridge_s1;
  input            cpu_data_master_qualified_request_cpu_jtag_debug_module;
  input            cpu_data_master_qualified_request_flash_ssram_pipeline_bridge_s1;
  input            cpu_data_master_qualified_request_slow_peripheral_bridge_s1;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1;
  input            cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register;
  input            cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  input            cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1;
  input            cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register;
  input            cpu_data_master_read_data_valid_slow_peripheral_bridge_s1;
  input            cpu_data_master_read_data_valid_slow_peripheral_bridge_s1_shift_register;
  input            cpu_data_master_requests_cpu_ddr_clock_bridge_s1;
  input            cpu_data_master_requests_cpu_jtag_debug_module;
  input            cpu_data_master_requests_flash_ssram_pipeline_bridge_s1;
  input            cpu_data_master_requests_slow_peripheral_bridge_s1;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 31: 0] cpu_ddr_clock_bridge_s1_readdata_from_sa;
  input            cpu_ddr_clock_bridge_s1_waitrequest_from_sa;
  input   [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  input            d1_cpu_ddr_clock_bridge_s1_end_xfer;
  input            d1_cpu_jtag_debug_module_end_xfer;
  input            d1_flash_ssram_pipeline_bridge_s1_end_xfer;
  input            d1_slow_peripheral_bridge_s1_end_xfer;
  input   [ 31: 0] flash_ssram_pipeline_bridge_s1_readdata_from_sa;
  input            flash_ssram_pipeline_bridge_s1_waitrequest_from_sa;
  input            high_res_timer_s1_irq_from_sa;
  input            jtag_uart_avalon_jtag_slave_irq_from_sa;
  input            pll_c0_out;
  input            pll_c0_out_reset_n;
  input            reset_n;
  input   [ 31: 0] slow_peripheral_bridge_s1_readdata_from_sa;
  input            slow_peripheral_bridge_s1_waitrequest_from_sa;
  input            sys_clk_timer_s1_irq_from_sa;

  reg              active_and_waiting_last_time;
  reg     [ 27: 0] cpu_data_master_address_last_time;
  wire    [ 27: 0] cpu_data_master_address_to_slave;
  reg     [  3: 0] cpu_data_master_byteenable_last_time;
  wire    [ 31: 0] cpu_data_master_irq;
  wire             cpu_data_master_is_granted_some_slave;
  reg              cpu_data_master_latency_counter;
  reg              cpu_data_master_read_but_no_slave_selected;
  reg              cpu_data_master_read_last_time;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_readdatavalid;
  wire             cpu_data_master_run;
  wire             cpu_data_master_waitrequest;
  reg              cpu_data_master_write_last_time;
  reg     [ 31: 0] cpu_data_master_writedata_last_time;
  wire             latency_load_value;
  wire             p1_cpu_data_master_latency_counter;
  wire             pll_c0_out_button_pio_s1_irq_from_sa;
  wire             pll_c0_out_high_res_timer_s1_irq_from_sa;
  wire             pll_c0_out_jtag_uart_avalon_jtag_slave_irq_from_sa;
  wire             pll_c0_out_sys_clk_timer_s1_irq_from_sa;
  wire             pre_flush_cpu_data_master_readdatavalid;
  wire             r_0;
  wire             r_1;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_requests_cpu_jtag_debug_module) & (cpu_data_master_granted_cpu_jtag_debug_module | ~cpu_data_master_qualified_request_cpu_jtag_debug_module) & ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_read | (1 & ~d1_cpu_jtag_debug_module_end_xfer & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_cpu_ddr_clock_bridge_s1 | ~cpu_data_master_requests_cpu_ddr_clock_bridge_s1) & (cpu_data_master_granted_cpu_ddr_clock_bridge_s1 | ~cpu_data_master_qualified_request_cpu_ddr_clock_bridge_s1) & ((~cpu_data_master_qualified_request_cpu_ddr_clock_bridge_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~cpu_ddr_clock_bridge_s1_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_cpu_ddr_clock_bridge_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~cpu_ddr_clock_bridge_s1_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_flash_ssram_pipeline_bridge_s1 | ~cpu_data_master_requests_flash_ssram_pipeline_bridge_s1) & (cpu_data_master_granted_flash_ssram_pipeline_bridge_s1 | ~cpu_data_master_qualified_request_flash_ssram_pipeline_bridge_s1) & ((~cpu_data_master_qualified_request_flash_ssram_pipeline_bridge_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~flash_ssram_pipeline_bridge_s1_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_flash_ssram_pipeline_bridge_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~flash_ssram_pipeline_bridge_s1_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write))));

  //cascaded wait assignment, which is an e_assign
  assign cpu_data_master_run = r_0 & r_1;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (cpu_data_master_qualified_request_slow_peripheral_bridge_s1 | ~cpu_data_master_requests_slow_peripheral_bridge_s1) & ((~cpu_data_master_qualified_request_slow_peripheral_bridge_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~slow_peripheral_bridge_s1_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_slow_peripheral_bridge_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~slow_peripheral_bridge_s1_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write))));

  //button_pio_s1_irq_from_sa from pll_c2_out to pll_c0_out
  button_pio_s1_irq_from_sa_clock_crossing_cpu_data_master_module button_pio_s1_irq_from_sa_clock_crossing_cpu_data_master
    (
      .clk      (pll_c0_out),
      .data_in  (button_pio_s1_irq_from_sa),
      .data_out (pll_c0_out_button_pio_s1_irq_from_sa),
      .reset_n  (pll_c0_out_reset_n)
    );

  //irq assign, which is an e_assign
  assign cpu_data_master_irq = {1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    pll_c0_out_high_res_timer_s1_irq_from_sa,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    pll_c0_out_button_pio_s1_irq_from_sa,
    1'b0,
    pll_c0_out_jtag_uart_avalon_jtag_slave_irq_from_sa,
    1'b0,
    pll_c0_out_sys_clk_timer_s1_irq_from_sa,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0};

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_data_master_address_to_slave = cpu_data_master_address[27 : 0];

  //cpu_data_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_but_no_slave_selected <= 0;
      else if (1)
          cpu_data_master_read_but_no_slave_selected <= cpu_data_master_read & cpu_data_master_run & ~cpu_data_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign cpu_data_master_is_granted_some_slave = cpu_data_master_granted_cpu_jtag_debug_module |
    cpu_data_master_granted_cpu_ddr_clock_bridge_s1 |
    cpu_data_master_granted_flash_ssram_pipeline_bridge_s1 |
    cpu_data_master_granted_slow_peripheral_bridge_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_data_master_readdatavalid = cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1 |
    cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1 |
    cpu_data_master_read_data_valid_slow_peripheral_bridge_s1;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_data_master_readdatavalid = cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_cpu_jtag_debug_module |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid;

  //cpu/data_master readdata mux, which is an e_mux
  assign cpu_data_master_readdata = ({32 {~(cpu_data_master_qualified_request_cpu_jtag_debug_module & cpu_data_master_read)}} | cpu_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1}} | cpu_ddr_clock_bridge_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1}} | flash_ssram_pipeline_bridge_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_read_data_valid_slow_peripheral_bridge_s1}} | slow_peripheral_bridge_s1_readdata_from_sa);

  //actual waitrequest port, which is an e_assign
  assign cpu_data_master_waitrequest = ~cpu_data_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_latency_counter <= 0;
      else if (1)
          cpu_data_master_latency_counter <= p1_cpu_data_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_cpu_data_master_latency_counter = ((cpu_data_master_run & cpu_data_master_read))? latency_load_value :
    (cpu_data_master_latency_counter)? cpu_data_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = 0;

  //high_res_timer_s1_irq_from_sa from pll_c2_out to pll_c0_out
  high_res_timer_s1_irq_from_sa_clock_crossing_cpu_data_master_module high_res_timer_s1_irq_from_sa_clock_crossing_cpu_data_master
    (
      .clk      (pll_c0_out),
      .data_in  (high_res_timer_s1_irq_from_sa),
      .data_out (pll_c0_out_high_res_timer_s1_irq_from_sa),
      .reset_n  (pll_c0_out_reset_n)
    );

  //jtag_uart_avalon_jtag_slave_irq_from_sa from pll_c2_out to pll_c0_out
  jtag_uart_avalon_jtag_slave_irq_from_sa_clock_crossing_cpu_data_master_module jtag_uart_avalon_jtag_slave_irq_from_sa_clock_crossing_cpu_data_master
    (
      .clk      (pll_c0_out),
      .data_in  (jtag_uart_avalon_jtag_slave_irq_from_sa),
      .data_out (pll_c0_out_jtag_uart_avalon_jtag_slave_irq_from_sa),
      .reset_n  (pll_c0_out_reset_n)
    );

  //sys_clk_timer_s1_irq_from_sa from pll_c2_out to pll_c0_out
  sys_clk_timer_s1_irq_from_sa_clock_crossing_cpu_data_master_module sys_clk_timer_s1_irq_from_sa_clock_crossing_cpu_data_master
    (
      .clk      (pll_c0_out),
      .data_in  (sys_clk_timer_s1_irq_from_sa),
      .data_out (pll_c0_out_sys_clk_timer_s1_irq_from_sa),
      .reset_n  (pll_c0_out_reset_n)
    );


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_data_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_address_last_time <= 0;
      else if (1)
          cpu_data_master_address_last_time <= cpu_data_master_address;
    end


  //cpu/data_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else if (1)
          active_and_waiting_last_time <= cpu_data_master_waitrequest & (cpu_data_master_read | cpu_data_master_write);
    end


  //cpu_data_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_data_master_address != cpu_data_master_address_last_time))
        begin
          $write("%0d ns: cpu_data_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_data_master_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_byteenable_last_time <= 0;
      else if (1)
          cpu_data_master_byteenable_last_time <= cpu_data_master_byteenable;
    end


  //cpu_data_master_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_data_master_byteenable != cpu_data_master_byteenable_last_time))
        begin
          $write("%0d ns: cpu_data_master_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_data_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_last_time <= 0;
      else if (1)
          cpu_data_master_read_last_time <= cpu_data_master_read;
    end


  //cpu_data_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_data_master_read != cpu_data_master_read_last_time))
        begin
          $write("%0d ns: cpu_data_master_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_data_master_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_write_last_time <= 0;
      else if (1)
          cpu_data_master_write_last_time <= cpu_data_master_write;
    end


  //cpu_data_master_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_data_master_write != cpu_data_master_write_last_time))
        begin
          $write("%0d ns: cpu_data_master_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_data_master_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_writedata_last_time <= 0;
      else if (1)
          cpu_data_master_writedata_last_time <= cpu_data_master_writedata;
    end


  //cpu_data_master_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_data_master_writedata != cpu_data_master_writedata_last_time) & cpu_data_master_write)
        begin
          $write("%0d ns: cpu_data_master_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_instruction_master_arbitrator (
                                           // inputs:
                                            clk,
                                            cpu_ddr_clock_bridge_s1_readdata_from_sa,
                                            cpu_ddr_clock_bridge_s1_waitrequest_from_sa,
                                            cpu_instruction_master_address,
                                            cpu_instruction_master_granted_cpu_ddr_clock_bridge_s1,
                                            cpu_instruction_master_granted_cpu_jtag_debug_module,
                                            cpu_instruction_master_granted_flash_ssram_pipeline_bridge_s1,
                                            cpu_instruction_master_qualified_request_cpu_ddr_clock_bridge_s1,
                                            cpu_instruction_master_qualified_request_cpu_jtag_debug_module,
                                            cpu_instruction_master_qualified_request_flash_ssram_pipeline_bridge_s1,
                                            cpu_instruction_master_read,
                                            cpu_instruction_master_read_data_valid_cpu_ddr_clock_bridge_s1,
                                            cpu_instruction_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register,
                                            cpu_instruction_master_read_data_valid_cpu_jtag_debug_module,
                                            cpu_instruction_master_read_data_valid_flash_ssram_pipeline_bridge_s1,
                                            cpu_instruction_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register,
                                            cpu_instruction_master_requests_cpu_ddr_clock_bridge_s1,
                                            cpu_instruction_master_requests_cpu_jtag_debug_module,
                                            cpu_instruction_master_requests_flash_ssram_pipeline_bridge_s1,
                                            cpu_jtag_debug_module_readdata_from_sa,
                                            d1_cpu_ddr_clock_bridge_s1_end_xfer,
                                            d1_cpu_jtag_debug_module_end_xfer,
                                            d1_flash_ssram_pipeline_bridge_s1_end_xfer,
                                            flash_ssram_pipeline_bridge_s1_readdata_from_sa,
                                            flash_ssram_pipeline_bridge_s1_waitrequest_from_sa,
                                            reset_n,

                                           // outputs:
                                            cpu_instruction_master_address_to_slave,
                                            cpu_instruction_master_latency_counter,
                                            cpu_instruction_master_readdata,
                                            cpu_instruction_master_readdatavalid,
                                            cpu_instruction_master_waitrequest
                                         )
;

  output  [ 26: 0] cpu_instruction_master_address_to_slave;
  output           cpu_instruction_master_latency_counter;
  output  [ 31: 0] cpu_instruction_master_readdata;
  output           cpu_instruction_master_readdatavalid;
  output           cpu_instruction_master_waitrequest;
  input            clk;
  input   [ 31: 0] cpu_ddr_clock_bridge_s1_readdata_from_sa;
  input            cpu_ddr_clock_bridge_s1_waitrequest_from_sa;
  input   [ 26: 0] cpu_instruction_master_address;
  input            cpu_instruction_master_granted_cpu_ddr_clock_bridge_s1;
  input            cpu_instruction_master_granted_cpu_jtag_debug_module;
  input            cpu_instruction_master_granted_flash_ssram_pipeline_bridge_s1;
  input            cpu_instruction_master_qualified_request_cpu_ddr_clock_bridge_s1;
  input            cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  input            cpu_instruction_master_qualified_request_flash_ssram_pipeline_bridge_s1;
  input            cpu_instruction_master_read;
  input            cpu_instruction_master_read_data_valid_cpu_ddr_clock_bridge_s1;
  input            cpu_instruction_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register;
  input            cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  input            cpu_instruction_master_read_data_valid_flash_ssram_pipeline_bridge_s1;
  input            cpu_instruction_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register;
  input            cpu_instruction_master_requests_cpu_ddr_clock_bridge_s1;
  input            cpu_instruction_master_requests_cpu_jtag_debug_module;
  input            cpu_instruction_master_requests_flash_ssram_pipeline_bridge_s1;
  input   [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  input            d1_cpu_ddr_clock_bridge_s1_end_xfer;
  input            d1_cpu_jtag_debug_module_end_xfer;
  input            d1_flash_ssram_pipeline_bridge_s1_end_xfer;
  input   [ 31: 0] flash_ssram_pipeline_bridge_s1_readdata_from_sa;
  input            flash_ssram_pipeline_bridge_s1_waitrequest_from_sa;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [ 26: 0] cpu_instruction_master_address_last_time;
  wire    [ 26: 0] cpu_instruction_master_address_to_slave;
  wire             cpu_instruction_master_is_granted_some_slave;
  reg              cpu_instruction_master_latency_counter;
  reg              cpu_instruction_master_read_but_no_slave_selected;
  reg              cpu_instruction_master_read_last_time;
  wire    [ 31: 0] cpu_instruction_master_readdata;
  wire             cpu_instruction_master_readdatavalid;
  wire             cpu_instruction_master_run;
  wire             cpu_instruction_master_waitrequest;
  wire             latency_load_value;
  wire             p1_cpu_instruction_master_latency_counter;
  wire             pre_flush_cpu_instruction_master_readdatavalid;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_requests_cpu_jtag_debug_module) & (cpu_instruction_master_granted_cpu_jtag_debug_module | ~cpu_instruction_master_qualified_request_cpu_jtag_debug_module) & ((~cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_read | (1 & ~d1_cpu_jtag_debug_module_end_xfer & cpu_instruction_master_read))) & 1 & (cpu_instruction_master_qualified_request_cpu_ddr_clock_bridge_s1 | ~cpu_instruction_master_requests_cpu_ddr_clock_bridge_s1) & (cpu_instruction_master_granted_cpu_ddr_clock_bridge_s1 | ~cpu_instruction_master_qualified_request_cpu_ddr_clock_bridge_s1) & ((~cpu_instruction_master_qualified_request_cpu_ddr_clock_bridge_s1 | ~(cpu_instruction_master_read) | (1 & ~cpu_ddr_clock_bridge_s1_waitrequest_from_sa & (cpu_instruction_master_read)))) & 1 & (cpu_instruction_master_qualified_request_flash_ssram_pipeline_bridge_s1 | ~cpu_instruction_master_requests_flash_ssram_pipeline_bridge_s1) & (cpu_instruction_master_granted_flash_ssram_pipeline_bridge_s1 | ~cpu_instruction_master_qualified_request_flash_ssram_pipeline_bridge_s1) & ((~cpu_instruction_master_qualified_request_flash_ssram_pipeline_bridge_s1 | ~(cpu_instruction_master_read) | (1 & ~flash_ssram_pipeline_bridge_s1_waitrequest_from_sa & (cpu_instruction_master_read))));

  //cascaded wait assignment, which is an e_assign
  assign cpu_instruction_master_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_instruction_master_address_to_slave = cpu_instruction_master_address[26 : 0];

  //cpu_instruction_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_but_no_slave_selected <= 0;
      else if (1)
          cpu_instruction_master_read_but_no_slave_selected <= cpu_instruction_master_read & cpu_instruction_master_run & ~cpu_instruction_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign cpu_instruction_master_is_granted_some_slave = cpu_instruction_master_granted_cpu_jtag_debug_module |
    cpu_instruction_master_granted_cpu_ddr_clock_bridge_s1 |
    cpu_instruction_master_granted_flash_ssram_pipeline_bridge_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_instruction_master_readdatavalid = cpu_instruction_master_read_data_valid_cpu_ddr_clock_bridge_s1 |
    cpu_instruction_master_read_data_valid_flash_ssram_pipeline_bridge_s1;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_instruction_master_readdatavalid = cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid |
    cpu_instruction_master_read_data_valid_cpu_jtag_debug_module |
    cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid |
    cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid;

  //cpu/instruction_master readdata mux, which is an e_mux
  assign cpu_instruction_master_readdata = ({32 {~(cpu_instruction_master_qualified_request_cpu_jtag_debug_module & cpu_instruction_master_read)}} | cpu_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_instruction_master_read_data_valid_cpu_ddr_clock_bridge_s1}} | cpu_ddr_clock_bridge_s1_readdata_from_sa) &
    ({32 {~cpu_instruction_master_read_data_valid_flash_ssram_pipeline_bridge_s1}} | flash_ssram_pipeline_bridge_s1_readdata_from_sa);

  //actual waitrequest port, which is an e_assign
  assign cpu_instruction_master_waitrequest = ~cpu_instruction_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_latency_counter <= 0;
      else if (1)
          cpu_instruction_master_latency_counter <= p1_cpu_instruction_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_cpu_instruction_master_latency_counter = ((cpu_instruction_master_run & cpu_instruction_master_read))? latency_load_value :
    (cpu_instruction_master_latency_counter)? cpu_instruction_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = 0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_instruction_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_address_last_time <= 0;
      else if (1)
          cpu_instruction_master_address_last_time <= cpu_instruction_master_address;
    end


  //cpu/instruction_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else if (1)
          active_and_waiting_last_time <= cpu_instruction_master_waitrequest & (cpu_instruction_master_read);
    end


  //cpu_instruction_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_instruction_master_address != cpu_instruction_master_address_last_time))
        begin
          $write("%0d ns: cpu_instruction_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_instruction_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_last_time <= 0;
      else if (1)
          cpu_instruction_master_read_last_time <= cpu_instruction_master_read;
    end


  //cpu_instruction_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_instruction_master_read != cpu_instruction_master_read_last_time))
        begin
          $write("%0d ns: cpu_instruction_master_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_data_master_to_cpu_ddr_clock_bridge_s1_module (
                                                                        // inputs:
                                                                         clear_fifo,
                                                                         clk,
                                                                         data_in,
                                                                         read,
                                                                         reset_n,
                                                                         sync_reset,
                                                                         write,

                                                                        // outputs:
                                                                         data_out,
                                                                         empty,
                                                                         fifo_contains_ones_n,
                                                                         full
                                                                      )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_10;
  reg              full_11;
  reg              full_12;
  reg              full_13;
  reg              full_14;
  reg              full_15;
  reg              full_16;
  reg              full_17;
  reg              full_18;
  reg              full_19;
  reg              full_2;
  reg              full_20;
  reg              full_21;
  reg              full_22;
  reg              full_23;
  reg              full_24;
  reg              full_25;
  reg              full_26;
  reg              full_27;
  reg              full_28;
  reg              full_29;
  reg              full_3;
  reg              full_30;
  reg              full_31;
  reg              full_32;
  reg              full_33;
  reg              full_34;
  reg              full_35;
  reg              full_36;
  reg              full_37;
  reg              full_38;
  reg              full_39;
  reg              full_4;
  reg              full_40;
  reg              full_41;
  reg              full_42;
  reg              full_43;
  reg              full_44;
  reg              full_45;
  reg              full_46;
  reg              full_47;
  wire             full_48;
  reg              full_5;
  reg              full_6;
  reg              full_7;
  reg              full_8;
  reg              full_9;
  reg     [  6: 0] how_many_ones;
  wire    [  6: 0] one_count_minus_one;
  wire    [  6: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p10_full_10;
  wire             p10_stage_10;
  wire             p11_full_11;
  wire             p11_stage_11;
  wire             p12_full_12;
  wire             p12_stage_12;
  wire             p13_full_13;
  wire             p13_stage_13;
  wire             p14_full_14;
  wire             p14_stage_14;
  wire             p15_full_15;
  wire             p15_stage_15;
  wire             p16_full_16;
  wire             p16_stage_16;
  wire             p17_full_17;
  wire             p17_stage_17;
  wire             p18_full_18;
  wire             p18_stage_18;
  wire             p19_full_19;
  wire             p19_stage_19;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p20_full_20;
  wire             p20_stage_20;
  wire             p21_full_21;
  wire             p21_stage_21;
  wire             p22_full_22;
  wire             p22_stage_22;
  wire             p23_full_23;
  wire             p23_stage_23;
  wire             p24_full_24;
  wire             p24_stage_24;
  wire             p25_full_25;
  wire             p25_stage_25;
  wire             p26_full_26;
  wire             p26_stage_26;
  wire             p27_full_27;
  wire             p27_stage_27;
  wire             p28_full_28;
  wire             p28_stage_28;
  wire             p29_full_29;
  wire             p29_stage_29;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p30_full_30;
  wire             p30_stage_30;
  wire             p31_full_31;
  wire             p31_stage_31;
  wire             p32_full_32;
  wire             p32_stage_32;
  wire             p33_full_33;
  wire             p33_stage_33;
  wire             p34_full_34;
  wire             p34_stage_34;
  wire             p35_full_35;
  wire             p35_stage_35;
  wire             p36_full_36;
  wire             p36_stage_36;
  wire             p37_full_37;
  wire             p37_stage_37;
  wire             p38_full_38;
  wire             p38_stage_38;
  wire             p39_full_39;
  wire             p39_stage_39;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p40_full_40;
  wire             p40_stage_40;
  wire             p41_full_41;
  wire             p41_stage_41;
  wire             p42_full_42;
  wire             p42_stage_42;
  wire             p43_full_43;
  wire             p43_stage_43;
  wire             p44_full_44;
  wire             p44_stage_44;
  wire             p45_full_45;
  wire             p45_stage_45;
  wire             p46_full_46;
  wire             p46_stage_46;
  wire             p47_full_47;
  wire             p47_stage_47;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  wire             p7_full_7;
  wire             p7_stage_7;
  wire             p8_full_8;
  wire             p8_stage_8;
  wire             p9_full_9;
  wire             p9_stage_9;
  reg              stage_0;
  reg              stage_1;
  reg              stage_10;
  reg              stage_11;
  reg              stage_12;
  reg              stage_13;
  reg              stage_14;
  reg              stage_15;
  reg              stage_16;
  reg              stage_17;
  reg              stage_18;
  reg              stage_19;
  reg              stage_2;
  reg              stage_20;
  reg              stage_21;
  reg              stage_22;
  reg              stage_23;
  reg              stage_24;
  reg              stage_25;
  reg              stage_26;
  reg              stage_27;
  reg              stage_28;
  reg              stage_29;
  reg              stage_3;
  reg              stage_30;
  reg              stage_31;
  reg              stage_32;
  reg              stage_33;
  reg              stage_34;
  reg              stage_35;
  reg              stage_36;
  reg              stage_37;
  reg              stage_38;
  reg              stage_39;
  reg              stage_4;
  reg              stage_40;
  reg              stage_41;
  reg              stage_42;
  reg              stage_43;
  reg              stage_44;
  reg              stage_45;
  reg              stage_46;
  reg              stage_47;
  reg              stage_5;
  reg              stage_6;
  reg              stage_7;
  reg              stage_8;
  reg              stage_9;
  wire    [  6: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_47;
  assign empty = !full_0;
  assign full_48 = 0;
  //data_47, which is an e_mux
  assign p47_stage_47 = ((full_48 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_47, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_47 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_47))
          if (sync_reset & full_47 & !((full_48 == 0) & read & write))
              stage_47 <= 0;
          else 
            stage_47 <= p47_stage_47;
    end


  //control_47, which is an e_mux
  assign p47_full_47 = ((read & !write) == 0)? full_46 :
    0;

  //control_reg_47, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_47 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_47 <= 0;
          else 
            full_47 <= p47_full_47;
    end


  //data_46, which is an e_mux
  assign p46_stage_46 = ((full_47 & ~clear_fifo) == 0)? data_in :
    stage_47;

  //data_reg_46, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_46 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_46))
          if (sync_reset & full_46 & !((full_47 == 0) & read & write))
              stage_46 <= 0;
          else 
            stage_46 <= p46_stage_46;
    end


  //control_46, which is an e_mux
  assign p46_full_46 = ((read & !write) == 0)? full_45 :
    full_47;

  //control_reg_46, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_46 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_46 <= 0;
          else 
            full_46 <= p46_full_46;
    end


  //data_45, which is an e_mux
  assign p45_stage_45 = ((full_46 & ~clear_fifo) == 0)? data_in :
    stage_46;

  //data_reg_45, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_45 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_45))
          if (sync_reset & full_45 & !((full_46 == 0) & read & write))
              stage_45 <= 0;
          else 
            stage_45 <= p45_stage_45;
    end


  //control_45, which is an e_mux
  assign p45_full_45 = ((read & !write) == 0)? full_44 :
    full_46;

  //control_reg_45, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_45 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_45 <= 0;
          else 
            full_45 <= p45_full_45;
    end


  //data_44, which is an e_mux
  assign p44_stage_44 = ((full_45 & ~clear_fifo) == 0)? data_in :
    stage_45;

  //data_reg_44, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_44 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_44))
          if (sync_reset & full_44 & !((full_45 == 0) & read & write))
              stage_44 <= 0;
          else 
            stage_44 <= p44_stage_44;
    end


  //control_44, which is an e_mux
  assign p44_full_44 = ((read & !write) == 0)? full_43 :
    full_45;

  //control_reg_44, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_44 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_44 <= 0;
          else 
            full_44 <= p44_full_44;
    end


  //data_43, which is an e_mux
  assign p43_stage_43 = ((full_44 & ~clear_fifo) == 0)? data_in :
    stage_44;

  //data_reg_43, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_43 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_43))
          if (sync_reset & full_43 & !((full_44 == 0) & read & write))
              stage_43 <= 0;
          else 
            stage_43 <= p43_stage_43;
    end


  //control_43, which is an e_mux
  assign p43_full_43 = ((read & !write) == 0)? full_42 :
    full_44;

  //control_reg_43, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_43 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_43 <= 0;
          else 
            full_43 <= p43_full_43;
    end


  //data_42, which is an e_mux
  assign p42_stage_42 = ((full_43 & ~clear_fifo) == 0)? data_in :
    stage_43;

  //data_reg_42, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_42 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_42))
          if (sync_reset & full_42 & !((full_43 == 0) & read & write))
              stage_42 <= 0;
          else 
            stage_42 <= p42_stage_42;
    end


  //control_42, which is an e_mux
  assign p42_full_42 = ((read & !write) == 0)? full_41 :
    full_43;

  //control_reg_42, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_42 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_42 <= 0;
          else 
            full_42 <= p42_full_42;
    end


  //data_41, which is an e_mux
  assign p41_stage_41 = ((full_42 & ~clear_fifo) == 0)? data_in :
    stage_42;

  //data_reg_41, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_41 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_41))
          if (sync_reset & full_41 & !((full_42 == 0) & read & write))
              stage_41 <= 0;
          else 
            stage_41 <= p41_stage_41;
    end


  //control_41, which is an e_mux
  assign p41_full_41 = ((read & !write) == 0)? full_40 :
    full_42;

  //control_reg_41, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_41 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_41 <= 0;
          else 
            full_41 <= p41_full_41;
    end


  //data_40, which is an e_mux
  assign p40_stage_40 = ((full_41 & ~clear_fifo) == 0)? data_in :
    stage_41;

  //data_reg_40, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_40 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_40))
          if (sync_reset & full_40 & !((full_41 == 0) & read & write))
              stage_40 <= 0;
          else 
            stage_40 <= p40_stage_40;
    end


  //control_40, which is an e_mux
  assign p40_full_40 = ((read & !write) == 0)? full_39 :
    full_41;

  //control_reg_40, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_40 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_40 <= 0;
          else 
            full_40 <= p40_full_40;
    end


  //data_39, which is an e_mux
  assign p39_stage_39 = ((full_40 & ~clear_fifo) == 0)? data_in :
    stage_40;

  //data_reg_39, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_39 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_39))
          if (sync_reset & full_39 & !((full_40 == 0) & read & write))
              stage_39 <= 0;
          else 
            stage_39 <= p39_stage_39;
    end


  //control_39, which is an e_mux
  assign p39_full_39 = ((read & !write) == 0)? full_38 :
    full_40;

  //control_reg_39, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_39 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_39 <= 0;
          else 
            full_39 <= p39_full_39;
    end


  //data_38, which is an e_mux
  assign p38_stage_38 = ((full_39 & ~clear_fifo) == 0)? data_in :
    stage_39;

  //data_reg_38, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_38 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_38))
          if (sync_reset & full_38 & !((full_39 == 0) & read & write))
              stage_38 <= 0;
          else 
            stage_38 <= p38_stage_38;
    end


  //control_38, which is an e_mux
  assign p38_full_38 = ((read & !write) == 0)? full_37 :
    full_39;

  //control_reg_38, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_38 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_38 <= 0;
          else 
            full_38 <= p38_full_38;
    end


  //data_37, which is an e_mux
  assign p37_stage_37 = ((full_38 & ~clear_fifo) == 0)? data_in :
    stage_38;

  //data_reg_37, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_37 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_37))
          if (sync_reset & full_37 & !((full_38 == 0) & read & write))
              stage_37 <= 0;
          else 
            stage_37 <= p37_stage_37;
    end


  //control_37, which is an e_mux
  assign p37_full_37 = ((read & !write) == 0)? full_36 :
    full_38;

  //control_reg_37, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_37 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_37 <= 0;
          else 
            full_37 <= p37_full_37;
    end


  //data_36, which is an e_mux
  assign p36_stage_36 = ((full_37 & ~clear_fifo) == 0)? data_in :
    stage_37;

  //data_reg_36, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_36 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_36))
          if (sync_reset & full_36 & !((full_37 == 0) & read & write))
              stage_36 <= 0;
          else 
            stage_36 <= p36_stage_36;
    end


  //control_36, which is an e_mux
  assign p36_full_36 = ((read & !write) == 0)? full_35 :
    full_37;

  //control_reg_36, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_36 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_36 <= 0;
          else 
            full_36 <= p36_full_36;
    end


  //data_35, which is an e_mux
  assign p35_stage_35 = ((full_36 & ~clear_fifo) == 0)? data_in :
    stage_36;

  //data_reg_35, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_35 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_35))
          if (sync_reset & full_35 & !((full_36 == 0) & read & write))
              stage_35 <= 0;
          else 
            stage_35 <= p35_stage_35;
    end


  //control_35, which is an e_mux
  assign p35_full_35 = ((read & !write) == 0)? full_34 :
    full_36;

  //control_reg_35, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_35 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_35 <= 0;
          else 
            full_35 <= p35_full_35;
    end


  //data_34, which is an e_mux
  assign p34_stage_34 = ((full_35 & ~clear_fifo) == 0)? data_in :
    stage_35;

  //data_reg_34, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_34 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_34))
          if (sync_reset & full_34 & !((full_35 == 0) & read & write))
              stage_34 <= 0;
          else 
            stage_34 <= p34_stage_34;
    end


  //control_34, which is an e_mux
  assign p34_full_34 = ((read & !write) == 0)? full_33 :
    full_35;

  //control_reg_34, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_34 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_34 <= 0;
          else 
            full_34 <= p34_full_34;
    end


  //data_33, which is an e_mux
  assign p33_stage_33 = ((full_34 & ~clear_fifo) == 0)? data_in :
    stage_34;

  //data_reg_33, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_33 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_33))
          if (sync_reset & full_33 & !((full_34 == 0) & read & write))
              stage_33 <= 0;
          else 
            stage_33 <= p33_stage_33;
    end


  //control_33, which is an e_mux
  assign p33_full_33 = ((read & !write) == 0)? full_32 :
    full_34;

  //control_reg_33, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_33 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_33 <= 0;
          else 
            full_33 <= p33_full_33;
    end


  //data_32, which is an e_mux
  assign p32_stage_32 = ((full_33 & ~clear_fifo) == 0)? data_in :
    stage_33;

  //data_reg_32, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_32 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_32))
          if (sync_reset & full_32 & !((full_33 == 0) & read & write))
              stage_32 <= 0;
          else 
            stage_32 <= p32_stage_32;
    end


  //control_32, which is an e_mux
  assign p32_full_32 = ((read & !write) == 0)? full_31 :
    full_33;

  //control_reg_32, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_32 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_32 <= 0;
          else 
            full_32 <= p32_full_32;
    end


  //data_31, which is an e_mux
  assign p31_stage_31 = ((full_32 & ~clear_fifo) == 0)? data_in :
    stage_32;

  //data_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_31 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_31))
          if (sync_reset & full_31 & !((full_32 == 0) & read & write))
              stage_31 <= 0;
          else 
            stage_31 <= p31_stage_31;
    end


  //control_31, which is an e_mux
  assign p31_full_31 = ((read & !write) == 0)? full_30 :
    full_32;

  //control_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_31 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_31 <= 0;
          else 
            full_31 <= p31_full_31;
    end


  //data_30, which is an e_mux
  assign p30_stage_30 = ((full_31 & ~clear_fifo) == 0)? data_in :
    stage_31;

  //data_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_30 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_30))
          if (sync_reset & full_30 & !((full_31 == 0) & read & write))
              stage_30 <= 0;
          else 
            stage_30 <= p30_stage_30;
    end


  //control_30, which is an e_mux
  assign p30_full_30 = ((read & !write) == 0)? full_29 :
    full_31;

  //control_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_30 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_30 <= 0;
          else 
            full_30 <= p30_full_30;
    end


  //data_29, which is an e_mux
  assign p29_stage_29 = ((full_30 & ~clear_fifo) == 0)? data_in :
    stage_30;

  //data_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_29 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_29))
          if (sync_reset & full_29 & !((full_30 == 0) & read & write))
              stage_29 <= 0;
          else 
            stage_29 <= p29_stage_29;
    end


  //control_29, which is an e_mux
  assign p29_full_29 = ((read & !write) == 0)? full_28 :
    full_30;

  //control_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_29 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_29 <= 0;
          else 
            full_29 <= p29_full_29;
    end


  //data_28, which is an e_mux
  assign p28_stage_28 = ((full_29 & ~clear_fifo) == 0)? data_in :
    stage_29;

  //data_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_28 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_28))
          if (sync_reset & full_28 & !((full_29 == 0) & read & write))
              stage_28 <= 0;
          else 
            stage_28 <= p28_stage_28;
    end


  //control_28, which is an e_mux
  assign p28_full_28 = ((read & !write) == 0)? full_27 :
    full_29;

  //control_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_28 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_28 <= 0;
          else 
            full_28 <= p28_full_28;
    end


  //data_27, which is an e_mux
  assign p27_stage_27 = ((full_28 & ~clear_fifo) == 0)? data_in :
    stage_28;

  //data_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_27 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_27))
          if (sync_reset & full_27 & !((full_28 == 0) & read & write))
              stage_27 <= 0;
          else 
            stage_27 <= p27_stage_27;
    end


  //control_27, which is an e_mux
  assign p27_full_27 = ((read & !write) == 0)? full_26 :
    full_28;

  //control_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_27 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_27 <= 0;
          else 
            full_27 <= p27_full_27;
    end


  //data_26, which is an e_mux
  assign p26_stage_26 = ((full_27 & ~clear_fifo) == 0)? data_in :
    stage_27;

  //data_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_26 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_26))
          if (sync_reset & full_26 & !((full_27 == 0) & read & write))
              stage_26 <= 0;
          else 
            stage_26 <= p26_stage_26;
    end


  //control_26, which is an e_mux
  assign p26_full_26 = ((read & !write) == 0)? full_25 :
    full_27;

  //control_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_26 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_26 <= 0;
          else 
            full_26 <= p26_full_26;
    end


  //data_25, which is an e_mux
  assign p25_stage_25 = ((full_26 & ~clear_fifo) == 0)? data_in :
    stage_26;

  //data_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_25 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_25))
          if (sync_reset & full_25 & !((full_26 == 0) & read & write))
              stage_25 <= 0;
          else 
            stage_25 <= p25_stage_25;
    end


  //control_25, which is an e_mux
  assign p25_full_25 = ((read & !write) == 0)? full_24 :
    full_26;

  //control_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_25 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_25 <= 0;
          else 
            full_25 <= p25_full_25;
    end


  //data_24, which is an e_mux
  assign p24_stage_24 = ((full_25 & ~clear_fifo) == 0)? data_in :
    stage_25;

  //data_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_24 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_24))
          if (sync_reset & full_24 & !((full_25 == 0) & read & write))
              stage_24 <= 0;
          else 
            stage_24 <= p24_stage_24;
    end


  //control_24, which is an e_mux
  assign p24_full_24 = ((read & !write) == 0)? full_23 :
    full_25;

  //control_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_24 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_24 <= 0;
          else 
            full_24 <= p24_full_24;
    end


  //data_23, which is an e_mux
  assign p23_stage_23 = ((full_24 & ~clear_fifo) == 0)? data_in :
    stage_24;

  //data_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_23 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_23))
          if (sync_reset & full_23 & !((full_24 == 0) & read & write))
              stage_23 <= 0;
          else 
            stage_23 <= p23_stage_23;
    end


  //control_23, which is an e_mux
  assign p23_full_23 = ((read & !write) == 0)? full_22 :
    full_24;

  //control_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_23 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_23 <= 0;
          else 
            full_23 <= p23_full_23;
    end


  //data_22, which is an e_mux
  assign p22_stage_22 = ((full_23 & ~clear_fifo) == 0)? data_in :
    stage_23;

  //data_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_22 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_22))
          if (sync_reset & full_22 & !((full_23 == 0) & read & write))
              stage_22 <= 0;
          else 
            stage_22 <= p22_stage_22;
    end


  //control_22, which is an e_mux
  assign p22_full_22 = ((read & !write) == 0)? full_21 :
    full_23;

  //control_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_22 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_22 <= 0;
          else 
            full_22 <= p22_full_22;
    end


  //data_21, which is an e_mux
  assign p21_stage_21 = ((full_22 & ~clear_fifo) == 0)? data_in :
    stage_22;

  //data_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_21 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_21))
          if (sync_reset & full_21 & !((full_22 == 0) & read & write))
              stage_21 <= 0;
          else 
            stage_21 <= p21_stage_21;
    end


  //control_21, which is an e_mux
  assign p21_full_21 = ((read & !write) == 0)? full_20 :
    full_22;

  //control_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_21 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_21 <= 0;
          else 
            full_21 <= p21_full_21;
    end


  //data_20, which is an e_mux
  assign p20_stage_20 = ((full_21 & ~clear_fifo) == 0)? data_in :
    stage_21;

  //data_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_20 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_20))
          if (sync_reset & full_20 & !((full_21 == 0) & read & write))
              stage_20 <= 0;
          else 
            stage_20 <= p20_stage_20;
    end


  //control_20, which is an e_mux
  assign p20_full_20 = ((read & !write) == 0)? full_19 :
    full_21;

  //control_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_20 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_20 <= 0;
          else 
            full_20 <= p20_full_20;
    end


  //data_19, which is an e_mux
  assign p19_stage_19 = ((full_20 & ~clear_fifo) == 0)? data_in :
    stage_20;

  //data_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_19 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_19))
          if (sync_reset & full_19 & !((full_20 == 0) & read & write))
              stage_19 <= 0;
          else 
            stage_19 <= p19_stage_19;
    end


  //control_19, which is an e_mux
  assign p19_full_19 = ((read & !write) == 0)? full_18 :
    full_20;

  //control_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_19 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_19 <= 0;
          else 
            full_19 <= p19_full_19;
    end


  //data_18, which is an e_mux
  assign p18_stage_18 = ((full_19 & ~clear_fifo) == 0)? data_in :
    stage_19;

  //data_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_18 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_18))
          if (sync_reset & full_18 & !((full_19 == 0) & read & write))
              stage_18 <= 0;
          else 
            stage_18 <= p18_stage_18;
    end


  //control_18, which is an e_mux
  assign p18_full_18 = ((read & !write) == 0)? full_17 :
    full_19;

  //control_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_18 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_18 <= 0;
          else 
            full_18 <= p18_full_18;
    end


  //data_17, which is an e_mux
  assign p17_stage_17 = ((full_18 & ~clear_fifo) == 0)? data_in :
    stage_18;

  //data_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_17 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_17))
          if (sync_reset & full_17 & !((full_18 == 0) & read & write))
              stage_17 <= 0;
          else 
            stage_17 <= p17_stage_17;
    end


  //control_17, which is an e_mux
  assign p17_full_17 = ((read & !write) == 0)? full_16 :
    full_18;

  //control_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_17 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_17 <= 0;
          else 
            full_17 <= p17_full_17;
    end


  //data_16, which is an e_mux
  assign p16_stage_16 = ((full_17 & ~clear_fifo) == 0)? data_in :
    stage_17;

  //data_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_16 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_16))
          if (sync_reset & full_16 & !((full_17 == 0) & read & write))
              stage_16 <= 0;
          else 
            stage_16 <= p16_stage_16;
    end


  //control_16, which is an e_mux
  assign p16_full_16 = ((read & !write) == 0)? full_15 :
    full_17;

  //control_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_16 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_16 <= 0;
          else 
            full_16 <= p16_full_16;
    end


  //data_15, which is an e_mux
  assign p15_stage_15 = ((full_16 & ~clear_fifo) == 0)? data_in :
    stage_16;

  //data_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_15 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_15))
          if (sync_reset & full_15 & !((full_16 == 0) & read & write))
              stage_15 <= 0;
          else 
            stage_15 <= p15_stage_15;
    end


  //control_15, which is an e_mux
  assign p15_full_15 = ((read & !write) == 0)? full_14 :
    full_16;

  //control_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_15 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_15 <= 0;
          else 
            full_15 <= p15_full_15;
    end


  //data_14, which is an e_mux
  assign p14_stage_14 = ((full_15 & ~clear_fifo) == 0)? data_in :
    stage_15;

  //data_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_14 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_14))
          if (sync_reset & full_14 & !((full_15 == 0) & read & write))
              stage_14 <= 0;
          else 
            stage_14 <= p14_stage_14;
    end


  //control_14, which is an e_mux
  assign p14_full_14 = ((read & !write) == 0)? full_13 :
    full_15;

  //control_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_14 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_14 <= 0;
          else 
            full_14 <= p14_full_14;
    end


  //data_13, which is an e_mux
  assign p13_stage_13 = ((full_14 & ~clear_fifo) == 0)? data_in :
    stage_14;

  //data_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_13 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_13))
          if (sync_reset & full_13 & !((full_14 == 0) & read & write))
              stage_13 <= 0;
          else 
            stage_13 <= p13_stage_13;
    end


  //control_13, which is an e_mux
  assign p13_full_13 = ((read & !write) == 0)? full_12 :
    full_14;

  //control_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_13 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_13 <= 0;
          else 
            full_13 <= p13_full_13;
    end


  //data_12, which is an e_mux
  assign p12_stage_12 = ((full_13 & ~clear_fifo) == 0)? data_in :
    stage_13;

  //data_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_12 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_12))
          if (sync_reset & full_12 & !((full_13 == 0) & read & write))
              stage_12 <= 0;
          else 
            stage_12 <= p12_stage_12;
    end


  //control_12, which is an e_mux
  assign p12_full_12 = ((read & !write) == 0)? full_11 :
    full_13;

  //control_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_12 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_12 <= 0;
          else 
            full_12 <= p12_full_12;
    end


  //data_11, which is an e_mux
  assign p11_stage_11 = ((full_12 & ~clear_fifo) == 0)? data_in :
    stage_12;

  //data_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_11 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_11))
          if (sync_reset & full_11 & !((full_12 == 0) & read & write))
              stage_11 <= 0;
          else 
            stage_11 <= p11_stage_11;
    end


  //control_11, which is an e_mux
  assign p11_full_11 = ((read & !write) == 0)? full_10 :
    full_12;

  //control_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_11 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_11 <= 0;
          else 
            full_11 <= p11_full_11;
    end


  //data_10, which is an e_mux
  assign p10_stage_10 = ((full_11 & ~clear_fifo) == 0)? data_in :
    stage_11;

  //data_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_10 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_10))
          if (sync_reset & full_10 & !((full_11 == 0) & read & write))
              stage_10 <= 0;
          else 
            stage_10 <= p10_stage_10;
    end


  //control_10, which is an e_mux
  assign p10_full_10 = ((read & !write) == 0)? full_9 :
    full_11;

  //control_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_10 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_10 <= 0;
          else 
            full_10 <= p10_full_10;
    end


  //data_9, which is an e_mux
  assign p9_stage_9 = ((full_10 & ~clear_fifo) == 0)? data_in :
    stage_10;

  //data_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_9 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_9))
          if (sync_reset & full_9 & !((full_10 == 0) & read & write))
              stage_9 <= 0;
          else 
            stage_9 <= p9_stage_9;
    end


  //control_9, which is an e_mux
  assign p9_full_9 = ((read & !write) == 0)? full_8 :
    full_10;

  //control_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_9 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_9 <= 0;
          else 
            full_9 <= p9_full_9;
    end


  //data_8, which is an e_mux
  assign p8_stage_8 = ((full_9 & ~clear_fifo) == 0)? data_in :
    stage_9;

  //data_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_8 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_8))
          if (sync_reset & full_8 & !((full_9 == 0) & read & write))
              stage_8 <= 0;
          else 
            stage_8 <= p8_stage_8;
    end


  //control_8, which is an e_mux
  assign p8_full_8 = ((read & !write) == 0)? full_7 :
    full_9;

  //control_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_8 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_8 <= 0;
          else 
            full_8 <= p8_full_8;
    end


  //data_7, which is an e_mux
  assign p7_stage_7 = ((full_8 & ~clear_fifo) == 0)? data_in :
    stage_8;

  //data_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_7 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_7))
          if (sync_reset & full_7 & !((full_8 == 0) & read & write))
              stage_7 <= 0;
          else 
            stage_7 <= p7_stage_7;
    end


  //control_7, which is an e_mux
  assign p7_full_7 = ((read & !write) == 0)? full_6 :
    full_8;

  //control_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_7 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_7 <= 0;
          else 
            full_7 <= p7_full_7;
    end


  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    stage_7;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    full_7;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_instruction_master_to_cpu_ddr_clock_bridge_s1_module (
                                                                               // inputs:
                                                                                clear_fifo,
                                                                                clk,
                                                                                data_in,
                                                                                read,
                                                                                reset_n,
                                                                                sync_reset,
                                                                                write,

                                                                               // outputs:
                                                                                data_out,
                                                                                empty,
                                                                                fifo_contains_ones_n,
                                                                                full
                                                                             )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_10;
  reg              full_11;
  reg              full_12;
  reg              full_13;
  reg              full_14;
  reg              full_15;
  reg              full_16;
  reg              full_17;
  reg              full_18;
  reg              full_19;
  reg              full_2;
  reg              full_20;
  reg              full_21;
  reg              full_22;
  reg              full_23;
  reg              full_24;
  reg              full_25;
  reg              full_26;
  reg              full_27;
  reg              full_28;
  reg              full_29;
  reg              full_3;
  reg              full_30;
  reg              full_31;
  reg              full_32;
  reg              full_33;
  reg              full_34;
  reg              full_35;
  reg              full_36;
  reg              full_37;
  reg              full_38;
  reg              full_39;
  reg              full_4;
  reg              full_40;
  reg              full_41;
  reg              full_42;
  reg              full_43;
  reg              full_44;
  reg              full_45;
  reg              full_46;
  reg              full_47;
  wire             full_48;
  reg              full_5;
  reg              full_6;
  reg              full_7;
  reg              full_8;
  reg              full_9;
  reg     [  6: 0] how_many_ones;
  wire    [  6: 0] one_count_minus_one;
  wire    [  6: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p10_full_10;
  wire             p10_stage_10;
  wire             p11_full_11;
  wire             p11_stage_11;
  wire             p12_full_12;
  wire             p12_stage_12;
  wire             p13_full_13;
  wire             p13_stage_13;
  wire             p14_full_14;
  wire             p14_stage_14;
  wire             p15_full_15;
  wire             p15_stage_15;
  wire             p16_full_16;
  wire             p16_stage_16;
  wire             p17_full_17;
  wire             p17_stage_17;
  wire             p18_full_18;
  wire             p18_stage_18;
  wire             p19_full_19;
  wire             p19_stage_19;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p20_full_20;
  wire             p20_stage_20;
  wire             p21_full_21;
  wire             p21_stage_21;
  wire             p22_full_22;
  wire             p22_stage_22;
  wire             p23_full_23;
  wire             p23_stage_23;
  wire             p24_full_24;
  wire             p24_stage_24;
  wire             p25_full_25;
  wire             p25_stage_25;
  wire             p26_full_26;
  wire             p26_stage_26;
  wire             p27_full_27;
  wire             p27_stage_27;
  wire             p28_full_28;
  wire             p28_stage_28;
  wire             p29_full_29;
  wire             p29_stage_29;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p30_full_30;
  wire             p30_stage_30;
  wire             p31_full_31;
  wire             p31_stage_31;
  wire             p32_full_32;
  wire             p32_stage_32;
  wire             p33_full_33;
  wire             p33_stage_33;
  wire             p34_full_34;
  wire             p34_stage_34;
  wire             p35_full_35;
  wire             p35_stage_35;
  wire             p36_full_36;
  wire             p36_stage_36;
  wire             p37_full_37;
  wire             p37_stage_37;
  wire             p38_full_38;
  wire             p38_stage_38;
  wire             p39_full_39;
  wire             p39_stage_39;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p40_full_40;
  wire             p40_stage_40;
  wire             p41_full_41;
  wire             p41_stage_41;
  wire             p42_full_42;
  wire             p42_stage_42;
  wire             p43_full_43;
  wire             p43_stage_43;
  wire             p44_full_44;
  wire             p44_stage_44;
  wire             p45_full_45;
  wire             p45_stage_45;
  wire             p46_full_46;
  wire             p46_stage_46;
  wire             p47_full_47;
  wire             p47_stage_47;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  wire             p7_full_7;
  wire             p7_stage_7;
  wire             p8_full_8;
  wire             p8_stage_8;
  wire             p9_full_9;
  wire             p9_stage_9;
  reg              stage_0;
  reg              stage_1;
  reg              stage_10;
  reg              stage_11;
  reg              stage_12;
  reg              stage_13;
  reg              stage_14;
  reg              stage_15;
  reg              stage_16;
  reg              stage_17;
  reg              stage_18;
  reg              stage_19;
  reg              stage_2;
  reg              stage_20;
  reg              stage_21;
  reg              stage_22;
  reg              stage_23;
  reg              stage_24;
  reg              stage_25;
  reg              stage_26;
  reg              stage_27;
  reg              stage_28;
  reg              stage_29;
  reg              stage_3;
  reg              stage_30;
  reg              stage_31;
  reg              stage_32;
  reg              stage_33;
  reg              stage_34;
  reg              stage_35;
  reg              stage_36;
  reg              stage_37;
  reg              stage_38;
  reg              stage_39;
  reg              stage_4;
  reg              stage_40;
  reg              stage_41;
  reg              stage_42;
  reg              stage_43;
  reg              stage_44;
  reg              stage_45;
  reg              stage_46;
  reg              stage_47;
  reg              stage_5;
  reg              stage_6;
  reg              stage_7;
  reg              stage_8;
  reg              stage_9;
  wire    [  6: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_47;
  assign empty = !full_0;
  assign full_48 = 0;
  //data_47, which is an e_mux
  assign p47_stage_47 = ((full_48 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_47, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_47 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_47))
          if (sync_reset & full_47 & !((full_48 == 0) & read & write))
              stage_47 <= 0;
          else 
            stage_47 <= p47_stage_47;
    end


  //control_47, which is an e_mux
  assign p47_full_47 = ((read & !write) == 0)? full_46 :
    0;

  //control_reg_47, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_47 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_47 <= 0;
          else 
            full_47 <= p47_full_47;
    end


  //data_46, which is an e_mux
  assign p46_stage_46 = ((full_47 & ~clear_fifo) == 0)? data_in :
    stage_47;

  //data_reg_46, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_46 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_46))
          if (sync_reset & full_46 & !((full_47 == 0) & read & write))
              stage_46 <= 0;
          else 
            stage_46 <= p46_stage_46;
    end


  //control_46, which is an e_mux
  assign p46_full_46 = ((read & !write) == 0)? full_45 :
    full_47;

  //control_reg_46, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_46 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_46 <= 0;
          else 
            full_46 <= p46_full_46;
    end


  //data_45, which is an e_mux
  assign p45_stage_45 = ((full_46 & ~clear_fifo) == 0)? data_in :
    stage_46;

  //data_reg_45, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_45 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_45))
          if (sync_reset & full_45 & !((full_46 == 0) & read & write))
              stage_45 <= 0;
          else 
            stage_45 <= p45_stage_45;
    end


  //control_45, which is an e_mux
  assign p45_full_45 = ((read & !write) == 0)? full_44 :
    full_46;

  //control_reg_45, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_45 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_45 <= 0;
          else 
            full_45 <= p45_full_45;
    end


  //data_44, which is an e_mux
  assign p44_stage_44 = ((full_45 & ~clear_fifo) == 0)? data_in :
    stage_45;

  //data_reg_44, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_44 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_44))
          if (sync_reset & full_44 & !((full_45 == 0) & read & write))
              stage_44 <= 0;
          else 
            stage_44 <= p44_stage_44;
    end


  //control_44, which is an e_mux
  assign p44_full_44 = ((read & !write) == 0)? full_43 :
    full_45;

  //control_reg_44, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_44 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_44 <= 0;
          else 
            full_44 <= p44_full_44;
    end


  //data_43, which is an e_mux
  assign p43_stage_43 = ((full_44 & ~clear_fifo) == 0)? data_in :
    stage_44;

  //data_reg_43, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_43 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_43))
          if (sync_reset & full_43 & !((full_44 == 0) & read & write))
              stage_43 <= 0;
          else 
            stage_43 <= p43_stage_43;
    end


  //control_43, which is an e_mux
  assign p43_full_43 = ((read & !write) == 0)? full_42 :
    full_44;

  //control_reg_43, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_43 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_43 <= 0;
          else 
            full_43 <= p43_full_43;
    end


  //data_42, which is an e_mux
  assign p42_stage_42 = ((full_43 & ~clear_fifo) == 0)? data_in :
    stage_43;

  //data_reg_42, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_42 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_42))
          if (sync_reset & full_42 & !((full_43 == 0) & read & write))
              stage_42 <= 0;
          else 
            stage_42 <= p42_stage_42;
    end


  //control_42, which is an e_mux
  assign p42_full_42 = ((read & !write) == 0)? full_41 :
    full_43;

  //control_reg_42, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_42 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_42 <= 0;
          else 
            full_42 <= p42_full_42;
    end


  //data_41, which is an e_mux
  assign p41_stage_41 = ((full_42 & ~clear_fifo) == 0)? data_in :
    stage_42;

  //data_reg_41, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_41 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_41))
          if (sync_reset & full_41 & !((full_42 == 0) & read & write))
              stage_41 <= 0;
          else 
            stage_41 <= p41_stage_41;
    end


  //control_41, which is an e_mux
  assign p41_full_41 = ((read & !write) == 0)? full_40 :
    full_42;

  //control_reg_41, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_41 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_41 <= 0;
          else 
            full_41 <= p41_full_41;
    end


  //data_40, which is an e_mux
  assign p40_stage_40 = ((full_41 & ~clear_fifo) == 0)? data_in :
    stage_41;

  //data_reg_40, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_40 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_40))
          if (sync_reset & full_40 & !((full_41 == 0) & read & write))
              stage_40 <= 0;
          else 
            stage_40 <= p40_stage_40;
    end


  //control_40, which is an e_mux
  assign p40_full_40 = ((read & !write) == 0)? full_39 :
    full_41;

  //control_reg_40, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_40 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_40 <= 0;
          else 
            full_40 <= p40_full_40;
    end


  //data_39, which is an e_mux
  assign p39_stage_39 = ((full_40 & ~clear_fifo) == 0)? data_in :
    stage_40;

  //data_reg_39, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_39 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_39))
          if (sync_reset & full_39 & !((full_40 == 0) & read & write))
              stage_39 <= 0;
          else 
            stage_39 <= p39_stage_39;
    end


  //control_39, which is an e_mux
  assign p39_full_39 = ((read & !write) == 0)? full_38 :
    full_40;

  //control_reg_39, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_39 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_39 <= 0;
          else 
            full_39 <= p39_full_39;
    end


  //data_38, which is an e_mux
  assign p38_stage_38 = ((full_39 & ~clear_fifo) == 0)? data_in :
    stage_39;

  //data_reg_38, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_38 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_38))
          if (sync_reset & full_38 & !((full_39 == 0) & read & write))
              stage_38 <= 0;
          else 
            stage_38 <= p38_stage_38;
    end


  //control_38, which is an e_mux
  assign p38_full_38 = ((read & !write) == 0)? full_37 :
    full_39;

  //control_reg_38, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_38 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_38 <= 0;
          else 
            full_38 <= p38_full_38;
    end


  //data_37, which is an e_mux
  assign p37_stage_37 = ((full_38 & ~clear_fifo) == 0)? data_in :
    stage_38;

  //data_reg_37, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_37 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_37))
          if (sync_reset & full_37 & !((full_38 == 0) & read & write))
              stage_37 <= 0;
          else 
            stage_37 <= p37_stage_37;
    end


  //control_37, which is an e_mux
  assign p37_full_37 = ((read & !write) == 0)? full_36 :
    full_38;

  //control_reg_37, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_37 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_37 <= 0;
          else 
            full_37 <= p37_full_37;
    end


  //data_36, which is an e_mux
  assign p36_stage_36 = ((full_37 & ~clear_fifo) == 0)? data_in :
    stage_37;

  //data_reg_36, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_36 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_36))
          if (sync_reset & full_36 & !((full_37 == 0) & read & write))
              stage_36 <= 0;
          else 
            stage_36 <= p36_stage_36;
    end


  //control_36, which is an e_mux
  assign p36_full_36 = ((read & !write) == 0)? full_35 :
    full_37;

  //control_reg_36, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_36 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_36 <= 0;
          else 
            full_36 <= p36_full_36;
    end


  //data_35, which is an e_mux
  assign p35_stage_35 = ((full_36 & ~clear_fifo) == 0)? data_in :
    stage_36;

  //data_reg_35, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_35 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_35))
          if (sync_reset & full_35 & !((full_36 == 0) & read & write))
              stage_35 <= 0;
          else 
            stage_35 <= p35_stage_35;
    end


  //control_35, which is an e_mux
  assign p35_full_35 = ((read & !write) == 0)? full_34 :
    full_36;

  //control_reg_35, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_35 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_35 <= 0;
          else 
            full_35 <= p35_full_35;
    end


  //data_34, which is an e_mux
  assign p34_stage_34 = ((full_35 & ~clear_fifo) == 0)? data_in :
    stage_35;

  //data_reg_34, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_34 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_34))
          if (sync_reset & full_34 & !((full_35 == 0) & read & write))
              stage_34 <= 0;
          else 
            stage_34 <= p34_stage_34;
    end


  //control_34, which is an e_mux
  assign p34_full_34 = ((read & !write) == 0)? full_33 :
    full_35;

  //control_reg_34, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_34 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_34 <= 0;
          else 
            full_34 <= p34_full_34;
    end


  //data_33, which is an e_mux
  assign p33_stage_33 = ((full_34 & ~clear_fifo) == 0)? data_in :
    stage_34;

  //data_reg_33, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_33 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_33))
          if (sync_reset & full_33 & !((full_34 == 0) & read & write))
              stage_33 <= 0;
          else 
            stage_33 <= p33_stage_33;
    end


  //control_33, which is an e_mux
  assign p33_full_33 = ((read & !write) == 0)? full_32 :
    full_34;

  //control_reg_33, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_33 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_33 <= 0;
          else 
            full_33 <= p33_full_33;
    end


  //data_32, which is an e_mux
  assign p32_stage_32 = ((full_33 & ~clear_fifo) == 0)? data_in :
    stage_33;

  //data_reg_32, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_32 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_32))
          if (sync_reset & full_32 & !((full_33 == 0) & read & write))
              stage_32 <= 0;
          else 
            stage_32 <= p32_stage_32;
    end


  //control_32, which is an e_mux
  assign p32_full_32 = ((read & !write) == 0)? full_31 :
    full_33;

  //control_reg_32, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_32 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_32 <= 0;
          else 
            full_32 <= p32_full_32;
    end


  //data_31, which is an e_mux
  assign p31_stage_31 = ((full_32 & ~clear_fifo) == 0)? data_in :
    stage_32;

  //data_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_31 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_31))
          if (sync_reset & full_31 & !((full_32 == 0) & read & write))
              stage_31 <= 0;
          else 
            stage_31 <= p31_stage_31;
    end


  //control_31, which is an e_mux
  assign p31_full_31 = ((read & !write) == 0)? full_30 :
    full_32;

  //control_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_31 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_31 <= 0;
          else 
            full_31 <= p31_full_31;
    end


  //data_30, which is an e_mux
  assign p30_stage_30 = ((full_31 & ~clear_fifo) == 0)? data_in :
    stage_31;

  //data_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_30 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_30))
          if (sync_reset & full_30 & !((full_31 == 0) & read & write))
              stage_30 <= 0;
          else 
            stage_30 <= p30_stage_30;
    end


  //control_30, which is an e_mux
  assign p30_full_30 = ((read & !write) == 0)? full_29 :
    full_31;

  //control_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_30 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_30 <= 0;
          else 
            full_30 <= p30_full_30;
    end


  //data_29, which is an e_mux
  assign p29_stage_29 = ((full_30 & ~clear_fifo) == 0)? data_in :
    stage_30;

  //data_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_29 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_29))
          if (sync_reset & full_29 & !((full_30 == 0) & read & write))
              stage_29 <= 0;
          else 
            stage_29 <= p29_stage_29;
    end


  //control_29, which is an e_mux
  assign p29_full_29 = ((read & !write) == 0)? full_28 :
    full_30;

  //control_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_29 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_29 <= 0;
          else 
            full_29 <= p29_full_29;
    end


  //data_28, which is an e_mux
  assign p28_stage_28 = ((full_29 & ~clear_fifo) == 0)? data_in :
    stage_29;

  //data_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_28 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_28))
          if (sync_reset & full_28 & !((full_29 == 0) & read & write))
              stage_28 <= 0;
          else 
            stage_28 <= p28_stage_28;
    end


  //control_28, which is an e_mux
  assign p28_full_28 = ((read & !write) == 0)? full_27 :
    full_29;

  //control_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_28 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_28 <= 0;
          else 
            full_28 <= p28_full_28;
    end


  //data_27, which is an e_mux
  assign p27_stage_27 = ((full_28 & ~clear_fifo) == 0)? data_in :
    stage_28;

  //data_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_27 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_27))
          if (sync_reset & full_27 & !((full_28 == 0) & read & write))
              stage_27 <= 0;
          else 
            stage_27 <= p27_stage_27;
    end


  //control_27, which is an e_mux
  assign p27_full_27 = ((read & !write) == 0)? full_26 :
    full_28;

  //control_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_27 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_27 <= 0;
          else 
            full_27 <= p27_full_27;
    end


  //data_26, which is an e_mux
  assign p26_stage_26 = ((full_27 & ~clear_fifo) == 0)? data_in :
    stage_27;

  //data_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_26 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_26))
          if (sync_reset & full_26 & !((full_27 == 0) & read & write))
              stage_26 <= 0;
          else 
            stage_26 <= p26_stage_26;
    end


  //control_26, which is an e_mux
  assign p26_full_26 = ((read & !write) == 0)? full_25 :
    full_27;

  //control_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_26 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_26 <= 0;
          else 
            full_26 <= p26_full_26;
    end


  //data_25, which is an e_mux
  assign p25_stage_25 = ((full_26 & ~clear_fifo) == 0)? data_in :
    stage_26;

  //data_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_25 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_25))
          if (sync_reset & full_25 & !((full_26 == 0) & read & write))
              stage_25 <= 0;
          else 
            stage_25 <= p25_stage_25;
    end


  //control_25, which is an e_mux
  assign p25_full_25 = ((read & !write) == 0)? full_24 :
    full_26;

  //control_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_25 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_25 <= 0;
          else 
            full_25 <= p25_full_25;
    end


  //data_24, which is an e_mux
  assign p24_stage_24 = ((full_25 & ~clear_fifo) == 0)? data_in :
    stage_25;

  //data_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_24 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_24))
          if (sync_reset & full_24 & !((full_25 == 0) & read & write))
              stage_24 <= 0;
          else 
            stage_24 <= p24_stage_24;
    end


  //control_24, which is an e_mux
  assign p24_full_24 = ((read & !write) == 0)? full_23 :
    full_25;

  //control_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_24 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_24 <= 0;
          else 
            full_24 <= p24_full_24;
    end


  //data_23, which is an e_mux
  assign p23_stage_23 = ((full_24 & ~clear_fifo) == 0)? data_in :
    stage_24;

  //data_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_23 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_23))
          if (sync_reset & full_23 & !((full_24 == 0) & read & write))
              stage_23 <= 0;
          else 
            stage_23 <= p23_stage_23;
    end


  //control_23, which is an e_mux
  assign p23_full_23 = ((read & !write) == 0)? full_22 :
    full_24;

  //control_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_23 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_23 <= 0;
          else 
            full_23 <= p23_full_23;
    end


  //data_22, which is an e_mux
  assign p22_stage_22 = ((full_23 & ~clear_fifo) == 0)? data_in :
    stage_23;

  //data_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_22 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_22))
          if (sync_reset & full_22 & !((full_23 == 0) & read & write))
              stage_22 <= 0;
          else 
            stage_22 <= p22_stage_22;
    end


  //control_22, which is an e_mux
  assign p22_full_22 = ((read & !write) == 0)? full_21 :
    full_23;

  //control_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_22 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_22 <= 0;
          else 
            full_22 <= p22_full_22;
    end


  //data_21, which is an e_mux
  assign p21_stage_21 = ((full_22 & ~clear_fifo) == 0)? data_in :
    stage_22;

  //data_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_21 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_21))
          if (sync_reset & full_21 & !((full_22 == 0) & read & write))
              stage_21 <= 0;
          else 
            stage_21 <= p21_stage_21;
    end


  //control_21, which is an e_mux
  assign p21_full_21 = ((read & !write) == 0)? full_20 :
    full_22;

  //control_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_21 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_21 <= 0;
          else 
            full_21 <= p21_full_21;
    end


  //data_20, which is an e_mux
  assign p20_stage_20 = ((full_21 & ~clear_fifo) == 0)? data_in :
    stage_21;

  //data_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_20 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_20))
          if (sync_reset & full_20 & !((full_21 == 0) & read & write))
              stage_20 <= 0;
          else 
            stage_20 <= p20_stage_20;
    end


  //control_20, which is an e_mux
  assign p20_full_20 = ((read & !write) == 0)? full_19 :
    full_21;

  //control_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_20 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_20 <= 0;
          else 
            full_20 <= p20_full_20;
    end


  //data_19, which is an e_mux
  assign p19_stage_19 = ((full_20 & ~clear_fifo) == 0)? data_in :
    stage_20;

  //data_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_19 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_19))
          if (sync_reset & full_19 & !((full_20 == 0) & read & write))
              stage_19 <= 0;
          else 
            stage_19 <= p19_stage_19;
    end


  //control_19, which is an e_mux
  assign p19_full_19 = ((read & !write) == 0)? full_18 :
    full_20;

  //control_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_19 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_19 <= 0;
          else 
            full_19 <= p19_full_19;
    end


  //data_18, which is an e_mux
  assign p18_stage_18 = ((full_19 & ~clear_fifo) == 0)? data_in :
    stage_19;

  //data_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_18 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_18))
          if (sync_reset & full_18 & !((full_19 == 0) & read & write))
              stage_18 <= 0;
          else 
            stage_18 <= p18_stage_18;
    end


  //control_18, which is an e_mux
  assign p18_full_18 = ((read & !write) == 0)? full_17 :
    full_19;

  //control_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_18 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_18 <= 0;
          else 
            full_18 <= p18_full_18;
    end


  //data_17, which is an e_mux
  assign p17_stage_17 = ((full_18 & ~clear_fifo) == 0)? data_in :
    stage_18;

  //data_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_17 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_17))
          if (sync_reset & full_17 & !((full_18 == 0) & read & write))
              stage_17 <= 0;
          else 
            stage_17 <= p17_stage_17;
    end


  //control_17, which is an e_mux
  assign p17_full_17 = ((read & !write) == 0)? full_16 :
    full_18;

  //control_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_17 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_17 <= 0;
          else 
            full_17 <= p17_full_17;
    end


  //data_16, which is an e_mux
  assign p16_stage_16 = ((full_17 & ~clear_fifo) == 0)? data_in :
    stage_17;

  //data_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_16 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_16))
          if (sync_reset & full_16 & !((full_17 == 0) & read & write))
              stage_16 <= 0;
          else 
            stage_16 <= p16_stage_16;
    end


  //control_16, which is an e_mux
  assign p16_full_16 = ((read & !write) == 0)? full_15 :
    full_17;

  //control_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_16 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_16 <= 0;
          else 
            full_16 <= p16_full_16;
    end


  //data_15, which is an e_mux
  assign p15_stage_15 = ((full_16 & ~clear_fifo) == 0)? data_in :
    stage_16;

  //data_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_15 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_15))
          if (sync_reset & full_15 & !((full_16 == 0) & read & write))
              stage_15 <= 0;
          else 
            stage_15 <= p15_stage_15;
    end


  //control_15, which is an e_mux
  assign p15_full_15 = ((read & !write) == 0)? full_14 :
    full_16;

  //control_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_15 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_15 <= 0;
          else 
            full_15 <= p15_full_15;
    end


  //data_14, which is an e_mux
  assign p14_stage_14 = ((full_15 & ~clear_fifo) == 0)? data_in :
    stage_15;

  //data_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_14 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_14))
          if (sync_reset & full_14 & !((full_15 == 0) & read & write))
              stage_14 <= 0;
          else 
            stage_14 <= p14_stage_14;
    end


  //control_14, which is an e_mux
  assign p14_full_14 = ((read & !write) == 0)? full_13 :
    full_15;

  //control_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_14 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_14 <= 0;
          else 
            full_14 <= p14_full_14;
    end


  //data_13, which is an e_mux
  assign p13_stage_13 = ((full_14 & ~clear_fifo) == 0)? data_in :
    stage_14;

  //data_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_13 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_13))
          if (sync_reset & full_13 & !((full_14 == 0) & read & write))
              stage_13 <= 0;
          else 
            stage_13 <= p13_stage_13;
    end


  //control_13, which is an e_mux
  assign p13_full_13 = ((read & !write) == 0)? full_12 :
    full_14;

  //control_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_13 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_13 <= 0;
          else 
            full_13 <= p13_full_13;
    end


  //data_12, which is an e_mux
  assign p12_stage_12 = ((full_13 & ~clear_fifo) == 0)? data_in :
    stage_13;

  //data_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_12 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_12))
          if (sync_reset & full_12 & !((full_13 == 0) & read & write))
              stage_12 <= 0;
          else 
            stage_12 <= p12_stage_12;
    end


  //control_12, which is an e_mux
  assign p12_full_12 = ((read & !write) == 0)? full_11 :
    full_13;

  //control_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_12 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_12 <= 0;
          else 
            full_12 <= p12_full_12;
    end


  //data_11, which is an e_mux
  assign p11_stage_11 = ((full_12 & ~clear_fifo) == 0)? data_in :
    stage_12;

  //data_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_11 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_11))
          if (sync_reset & full_11 & !((full_12 == 0) & read & write))
              stage_11 <= 0;
          else 
            stage_11 <= p11_stage_11;
    end


  //control_11, which is an e_mux
  assign p11_full_11 = ((read & !write) == 0)? full_10 :
    full_12;

  //control_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_11 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_11 <= 0;
          else 
            full_11 <= p11_full_11;
    end


  //data_10, which is an e_mux
  assign p10_stage_10 = ((full_11 & ~clear_fifo) == 0)? data_in :
    stage_11;

  //data_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_10 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_10))
          if (sync_reset & full_10 & !((full_11 == 0) & read & write))
              stage_10 <= 0;
          else 
            stage_10 <= p10_stage_10;
    end


  //control_10, which is an e_mux
  assign p10_full_10 = ((read & !write) == 0)? full_9 :
    full_11;

  //control_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_10 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_10 <= 0;
          else 
            full_10 <= p10_full_10;
    end


  //data_9, which is an e_mux
  assign p9_stage_9 = ((full_10 & ~clear_fifo) == 0)? data_in :
    stage_10;

  //data_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_9 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_9))
          if (sync_reset & full_9 & !((full_10 == 0) & read & write))
              stage_9 <= 0;
          else 
            stage_9 <= p9_stage_9;
    end


  //control_9, which is an e_mux
  assign p9_full_9 = ((read & !write) == 0)? full_8 :
    full_10;

  //control_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_9 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_9 <= 0;
          else 
            full_9 <= p9_full_9;
    end


  //data_8, which is an e_mux
  assign p8_stage_8 = ((full_9 & ~clear_fifo) == 0)? data_in :
    stage_9;

  //data_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_8 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_8))
          if (sync_reset & full_8 & !((full_9 == 0) & read & write))
              stage_8 <= 0;
          else 
            stage_8 <= p8_stage_8;
    end


  //control_8, which is an e_mux
  assign p8_full_8 = ((read & !write) == 0)? full_7 :
    full_9;

  //control_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_8 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_8 <= 0;
          else 
            full_8 <= p8_full_8;
    end


  //data_7, which is an e_mux
  assign p7_stage_7 = ((full_8 & ~clear_fifo) == 0)? data_in :
    stage_8;

  //data_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_7 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_7))
          if (sync_reset & full_7 & !((full_8 == 0) & read & write))
              stage_7 <= 0;
          else 
            stage_7 <= p7_stage_7;
    end


  //control_7, which is an e_mux
  assign p7_full_7 = ((read & !write) == 0)? full_6 :
    full_8;

  //control_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_7 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_7 <= 0;
          else 
            full_7 <= p7_full_7;
    end


  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    stage_7;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    full_7;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_ddr_clock_bridge_s1_arbitrator (
                                            // inputs:
                                             clk,
                                             cpu_data_master_address_to_slave,
                                             cpu_data_master_byteenable,
                                             cpu_data_master_latency_counter,
                                             cpu_data_master_read,
                                             cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register,
                                             cpu_data_master_read_data_valid_slow_peripheral_bridge_s1_shift_register,
                                             cpu_data_master_write,
                                             cpu_data_master_writedata,
                                             cpu_ddr_clock_bridge_s1_endofpacket,
                                             cpu_ddr_clock_bridge_s1_readdata,
                                             cpu_ddr_clock_bridge_s1_readdatavalid,
                                             cpu_ddr_clock_bridge_s1_waitrequest,
                                             cpu_instruction_master_address_to_slave,
                                             cpu_instruction_master_latency_counter,
                                             cpu_instruction_master_read,
                                             cpu_instruction_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register,
                                             reset_n,

                                            // outputs:
                                             cpu_data_master_granted_cpu_ddr_clock_bridge_s1,
                                             cpu_data_master_qualified_request_cpu_ddr_clock_bridge_s1,
                                             cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1,
                                             cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register,
                                             cpu_data_master_requests_cpu_ddr_clock_bridge_s1,
                                             cpu_ddr_clock_bridge_s1_address,
                                             cpu_ddr_clock_bridge_s1_byteenable,
                                             cpu_ddr_clock_bridge_s1_endofpacket_from_sa,
                                             cpu_ddr_clock_bridge_s1_nativeaddress,
                                             cpu_ddr_clock_bridge_s1_read,
                                             cpu_ddr_clock_bridge_s1_readdata_from_sa,
                                             cpu_ddr_clock_bridge_s1_reset_n,
                                             cpu_ddr_clock_bridge_s1_waitrequest_from_sa,
                                             cpu_ddr_clock_bridge_s1_write,
                                             cpu_ddr_clock_bridge_s1_writedata,
                                             cpu_instruction_master_granted_cpu_ddr_clock_bridge_s1,
                                             cpu_instruction_master_qualified_request_cpu_ddr_clock_bridge_s1,
                                             cpu_instruction_master_read_data_valid_cpu_ddr_clock_bridge_s1,
                                             cpu_instruction_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register,
                                             cpu_instruction_master_requests_cpu_ddr_clock_bridge_s1,
                                             d1_cpu_ddr_clock_bridge_s1_end_xfer
                                          )
;

  output           cpu_data_master_granted_cpu_ddr_clock_bridge_s1;
  output           cpu_data_master_qualified_request_cpu_ddr_clock_bridge_s1;
  output           cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1;
  output           cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register;
  output           cpu_data_master_requests_cpu_ddr_clock_bridge_s1;
  output  [ 22: 0] cpu_ddr_clock_bridge_s1_address;
  output  [  3: 0] cpu_ddr_clock_bridge_s1_byteenable;
  output           cpu_ddr_clock_bridge_s1_endofpacket_from_sa;
  output  [ 22: 0] cpu_ddr_clock_bridge_s1_nativeaddress;
  output           cpu_ddr_clock_bridge_s1_read;
  output  [ 31: 0] cpu_ddr_clock_bridge_s1_readdata_from_sa;
  output           cpu_ddr_clock_bridge_s1_reset_n;
  output           cpu_ddr_clock_bridge_s1_waitrequest_from_sa;
  output           cpu_ddr_clock_bridge_s1_write;
  output  [ 31: 0] cpu_ddr_clock_bridge_s1_writedata;
  output           cpu_instruction_master_granted_cpu_ddr_clock_bridge_s1;
  output           cpu_instruction_master_qualified_request_cpu_ddr_clock_bridge_s1;
  output           cpu_instruction_master_read_data_valid_cpu_ddr_clock_bridge_s1;
  output           cpu_instruction_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register;
  output           cpu_instruction_master_requests_cpu_ddr_clock_bridge_s1;
  output           d1_cpu_ddr_clock_bridge_s1_end_xfer;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register;
  input            cpu_data_master_read_data_valid_slow_peripheral_bridge_s1_shift_register;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            cpu_ddr_clock_bridge_s1_endofpacket;
  input   [ 31: 0] cpu_ddr_clock_bridge_s1_readdata;
  input            cpu_ddr_clock_bridge_s1_readdatavalid;
  input            cpu_ddr_clock_bridge_s1_waitrequest;
  input   [ 26: 0] cpu_instruction_master_address_to_slave;
  input            cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input            cpu_instruction_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_cpu_ddr_clock_bridge_s1;
  wire             cpu_data_master_qualified_request_cpu_ddr_clock_bridge_s1;
  wire             cpu_data_master_rdv_fifo_empty_cpu_ddr_clock_bridge_s1;
  wire             cpu_data_master_rdv_fifo_output_from_cpu_ddr_clock_bridge_s1;
  wire             cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1;
  wire             cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register;
  wire             cpu_data_master_requests_cpu_ddr_clock_bridge_s1;
  wire             cpu_data_master_saved_grant_cpu_ddr_clock_bridge_s1;
  wire    [ 22: 0] cpu_ddr_clock_bridge_s1_address;
  wire             cpu_ddr_clock_bridge_s1_allgrants;
  wire             cpu_ddr_clock_bridge_s1_allow_new_arb_cycle;
  wire             cpu_ddr_clock_bridge_s1_any_bursting_master_saved_grant;
  wire             cpu_ddr_clock_bridge_s1_any_continuerequest;
  reg     [  1: 0] cpu_ddr_clock_bridge_s1_arb_addend;
  wire             cpu_ddr_clock_bridge_s1_arb_counter_enable;
  reg     [  3: 0] cpu_ddr_clock_bridge_s1_arb_share_counter;
  wire    [  3: 0] cpu_ddr_clock_bridge_s1_arb_share_counter_next_value;
  wire    [  3: 0] cpu_ddr_clock_bridge_s1_arb_share_set_values;
  wire    [  1: 0] cpu_ddr_clock_bridge_s1_arb_winner;
  wire             cpu_ddr_clock_bridge_s1_arbitration_holdoff_internal;
  wire             cpu_ddr_clock_bridge_s1_beginbursttransfer_internal;
  wire             cpu_ddr_clock_bridge_s1_begins_xfer;
  wire    [  3: 0] cpu_ddr_clock_bridge_s1_byteenable;
  wire    [  3: 0] cpu_ddr_clock_bridge_s1_chosen_master_double_vector;
  wire    [  1: 0] cpu_ddr_clock_bridge_s1_chosen_master_rot_left;
  wire             cpu_ddr_clock_bridge_s1_end_xfer;
  wire             cpu_ddr_clock_bridge_s1_endofpacket_from_sa;
  wire             cpu_ddr_clock_bridge_s1_firsttransfer;
  wire    [  1: 0] cpu_ddr_clock_bridge_s1_grant_vector;
  wire             cpu_ddr_clock_bridge_s1_in_a_read_cycle;
  wire             cpu_ddr_clock_bridge_s1_in_a_write_cycle;
  wire    [  1: 0] cpu_ddr_clock_bridge_s1_master_qreq_vector;
  wire             cpu_ddr_clock_bridge_s1_move_on_to_next_transaction;
  wire    [ 22: 0] cpu_ddr_clock_bridge_s1_nativeaddress;
  wire             cpu_ddr_clock_bridge_s1_non_bursting_master_requests;
  wire             cpu_ddr_clock_bridge_s1_read;
  wire    [ 31: 0] cpu_ddr_clock_bridge_s1_readdata_from_sa;
  wire             cpu_ddr_clock_bridge_s1_readdatavalid_from_sa;
  reg              cpu_ddr_clock_bridge_s1_reg_firsttransfer;
  wire             cpu_ddr_clock_bridge_s1_reset_n;
  reg     [  1: 0] cpu_ddr_clock_bridge_s1_saved_chosen_master_vector;
  reg              cpu_ddr_clock_bridge_s1_slavearbiterlockenable;
  wire             cpu_ddr_clock_bridge_s1_slavearbiterlockenable2;
  wire             cpu_ddr_clock_bridge_s1_unreg_firsttransfer;
  wire             cpu_ddr_clock_bridge_s1_waitrequest_from_sa;
  wire             cpu_ddr_clock_bridge_s1_waits_for_read;
  wire             cpu_ddr_clock_bridge_s1_waits_for_write;
  wire             cpu_ddr_clock_bridge_s1_write;
  wire    [ 31: 0] cpu_ddr_clock_bridge_s1_writedata;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_cpu_ddr_clock_bridge_s1;
  wire             cpu_instruction_master_qualified_request_cpu_ddr_clock_bridge_s1;
  wire             cpu_instruction_master_rdv_fifo_empty_cpu_ddr_clock_bridge_s1;
  wire             cpu_instruction_master_rdv_fifo_output_from_cpu_ddr_clock_bridge_s1;
  wire             cpu_instruction_master_read_data_valid_cpu_ddr_clock_bridge_s1;
  wire             cpu_instruction_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register;
  wire             cpu_instruction_master_requests_cpu_ddr_clock_bridge_s1;
  wire             cpu_instruction_master_saved_grant_cpu_ddr_clock_bridge_s1;
  reg              d1_cpu_ddr_clock_bridge_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_cpu_ddr_clock_bridge_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_cpu_ddr_clock_bridge_s1;
  reg              last_cycle_cpu_instruction_master_granted_slave_cpu_ddr_clock_bridge_s1;
  wire    [ 27: 0] shifted_address_to_cpu_ddr_clock_bridge_s1_from_cpu_data_master;
  wire    [ 26: 0] shifted_address_to_cpu_ddr_clock_bridge_s1_from_cpu_instruction_master;
  wire             wait_for_cpu_ddr_clock_bridge_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~cpu_ddr_clock_bridge_s1_end_xfer;
    end


  assign cpu_ddr_clock_bridge_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_cpu_ddr_clock_bridge_s1 | cpu_instruction_master_qualified_request_cpu_ddr_clock_bridge_s1));
  //assign cpu_ddr_clock_bridge_s1_readdatavalid_from_sa = cpu_ddr_clock_bridge_s1_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_ddr_clock_bridge_s1_readdatavalid_from_sa = cpu_ddr_clock_bridge_s1_readdatavalid;

  //assign cpu_ddr_clock_bridge_s1_readdata_from_sa = cpu_ddr_clock_bridge_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_ddr_clock_bridge_s1_readdata_from_sa = cpu_ddr_clock_bridge_s1_readdata;

  assign cpu_data_master_requests_cpu_ddr_clock_bridge_s1 = ({cpu_data_master_address_to_slave[27 : 25] , 25'b0} == 28'h0) & (cpu_data_master_read | cpu_data_master_write);
  //assign cpu_ddr_clock_bridge_s1_waitrequest_from_sa = cpu_ddr_clock_bridge_s1_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_ddr_clock_bridge_s1_waitrequest_from_sa = cpu_ddr_clock_bridge_s1_waitrequest;

  //cpu_ddr_clock_bridge_s1_arb_share_counter set values, which is an e_mux
  assign cpu_ddr_clock_bridge_s1_arb_share_set_values = (cpu_data_master_granted_cpu_ddr_clock_bridge_s1)? 8 :
    (cpu_instruction_master_granted_cpu_ddr_clock_bridge_s1)? 8 :
    (cpu_data_master_granted_cpu_ddr_clock_bridge_s1)? 8 :
    (cpu_instruction_master_granted_cpu_ddr_clock_bridge_s1)? 8 :
    1;

  //cpu_ddr_clock_bridge_s1_non_bursting_master_requests mux, which is an e_mux
  assign cpu_ddr_clock_bridge_s1_non_bursting_master_requests = cpu_data_master_requests_cpu_ddr_clock_bridge_s1 |
    cpu_instruction_master_requests_cpu_ddr_clock_bridge_s1 |
    cpu_data_master_requests_cpu_ddr_clock_bridge_s1 |
    cpu_instruction_master_requests_cpu_ddr_clock_bridge_s1;

  //cpu_ddr_clock_bridge_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign cpu_ddr_clock_bridge_s1_any_bursting_master_saved_grant = 0;

  //cpu_ddr_clock_bridge_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign cpu_ddr_clock_bridge_s1_arb_share_counter_next_value = cpu_ddr_clock_bridge_s1_firsttransfer ? (cpu_ddr_clock_bridge_s1_arb_share_set_values - 1) : |cpu_ddr_clock_bridge_s1_arb_share_counter ? (cpu_ddr_clock_bridge_s1_arb_share_counter - 1) : 0;

  //cpu_ddr_clock_bridge_s1_allgrants all slave grants, which is an e_mux
  assign cpu_ddr_clock_bridge_s1_allgrants = |cpu_ddr_clock_bridge_s1_grant_vector |
    |cpu_ddr_clock_bridge_s1_grant_vector |
    |cpu_ddr_clock_bridge_s1_grant_vector |
    |cpu_ddr_clock_bridge_s1_grant_vector;

  //cpu_ddr_clock_bridge_s1_end_xfer assignment, which is an e_assign
  assign cpu_ddr_clock_bridge_s1_end_xfer = ~(cpu_ddr_clock_bridge_s1_waits_for_read | cpu_ddr_clock_bridge_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_cpu_ddr_clock_bridge_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_cpu_ddr_clock_bridge_s1 = cpu_ddr_clock_bridge_s1_end_xfer & (~cpu_ddr_clock_bridge_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //cpu_ddr_clock_bridge_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign cpu_ddr_clock_bridge_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_cpu_ddr_clock_bridge_s1 & cpu_ddr_clock_bridge_s1_allgrants) | (end_xfer_arb_share_counter_term_cpu_ddr_clock_bridge_s1 & ~cpu_ddr_clock_bridge_s1_non_bursting_master_requests);

  //cpu_ddr_clock_bridge_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_ddr_clock_bridge_s1_arb_share_counter <= 0;
      else if (cpu_ddr_clock_bridge_s1_arb_counter_enable)
          cpu_ddr_clock_bridge_s1_arb_share_counter <= cpu_ddr_clock_bridge_s1_arb_share_counter_next_value;
    end


  //cpu_ddr_clock_bridge_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_ddr_clock_bridge_s1_slavearbiterlockenable <= 0;
      else if ((|cpu_ddr_clock_bridge_s1_master_qreq_vector & end_xfer_arb_share_counter_term_cpu_ddr_clock_bridge_s1) | (end_xfer_arb_share_counter_term_cpu_ddr_clock_bridge_s1 & ~cpu_ddr_clock_bridge_s1_non_bursting_master_requests))
          cpu_ddr_clock_bridge_s1_slavearbiterlockenable <= |cpu_ddr_clock_bridge_s1_arb_share_counter_next_value;
    end


  //cpu/data_master cpu_ddr_clock_bridge/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = cpu_ddr_clock_bridge_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //cpu_ddr_clock_bridge_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign cpu_ddr_clock_bridge_s1_slavearbiterlockenable2 = |cpu_ddr_clock_bridge_s1_arb_share_counter_next_value;

  //cpu/data_master cpu_ddr_clock_bridge/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = cpu_ddr_clock_bridge_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master cpu_ddr_clock_bridge/s1 arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = cpu_ddr_clock_bridge_s1_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master cpu_ddr_clock_bridge/s1 arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = cpu_ddr_clock_bridge_s1_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted cpu_ddr_clock_bridge/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_cpu_ddr_clock_bridge_s1 <= 0;
      else if (1)
          last_cycle_cpu_instruction_master_granted_slave_cpu_ddr_clock_bridge_s1 <= cpu_instruction_master_saved_grant_cpu_ddr_clock_bridge_s1 ? 1 : (cpu_ddr_clock_bridge_s1_arbitration_holdoff_internal | ~cpu_instruction_master_requests_cpu_ddr_clock_bridge_s1) ? 0 : last_cycle_cpu_instruction_master_granted_slave_cpu_ddr_clock_bridge_s1;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_cpu_ddr_clock_bridge_s1 & cpu_instruction_master_requests_cpu_ddr_clock_bridge_s1;

  //cpu_ddr_clock_bridge_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign cpu_ddr_clock_bridge_s1_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_cpu_ddr_clock_bridge_s1 = cpu_data_master_requests_cpu_ddr_clock_bridge_s1 & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0) | (1 < cpu_data_master_latency_counter) | (|cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register) | (|cpu_data_master_read_data_valid_slow_peripheral_bridge_s1_shift_register))) | cpu_instruction_master_arbiterlock);
  //unique name for cpu_ddr_clock_bridge_s1_move_on_to_next_transaction, which is an e_assign
  assign cpu_ddr_clock_bridge_s1_move_on_to_next_transaction = cpu_ddr_clock_bridge_s1_readdatavalid_from_sa;

  //rdv_fifo_for_cpu_data_master_to_cpu_ddr_clock_bridge_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_data_master_to_cpu_ddr_clock_bridge_s1_module rdv_fifo_for_cpu_data_master_to_cpu_ddr_clock_bridge_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_data_master_granted_cpu_ddr_clock_bridge_s1),
      .data_out             (cpu_data_master_rdv_fifo_output_from_cpu_ddr_clock_bridge_s1),
      .empty                (),
      .fifo_contains_ones_n (cpu_data_master_rdv_fifo_empty_cpu_ddr_clock_bridge_s1),
      .full                 (),
      .read                 (cpu_ddr_clock_bridge_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~cpu_ddr_clock_bridge_s1_waits_for_read)
    );

  assign cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register = ~cpu_data_master_rdv_fifo_empty_cpu_ddr_clock_bridge_s1;
  //local readdatavalid cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1 = (cpu_ddr_clock_bridge_s1_readdatavalid_from_sa & cpu_data_master_rdv_fifo_output_from_cpu_ddr_clock_bridge_s1) & ~ cpu_data_master_rdv_fifo_empty_cpu_ddr_clock_bridge_s1;

  //cpu_ddr_clock_bridge_s1_writedata mux, which is an e_mux
  assign cpu_ddr_clock_bridge_s1_writedata = cpu_data_master_writedata;

  //assign cpu_ddr_clock_bridge_s1_endofpacket_from_sa = cpu_ddr_clock_bridge_s1_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_ddr_clock_bridge_s1_endofpacket_from_sa = cpu_ddr_clock_bridge_s1_endofpacket;

  assign cpu_instruction_master_requests_cpu_ddr_clock_bridge_s1 = (({cpu_instruction_master_address_to_slave[26 : 25] , 25'b0} == 27'h0) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted cpu_ddr_clock_bridge/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_cpu_ddr_clock_bridge_s1 <= 0;
      else if (1)
          last_cycle_cpu_data_master_granted_slave_cpu_ddr_clock_bridge_s1 <= cpu_data_master_saved_grant_cpu_ddr_clock_bridge_s1 ? 1 : (cpu_ddr_clock_bridge_s1_arbitration_holdoff_internal | ~cpu_data_master_requests_cpu_ddr_clock_bridge_s1) ? 0 : last_cycle_cpu_data_master_granted_slave_cpu_ddr_clock_bridge_s1;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_cpu_ddr_clock_bridge_s1 & cpu_data_master_requests_cpu_ddr_clock_bridge_s1;

  assign cpu_instruction_master_qualified_request_cpu_ddr_clock_bridge_s1 = cpu_instruction_master_requests_cpu_ddr_clock_bridge_s1 & ~((cpu_instruction_master_read & ((cpu_instruction_master_latency_counter != 0) | (1 < cpu_instruction_master_latency_counter) | (|cpu_instruction_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register))) | cpu_data_master_arbiterlock);
  //rdv_fifo_for_cpu_instruction_master_to_cpu_ddr_clock_bridge_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_instruction_master_to_cpu_ddr_clock_bridge_s1_module rdv_fifo_for_cpu_instruction_master_to_cpu_ddr_clock_bridge_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_instruction_master_granted_cpu_ddr_clock_bridge_s1),
      .data_out             (cpu_instruction_master_rdv_fifo_output_from_cpu_ddr_clock_bridge_s1),
      .empty                (),
      .fifo_contains_ones_n (cpu_instruction_master_rdv_fifo_empty_cpu_ddr_clock_bridge_s1),
      .full                 (),
      .read                 (cpu_ddr_clock_bridge_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~cpu_ddr_clock_bridge_s1_waits_for_read)
    );

  assign cpu_instruction_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register = ~cpu_instruction_master_rdv_fifo_empty_cpu_ddr_clock_bridge_s1;
  //local readdatavalid cpu_instruction_master_read_data_valid_cpu_ddr_clock_bridge_s1, which is an e_mux
  assign cpu_instruction_master_read_data_valid_cpu_ddr_clock_bridge_s1 = (cpu_ddr_clock_bridge_s1_readdatavalid_from_sa & cpu_instruction_master_rdv_fifo_output_from_cpu_ddr_clock_bridge_s1) & ~ cpu_instruction_master_rdv_fifo_empty_cpu_ddr_clock_bridge_s1;

  //allow new arb cycle for cpu_ddr_clock_bridge/s1, which is an e_assign
  assign cpu_ddr_clock_bridge_s1_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for cpu_ddr_clock_bridge/s1, which is an e_assign
  assign cpu_ddr_clock_bridge_s1_master_qreq_vector[0] = cpu_instruction_master_qualified_request_cpu_ddr_clock_bridge_s1;

  //cpu/instruction_master grant cpu_ddr_clock_bridge/s1, which is an e_assign
  assign cpu_instruction_master_granted_cpu_ddr_clock_bridge_s1 = cpu_ddr_clock_bridge_s1_grant_vector[0];

  //cpu/instruction_master saved-grant cpu_ddr_clock_bridge/s1, which is an e_assign
  assign cpu_instruction_master_saved_grant_cpu_ddr_clock_bridge_s1 = cpu_ddr_clock_bridge_s1_arb_winner[0] && cpu_instruction_master_requests_cpu_ddr_clock_bridge_s1;

  //cpu/data_master assignment into master qualified-requests vector for cpu_ddr_clock_bridge/s1, which is an e_assign
  assign cpu_ddr_clock_bridge_s1_master_qreq_vector[1] = cpu_data_master_qualified_request_cpu_ddr_clock_bridge_s1;

  //cpu/data_master grant cpu_ddr_clock_bridge/s1, which is an e_assign
  assign cpu_data_master_granted_cpu_ddr_clock_bridge_s1 = cpu_ddr_clock_bridge_s1_grant_vector[1];

  //cpu/data_master saved-grant cpu_ddr_clock_bridge/s1, which is an e_assign
  assign cpu_data_master_saved_grant_cpu_ddr_clock_bridge_s1 = cpu_ddr_clock_bridge_s1_arb_winner[1] && cpu_data_master_requests_cpu_ddr_clock_bridge_s1;

  //cpu_ddr_clock_bridge/s1 chosen-master double-vector, which is an e_assign
  assign cpu_ddr_clock_bridge_s1_chosen_master_double_vector = {cpu_ddr_clock_bridge_s1_master_qreq_vector, cpu_ddr_clock_bridge_s1_master_qreq_vector} & ({~cpu_ddr_clock_bridge_s1_master_qreq_vector, ~cpu_ddr_clock_bridge_s1_master_qreq_vector} + cpu_ddr_clock_bridge_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign cpu_ddr_clock_bridge_s1_arb_winner = (cpu_ddr_clock_bridge_s1_allow_new_arb_cycle & | cpu_ddr_clock_bridge_s1_grant_vector) ? cpu_ddr_clock_bridge_s1_grant_vector : cpu_ddr_clock_bridge_s1_saved_chosen_master_vector;

  //saved cpu_ddr_clock_bridge_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_ddr_clock_bridge_s1_saved_chosen_master_vector <= 0;
      else if (cpu_ddr_clock_bridge_s1_allow_new_arb_cycle)
          cpu_ddr_clock_bridge_s1_saved_chosen_master_vector <= |cpu_ddr_clock_bridge_s1_grant_vector ? cpu_ddr_clock_bridge_s1_grant_vector : cpu_ddr_clock_bridge_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign cpu_ddr_clock_bridge_s1_grant_vector = {(cpu_ddr_clock_bridge_s1_chosen_master_double_vector[1] | cpu_ddr_clock_bridge_s1_chosen_master_double_vector[3]),
    (cpu_ddr_clock_bridge_s1_chosen_master_double_vector[0] | cpu_ddr_clock_bridge_s1_chosen_master_double_vector[2])};

  //cpu_ddr_clock_bridge/s1 chosen master rotated left, which is an e_assign
  assign cpu_ddr_clock_bridge_s1_chosen_master_rot_left = (cpu_ddr_clock_bridge_s1_arb_winner << 1) ? (cpu_ddr_clock_bridge_s1_arb_winner << 1) : 1;

  //cpu_ddr_clock_bridge/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_ddr_clock_bridge_s1_arb_addend <= 1;
      else if (|cpu_ddr_clock_bridge_s1_grant_vector)
          cpu_ddr_clock_bridge_s1_arb_addend <= cpu_ddr_clock_bridge_s1_end_xfer? cpu_ddr_clock_bridge_s1_chosen_master_rot_left : cpu_ddr_clock_bridge_s1_grant_vector;
    end


  //cpu_ddr_clock_bridge_s1_reset_n assignment, which is an e_assign
  assign cpu_ddr_clock_bridge_s1_reset_n = reset_n;

  //cpu_ddr_clock_bridge_s1_firsttransfer first transaction, which is an e_assign
  assign cpu_ddr_clock_bridge_s1_firsttransfer = cpu_ddr_clock_bridge_s1_begins_xfer ? cpu_ddr_clock_bridge_s1_unreg_firsttransfer : cpu_ddr_clock_bridge_s1_reg_firsttransfer;

  //cpu_ddr_clock_bridge_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign cpu_ddr_clock_bridge_s1_unreg_firsttransfer = ~(cpu_ddr_clock_bridge_s1_slavearbiterlockenable & cpu_ddr_clock_bridge_s1_any_continuerequest);

  //cpu_ddr_clock_bridge_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_ddr_clock_bridge_s1_reg_firsttransfer <= 1'b1;
      else if (cpu_ddr_clock_bridge_s1_begins_xfer)
          cpu_ddr_clock_bridge_s1_reg_firsttransfer <= cpu_ddr_clock_bridge_s1_unreg_firsttransfer;
    end


  //cpu_ddr_clock_bridge_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign cpu_ddr_clock_bridge_s1_beginbursttransfer_internal = cpu_ddr_clock_bridge_s1_begins_xfer;

  //cpu_ddr_clock_bridge_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign cpu_ddr_clock_bridge_s1_arbitration_holdoff_internal = cpu_ddr_clock_bridge_s1_begins_xfer & cpu_ddr_clock_bridge_s1_firsttransfer;

  //cpu_ddr_clock_bridge_s1_read assignment, which is an e_mux
  assign cpu_ddr_clock_bridge_s1_read = (cpu_data_master_granted_cpu_ddr_clock_bridge_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_cpu_ddr_clock_bridge_s1 & cpu_instruction_master_read);

  //cpu_ddr_clock_bridge_s1_write assignment, which is an e_mux
  assign cpu_ddr_clock_bridge_s1_write = cpu_data_master_granted_cpu_ddr_clock_bridge_s1 & cpu_data_master_write;

  assign shifted_address_to_cpu_ddr_clock_bridge_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //cpu_ddr_clock_bridge_s1_address mux, which is an e_mux
  assign cpu_ddr_clock_bridge_s1_address = (cpu_data_master_granted_cpu_ddr_clock_bridge_s1)? (shifted_address_to_cpu_ddr_clock_bridge_s1_from_cpu_data_master >> 2) :
    (shifted_address_to_cpu_ddr_clock_bridge_s1_from_cpu_instruction_master >> 2);

  assign shifted_address_to_cpu_ddr_clock_bridge_s1_from_cpu_instruction_master = cpu_instruction_master_address_to_slave;
  //slaveid cpu_ddr_clock_bridge_s1_nativeaddress nativeaddress mux, which is an e_mux
  assign cpu_ddr_clock_bridge_s1_nativeaddress = (cpu_data_master_granted_cpu_ddr_clock_bridge_s1)? (cpu_data_master_address_to_slave >> 2) :
    (cpu_instruction_master_address_to_slave >> 2);

  //d1_cpu_ddr_clock_bridge_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_cpu_ddr_clock_bridge_s1_end_xfer <= 1;
      else if (1)
          d1_cpu_ddr_clock_bridge_s1_end_xfer <= cpu_ddr_clock_bridge_s1_end_xfer;
    end


  //cpu_ddr_clock_bridge_s1_waits_for_read in a cycle, which is an e_mux
  assign cpu_ddr_clock_bridge_s1_waits_for_read = cpu_ddr_clock_bridge_s1_in_a_read_cycle & cpu_ddr_clock_bridge_s1_waitrequest_from_sa;

  //cpu_ddr_clock_bridge_s1_in_a_read_cycle assignment, which is an e_assign
  assign cpu_ddr_clock_bridge_s1_in_a_read_cycle = (cpu_data_master_granted_cpu_ddr_clock_bridge_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_cpu_ddr_clock_bridge_s1 & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cpu_ddr_clock_bridge_s1_in_a_read_cycle;

  //cpu_ddr_clock_bridge_s1_waits_for_write in a cycle, which is an e_mux
  assign cpu_ddr_clock_bridge_s1_waits_for_write = cpu_ddr_clock_bridge_s1_in_a_write_cycle & cpu_ddr_clock_bridge_s1_waitrequest_from_sa;

  //cpu_ddr_clock_bridge_s1_in_a_write_cycle assignment, which is an e_assign
  assign cpu_ddr_clock_bridge_s1_in_a_write_cycle = cpu_data_master_granted_cpu_ddr_clock_bridge_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cpu_ddr_clock_bridge_s1_in_a_write_cycle;

  assign wait_for_cpu_ddr_clock_bridge_s1_counter = 0;
  //cpu_ddr_clock_bridge_s1_byteenable byte enable port mux, which is an e_mux
  assign cpu_ddr_clock_bridge_s1_byteenable = (cpu_data_master_granted_cpu_ddr_clock_bridge_s1)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_ddr_clock_bridge/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_cpu_ddr_clock_bridge_s1 + cpu_instruction_master_granted_cpu_ddr_clock_bridge_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_cpu_ddr_clock_bridge_s1 + cpu_instruction_master_saved_grant_cpu_ddr_clock_bridge_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module selecto_nrdv_cpu_ddr_clock_bridge_m1_1_ddr_sdram_s1_fifo_module (
                                                                         // inputs:
                                                                          clear_fifo,
                                                                          clk,
                                                                          data_in,
                                                                          read,
                                                                          reset_n,
                                                                          sync_reset,
                                                                          write,

                                                                         // outputs:
                                                                          data_out,
                                                                          empty,
                                                                          fifo_contains_ones_n,
                                                                          full
                                                                       )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_10;
  reg              full_11;
  reg              full_12;
  reg              full_13;
  reg              full_14;
  reg              full_15;
  reg              full_16;
  reg              full_17;
  reg              full_18;
  reg              full_19;
  reg              full_2;
  reg              full_20;
  reg              full_21;
  reg              full_22;
  reg              full_23;
  reg              full_24;
  reg              full_25;
  reg              full_26;
  reg              full_27;
  reg              full_28;
  reg              full_29;
  reg              full_3;
  reg              full_30;
  reg              full_31;
  wire             full_32;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  reg              full_7;
  reg              full_8;
  reg              full_9;
  reg     [  6: 0] how_many_ones;
  wire    [  6: 0] one_count_minus_one;
  wire    [  6: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p10_full_10;
  wire             p10_stage_10;
  wire             p11_full_11;
  wire             p11_stage_11;
  wire             p12_full_12;
  wire             p12_stage_12;
  wire             p13_full_13;
  wire             p13_stage_13;
  wire             p14_full_14;
  wire             p14_stage_14;
  wire             p15_full_15;
  wire             p15_stage_15;
  wire             p16_full_16;
  wire             p16_stage_16;
  wire             p17_full_17;
  wire             p17_stage_17;
  wire             p18_full_18;
  wire             p18_stage_18;
  wire             p19_full_19;
  wire             p19_stage_19;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p20_full_20;
  wire             p20_stage_20;
  wire             p21_full_21;
  wire             p21_stage_21;
  wire             p22_full_22;
  wire             p22_stage_22;
  wire             p23_full_23;
  wire             p23_stage_23;
  wire             p24_full_24;
  wire             p24_stage_24;
  wire             p25_full_25;
  wire             p25_stage_25;
  wire             p26_full_26;
  wire             p26_stage_26;
  wire             p27_full_27;
  wire             p27_stage_27;
  wire             p28_full_28;
  wire             p28_stage_28;
  wire             p29_full_29;
  wire             p29_stage_29;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p30_full_30;
  wire             p30_stage_30;
  wire             p31_full_31;
  wire             p31_stage_31;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  wire             p7_full_7;
  wire             p7_stage_7;
  wire             p8_full_8;
  wire             p8_stage_8;
  wire             p9_full_9;
  wire             p9_stage_9;
  reg              stage_0;
  reg              stage_1;
  reg              stage_10;
  reg              stage_11;
  reg              stage_12;
  reg              stage_13;
  reg              stage_14;
  reg              stage_15;
  reg              stage_16;
  reg              stage_17;
  reg              stage_18;
  reg              stage_19;
  reg              stage_2;
  reg              stage_20;
  reg              stage_21;
  reg              stage_22;
  reg              stage_23;
  reg              stage_24;
  reg              stage_25;
  reg              stage_26;
  reg              stage_27;
  reg              stage_28;
  reg              stage_29;
  reg              stage_3;
  reg              stage_30;
  reg              stage_31;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  reg              stage_7;
  reg              stage_8;
  reg              stage_9;
  wire    [  6: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_31;
  assign empty = !full_0;
  assign full_32 = 0;
  //data_31, which is an e_mux
  assign p31_stage_31 = ((full_32 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_31 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_31))
          if (sync_reset & full_31 & !((full_32 == 0) & read & write))
              stage_31 <= 0;
          else 
            stage_31 <= p31_stage_31;
    end


  //control_31, which is an e_mux
  assign p31_full_31 = ((read & !write) == 0)? full_30 :
    0;

  //control_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_31 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_31 <= 0;
          else 
            full_31 <= p31_full_31;
    end


  //data_30, which is an e_mux
  assign p30_stage_30 = ((full_31 & ~clear_fifo) == 0)? data_in :
    stage_31;

  //data_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_30 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_30))
          if (sync_reset & full_30 & !((full_31 == 0) & read & write))
              stage_30 <= 0;
          else 
            stage_30 <= p30_stage_30;
    end


  //control_30, which is an e_mux
  assign p30_full_30 = ((read & !write) == 0)? full_29 :
    full_31;

  //control_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_30 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_30 <= 0;
          else 
            full_30 <= p30_full_30;
    end


  //data_29, which is an e_mux
  assign p29_stage_29 = ((full_30 & ~clear_fifo) == 0)? data_in :
    stage_30;

  //data_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_29 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_29))
          if (sync_reset & full_29 & !((full_30 == 0) & read & write))
              stage_29 <= 0;
          else 
            stage_29 <= p29_stage_29;
    end


  //control_29, which is an e_mux
  assign p29_full_29 = ((read & !write) == 0)? full_28 :
    full_30;

  //control_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_29 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_29 <= 0;
          else 
            full_29 <= p29_full_29;
    end


  //data_28, which is an e_mux
  assign p28_stage_28 = ((full_29 & ~clear_fifo) == 0)? data_in :
    stage_29;

  //data_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_28 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_28))
          if (sync_reset & full_28 & !((full_29 == 0) & read & write))
              stage_28 <= 0;
          else 
            stage_28 <= p28_stage_28;
    end


  //control_28, which is an e_mux
  assign p28_full_28 = ((read & !write) == 0)? full_27 :
    full_29;

  //control_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_28 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_28 <= 0;
          else 
            full_28 <= p28_full_28;
    end


  //data_27, which is an e_mux
  assign p27_stage_27 = ((full_28 & ~clear_fifo) == 0)? data_in :
    stage_28;

  //data_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_27 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_27))
          if (sync_reset & full_27 & !((full_28 == 0) & read & write))
              stage_27 <= 0;
          else 
            stage_27 <= p27_stage_27;
    end


  //control_27, which is an e_mux
  assign p27_full_27 = ((read & !write) == 0)? full_26 :
    full_28;

  //control_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_27 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_27 <= 0;
          else 
            full_27 <= p27_full_27;
    end


  //data_26, which is an e_mux
  assign p26_stage_26 = ((full_27 & ~clear_fifo) == 0)? data_in :
    stage_27;

  //data_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_26 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_26))
          if (sync_reset & full_26 & !((full_27 == 0) & read & write))
              stage_26 <= 0;
          else 
            stage_26 <= p26_stage_26;
    end


  //control_26, which is an e_mux
  assign p26_full_26 = ((read & !write) == 0)? full_25 :
    full_27;

  //control_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_26 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_26 <= 0;
          else 
            full_26 <= p26_full_26;
    end


  //data_25, which is an e_mux
  assign p25_stage_25 = ((full_26 & ~clear_fifo) == 0)? data_in :
    stage_26;

  //data_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_25 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_25))
          if (sync_reset & full_25 & !((full_26 == 0) & read & write))
              stage_25 <= 0;
          else 
            stage_25 <= p25_stage_25;
    end


  //control_25, which is an e_mux
  assign p25_full_25 = ((read & !write) == 0)? full_24 :
    full_26;

  //control_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_25 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_25 <= 0;
          else 
            full_25 <= p25_full_25;
    end


  //data_24, which is an e_mux
  assign p24_stage_24 = ((full_25 & ~clear_fifo) == 0)? data_in :
    stage_25;

  //data_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_24 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_24))
          if (sync_reset & full_24 & !((full_25 == 0) & read & write))
              stage_24 <= 0;
          else 
            stage_24 <= p24_stage_24;
    end


  //control_24, which is an e_mux
  assign p24_full_24 = ((read & !write) == 0)? full_23 :
    full_25;

  //control_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_24 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_24 <= 0;
          else 
            full_24 <= p24_full_24;
    end


  //data_23, which is an e_mux
  assign p23_stage_23 = ((full_24 & ~clear_fifo) == 0)? data_in :
    stage_24;

  //data_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_23 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_23))
          if (sync_reset & full_23 & !((full_24 == 0) & read & write))
              stage_23 <= 0;
          else 
            stage_23 <= p23_stage_23;
    end


  //control_23, which is an e_mux
  assign p23_full_23 = ((read & !write) == 0)? full_22 :
    full_24;

  //control_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_23 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_23 <= 0;
          else 
            full_23 <= p23_full_23;
    end


  //data_22, which is an e_mux
  assign p22_stage_22 = ((full_23 & ~clear_fifo) == 0)? data_in :
    stage_23;

  //data_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_22 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_22))
          if (sync_reset & full_22 & !((full_23 == 0) & read & write))
              stage_22 <= 0;
          else 
            stage_22 <= p22_stage_22;
    end


  //control_22, which is an e_mux
  assign p22_full_22 = ((read & !write) == 0)? full_21 :
    full_23;

  //control_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_22 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_22 <= 0;
          else 
            full_22 <= p22_full_22;
    end


  //data_21, which is an e_mux
  assign p21_stage_21 = ((full_22 & ~clear_fifo) == 0)? data_in :
    stage_22;

  //data_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_21 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_21))
          if (sync_reset & full_21 & !((full_22 == 0) & read & write))
              stage_21 <= 0;
          else 
            stage_21 <= p21_stage_21;
    end


  //control_21, which is an e_mux
  assign p21_full_21 = ((read & !write) == 0)? full_20 :
    full_22;

  //control_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_21 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_21 <= 0;
          else 
            full_21 <= p21_full_21;
    end


  //data_20, which is an e_mux
  assign p20_stage_20 = ((full_21 & ~clear_fifo) == 0)? data_in :
    stage_21;

  //data_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_20 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_20))
          if (sync_reset & full_20 & !((full_21 == 0) & read & write))
              stage_20 <= 0;
          else 
            stage_20 <= p20_stage_20;
    end


  //control_20, which is an e_mux
  assign p20_full_20 = ((read & !write) == 0)? full_19 :
    full_21;

  //control_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_20 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_20 <= 0;
          else 
            full_20 <= p20_full_20;
    end


  //data_19, which is an e_mux
  assign p19_stage_19 = ((full_20 & ~clear_fifo) == 0)? data_in :
    stage_20;

  //data_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_19 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_19))
          if (sync_reset & full_19 & !((full_20 == 0) & read & write))
              stage_19 <= 0;
          else 
            stage_19 <= p19_stage_19;
    end


  //control_19, which is an e_mux
  assign p19_full_19 = ((read & !write) == 0)? full_18 :
    full_20;

  //control_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_19 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_19 <= 0;
          else 
            full_19 <= p19_full_19;
    end


  //data_18, which is an e_mux
  assign p18_stage_18 = ((full_19 & ~clear_fifo) == 0)? data_in :
    stage_19;

  //data_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_18 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_18))
          if (sync_reset & full_18 & !((full_19 == 0) & read & write))
              stage_18 <= 0;
          else 
            stage_18 <= p18_stage_18;
    end


  //control_18, which is an e_mux
  assign p18_full_18 = ((read & !write) == 0)? full_17 :
    full_19;

  //control_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_18 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_18 <= 0;
          else 
            full_18 <= p18_full_18;
    end


  //data_17, which is an e_mux
  assign p17_stage_17 = ((full_18 & ~clear_fifo) == 0)? data_in :
    stage_18;

  //data_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_17 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_17))
          if (sync_reset & full_17 & !((full_18 == 0) & read & write))
              stage_17 <= 0;
          else 
            stage_17 <= p17_stage_17;
    end


  //control_17, which is an e_mux
  assign p17_full_17 = ((read & !write) == 0)? full_16 :
    full_18;

  //control_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_17 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_17 <= 0;
          else 
            full_17 <= p17_full_17;
    end


  //data_16, which is an e_mux
  assign p16_stage_16 = ((full_17 & ~clear_fifo) == 0)? data_in :
    stage_17;

  //data_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_16 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_16))
          if (sync_reset & full_16 & !((full_17 == 0) & read & write))
              stage_16 <= 0;
          else 
            stage_16 <= p16_stage_16;
    end


  //control_16, which is an e_mux
  assign p16_full_16 = ((read & !write) == 0)? full_15 :
    full_17;

  //control_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_16 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_16 <= 0;
          else 
            full_16 <= p16_full_16;
    end


  //data_15, which is an e_mux
  assign p15_stage_15 = ((full_16 & ~clear_fifo) == 0)? data_in :
    stage_16;

  //data_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_15 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_15))
          if (sync_reset & full_15 & !((full_16 == 0) & read & write))
              stage_15 <= 0;
          else 
            stage_15 <= p15_stage_15;
    end


  //control_15, which is an e_mux
  assign p15_full_15 = ((read & !write) == 0)? full_14 :
    full_16;

  //control_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_15 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_15 <= 0;
          else 
            full_15 <= p15_full_15;
    end


  //data_14, which is an e_mux
  assign p14_stage_14 = ((full_15 & ~clear_fifo) == 0)? data_in :
    stage_15;

  //data_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_14 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_14))
          if (sync_reset & full_14 & !((full_15 == 0) & read & write))
              stage_14 <= 0;
          else 
            stage_14 <= p14_stage_14;
    end


  //control_14, which is an e_mux
  assign p14_full_14 = ((read & !write) == 0)? full_13 :
    full_15;

  //control_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_14 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_14 <= 0;
          else 
            full_14 <= p14_full_14;
    end


  //data_13, which is an e_mux
  assign p13_stage_13 = ((full_14 & ~clear_fifo) == 0)? data_in :
    stage_14;

  //data_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_13 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_13))
          if (sync_reset & full_13 & !((full_14 == 0) & read & write))
              stage_13 <= 0;
          else 
            stage_13 <= p13_stage_13;
    end


  //control_13, which is an e_mux
  assign p13_full_13 = ((read & !write) == 0)? full_12 :
    full_14;

  //control_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_13 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_13 <= 0;
          else 
            full_13 <= p13_full_13;
    end


  //data_12, which is an e_mux
  assign p12_stage_12 = ((full_13 & ~clear_fifo) == 0)? data_in :
    stage_13;

  //data_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_12 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_12))
          if (sync_reset & full_12 & !((full_13 == 0) & read & write))
              stage_12 <= 0;
          else 
            stage_12 <= p12_stage_12;
    end


  //control_12, which is an e_mux
  assign p12_full_12 = ((read & !write) == 0)? full_11 :
    full_13;

  //control_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_12 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_12 <= 0;
          else 
            full_12 <= p12_full_12;
    end


  //data_11, which is an e_mux
  assign p11_stage_11 = ((full_12 & ~clear_fifo) == 0)? data_in :
    stage_12;

  //data_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_11 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_11))
          if (sync_reset & full_11 & !((full_12 == 0) & read & write))
              stage_11 <= 0;
          else 
            stage_11 <= p11_stage_11;
    end


  //control_11, which is an e_mux
  assign p11_full_11 = ((read & !write) == 0)? full_10 :
    full_12;

  //control_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_11 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_11 <= 0;
          else 
            full_11 <= p11_full_11;
    end


  //data_10, which is an e_mux
  assign p10_stage_10 = ((full_11 & ~clear_fifo) == 0)? data_in :
    stage_11;

  //data_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_10 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_10))
          if (sync_reset & full_10 & !((full_11 == 0) & read & write))
              stage_10 <= 0;
          else 
            stage_10 <= p10_stage_10;
    end


  //control_10, which is an e_mux
  assign p10_full_10 = ((read & !write) == 0)? full_9 :
    full_11;

  //control_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_10 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_10 <= 0;
          else 
            full_10 <= p10_full_10;
    end


  //data_9, which is an e_mux
  assign p9_stage_9 = ((full_10 & ~clear_fifo) == 0)? data_in :
    stage_10;

  //data_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_9 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_9))
          if (sync_reset & full_9 & !((full_10 == 0) & read & write))
              stage_9 <= 0;
          else 
            stage_9 <= p9_stage_9;
    end


  //control_9, which is an e_mux
  assign p9_full_9 = ((read & !write) == 0)? full_8 :
    full_10;

  //control_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_9 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_9 <= 0;
          else 
            full_9 <= p9_full_9;
    end


  //data_8, which is an e_mux
  assign p8_stage_8 = ((full_9 & ~clear_fifo) == 0)? data_in :
    stage_9;

  //data_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_8 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_8))
          if (sync_reset & full_8 & !((full_9 == 0) & read & write))
              stage_8 <= 0;
          else 
            stage_8 <= p8_stage_8;
    end


  //control_8, which is an e_mux
  assign p8_full_8 = ((read & !write) == 0)? full_7 :
    full_9;

  //control_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_8 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_8 <= 0;
          else 
            full_8 <= p8_full_8;
    end


  //data_7, which is an e_mux
  assign p7_stage_7 = ((full_8 & ~clear_fifo) == 0)? data_in :
    stage_8;

  //data_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_7 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_7))
          if (sync_reset & full_7 & !((full_8 == 0) & read & write))
              stage_7 <= 0;
          else 
            stage_7 <= p7_stage_7;
    end


  //control_7, which is an e_mux
  assign p7_full_7 = ((read & !write) == 0)? full_6 :
    full_8;

  //control_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_7 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_7 <= 0;
          else 
            full_7 <= p7_full_7;
    end


  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    stage_7;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    full_7;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_ddr_clock_bridge_m1_arbitrator (
                                            // inputs:
                                             clk,
                                             cpu_ddr_clock_bridge_m1_address,
                                             cpu_ddr_clock_bridge_m1_byteenable,
                                             cpu_ddr_clock_bridge_m1_granted_ddr_sdram_s1,
                                             cpu_ddr_clock_bridge_m1_qualified_request_ddr_sdram_s1,
                                             cpu_ddr_clock_bridge_m1_read,
                                             cpu_ddr_clock_bridge_m1_read_data_valid_ddr_sdram_s1,
                                             cpu_ddr_clock_bridge_m1_read_data_valid_ddr_sdram_s1_shift_register,
                                             cpu_ddr_clock_bridge_m1_requests_ddr_sdram_s1,
                                             cpu_ddr_clock_bridge_m1_write,
                                             cpu_ddr_clock_bridge_m1_writedata,
                                             d1_ddr_sdram_s1_end_xfer,
                                             ddr_sdram_s1_readdata_from_sa,
                                             ddr_sdram_s1_waitrequest_n_from_sa,
                                             reset_n,

                                            // outputs:
                                             cpu_ddr_clock_bridge_m1_address_to_slave,
                                             cpu_ddr_clock_bridge_m1_latency_counter,
                                             cpu_ddr_clock_bridge_m1_readdata,
                                             cpu_ddr_clock_bridge_m1_readdatavalid,
                                             cpu_ddr_clock_bridge_m1_reset_n,
                                             cpu_ddr_clock_bridge_m1_waitrequest
                                          )
;

  output  [ 24: 0] cpu_ddr_clock_bridge_m1_address_to_slave;
  output           cpu_ddr_clock_bridge_m1_latency_counter;
  output  [ 31: 0] cpu_ddr_clock_bridge_m1_readdata;
  output           cpu_ddr_clock_bridge_m1_readdatavalid;
  output           cpu_ddr_clock_bridge_m1_reset_n;
  output           cpu_ddr_clock_bridge_m1_waitrequest;
  input            clk;
  input   [ 24: 0] cpu_ddr_clock_bridge_m1_address;
  input   [  3: 0] cpu_ddr_clock_bridge_m1_byteenable;
  input            cpu_ddr_clock_bridge_m1_granted_ddr_sdram_s1;
  input            cpu_ddr_clock_bridge_m1_qualified_request_ddr_sdram_s1;
  input            cpu_ddr_clock_bridge_m1_read;
  input            cpu_ddr_clock_bridge_m1_read_data_valid_ddr_sdram_s1;
  input            cpu_ddr_clock_bridge_m1_read_data_valid_ddr_sdram_s1_shift_register;
  input            cpu_ddr_clock_bridge_m1_requests_ddr_sdram_s1;
  input            cpu_ddr_clock_bridge_m1_write;
  input   [ 31: 0] cpu_ddr_clock_bridge_m1_writedata;
  input            d1_ddr_sdram_s1_end_xfer;
  input   [ 63: 0] ddr_sdram_s1_readdata_from_sa;
  input            ddr_sdram_s1_waitrequest_n_from_sa;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [ 24: 0] cpu_ddr_clock_bridge_m1_address_last_time;
  wire    [ 24: 0] cpu_ddr_clock_bridge_m1_address_to_slave;
  reg     [  3: 0] cpu_ddr_clock_bridge_m1_byteenable_last_time;
  wire             cpu_ddr_clock_bridge_m1_latency_counter;
  reg              cpu_ddr_clock_bridge_m1_read_last_time;
  wire    [ 31: 0] cpu_ddr_clock_bridge_m1_readdata;
  wire             cpu_ddr_clock_bridge_m1_readdatavalid;
  wire             cpu_ddr_clock_bridge_m1_reset_n;
  wire             cpu_ddr_clock_bridge_m1_run;
  wire             cpu_ddr_clock_bridge_m1_waitrequest;
  reg              cpu_ddr_clock_bridge_m1_write_last_time;
  reg     [ 31: 0] cpu_ddr_clock_bridge_m1_writedata_last_time;
  wire    [ 31: 0] ddr_sdram_s1_readdata_from_sa_part_selected_by_negative_dbs;
  wire             empty_selecto_nrdv_cpu_ddr_clock_bridge_m1_1_ddr_sdram_s1_fifo;
  wire             full_selecto_nrdv_cpu_ddr_clock_bridge_m1_1_ddr_sdram_s1_fifo;
  wire             pre_flush_cpu_ddr_clock_bridge_m1_readdatavalid;
  wire             r_0;
  wire             read_selecto_nrdv_cpu_ddr_clock_bridge_m1_1_ddr_sdram_s1_fifo;
  wire             selecto_nrdv_cpu_ddr_clock_bridge_m1_1_ddr_sdram_s1_fifo_output;
  wire             selecto_nrdv_cpu_ddr_clock_bridge_m1_1_ddr_sdram_s1_fifo_output_ddr_sdram_s1;
  wire             write_selecto_nrdv_cpu_ddr_clock_bridge_m1_1_ddr_sdram_s1_fifo;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_ddr_clock_bridge_m1_qualified_request_ddr_sdram_s1 | ~cpu_ddr_clock_bridge_m1_requests_ddr_sdram_s1) & ((~cpu_ddr_clock_bridge_m1_qualified_request_ddr_sdram_s1 | ~(cpu_ddr_clock_bridge_m1_read | cpu_ddr_clock_bridge_m1_write) | (1 & ddr_sdram_s1_waitrequest_n_from_sa & (cpu_ddr_clock_bridge_m1_read | cpu_ddr_clock_bridge_m1_write)))) & ((~cpu_ddr_clock_bridge_m1_qualified_request_ddr_sdram_s1 | ~(cpu_ddr_clock_bridge_m1_read | cpu_ddr_clock_bridge_m1_write) | (1 & ddr_sdram_s1_waitrequest_n_from_sa & (cpu_ddr_clock_bridge_m1_read | cpu_ddr_clock_bridge_m1_write))));

  //cascaded wait assignment, which is an e_assign
  assign cpu_ddr_clock_bridge_m1_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_ddr_clock_bridge_m1_address_to_slave = cpu_ddr_clock_bridge_m1_address[24 : 0];

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_ddr_clock_bridge_m1_readdatavalid = cpu_ddr_clock_bridge_m1_read_data_valid_ddr_sdram_s1;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_ddr_clock_bridge_m1_readdatavalid = 0 |
    pre_flush_cpu_ddr_clock_bridge_m1_readdatavalid;

  //Negative Dynamic Bus-sizing mux.
  //this mux selects the correct half of the 
  //wide data coming from the slave ddr_sdram/s1 
  assign ddr_sdram_s1_readdata_from_sa_part_selected_by_negative_dbs = ((selecto_nrdv_cpu_ddr_clock_bridge_m1_1_ddr_sdram_s1_fifo_output_ddr_sdram_s1 == 0))? ddr_sdram_s1_readdata_from_sa[31 : 0] :
    ddr_sdram_s1_readdata_from_sa[63 : 32];

  //read_selecto_nrdv_cpu_ddr_clock_bridge_m1_1_ddr_sdram_s1_fifo fifo read, which is an e_mux
  assign read_selecto_nrdv_cpu_ddr_clock_bridge_m1_1_ddr_sdram_s1_fifo = cpu_ddr_clock_bridge_m1_read_data_valid_ddr_sdram_s1;

  //write_selecto_nrdv_cpu_ddr_clock_bridge_m1_1_ddr_sdram_s1_fifo fifo write, which is an e_mux
  assign write_selecto_nrdv_cpu_ddr_clock_bridge_m1_1_ddr_sdram_s1_fifo = cpu_ddr_clock_bridge_m1_read & cpu_ddr_clock_bridge_m1_run & cpu_ddr_clock_bridge_m1_requests_ddr_sdram_s1;

  assign selecto_nrdv_cpu_ddr_clock_bridge_m1_1_ddr_sdram_s1_fifo_output_ddr_sdram_s1 = selecto_nrdv_cpu_ddr_clock_bridge_m1_1_ddr_sdram_s1_fifo_output;
  //selecto_nrdv_cpu_ddr_clock_bridge_m1_1_ddr_sdram_s1_fifo, which is an e_fifo_with_registered_outputs
  selecto_nrdv_cpu_ddr_clock_bridge_m1_1_ddr_sdram_s1_fifo_module selecto_nrdv_cpu_ddr_clock_bridge_m1_1_ddr_sdram_s1_fifo
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_ddr_clock_bridge_m1_address_to_slave[2]),
      .data_out             (selecto_nrdv_cpu_ddr_clock_bridge_m1_1_ddr_sdram_s1_fifo_output),
      .empty                (empty_selecto_nrdv_cpu_ddr_clock_bridge_m1_1_ddr_sdram_s1_fifo),
      .fifo_contains_ones_n (),
      .full                 (full_selecto_nrdv_cpu_ddr_clock_bridge_m1_1_ddr_sdram_s1_fifo),
      .read                 (read_selecto_nrdv_cpu_ddr_clock_bridge_m1_1_ddr_sdram_s1_fifo),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (write_selecto_nrdv_cpu_ddr_clock_bridge_m1_1_ddr_sdram_s1_fifo)
    );

  //cpu_ddr_clock_bridge/m1 readdata mux, which is an e_mux
  assign cpu_ddr_clock_bridge_m1_readdata = ddr_sdram_s1_readdata_from_sa_part_selected_by_negative_dbs;

  //actual waitrequest port, which is an e_assign
  assign cpu_ddr_clock_bridge_m1_waitrequest = ~cpu_ddr_clock_bridge_m1_run;

  //latent max counter, which is an e_assign
  assign cpu_ddr_clock_bridge_m1_latency_counter = 0;

  //cpu_ddr_clock_bridge_m1_reset_n assignment, which is an e_assign
  assign cpu_ddr_clock_bridge_m1_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_ddr_clock_bridge_m1_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_ddr_clock_bridge_m1_address_last_time <= 0;
      else if (1)
          cpu_ddr_clock_bridge_m1_address_last_time <= cpu_ddr_clock_bridge_m1_address;
    end


  //cpu_ddr_clock_bridge/m1 waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else if (1)
          active_and_waiting_last_time <= cpu_ddr_clock_bridge_m1_waitrequest & (cpu_ddr_clock_bridge_m1_read | cpu_ddr_clock_bridge_m1_write);
    end


  //cpu_ddr_clock_bridge_m1_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_ddr_clock_bridge_m1_address != cpu_ddr_clock_bridge_m1_address_last_time))
        begin
          $write("%0d ns: cpu_ddr_clock_bridge_m1_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_ddr_clock_bridge_m1_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_ddr_clock_bridge_m1_byteenable_last_time <= 0;
      else if (1)
          cpu_ddr_clock_bridge_m1_byteenable_last_time <= cpu_ddr_clock_bridge_m1_byteenable;
    end


  //cpu_ddr_clock_bridge_m1_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_ddr_clock_bridge_m1_byteenable != cpu_ddr_clock_bridge_m1_byteenable_last_time))
        begin
          $write("%0d ns: cpu_ddr_clock_bridge_m1_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_ddr_clock_bridge_m1_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_ddr_clock_bridge_m1_read_last_time <= 0;
      else if (1)
          cpu_ddr_clock_bridge_m1_read_last_time <= cpu_ddr_clock_bridge_m1_read;
    end


  //cpu_ddr_clock_bridge_m1_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_ddr_clock_bridge_m1_read != cpu_ddr_clock_bridge_m1_read_last_time))
        begin
          $write("%0d ns: cpu_ddr_clock_bridge_m1_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_ddr_clock_bridge_m1_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_ddr_clock_bridge_m1_write_last_time <= 0;
      else if (1)
          cpu_ddr_clock_bridge_m1_write_last_time <= cpu_ddr_clock_bridge_m1_write;
    end


  //cpu_ddr_clock_bridge_m1_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_ddr_clock_bridge_m1_write != cpu_ddr_clock_bridge_m1_write_last_time))
        begin
          $write("%0d ns: cpu_ddr_clock_bridge_m1_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_ddr_clock_bridge_m1_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_ddr_clock_bridge_m1_writedata_last_time <= 0;
      else if (1)
          cpu_ddr_clock_bridge_m1_writedata_last_time <= cpu_ddr_clock_bridge_m1_writedata;
    end


  //cpu_ddr_clock_bridge_m1_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_ddr_clock_bridge_m1_writedata != cpu_ddr_clock_bridge_m1_writedata_last_time) & cpu_ddr_clock_bridge_m1_write)
        begin
          $write("%0d ns: cpu_ddr_clock_bridge_m1_writedata did not heed wait!!!", $time);
          $stop;
        end
    end


  //selecto_nrdv_cpu_ddr_clock_bridge_m1_1_ddr_sdram_s1_fifo read when empty, which is an e_process
  always @(posedge clk)
    begin
      if (empty_selecto_nrdv_cpu_ddr_clock_bridge_m1_1_ddr_sdram_s1_fifo & read_selecto_nrdv_cpu_ddr_clock_bridge_m1_1_ddr_sdram_s1_fifo)
        begin
          $write("%0d ns: cpu_ddr_clock_bridge/m1 negative rdv fifo selecto_nrdv_cpu_ddr_clock_bridge_m1_1_ddr_sdram_s1_fifo: read AND empty.\n", $time);
          $stop;
        end
    end


  //selecto_nrdv_cpu_ddr_clock_bridge_m1_1_ddr_sdram_s1_fifo write when full, which is an e_process
  always @(posedge clk)
    begin
      if (full_selecto_nrdv_cpu_ddr_clock_bridge_m1_1_ddr_sdram_s1_fifo & write_selecto_nrdv_cpu_ddr_clock_bridge_m1_1_ddr_sdram_s1_fifo & ~read_selecto_nrdv_cpu_ddr_clock_bridge_m1_1_ddr_sdram_s1_fifo)
        begin
          $write("%0d ns: cpu_ddr_clock_bridge/m1 negative rdv fifo selecto_nrdv_cpu_ddr_clock_bridge_m1_1_ddr_sdram_s1_fifo: write AND full.\n", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_ddr_clock_bridge_bridge_arbitrator 
;



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cycloneIII_3c25_niosII_standard_sopc_clock_0_in_arbitrator (
                                                                    // inputs:
                                                                     clk,
                                                                     cycloneIII_3c25_niosII_standard_sopc_clock_0_in_endofpacket,
                                                                     cycloneIII_3c25_niosII_standard_sopc_clock_0_in_readdata,
                                                                     cycloneIII_3c25_niosII_standard_sopc_clock_0_in_waitrequest,
                                                                     reset_n,
                                                                     slow_peripheral_bridge_m1_address_to_slave,
                                                                     slow_peripheral_bridge_m1_byteenable,
                                                                     slow_peripheral_bridge_m1_latency_counter,
                                                                     slow_peripheral_bridge_m1_nativeaddress,
                                                                     slow_peripheral_bridge_m1_read,
                                                                     slow_peripheral_bridge_m1_write,
                                                                     slow_peripheral_bridge_m1_writedata,

                                                                    // outputs:
                                                                     cycloneIII_3c25_niosII_standard_sopc_clock_0_in_address,
                                                                     cycloneIII_3c25_niosII_standard_sopc_clock_0_in_byteenable,
                                                                     cycloneIII_3c25_niosII_standard_sopc_clock_0_in_endofpacket_from_sa,
                                                                     cycloneIII_3c25_niosII_standard_sopc_clock_0_in_nativeaddress,
                                                                     cycloneIII_3c25_niosII_standard_sopc_clock_0_in_read,
                                                                     cycloneIII_3c25_niosII_standard_sopc_clock_0_in_readdata_from_sa,
                                                                     cycloneIII_3c25_niosII_standard_sopc_clock_0_in_reset_n,
                                                                     cycloneIII_3c25_niosII_standard_sopc_clock_0_in_waitrequest_from_sa,
                                                                     cycloneIII_3c25_niosII_standard_sopc_clock_0_in_write,
                                                                     cycloneIII_3c25_niosII_standard_sopc_clock_0_in_writedata,
                                                                     d1_cycloneIII_3c25_niosII_standard_sopc_clock_0_in_end_xfer,
                                                                     slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_0_in,
                                                                     slow_peripheral_bridge_m1_qualified_request_cycloneIII_3c25_niosII_standard_sopc_clock_0_in,
                                                                     slow_peripheral_bridge_m1_read_data_valid_cycloneIII_3c25_niosII_standard_sopc_clock_0_in,
                                                                     slow_peripheral_bridge_m1_requests_cycloneIII_3c25_niosII_standard_sopc_clock_0_in
                                                                  )
;

  output  [  3: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_in_address;
  output  [  1: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_in_byteenable;
  output           cycloneIII_3c25_niosII_standard_sopc_clock_0_in_endofpacket_from_sa;
  output  [  2: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_in_nativeaddress;
  output           cycloneIII_3c25_niosII_standard_sopc_clock_0_in_read;
  output  [ 15: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_in_readdata_from_sa;
  output           cycloneIII_3c25_niosII_standard_sopc_clock_0_in_reset_n;
  output           cycloneIII_3c25_niosII_standard_sopc_clock_0_in_waitrequest_from_sa;
  output           cycloneIII_3c25_niosII_standard_sopc_clock_0_in_write;
  output  [ 15: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_in_writedata;
  output           d1_cycloneIII_3c25_niosII_standard_sopc_clock_0_in_end_xfer;
  output           slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_0_in;
  output           slow_peripheral_bridge_m1_qualified_request_cycloneIII_3c25_niosII_standard_sopc_clock_0_in;
  output           slow_peripheral_bridge_m1_read_data_valid_cycloneIII_3c25_niosII_standard_sopc_clock_0_in;
  output           slow_peripheral_bridge_m1_requests_cycloneIII_3c25_niosII_standard_sopc_clock_0_in;
  input            clk;
  input            cycloneIII_3c25_niosII_standard_sopc_clock_0_in_endofpacket;
  input   [ 15: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_in_readdata;
  input            cycloneIII_3c25_niosII_standard_sopc_clock_0_in_waitrequest;
  input            reset_n;
  input   [  8: 0] slow_peripheral_bridge_m1_address_to_slave;
  input   [  3: 0] slow_peripheral_bridge_m1_byteenable;
  input            slow_peripheral_bridge_m1_latency_counter;
  input   [  6: 0] slow_peripheral_bridge_m1_nativeaddress;
  input            slow_peripheral_bridge_m1_read;
  input            slow_peripheral_bridge_m1_write;
  input   [ 31: 0] slow_peripheral_bridge_m1_writedata;

  wire    [  3: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_in_address;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_in_allgrants;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_in_allow_new_arb_cycle;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_in_any_bursting_master_saved_grant;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_in_any_continuerequest;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_in_arb_counter_enable;
  reg              cycloneIII_3c25_niosII_standard_sopc_clock_0_in_arb_share_counter;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_in_arb_share_counter_next_value;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_in_arb_share_set_values;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_in_beginbursttransfer_internal;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_in_begins_xfer;
  wire    [  1: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_in_byteenable;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_in_end_xfer;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_in_endofpacket_from_sa;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_in_firsttransfer;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_in_grant_vector;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_in_in_a_read_cycle;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_in_in_a_write_cycle;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_in_master_qreq_vector;
  wire    [  2: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_in_nativeaddress;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_in_non_bursting_master_requests;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_in_read;
  wire    [ 15: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_in_readdata_from_sa;
  reg              cycloneIII_3c25_niosII_standard_sopc_clock_0_in_reg_firsttransfer;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_in_reset_n;
  reg              cycloneIII_3c25_niosII_standard_sopc_clock_0_in_slavearbiterlockenable;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_in_slavearbiterlockenable2;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_in_unreg_firsttransfer;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_in_waitrequest_from_sa;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_in_waits_for_read;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_in_waits_for_write;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_in_write;
  wire    [ 15: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_in_writedata;
  reg              d1_cycloneIII_3c25_niosII_standard_sopc_clock_0_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_cycloneIII_3c25_niosII_standard_sopc_clock_0_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             slow_peripheral_bridge_m1_arbiterlock;
  wire             slow_peripheral_bridge_m1_arbiterlock2;
  wire             slow_peripheral_bridge_m1_continuerequest;
  wire             slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_0_in;
  wire             slow_peripheral_bridge_m1_qualified_request_cycloneIII_3c25_niosII_standard_sopc_clock_0_in;
  wire             slow_peripheral_bridge_m1_read_data_valid_cycloneIII_3c25_niosII_standard_sopc_clock_0_in;
  wire             slow_peripheral_bridge_m1_requests_cycloneIII_3c25_niosII_standard_sopc_clock_0_in;
  wire             slow_peripheral_bridge_m1_saved_grant_cycloneIII_3c25_niosII_standard_sopc_clock_0_in;
  wire             wait_for_cycloneIII_3c25_niosII_standard_sopc_clock_0_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~cycloneIII_3c25_niosII_standard_sopc_clock_0_in_end_xfer;
    end


  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_in_begins_xfer = ~d1_reasons_to_wait & ((slow_peripheral_bridge_m1_qualified_request_cycloneIII_3c25_niosII_standard_sopc_clock_0_in));
  //assign cycloneIII_3c25_niosII_standard_sopc_clock_0_in_readdata_from_sa = cycloneIII_3c25_niosII_standard_sopc_clock_0_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_in_readdata_from_sa = cycloneIII_3c25_niosII_standard_sopc_clock_0_in_readdata;

  assign slow_peripheral_bridge_m1_requests_cycloneIII_3c25_niosII_standard_sopc_clock_0_in = ({slow_peripheral_bridge_m1_address_to_slave[8 : 5] , 5'b0} == 9'h140) & (slow_peripheral_bridge_m1_read | slow_peripheral_bridge_m1_write);
  //assign cycloneIII_3c25_niosII_standard_sopc_clock_0_in_waitrequest_from_sa = cycloneIII_3c25_niosII_standard_sopc_clock_0_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_in_waitrequest_from_sa = cycloneIII_3c25_niosII_standard_sopc_clock_0_in_waitrequest;

  //cycloneIII_3c25_niosII_standard_sopc_clock_0_in_arb_share_counter set values, which is an e_mux
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_in_arb_share_set_values = 1;

  //cycloneIII_3c25_niosII_standard_sopc_clock_0_in_non_bursting_master_requests mux, which is an e_mux
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_in_non_bursting_master_requests = slow_peripheral_bridge_m1_requests_cycloneIII_3c25_niosII_standard_sopc_clock_0_in;

  //cycloneIII_3c25_niosII_standard_sopc_clock_0_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_in_any_bursting_master_saved_grant = 0;

  //cycloneIII_3c25_niosII_standard_sopc_clock_0_in_arb_share_counter_next_value assignment, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_in_arb_share_counter_next_value = cycloneIII_3c25_niosII_standard_sopc_clock_0_in_firsttransfer ? (cycloneIII_3c25_niosII_standard_sopc_clock_0_in_arb_share_set_values - 1) : |cycloneIII_3c25_niosII_standard_sopc_clock_0_in_arb_share_counter ? (cycloneIII_3c25_niosII_standard_sopc_clock_0_in_arb_share_counter - 1) : 0;

  //cycloneIII_3c25_niosII_standard_sopc_clock_0_in_allgrants all slave grants, which is an e_mux
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_in_allgrants = |cycloneIII_3c25_niosII_standard_sopc_clock_0_in_grant_vector;

  //cycloneIII_3c25_niosII_standard_sopc_clock_0_in_end_xfer assignment, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_in_end_xfer = ~(cycloneIII_3c25_niosII_standard_sopc_clock_0_in_waits_for_read | cycloneIII_3c25_niosII_standard_sopc_clock_0_in_waits_for_write);

  //end_xfer_arb_share_counter_term_cycloneIII_3c25_niosII_standard_sopc_clock_0_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_cycloneIII_3c25_niosII_standard_sopc_clock_0_in = cycloneIII_3c25_niosII_standard_sopc_clock_0_in_end_xfer & (~cycloneIII_3c25_niosII_standard_sopc_clock_0_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //cycloneIII_3c25_niosII_standard_sopc_clock_0_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_in_arb_counter_enable = (end_xfer_arb_share_counter_term_cycloneIII_3c25_niosII_standard_sopc_clock_0_in & cycloneIII_3c25_niosII_standard_sopc_clock_0_in_allgrants) | (end_xfer_arb_share_counter_term_cycloneIII_3c25_niosII_standard_sopc_clock_0_in & ~cycloneIII_3c25_niosII_standard_sopc_clock_0_in_non_bursting_master_requests);

  //cycloneIII_3c25_niosII_standard_sopc_clock_0_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cycloneIII_3c25_niosII_standard_sopc_clock_0_in_arb_share_counter <= 0;
      else if (cycloneIII_3c25_niosII_standard_sopc_clock_0_in_arb_counter_enable)
          cycloneIII_3c25_niosII_standard_sopc_clock_0_in_arb_share_counter <= cycloneIII_3c25_niosII_standard_sopc_clock_0_in_arb_share_counter_next_value;
    end


  //cycloneIII_3c25_niosII_standard_sopc_clock_0_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cycloneIII_3c25_niosII_standard_sopc_clock_0_in_slavearbiterlockenable <= 0;
      else if ((|cycloneIII_3c25_niosII_standard_sopc_clock_0_in_master_qreq_vector & end_xfer_arb_share_counter_term_cycloneIII_3c25_niosII_standard_sopc_clock_0_in) | (end_xfer_arb_share_counter_term_cycloneIII_3c25_niosII_standard_sopc_clock_0_in & ~cycloneIII_3c25_niosII_standard_sopc_clock_0_in_non_bursting_master_requests))
          cycloneIII_3c25_niosII_standard_sopc_clock_0_in_slavearbiterlockenable <= |cycloneIII_3c25_niosII_standard_sopc_clock_0_in_arb_share_counter_next_value;
    end


  //slow_peripheral_bridge/m1 cycloneIII_3c25_niosII_standard_sopc_clock_0/in arbiterlock, which is an e_assign
  assign slow_peripheral_bridge_m1_arbiterlock = cycloneIII_3c25_niosII_standard_sopc_clock_0_in_slavearbiterlockenable & slow_peripheral_bridge_m1_continuerequest;

  //cycloneIII_3c25_niosII_standard_sopc_clock_0_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_in_slavearbiterlockenable2 = |cycloneIII_3c25_niosII_standard_sopc_clock_0_in_arb_share_counter_next_value;

  //slow_peripheral_bridge/m1 cycloneIII_3c25_niosII_standard_sopc_clock_0/in arbiterlock2, which is an e_assign
  assign slow_peripheral_bridge_m1_arbiterlock2 = cycloneIII_3c25_niosII_standard_sopc_clock_0_in_slavearbiterlockenable2 & slow_peripheral_bridge_m1_continuerequest;

  //cycloneIII_3c25_niosII_standard_sopc_clock_0_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_in_any_continuerequest = 1;

  //slow_peripheral_bridge_m1_continuerequest continued request, which is an e_assign
  assign slow_peripheral_bridge_m1_continuerequest = 1;

  assign slow_peripheral_bridge_m1_qualified_request_cycloneIII_3c25_niosII_standard_sopc_clock_0_in = slow_peripheral_bridge_m1_requests_cycloneIII_3c25_niosII_standard_sopc_clock_0_in & ~((slow_peripheral_bridge_m1_read & ((slow_peripheral_bridge_m1_latency_counter != 0))));
  //local readdatavalid slow_peripheral_bridge_m1_read_data_valid_cycloneIII_3c25_niosII_standard_sopc_clock_0_in, which is an e_mux
  assign slow_peripheral_bridge_m1_read_data_valid_cycloneIII_3c25_niosII_standard_sopc_clock_0_in = slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_0_in & slow_peripheral_bridge_m1_read & ~cycloneIII_3c25_niosII_standard_sopc_clock_0_in_waits_for_read;

  //cycloneIII_3c25_niosII_standard_sopc_clock_0_in_writedata mux, which is an e_mux
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_in_writedata = slow_peripheral_bridge_m1_writedata;

  //assign cycloneIII_3c25_niosII_standard_sopc_clock_0_in_endofpacket_from_sa = cycloneIII_3c25_niosII_standard_sopc_clock_0_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_in_endofpacket_from_sa = cycloneIII_3c25_niosII_standard_sopc_clock_0_in_endofpacket;

  //master is always granted when requested
  assign slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_0_in = slow_peripheral_bridge_m1_qualified_request_cycloneIII_3c25_niosII_standard_sopc_clock_0_in;

  //slow_peripheral_bridge/m1 saved-grant cycloneIII_3c25_niosII_standard_sopc_clock_0/in, which is an e_assign
  assign slow_peripheral_bridge_m1_saved_grant_cycloneIII_3c25_niosII_standard_sopc_clock_0_in = slow_peripheral_bridge_m1_requests_cycloneIII_3c25_niosII_standard_sopc_clock_0_in;

  //allow new arb cycle for cycloneIII_3c25_niosII_standard_sopc_clock_0/in, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_in_master_qreq_vector = 1;

  //cycloneIII_3c25_niosII_standard_sopc_clock_0_in_reset_n assignment, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_in_reset_n = reset_n;

  //cycloneIII_3c25_niosII_standard_sopc_clock_0_in_firsttransfer first transaction, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_in_firsttransfer = cycloneIII_3c25_niosII_standard_sopc_clock_0_in_begins_xfer ? cycloneIII_3c25_niosII_standard_sopc_clock_0_in_unreg_firsttransfer : cycloneIII_3c25_niosII_standard_sopc_clock_0_in_reg_firsttransfer;

  //cycloneIII_3c25_niosII_standard_sopc_clock_0_in_unreg_firsttransfer first transaction, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_in_unreg_firsttransfer = ~(cycloneIII_3c25_niosII_standard_sopc_clock_0_in_slavearbiterlockenable & cycloneIII_3c25_niosII_standard_sopc_clock_0_in_any_continuerequest);

  //cycloneIII_3c25_niosII_standard_sopc_clock_0_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cycloneIII_3c25_niosII_standard_sopc_clock_0_in_reg_firsttransfer <= 1'b1;
      else if (cycloneIII_3c25_niosII_standard_sopc_clock_0_in_begins_xfer)
          cycloneIII_3c25_niosII_standard_sopc_clock_0_in_reg_firsttransfer <= cycloneIII_3c25_niosII_standard_sopc_clock_0_in_unreg_firsttransfer;
    end


  //cycloneIII_3c25_niosII_standard_sopc_clock_0_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_in_beginbursttransfer_internal = cycloneIII_3c25_niosII_standard_sopc_clock_0_in_begins_xfer;

  //cycloneIII_3c25_niosII_standard_sopc_clock_0_in_read assignment, which is an e_mux
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_in_read = slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_0_in & slow_peripheral_bridge_m1_read;

  //cycloneIII_3c25_niosII_standard_sopc_clock_0_in_write assignment, which is an e_mux
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_in_write = slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_0_in & slow_peripheral_bridge_m1_write;

  //cycloneIII_3c25_niosII_standard_sopc_clock_0_in_address mux, which is an e_mux
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_in_address = slow_peripheral_bridge_m1_address_to_slave;

  //slaveid cycloneIII_3c25_niosII_standard_sopc_clock_0_in_nativeaddress nativeaddress mux, which is an e_mux
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_in_nativeaddress = slow_peripheral_bridge_m1_nativeaddress;

  //d1_cycloneIII_3c25_niosII_standard_sopc_clock_0_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_cycloneIII_3c25_niosII_standard_sopc_clock_0_in_end_xfer <= 1;
      else if (1)
          d1_cycloneIII_3c25_niosII_standard_sopc_clock_0_in_end_xfer <= cycloneIII_3c25_niosII_standard_sopc_clock_0_in_end_xfer;
    end


  //cycloneIII_3c25_niosII_standard_sopc_clock_0_in_waits_for_read in a cycle, which is an e_mux
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_in_waits_for_read = cycloneIII_3c25_niosII_standard_sopc_clock_0_in_in_a_read_cycle & cycloneIII_3c25_niosII_standard_sopc_clock_0_in_waitrequest_from_sa;

  //cycloneIII_3c25_niosII_standard_sopc_clock_0_in_in_a_read_cycle assignment, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_in_in_a_read_cycle = slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_0_in & slow_peripheral_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cycloneIII_3c25_niosII_standard_sopc_clock_0_in_in_a_read_cycle;

  //cycloneIII_3c25_niosII_standard_sopc_clock_0_in_waits_for_write in a cycle, which is an e_mux
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_in_waits_for_write = cycloneIII_3c25_niosII_standard_sopc_clock_0_in_in_a_write_cycle & cycloneIII_3c25_niosII_standard_sopc_clock_0_in_waitrequest_from_sa;

  //cycloneIII_3c25_niosII_standard_sopc_clock_0_in_in_a_write_cycle assignment, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_in_in_a_write_cycle = slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_0_in & slow_peripheral_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cycloneIII_3c25_niosII_standard_sopc_clock_0_in_in_a_write_cycle;

  assign wait_for_cycloneIII_3c25_niosII_standard_sopc_clock_0_in_counter = 0;
  //cycloneIII_3c25_niosII_standard_sopc_clock_0_in_byteenable byte enable port mux, which is an e_mux
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_in_byteenable = (slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_0_in)? slow_peripheral_bridge_m1_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cycloneIII_3c25_niosII_standard_sopc_clock_0/in enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cycloneIII_3c25_niosII_standard_sopc_clock_0_out_arbitrator (
                                                                     // inputs:
                                                                      clk,
                                                                      cycloneIII_3c25_niosII_standard_sopc_clock_0_out_address,
                                                                      cycloneIII_3c25_niosII_standard_sopc_clock_0_out_byteenable,
                                                                      cycloneIII_3c25_niosII_standard_sopc_clock_0_out_granted_pll_s1,
                                                                      cycloneIII_3c25_niosII_standard_sopc_clock_0_out_qualified_request_pll_s1,
                                                                      cycloneIII_3c25_niosII_standard_sopc_clock_0_out_read,
                                                                      cycloneIII_3c25_niosII_standard_sopc_clock_0_out_read_data_valid_pll_s1,
                                                                      cycloneIII_3c25_niosII_standard_sopc_clock_0_out_requests_pll_s1,
                                                                      cycloneIII_3c25_niosII_standard_sopc_clock_0_out_write,
                                                                      cycloneIII_3c25_niosII_standard_sopc_clock_0_out_writedata,
                                                                      d1_pll_s1_end_xfer,
                                                                      pll_s1_readdata_from_sa,
                                                                      reset_n,

                                                                     // outputs:
                                                                      cycloneIII_3c25_niosII_standard_sopc_clock_0_out_address_to_slave,
                                                                      cycloneIII_3c25_niosII_standard_sopc_clock_0_out_readdata,
                                                                      cycloneIII_3c25_niosII_standard_sopc_clock_0_out_reset_n,
                                                                      cycloneIII_3c25_niosII_standard_sopc_clock_0_out_waitrequest
                                                                   )
;

  output  [  3: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_out_address_to_slave;
  output  [ 15: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_out_readdata;
  output           cycloneIII_3c25_niosII_standard_sopc_clock_0_out_reset_n;
  output           cycloneIII_3c25_niosII_standard_sopc_clock_0_out_waitrequest;
  input            clk;
  input   [  3: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_out_address;
  input   [  1: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_out_byteenable;
  input            cycloneIII_3c25_niosII_standard_sopc_clock_0_out_granted_pll_s1;
  input            cycloneIII_3c25_niosII_standard_sopc_clock_0_out_qualified_request_pll_s1;
  input            cycloneIII_3c25_niosII_standard_sopc_clock_0_out_read;
  input            cycloneIII_3c25_niosII_standard_sopc_clock_0_out_read_data_valid_pll_s1;
  input            cycloneIII_3c25_niosII_standard_sopc_clock_0_out_requests_pll_s1;
  input            cycloneIII_3c25_niosII_standard_sopc_clock_0_out_write;
  input   [ 15: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_out_writedata;
  input            d1_pll_s1_end_xfer;
  input   [ 15: 0] pll_s1_readdata_from_sa;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [  3: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_out_address_last_time;
  wire    [  3: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_out_address_to_slave;
  reg     [  1: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_out_byteenable_last_time;
  reg              cycloneIII_3c25_niosII_standard_sopc_clock_0_out_read_last_time;
  wire    [ 15: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_out_readdata;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_out_reset_n;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_out_run;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_out_waitrequest;
  reg              cycloneIII_3c25_niosII_standard_sopc_clock_0_out_write_last_time;
  reg     [ 15: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_out_writedata_last_time;
  wire             r_1;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & ((~cycloneIII_3c25_niosII_standard_sopc_clock_0_out_qualified_request_pll_s1 | ~cycloneIII_3c25_niosII_standard_sopc_clock_0_out_read | (1 & ~d1_pll_s1_end_xfer & cycloneIII_3c25_niosII_standard_sopc_clock_0_out_read))) & ((~cycloneIII_3c25_niosII_standard_sopc_clock_0_out_qualified_request_pll_s1 | ~cycloneIII_3c25_niosII_standard_sopc_clock_0_out_write | (1 & cycloneIII_3c25_niosII_standard_sopc_clock_0_out_write)));

  //cascaded wait assignment, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_out_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_out_address_to_slave = cycloneIII_3c25_niosII_standard_sopc_clock_0_out_address;

  //cycloneIII_3c25_niosII_standard_sopc_clock_0/out readdata mux, which is an e_mux
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_out_readdata = pll_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_out_waitrequest = ~cycloneIII_3c25_niosII_standard_sopc_clock_0_out_run;

  //cycloneIII_3c25_niosII_standard_sopc_clock_0_out_reset_n assignment, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cycloneIII_3c25_niosII_standard_sopc_clock_0_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cycloneIII_3c25_niosII_standard_sopc_clock_0_out_address_last_time <= 0;
      else if (1)
          cycloneIII_3c25_niosII_standard_sopc_clock_0_out_address_last_time <= cycloneIII_3c25_niosII_standard_sopc_clock_0_out_address;
    end


  //cycloneIII_3c25_niosII_standard_sopc_clock_0/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else if (1)
          active_and_waiting_last_time <= cycloneIII_3c25_niosII_standard_sopc_clock_0_out_waitrequest & (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_read | cycloneIII_3c25_niosII_standard_sopc_clock_0_out_write);
    end


  //cycloneIII_3c25_niosII_standard_sopc_clock_0_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_address != cycloneIII_3c25_niosII_standard_sopc_clock_0_out_address_last_time))
        begin
          $write("%0d ns: cycloneIII_3c25_niosII_standard_sopc_clock_0_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cycloneIII_3c25_niosII_standard_sopc_clock_0_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cycloneIII_3c25_niosII_standard_sopc_clock_0_out_byteenable_last_time <= 0;
      else if (1)
          cycloneIII_3c25_niosII_standard_sopc_clock_0_out_byteenable_last_time <= cycloneIII_3c25_niosII_standard_sopc_clock_0_out_byteenable;
    end


  //cycloneIII_3c25_niosII_standard_sopc_clock_0_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_byteenable != cycloneIII_3c25_niosII_standard_sopc_clock_0_out_byteenable_last_time))
        begin
          $write("%0d ns: cycloneIII_3c25_niosII_standard_sopc_clock_0_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //cycloneIII_3c25_niosII_standard_sopc_clock_0_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cycloneIII_3c25_niosII_standard_sopc_clock_0_out_read_last_time <= 0;
      else if (1)
          cycloneIII_3c25_niosII_standard_sopc_clock_0_out_read_last_time <= cycloneIII_3c25_niosII_standard_sopc_clock_0_out_read;
    end


  //cycloneIII_3c25_niosII_standard_sopc_clock_0_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_read != cycloneIII_3c25_niosII_standard_sopc_clock_0_out_read_last_time))
        begin
          $write("%0d ns: cycloneIII_3c25_niosII_standard_sopc_clock_0_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //cycloneIII_3c25_niosII_standard_sopc_clock_0_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cycloneIII_3c25_niosII_standard_sopc_clock_0_out_write_last_time <= 0;
      else if (1)
          cycloneIII_3c25_niosII_standard_sopc_clock_0_out_write_last_time <= cycloneIII_3c25_niosII_standard_sopc_clock_0_out_write;
    end


  //cycloneIII_3c25_niosII_standard_sopc_clock_0_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_write != cycloneIII_3c25_niosII_standard_sopc_clock_0_out_write_last_time))
        begin
          $write("%0d ns: cycloneIII_3c25_niosII_standard_sopc_clock_0_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //cycloneIII_3c25_niosII_standard_sopc_clock_0_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cycloneIII_3c25_niosII_standard_sopc_clock_0_out_writedata_last_time <= 0;
      else if (1)
          cycloneIII_3c25_niosII_standard_sopc_clock_0_out_writedata_last_time <= cycloneIII_3c25_niosII_standard_sopc_clock_0_out_writedata;
    end


  //cycloneIII_3c25_niosII_standard_sopc_clock_0_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_writedata != cycloneIII_3c25_niosII_standard_sopc_clock_0_out_writedata_last_time) & cycloneIII_3c25_niosII_standard_sopc_clock_0_out_write)
        begin
          $write("%0d ns: cycloneIII_3c25_niosII_standard_sopc_clock_0_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cycloneIII_3c25_niosII_standard_sopc_clock_1_in_arbitrator (
                                                                    // inputs:
                                                                     clk,
                                                                     cycloneIII_3c25_niosII_standard_sopc_clock_1_in_endofpacket,
                                                                     cycloneIII_3c25_niosII_standard_sopc_clock_1_in_readdata,
                                                                     cycloneIII_3c25_niosII_standard_sopc_clock_1_in_waitrequest,
                                                                     reset_n,
                                                                     slow_peripheral_bridge_m1_address_to_slave,
                                                                     slow_peripheral_bridge_m1_byteenable,
                                                                     slow_peripheral_bridge_m1_latency_counter,
                                                                     slow_peripheral_bridge_m1_nativeaddress,
                                                                     slow_peripheral_bridge_m1_read,
                                                                     slow_peripheral_bridge_m1_write,
                                                                     slow_peripheral_bridge_m1_writedata,

                                                                    // outputs:
                                                                     cycloneIII_3c25_niosII_standard_sopc_clock_1_in_address,
                                                                     cycloneIII_3c25_niosII_standard_sopc_clock_1_in_byteenable,
                                                                     cycloneIII_3c25_niosII_standard_sopc_clock_1_in_endofpacket_from_sa,
                                                                     cycloneIII_3c25_niosII_standard_sopc_clock_1_in_nativeaddress,
                                                                     cycloneIII_3c25_niosII_standard_sopc_clock_1_in_read,
                                                                     cycloneIII_3c25_niosII_standard_sopc_clock_1_in_readdata_from_sa,
                                                                     cycloneIII_3c25_niosII_standard_sopc_clock_1_in_reset_n,
                                                                     cycloneIII_3c25_niosII_standard_sopc_clock_1_in_waitrequest_from_sa,
                                                                     cycloneIII_3c25_niosII_standard_sopc_clock_1_in_write,
                                                                     cycloneIII_3c25_niosII_standard_sopc_clock_1_in_writedata,
                                                                     d1_cycloneIII_3c25_niosII_standard_sopc_clock_1_in_end_xfer,
                                                                     slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_1_in,
                                                                     slow_peripheral_bridge_m1_qualified_request_cycloneIII_3c25_niosII_standard_sopc_clock_1_in,
                                                                     slow_peripheral_bridge_m1_read_data_valid_cycloneIII_3c25_niosII_standard_sopc_clock_1_in,
                                                                     slow_peripheral_bridge_m1_requests_cycloneIII_3c25_niosII_standard_sopc_clock_1_in
                                                                  )
;

  output  [  7: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_in_address;
  output  [  3: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_in_byteenable;
  output           cycloneIII_3c25_niosII_standard_sopc_clock_1_in_endofpacket_from_sa;
  output  [  5: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_in_nativeaddress;
  output           cycloneIII_3c25_niosII_standard_sopc_clock_1_in_read;
  output  [ 31: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_in_readdata_from_sa;
  output           cycloneIII_3c25_niosII_standard_sopc_clock_1_in_reset_n;
  output           cycloneIII_3c25_niosII_standard_sopc_clock_1_in_waitrequest_from_sa;
  output           cycloneIII_3c25_niosII_standard_sopc_clock_1_in_write;
  output  [ 31: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_in_writedata;
  output           d1_cycloneIII_3c25_niosII_standard_sopc_clock_1_in_end_xfer;
  output           slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_1_in;
  output           slow_peripheral_bridge_m1_qualified_request_cycloneIII_3c25_niosII_standard_sopc_clock_1_in;
  output           slow_peripheral_bridge_m1_read_data_valid_cycloneIII_3c25_niosII_standard_sopc_clock_1_in;
  output           slow_peripheral_bridge_m1_requests_cycloneIII_3c25_niosII_standard_sopc_clock_1_in;
  input            clk;
  input            cycloneIII_3c25_niosII_standard_sopc_clock_1_in_endofpacket;
  input   [ 31: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_in_readdata;
  input            cycloneIII_3c25_niosII_standard_sopc_clock_1_in_waitrequest;
  input            reset_n;
  input   [  8: 0] slow_peripheral_bridge_m1_address_to_slave;
  input   [  3: 0] slow_peripheral_bridge_m1_byteenable;
  input            slow_peripheral_bridge_m1_latency_counter;
  input   [  6: 0] slow_peripheral_bridge_m1_nativeaddress;
  input            slow_peripheral_bridge_m1_read;
  input            slow_peripheral_bridge_m1_write;
  input   [ 31: 0] slow_peripheral_bridge_m1_writedata;

  wire    [  7: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_in_address;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_in_allgrants;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_in_allow_new_arb_cycle;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_in_any_bursting_master_saved_grant;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_in_any_continuerequest;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_in_arb_counter_enable;
  reg              cycloneIII_3c25_niosII_standard_sopc_clock_1_in_arb_share_counter;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_in_arb_share_counter_next_value;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_in_arb_share_set_values;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_in_beginbursttransfer_internal;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_in_begins_xfer;
  wire    [  3: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_in_byteenable;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_in_end_xfer;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_in_endofpacket_from_sa;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_in_firsttransfer;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_in_grant_vector;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_in_in_a_read_cycle;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_in_in_a_write_cycle;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_in_master_qreq_vector;
  wire    [  5: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_in_nativeaddress;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_in_non_bursting_master_requests;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_in_read;
  wire    [ 31: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_in_readdata_from_sa;
  reg              cycloneIII_3c25_niosII_standard_sopc_clock_1_in_reg_firsttransfer;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_in_reset_n;
  reg              cycloneIII_3c25_niosII_standard_sopc_clock_1_in_slavearbiterlockenable;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_in_slavearbiterlockenable2;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_in_unreg_firsttransfer;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_in_waitrequest_from_sa;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_in_waits_for_read;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_in_waits_for_write;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_in_write;
  wire    [ 31: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_in_writedata;
  reg              d1_cycloneIII_3c25_niosII_standard_sopc_clock_1_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_cycloneIII_3c25_niosII_standard_sopc_clock_1_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             slow_peripheral_bridge_m1_arbiterlock;
  wire             slow_peripheral_bridge_m1_arbiterlock2;
  wire             slow_peripheral_bridge_m1_continuerequest;
  wire             slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_1_in;
  wire             slow_peripheral_bridge_m1_qualified_request_cycloneIII_3c25_niosII_standard_sopc_clock_1_in;
  wire             slow_peripheral_bridge_m1_read_data_valid_cycloneIII_3c25_niosII_standard_sopc_clock_1_in;
  wire             slow_peripheral_bridge_m1_requests_cycloneIII_3c25_niosII_standard_sopc_clock_1_in;
  wire             slow_peripheral_bridge_m1_saved_grant_cycloneIII_3c25_niosII_standard_sopc_clock_1_in;
  wire             wait_for_cycloneIII_3c25_niosII_standard_sopc_clock_1_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~cycloneIII_3c25_niosII_standard_sopc_clock_1_in_end_xfer;
    end


  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_in_begins_xfer = ~d1_reasons_to_wait & ((slow_peripheral_bridge_m1_qualified_request_cycloneIII_3c25_niosII_standard_sopc_clock_1_in));
  //assign cycloneIII_3c25_niosII_standard_sopc_clock_1_in_readdata_from_sa = cycloneIII_3c25_niosII_standard_sopc_clock_1_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_in_readdata_from_sa = cycloneIII_3c25_niosII_standard_sopc_clock_1_in_readdata;

  assign slow_peripheral_bridge_m1_requests_cycloneIII_3c25_niosII_standard_sopc_clock_1_in = ({slow_peripheral_bridge_m1_address_to_slave[8] , 8'b0} == 9'h0) & (slow_peripheral_bridge_m1_read | slow_peripheral_bridge_m1_write);
  //assign cycloneIII_3c25_niosII_standard_sopc_clock_1_in_waitrequest_from_sa = cycloneIII_3c25_niosII_standard_sopc_clock_1_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_in_waitrequest_from_sa = cycloneIII_3c25_niosII_standard_sopc_clock_1_in_waitrequest;

  //cycloneIII_3c25_niosII_standard_sopc_clock_1_in_arb_share_counter set values, which is an e_mux
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_in_arb_share_set_values = 1;

  //cycloneIII_3c25_niosII_standard_sopc_clock_1_in_non_bursting_master_requests mux, which is an e_mux
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_in_non_bursting_master_requests = slow_peripheral_bridge_m1_requests_cycloneIII_3c25_niosII_standard_sopc_clock_1_in;

  //cycloneIII_3c25_niosII_standard_sopc_clock_1_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_in_any_bursting_master_saved_grant = 0;

  //cycloneIII_3c25_niosII_standard_sopc_clock_1_in_arb_share_counter_next_value assignment, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_in_arb_share_counter_next_value = cycloneIII_3c25_niosII_standard_sopc_clock_1_in_firsttransfer ? (cycloneIII_3c25_niosII_standard_sopc_clock_1_in_arb_share_set_values - 1) : |cycloneIII_3c25_niosII_standard_sopc_clock_1_in_arb_share_counter ? (cycloneIII_3c25_niosII_standard_sopc_clock_1_in_arb_share_counter - 1) : 0;

  //cycloneIII_3c25_niosII_standard_sopc_clock_1_in_allgrants all slave grants, which is an e_mux
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_in_allgrants = |cycloneIII_3c25_niosII_standard_sopc_clock_1_in_grant_vector;

  //cycloneIII_3c25_niosII_standard_sopc_clock_1_in_end_xfer assignment, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_in_end_xfer = ~(cycloneIII_3c25_niosII_standard_sopc_clock_1_in_waits_for_read | cycloneIII_3c25_niosII_standard_sopc_clock_1_in_waits_for_write);

  //end_xfer_arb_share_counter_term_cycloneIII_3c25_niosII_standard_sopc_clock_1_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_cycloneIII_3c25_niosII_standard_sopc_clock_1_in = cycloneIII_3c25_niosII_standard_sopc_clock_1_in_end_xfer & (~cycloneIII_3c25_niosII_standard_sopc_clock_1_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //cycloneIII_3c25_niosII_standard_sopc_clock_1_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_in_arb_counter_enable = (end_xfer_arb_share_counter_term_cycloneIII_3c25_niosII_standard_sopc_clock_1_in & cycloneIII_3c25_niosII_standard_sopc_clock_1_in_allgrants) | (end_xfer_arb_share_counter_term_cycloneIII_3c25_niosII_standard_sopc_clock_1_in & ~cycloneIII_3c25_niosII_standard_sopc_clock_1_in_non_bursting_master_requests);

  //cycloneIII_3c25_niosII_standard_sopc_clock_1_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cycloneIII_3c25_niosII_standard_sopc_clock_1_in_arb_share_counter <= 0;
      else if (cycloneIII_3c25_niosII_standard_sopc_clock_1_in_arb_counter_enable)
          cycloneIII_3c25_niosII_standard_sopc_clock_1_in_arb_share_counter <= cycloneIII_3c25_niosII_standard_sopc_clock_1_in_arb_share_counter_next_value;
    end


  //cycloneIII_3c25_niosII_standard_sopc_clock_1_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cycloneIII_3c25_niosII_standard_sopc_clock_1_in_slavearbiterlockenable <= 0;
      else if ((|cycloneIII_3c25_niosII_standard_sopc_clock_1_in_master_qreq_vector & end_xfer_arb_share_counter_term_cycloneIII_3c25_niosII_standard_sopc_clock_1_in) | (end_xfer_arb_share_counter_term_cycloneIII_3c25_niosII_standard_sopc_clock_1_in & ~cycloneIII_3c25_niosII_standard_sopc_clock_1_in_non_bursting_master_requests))
          cycloneIII_3c25_niosII_standard_sopc_clock_1_in_slavearbiterlockenable <= |cycloneIII_3c25_niosII_standard_sopc_clock_1_in_arb_share_counter_next_value;
    end


  //slow_peripheral_bridge/m1 cycloneIII_3c25_niosII_standard_sopc_clock_1/in arbiterlock, which is an e_assign
  assign slow_peripheral_bridge_m1_arbiterlock = cycloneIII_3c25_niosII_standard_sopc_clock_1_in_slavearbiterlockenable & slow_peripheral_bridge_m1_continuerequest;

  //cycloneIII_3c25_niosII_standard_sopc_clock_1_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_in_slavearbiterlockenable2 = |cycloneIII_3c25_niosII_standard_sopc_clock_1_in_arb_share_counter_next_value;

  //slow_peripheral_bridge/m1 cycloneIII_3c25_niosII_standard_sopc_clock_1/in arbiterlock2, which is an e_assign
  assign slow_peripheral_bridge_m1_arbiterlock2 = cycloneIII_3c25_niosII_standard_sopc_clock_1_in_slavearbiterlockenable2 & slow_peripheral_bridge_m1_continuerequest;

  //cycloneIII_3c25_niosII_standard_sopc_clock_1_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_in_any_continuerequest = 1;

  //slow_peripheral_bridge_m1_continuerequest continued request, which is an e_assign
  assign slow_peripheral_bridge_m1_continuerequest = 1;

  assign slow_peripheral_bridge_m1_qualified_request_cycloneIII_3c25_niosII_standard_sopc_clock_1_in = slow_peripheral_bridge_m1_requests_cycloneIII_3c25_niosII_standard_sopc_clock_1_in & ~((slow_peripheral_bridge_m1_read & ((slow_peripheral_bridge_m1_latency_counter != 0))));
  //local readdatavalid slow_peripheral_bridge_m1_read_data_valid_cycloneIII_3c25_niosII_standard_sopc_clock_1_in, which is an e_mux
  assign slow_peripheral_bridge_m1_read_data_valid_cycloneIII_3c25_niosII_standard_sopc_clock_1_in = slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_1_in & slow_peripheral_bridge_m1_read & ~cycloneIII_3c25_niosII_standard_sopc_clock_1_in_waits_for_read;

  //cycloneIII_3c25_niosII_standard_sopc_clock_1_in_writedata mux, which is an e_mux
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_in_writedata = slow_peripheral_bridge_m1_writedata;

  //assign cycloneIII_3c25_niosII_standard_sopc_clock_1_in_endofpacket_from_sa = cycloneIII_3c25_niosII_standard_sopc_clock_1_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_in_endofpacket_from_sa = cycloneIII_3c25_niosII_standard_sopc_clock_1_in_endofpacket;

  //master is always granted when requested
  assign slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_1_in = slow_peripheral_bridge_m1_qualified_request_cycloneIII_3c25_niosII_standard_sopc_clock_1_in;

  //slow_peripheral_bridge/m1 saved-grant cycloneIII_3c25_niosII_standard_sopc_clock_1/in, which is an e_assign
  assign slow_peripheral_bridge_m1_saved_grant_cycloneIII_3c25_niosII_standard_sopc_clock_1_in = slow_peripheral_bridge_m1_requests_cycloneIII_3c25_niosII_standard_sopc_clock_1_in;

  //allow new arb cycle for cycloneIII_3c25_niosII_standard_sopc_clock_1/in, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_in_master_qreq_vector = 1;

  //cycloneIII_3c25_niosII_standard_sopc_clock_1_in_reset_n assignment, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_in_reset_n = reset_n;

  //cycloneIII_3c25_niosII_standard_sopc_clock_1_in_firsttransfer first transaction, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_in_firsttransfer = cycloneIII_3c25_niosII_standard_sopc_clock_1_in_begins_xfer ? cycloneIII_3c25_niosII_standard_sopc_clock_1_in_unreg_firsttransfer : cycloneIII_3c25_niosII_standard_sopc_clock_1_in_reg_firsttransfer;

  //cycloneIII_3c25_niosII_standard_sopc_clock_1_in_unreg_firsttransfer first transaction, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_in_unreg_firsttransfer = ~(cycloneIII_3c25_niosII_standard_sopc_clock_1_in_slavearbiterlockenable & cycloneIII_3c25_niosII_standard_sopc_clock_1_in_any_continuerequest);

  //cycloneIII_3c25_niosII_standard_sopc_clock_1_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cycloneIII_3c25_niosII_standard_sopc_clock_1_in_reg_firsttransfer <= 1'b1;
      else if (cycloneIII_3c25_niosII_standard_sopc_clock_1_in_begins_xfer)
          cycloneIII_3c25_niosII_standard_sopc_clock_1_in_reg_firsttransfer <= cycloneIII_3c25_niosII_standard_sopc_clock_1_in_unreg_firsttransfer;
    end


  //cycloneIII_3c25_niosII_standard_sopc_clock_1_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_in_beginbursttransfer_internal = cycloneIII_3c25_niosII_standard_sopc_clock_1_in_begins_xfer;

  //cycloneIII_3c25_niosII_standard_sopc_clock_1_in_read assignment, which is an e_mux
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_in_read = slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_1_in & slow_peripheral_bridge_m1_read;

  //cycloneIII_3c25_niosII_standard_sopc_clock_1_in_write assignment, which is an e_mux
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_in_write = slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_1_in & slow_peripheral_bridge_m1_write;

  //cycloneIII_3c25_niosII_standard_sopc_clock_1_in_address mux, which is an e_mux
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_in_address = slow_peripheral_bridge_m1_address_to_slave;

  //slaveid cycloneIII_3c25_niosII_standard_sopc_clock_1_in_nativeaddress nativeaddress mux, which is an e_mux
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_in_nativeaddress = slow_peripheral_bridge_m1_nativeaddress;

  //d1_cycloneIII_3c25_niosII_standard_sopc_clock_1_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_cycloneIII_3c25_niosII_standard_sopc_clock_1_in_end_xfer <= 1;
      else if (1)
          d1_cycloneIII_3c25_niosII_standard_sopc_clock_1_in_end_xfer <= cycloneIII_3c25_niosII_standard_sopc_clock_1_in_end_xfer;
    end


  //cycloneIII_3c25_niosII_standard_sopc_clock_1_in_waits_for_read in a cycle, which is an e_mux
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_in_waits_for_read = cycloneIII_3c25_niosII_standard_sopc_clock_1_in_in_a_read_cycle & cycloneIII_3c25_niosII_standard_sopc_clock_1_in_waitrequest_from_sa;

  //cycloneIII_3c25_niosII_standard_sopc_clock_1_in_in_a_read_cycle assignment, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_in_in_a_read_cycle = slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_1_in & slow_peripheral_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cycloneIII_3c25_niosII_standard_sopc_clock_1_in_in_a_read_cycle;

  //cycloneIII_3c25_niosII_standard_sopc_clock_1_in_waits_for_write in a cycle, which is an e_mux
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_in_waits_for_write = cycloneIII_3c25_niosII_standard_sopc_clock_1_in_in_a_write_cycle & cycloneIII_3c25_niosII_standard_sopc_clock_1_in_waitrequest_from_sa;

  //cycloneIII_3c25_niosII_standard_sopc_clock_1_in_in_a_write_cycle assignment, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_in_in_a_write_cycle = slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_1_in & slow_peripheral_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cycloneIII_3c25_niosII_standard_sopc_clock_1_in_in_a_write_cycle;

  assign wait_for_cycloneIII_3c25_niosII_standard_sopc_clock_1_in_counter = 0;
  //cycloneIII_3c25_niosII_standard_sopc_clock_1_in_byteenable byte enable port mux, which is an e_mux
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_in_byteenable = (slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_1_in)? slow_peripheral_bridge_m1_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cycloneIII_3c25_niosII_standard_sopc_clock_1/in enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cycloneIII_3c25_niosII_standard_sopc_clock_1_out_arbitrator (
                                                                     // inputs:
                                                                      clk,
                                                                      cycloneIII_3c25_niosII_standard_sopc_clock_1_out_address,
                                                                      cycloneIII_3c25_niosII_standard_sopc_clock_1_out_byteenable,
                                                                      cycloneIII_3c25_niosII_standard_sopc_clock_1_out_granted_remote_update_s1,
                                                                      cycloneIII_3c25_niosII_standard_sopc_clock_1_out_qualified_request_remote_update_s1,
                                                                      cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read,
                                                                      cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read_data_valid_remote_update_s1,
                                                                      cycloneIII_3c25_niosII_standard_sopc_clock_1_out_requests_remote_update_s1,
                                                                      cycloneIII_3c25_niosII_standard_sopc_clock_1_out_write,
                                                                      cycloneIII_3c25_niosII_standard_sopc_clock_1_out_writedata,
                                                                      d1_remote_update_s1_end_xfer,
                                                                      remote_update_s1_readdata_from_sa,
                                                                      remote_update_s1_waitrequest_from_sa,
                                                                      reset_n,

                                                                     // outputs:
                                                                      cycloneIII_3c25_niosII_standard_sopc_clock_1_out_address_to_slave,
                                                                      cycloneIII_3c25_niosII_standard_sopc_clock_1_out_readdata,
                                                                      cycloneIII_3c25_niosII_standard_sopc_clock_1_out_reset_n,
                                                                      cycloneIII_3c25_niosII_standard_sopc_clock_1_out_waitrequest
                                                                   )
;

  output  [  7: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_out_address_to_slave;
  output  [ 31: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_out_readdata;
  output           cycloneIII_3c25_niosII_standard_sopc_clock_1_out_reset_n;
  output           cycloneIII_3c25_niosII_standard_sopc_clock_1_out_waitrequest;
  input            clk;
  input   [  7: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_out_address;
  input   [  3: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_out_byteenable;
  input            cycloneIII_3c25_niosII_standard_sopc_clock_1_out_granted_remote_update_s1;
  input            cycloneIII_3c25_niosII_standard_sopc_clock_1_out_qualified_request_remote_update_s1;
  input            cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read;
  input            cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read_data_valid_remote_update_s1;
  input            cycloneIII_3c25_niosII_standard_sopc_clock_1_out_requests_remote_update_s1;
  input            cycloneIII_3c25_niosII_standard_sopc_clock_1_out_write;
  input   [ 31: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_out_writedata;
  input            d1_remote_update_s1_end_xfer;
  input   [ 31: 0] remote_update_s1_readdata_from_sa;
  input            remote_update_s1_waitrequest_from_sa;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [  7: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_out_address_last_time;
  wire    [  7: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_out_address_to_slave;
  reg     [  3: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_out_byteenable_last_time;
  reg              cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read_last_time;
  wire    [ 31: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_out_readdata;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_out_reset_n;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_out_run;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_out_waitrequest;
  reg              cycloneIII_3c25_niosII_standard_sopc_clock_1_out_write_last_time;
  reg     [ 31: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_out_writedata_last_time;
  wire             r_1;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_qualified_request_remote_update_s1 | cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read_data_valid_remote_update_s1 | ~cycloneIII_3c25_niosII_standard_sopc_clock_1_out_requests_remote_update_s1) & ((~cycloneIII_3c25_niosII_standard_sopc_clock_1_out_qualified_request_remote_update_s1 | ~cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read | (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read_data_valid_remote_update_s1 & cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read))) & ((~cycloneIII_3c25_niosII_standard_sopc_clock_1_out_qualified_request_remote_update_s1 | ~(cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read | cycloneIII_3c25_niosII_standard_sopc_clock_1_out_write) | (1 & ~remote_update_s1_waitrequest_from_sa & (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read | cycloneIII_3c25_niosII_standard_sopc_clock_1_out_write))));

  //cascaded wait assignment, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_out_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_out_address_to_slave = cycloneIII_3c25_niosII_standard_sopc_clock_1_out_address;

  //cycloneIII_3c25_niosII_standard_sopc_clock_1/out readdata mux, which is an e_mux
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_out_readdata = remote_update_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_out_waitrequest = ~cycloneIII_3c25_niosII_standard_sopc_clock_1_out_run;

  //cycloneIII_3c25_niosII_standard_sopc_clock_1_out_reset_n assignment, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cycloneIII_3c25_niosII_standard_sopc_clock_1_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cycloneIII_3c25_niosII_standard_sopc_clock_1_out_address_last_time <= 0;
      else if (1)
          cycloneIII_3c25_niosII_standard_sopc_clock_1_out_address_last_time <= cycloneIII_3c25_niosII_standard_sopc_clock_1_out_address;
    end


  //cycloneIII_3c25_niosII_standard_sopc_clock_1/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else if (1)
          active_and_waiting_last_time <= cycloneIII_3c25_niosII_standard_sopc_clock_1_out_waitrequest & (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read | cycloneIII_3c25_niosII_standard_sopc_clock_1_out_write);
    end


  //cycloneIII_3c25_niosII_standard_sopc_clock_1_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_address != cycloneIII_3c25_niosII_standard_sopc_clock_1_out_address_last_time))
        begin
          $write("%0d ns: cycloneIII_3c25_niosII_standard_sopc_clock_1_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cycloneIII_3c25_niosII_standard_sopc_clock_1_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cycloneIII_3c25_niosII_standard_sopc_clock_1_out_byteenable_last_time <= 0;
      else if (1)
          cycloneIII_3c25_niosII_standard_sopc_clock_1_out_byteenable_last_time <= cycloneIII_3c25_niosII_standard_sopc_clock_1_out_byteenable;
    end


  //cycloneIII_3c25_niosII_standard_sopc_clock_1_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_byteenable != cycloneIII_3c25_niosII_standard_sopc_clock_1_out_byteenable_last_time))
        begin
          $write("%0d ns: cycloneIII_3c25_niosII_standard_sopc_clock_1_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read_last_time <= 0;
      else if (1)
          cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read_last_time <= cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read;
    end


  //cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read != cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read_last_time))
        begin
          $write("%0d ns: cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //cycloneIII_3c25_niosII_standard_sopc_clock_1_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cycloneIII_3c25_niosII_standard_sopc_clock_1_out_write_last_time <= 0;
      else if (1)
          cycloneIII_3c25_niosII_standard_sopc_clock_1_out_write_last_time <= cycloneIII_3c25_niosII_standard_sopc_clock_1_out_write;
    end


  //cycloneIII_3c25_niosII_standard_sopc_clock_1_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_write != cycloneIII_3c25_niosII_standard_sopc_clock_1_out_write_last_time))
        begin
          $write("%0d ns: cycloneIII_3c25_niosII_standard_sopc_clock_1_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //cycloneIII_3c25_niosII_standard_sopc_clock_1_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cycloneIII_3c25_niosII_standard_sopc_clock_1_out_writedata_last_time <= 0;
      else if (1)
          cycloneIII_3c25_niosII_standard_sopc_clock_1_out_writedata_last_time <= cycloneIII_3c25_niosII_standard_sopc_clock_1_out_writedata;
    end


  //cycloneIII_3c25_niosII_standard_sopc_clock_1_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_writedata != cycloneIII_3c25_niosII_standard_sopc_clock_1_out_writedata_last_time) & cycloneIII_3c25_niosII_standard_sopc_clock_1_out_write)
        begin
          $write("%0d ns: cycloneIII_3c25_niosII_standard_sopc_clock_1_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_ddr_clock_bridge_m1_to_ddr_sdram_s1_module (
                                                                     // inputs:
                                                                      clear_fifo,
                                                                      clk,
                                                                      data_in,
                                                                      read,
                                                                      reset_n,
                                                                      sync_reset,
                                                                      write,

                                                                     // outputs:
                                                                      data_out,
                                                                      empty,
                                                                      fifo_contains_ones_n,
                                                                      full
                                                                   )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_10;
  reg              full_11;
  reg              full_12;
  reg              full_13;
  reg              full_14;
  reg              full_15;
  reg              full_16;
  reg              full_17;
  reg              full_18;
  reg              full_19;
  reg              full_2;
  reg              full_20;
  reg              full_21;
  reg              full_22;
  reg              full_23;
  reg              full_24;
  reg              full_25;
  reg              full_26;
  reg              full_27;
  reg              full_28;
  reg              full_29;
  reg              full_3;
  reg              full_30;
  reg              full_31;
  wire             full_32;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  reg              full_7;
  reg              full_8;
  reg              full_9;
  reg     [  6: 0] how_many_ones;
  wire    [  6: 0] one_count_minus_one;
  wire    [  6: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p10_full_10;
  wire             p10_stage_10;
  wire             p11_full_11;
  wire             p11_stage_11;
  wire             p12_full_12;
  wire             p12_stage_12;
  wire             p13_full_13;
  wire             p13_stage_13;
  wire             p14_full_14;
  wire             p14_stage_14;
  wire             p15_full_15;
  wire             p15_stage_15;
  wire             p16_full_16;
  wire             p16_stage_16;
  wire             p17_full_17;
  wire             p17_stage_17;
  wire             p18_full_18;
  wire             p18_stage_18;
  wire             p19_full_19;
  wire             p19_stage_19;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p20_full_20;
  wire             p20_stage_20;
  wire             p21_full_21;
  wire             p21_stage_21;
  wire             p22_full_22;
  wire             p22_stage_22;
  wire             p23_full_23;
  wire             p23_stage_23;
  wire             p24_full_24;
  wire             p24_stage_24;
  wire             p25_full_25;
  wire             p25_stage_25;
  wire             p26_full_26;
  wire             p26_stage_26;
  wire             p27_full_27;
  wire             p27_stage_27;
  wire             p28_full_28;
  wire             p28_stage_28;
  wire             p29_full_29;
  wire             p29_stage_29;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p30_full_30;
  wire             p30_stage_30;
  wire             p31_full_31;
  wire             p31_stage_31;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  wire             p7_full_7;
  wire             p7_stage_7;
  wire             p8_full_8;
  wire             p8_stage_8;
  wire             p9_full_9;
  wire             p9_stage_9;
  reg              stage_0;
  reg              stage_1;
  reg              stage_10;
  reg              stage_11;
  reg              stage_12;
  reg              stage_13;
  reg              stage_14;
  reg              stage_15;
  reg              stage_16;
  reg              stage_17;
  reg              stage_18;
  reg              stage_19;
  reg              stage_2;
  reg              stage_20;
  reg              stage_21;
  reg              stage_22;
  reg              stage_23;
  reg              stage_24;
  reg              stage_25;
  reg              stage_26;
  reg              stage_27;
  reg              stage_28;
  reg              stage_29;
  reg              stage_3;
  reg              stage_30;
  reg              stage_31;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  reg              stage_7;
  reg              stage_8;
  reg              stage_9;
  wire    [  6: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_31;
  assign empty = !full_0;
  assign full_32 = 0;
  //data_31, which is an e_mux
  assign p31_stage_31 = ((full_32 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_31 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_31))
          if (sync_reset & full_31 & !((full_32 == 0) & read & write))
              stage_31 <= 0;
          else 
            stage_31 <= p31_stage_31;
    end


  //control_31, which is an e_mux
  assign p31_full_31 = ((read & !write) == 0)? full_30 :
    0;

  //control_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_31 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_31 <= 0;
          else 
            full_31 <= p31_full_31;
    end


  //data_30, which is an e_mux
  assign p30_stage_30 = ((full_31 & ~clear_fifo) == 0)? data_in :
    stage_31;

  //data_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_30 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_30))
          if (sync_reset & full_30 & !((full_31 == 0) & read & write))
              stage_30 <= 0;
          else 
            stage_30 <= p30_stage_30;
    end


  //control_30, which is an e_mux
  assign p30_full_30 = ((read & !write) == 0)? full_29 :
    full_31;

  //control_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_30 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_30 <= 0;
          else 
            full_30 <= p30_full_30;
    end


  //data_29, which is an e_mux
  assign p29_stage_29 = ((full_30 & ~clear_fifo) == 0)? data_in :
    stage_30;

  //data_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_29 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_29))
          if (sync_reset & full_29 & !((full_30 == 0) & read & write))
              stage_29 <= 0;
          else 
            stage_29 <= p29_stage_29;
    end


  //control_29, which is an e_mux
  assign p29_full_29 = ((read & !write) == 0)? full_28 :
    full_30;

  //control_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_29 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_29 <= 0;
          else 
            full_29 <= p29_full_29;
    end


  //data_28, which is an e_mux
  assign p28_stage_28 = ((full_29 & ~clear_fifo) == 0)? data_in :
    stage_29;

  //data_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_28 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_28))
          if (sync_reset & full_28 & !((full_29 == 0) & read & write))
              stage_28 <= 0;
          else 
            stage_28 <= p28_stage_28;
    end


  //control_28, which is an e_mux
  assign p28_full_28 = ((read & !write) == 0)? full_27 :
    full_29;

  //control_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_28 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_28 <= 0;
          else 
            full_28 <= p28_full_28;
    end


  //data_27, which is an e_mux
  assign p27_stage_27 = ((full_28 & ~clear_fifo) == 0)? data_in :
    stage_28;

  //data_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_27 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_27))
          if (sync_reset & full_27 & !((full_28 == 0) & read & write))
              stage_27 <= 0;
          else 
            stage_27 <= p27_stage_27;
    end


  //control_27, which is an e_mux
  assign p27_full_27 = ((read & !write) == 0)? full_26 :
    full_28;

  //control_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_27 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_27 <= 0;
          else 
            full_27 <= p27_full_27;
    end


  //data_26, which is an e_mux
  assign p26_stage_26 = ((full_27 & ~clear_fifo) == 0)? data_in :
    stage_27;

  //data_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_26 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_26))
          if (sync_reset & full_26 & !((full_27 == 0) & read & write))
              stage_26 <= 0;
          else 
            stage_26 <= p26_stage_26;
    end


  //control_26, which is an e_mux
  assign p26_full_26 = ((read & !write) == 0)? full_25 :
    full_27;

  //control_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_26 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_26 <= 0;
          else 
            full_26 <= p26_full_26;
    end


  //data_25, which is an e_mux
  assign p25_stage_25 = ((full_26 & ~clear_fifo) == 0)? data_in :
    stage_26;

  //data_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_25 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_25))
          if (sync_reset & full_25 & !((full_26 == 0) & read & write))
              stage_25 <= 0;
          else 
            stage_25 <= p25_stage_25;
    end


  //control_25, which is an e_mux
  assign p25_full_25 = ((read & !write) == 0)? full_24 :
    full_26;

  //control_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_25 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_25 <= 0;
          else 
            full_25 <= p25_full_25;
    end


  //data_24, which is an e_mux
  assign p24_stage_24 = ((full_25 & ~clear_fifo) == 0)? data_in :
    stage_25;

  //data_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_24 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_24))
          if (sync_reset & full_24 & !((full_25 == 0) & read & write))
              stage_24 <= 0;
          else 
            stage_24 <= p24_stage_24;
    end


  //control_24, which is an e_mux
  assign p24_full_24 = ((read & !write) == 0)? full_23 :
    full_25;

  //control_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_24 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_24 <= 0;
          else 
            full_24 <= p24_full_24;
    end


  //data_23, which is an e_mux
  assign p23_stage_23 = ((full_24 & ~clear_fifo) == 0)? data_in :
    stage_24;

  //data_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_23 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_23))
          if (sync_reset & full_23 & !((full_24 == 0) & read & write))
              stage_23 <= 0;
          else 
            stage_23 <= p23_stage_23;
    end


  //control_23, which is an e_mux
  assign p23_full_23 = ((read & !write) == 0)? full_22 :
    full_24;

  //control_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_23 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_23 <= 0;
          else 
            full_23 <= p23_full_23;
    end


  //data_22, which is an e_mux
  assign p22_stage_22 = ((full_23 & ~clear_fifo) == 0)? data_in :
    stage_23;

  //data_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_22 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_22))
          if (sync_reset & full_22 & !((full_23 == 0) & read & write))
              stage_22 <= 0;
          else 
            stage_22 <= p22_stage_22;
    end


  //control_22, which is an e_mux
  assign p22_full_22 = ((read & !write) == 0)? full_21 :
    full_23;

  //control_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_22 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_22 <= 0;
          else 
            full_22 <= p22_full_22;
    end


  //data_21, which is an e_mux
  assign p21_stage_21 = ((full_22 & ~clear_fifo) == 0)? data_in :
    stage_22;

  //data_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_21 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_21))
          if (sync_reset & full_21 & !((full_22 == 0) & read & write))
              stage_21 <= 0;
          else 
            stage_21 <= p21_stage_21;
    end


  //control_21, which is an e_mux
  assign p21_full_21 = ((read & !write) == 0)? full_20 :
    full_22;

  //control_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_21 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_21 <= 0;
          else 
            full_21 <= p21_full_21;
    end


  //data_20, which is an e_mux
  assign p20_stage_20 = ((full_21 & ~clear_fifo) == 0)? data_in :
    stage_21;

  //data_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_20 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_20))
          if (sync_reset & full_20 & !((full_21 == 0) & read & write))
              stage_20 <= 0;
          else 
            stage_20 <= p20_stage_20;
    end


  //control_20, which is an e_mux
  assign p20_full_20 = ((read & !write) == 0)? full_19 :
    full_21;

  //control_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_20 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_20 <= 0;
          else 
            full_20 <= p20_full_20;
    end


  //data_19, which is an e_mux
  assign p19_stage_19 = ((full_20 & ~clear_fifo) == 0)? data_in :
    stage_20;

  //data_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_19 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_19))
          if (sync_reset & full_19 & !((full_20 == 0) & read & write))
              stage_19 <= 0;
          else 
            stage_19 <= p19_stage_19;
    end


  //control_19, which is an e_mux
  assign p19_full_19 = ((read & !write) == 0)? full_18 :
    full_20;

  //control_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_19 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_19 <= 0;
          else 
            full_19 <= p19_full_19;
    end


  //data_18, which is an e_mux
  assign p18_stage_18 = ((full_19 & ~clear_fifo) == 0)? data_in :
    stage_19;

  //data_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_18 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_18))
          if (sync_reset & full_18 & !((full_19 == 0) & read & write))
              stage_18 <= 0;
          else 
            stage_18 <= p18_stage_18;
    end


  //control_18, which is an e_mux
  assign p18_full_18 = ((read & !write) == 0)? full_17 :
    full_19;

  //control_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_18 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_18 <= 0;
          else 
            full_18 <= p18_full_18;
    end


  //data_17, which is an e_mux
  assign p17_stage_17 = ((full_18 & ~clear_fifo) == 0)? data_in :
    stage_18;

  //data_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_17 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_17))
          if (sync_reset & full_17 & !((full_18 == 0) & read & write))
              stage_17 <= 0;
          else 
            stage_17 <= p17_stage_17;
    end


  //control_17, which is an e_mux
  assign p17_full_17 = ((read & !write) == 0)? full_16 :
    full_18;

  //control_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_17 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_17 <= 0;
          else 
            full_17 <= p17_full_17;
    end


  //data_16, which is an e_mux
  assign p16_stage_16 = ((full_17 & ~clear_fifo) == 0)? data_in :
    stage_17;

  //data_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_16 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_16))
          if (sync_reset & full_16 & !((full_17 == 0) & read & write))
              stage_16 <= 0;
          else 
            stage_16 <= p16_stage_16;
    end


  //control_16, which is an e_mux
  assign p16_full_16 = ((read & !write) == 0)? full_15 :
    full_17;

  //control_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_16 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_16 <= 0;
          else 
            full_16 <= p16_full_16;
    end


  //data_15, which is an e_mux
  assign p15_stage_15 = ((full_16 & ~clear_fifo) == 0)? data_in :
    stage_16;

  //data_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_15 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_15))
          if (sync_reset & full_15 & !((full_16 == 0) & read & write))
              stage_15 <= 0;
          else 
            stage_15 <= p15_stage_15;
    end


  //control_15, which is an e_mux
  assign p15_full_15 = ((read & !write) == 0)? full_14 :
    full_16;

  //control_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_15 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_15 <= 0;
          else 
            full_15 <= p15_full_15;
    end


  //data_14, which is an e_mux
  assign p14_stage_14 = ((full_15 & ~clear_fifo) == 0)? data_in :
    stage_15;

  //data_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_14 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_14))
          if (sync_reset & full_14 & !((full_15 == 0) & read & write))
              stage_14 <= 0;
          else 
            stage_14 <= p14_stage_14;
    end


  //control_14, which is an e_mux
  assign p14_full_14 = ((read & !write) == 0)? full_13 :
    full_15;

  //control_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_14 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_14 <= 0;
          else 
            full_14 <= p14_full_14;
    end


  //data_13, which is an e_mux
  assign p13_stage_13 = ((full_14 & ~clear_fifo) == 0)? data_in :
    stage_14;

  //data_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_13 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_13))
          if (sync_reset & full_13 & !((full_14 == 0) & read & write))
              stage_13 <= 0;
          else 
            stage_13 <= p13_stage_13;
    end


  //control_13, which is an e_mux
  assign p13_full_13 = ((read & !write) == 0)? full_12 :
    full_14;

  //control_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_13 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_13 <= 0;
          else 
            full_13 <= p13_full_13;
    end


  //data_12, which is an e_mux
  assign p12_stage_12 = ((full_13 & ~clear_fifo) == 0)? data_in :
    stage_13;

  //data_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_12 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_12))
          if (sync_reset & full_12 & !((full_13 == 0) & read & write))
              stage_12 <= 0;
          else 
            stage_12 <= p12_stage_12;
    end


  //control_12, which is an e_mux
  assign p12_full_12 = ((read & !write) == 0)? full_11 :
    full_13;

  //control_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_12 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_12 <= 0;
          else 
            full_12 <= p12_full_12;
    end


  //data_11, which is an e_mux
  assign p11_stage_11 = ((full_12 & ~clear_fifo) == 0)? data_in :
    stage_12;

  //data_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_11 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_11))
          if (sync_reset & full_11 & !((full_12 == 0) & read & write))
              stage_11 <= 0;
          else 
            stage_11 <= p11_stage_11;
    end


  //control_11, which is an e_mux
  assign p11_full_11 = ((read & !write) == 0)? full_10 :
    full_12;

  //control_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_11 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_11 <= 0;
          else 
            full_11 <= p11_full_11;
    end


  //data_10, which is an e_mux
  assign p10_stage_10 = ((full_11 & ~clear_fifo) == 0)? data_in :
    stage_11;

  //data_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_10 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_10))
          if (sync_reset & full_10 & !((full_11 == 0) & read & write))
              stage_10 <= 0;
          else 
            stage_10 <= p10_stage_10;
    end


  //control_10, which is an e_mux
  assign p10_full_10 = ((read & !write) == 0)? full_9 :
    full_11;

  //control_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_10 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_10 <= 0;
          else 
            full_10 <= p10_full_10;
    end


  //data_9, which is an e_mux
  assign p9_stage_9 = ((full_10 & ~clear_fifo) == 0)? data_in :
    stage_10;

  //data_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_9 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_9))
          if (sync_reset & full_9 & !((full_10 == 0) & read & write))
              stage_9 <= 0;
          else 
            stage_9 <= p9_stage_9;
    end


  //control_9, which is an e_mux
  assign p9_full_9 = ((read & !write) == 0)? full_8 :
    full_10;

  //control_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_9 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_9 <= 0;
          else 
            full_9 <= p9_full_9;
    end


  //data_8, which is an e_mux
  assign p8_stage_8 = ((full_9 & ~clear_fifo) == 0)? data_in :
    stage_9;

  //data_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_8 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_8))
          if (sync_reset & full_8 & !((full_9 == 0) & read & write))
              stage_8 <= 0;
          else 
            stage_8 <= p8_stage_8;
    end


  //control_8, which is an e_mux
  assign p8_full_8 = ((read & !write) == 0)? full_7 :
    full_9;

  //control_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_8 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_8 <= 0;
          else 
            full_8 <= p8_full_8;
    end


  //data_7, which is an e_mux
  assign p7_stage_7 = ((full_8 & ~clear_fifo) == 0)? data_in :
    stage_8;

  //data_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_7 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_7))
          if (sync_reset & full_7 & !((full_8 == 0) & read & write))
              stage_7 <= 0;
          else 
            stage_7 <= p7_stage_7;
    end


  //control_7, which is an e_mux
  assign p7_full_7 = ((read & !write) == 0)? full_6 :
    full_8;

  //control_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_7 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_7 <= 0;
          else 
            full_7 <= p7_full_7;
    end


  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    stage_7;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    full_7;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module ddr_sdram_s1_arbitrator (
                                 // inputs:
                                  clk,
                                  cpu_ddr_clock_bridge_m1_address_to_slave,
                                  cpu_ddr_clock_bridge_m1_byteenable,
                                  cpu_ddr_clock_bridge_m1_latency_counter,
                                  cpu_ddr_clock_bridge_m1_read,
                                  cpu_ddr_clock_bridge_m1_write,
                                  cpu_ddr_clock_bridge_m1_writedata,
                                  ddr_sdram_s1_readdata,
                                  ddr_sdram_s1_readdatavalid,
                                  ddr_sdram_s1_resetrequest_n,
                                  ddr_sdram_s1_waitrequest_n,
                                  reset_n,

                                 // outputs:
                                  cpu_ddr_clock_bridge_m1_granted_ddr_sdram_s1,
                                  cpu_ddr_clock_bridge_m1_qualified_request_ddr_sdram_s1,
                                  cpu_ddr_clock_bridge_m1_read_data_valid_ddr_sdram_s1,
                                  cpu_ddr_clock_bridge_m1_read_data_valid_ddr_sdram_s1_shift_register,
                                  cpu_ddr_clock_bridge_m1_requests_ddr_sdram_s1,
                                  d1_ddr_sdram_s1_end_xfer,
                                  ddr_sdram_s1_address,
                                  ddr_sdram_s1_beginbursttransfer,
                                  ddr_sdram_s1_burstcount,
                                  ddr_sdram_s1_byteenable,
                                  ddr_sdram_s1_read,
                                  ddr_sdram_s1_readdata_from_sa,
                                  ddr_sdram_s1_resetrequest_n_from_sa,
                                  ddr_sdram_s1_waitrequest_n_from_sa,
                                  ddr_sdram_s1_write,
                                  ddr_sdram_s1_writedata
                               )
;

  output           cpu_ddr_clock_bridge_m1_granted_ddr_sdram_s1;
  output           cpu_ddr_clock_bridge_m1_qualified_request_ddr_sdram_s1;
  output           cpu_ddr_clock_bridge_m1_read_data_valid_ddr_sdram_s1;
  output           cpu_ddr_clock_bridge_m1_read_data_valid_ddr_sdram_s1_shift_register;
  output           cpu_ddr_clock_bridge_m1_requests_ddr_sdram_s1;
  output           d1_ddr_sdram_s1_end_xfer;
  output  [ 21: 0] ddr_sdram_s1_address;
  output           ddr_sdram_s1_beginbursttransfer;
  output           ddr_sdram_s1_burstcount;
  output  [  7: 0] ddr_sdram_s1_byteenable;
  output           ddr_sdram_s1_read;
  output  [ 63: 0] ddr_sdram_s1_readdata_from_sa;
  output           ddr_sdram_s1_resetrequest_n_from_sa;
  output           ddr_sdram_s1_waitrequest_n_from_sa;
  output           ddr_sdram_s1_write;
  output  [ 63: 0] ddr_sdram_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_ddr_clock_bridge_m1_address_to_slave;
  input   [  3: 0] cpu_ddr_clock_bridge_m1_byteenable;
  input            cpu_ddr_clock_bridge_m1_latency_counter;
  input            cpu_ddr_clock_bridge_m1_read;
  input            cpu_ddr_clock_bridge_m1_write;
  input   [ 31: 0] cpu_ddr_clock_bridge_m1_writedata;
  input   [ 63: 0] ddr_sdram_s1_readdata;
  input            ddr_sdram_s1_readdatavalid;
  input            ddr_sdram_s1_resetrequest_n;
  input            ddr_sdram_s1_waitrequest_n;
  input            reset_n;

  wire             cpu_ddr_clock_bridge_m1_arbiterlock;
  wire             cpu_ddr_clock_bridge_m1_arbiterlock2;
  wire    [  7: 0] cpu_ddr_clock_bridge_m1_byteenable_ddr_sdram_s1;
  wire             cpu_ddr_clock_bridge_m1_continuerequest;
  wire             cpu_ddr_clock_bridge_m1_granted_ddr_sdram_s1;
  wire             cpu_ddr_clock_bridge_m1_qualified_request_ddr_sdram_s1;
  wire             cpu_ddr_clock_bridge_m1_rdv_fifo_empty_ddr_sdram_s1;
  wire             cpu_ddr_clock_bridge_m1_rdv_fifo_output_from_ddr_sdram_s1;
  wire             cpu_ddr_clock_bridge_m1_read_data_valid_ddr_sdram_s1;
  wire             cpu_ddr_clock_bridge_m1_read_data_valid_ddr_sdram_s1_shift_register;
  wire             cpu_ddr_clock_bridge_m1_requests_ddr_sdram_s1;
  wire             cpu_ddr_clock_bridge_m1_saved_grant_ddr_sdram_s1;
  wire    [ 63: 0] cpu_ddr_clock_bridge_m1_writedata_replicated;
  reg              d1_ddr_sdram_s1_end_xfer;
  reg              d1_reasons_to_wait;
  wire    [ 21: 0] ddr_sdram_s1_address;
  wire             ddr_sdram_s1_allgrants;
  wire             ddr_sdram_s1_allow_new_arb_cycle;
  wire             ddr_sdram_s1_any_bursting_master_saved_grant;
  wire             ddr_sdram_s1_any_continuerequest;
  wire             ddr_sdram_s1_arb_counter_enable;
  reg     [  3: 0] ddr_sdram_s1_arb_share_counter;
  wire    [  3: 0] ddr_sdram_s1_arb_share_counter_next_value;
  wire    [  3: 0] ddr_sdram_s1_arb_share_set_values;
  wire             ddr_sdram_s1_beginbursttransfer;
  wire             ddr_sdram_s1_beginbursttransfer_internal;
  wire             ddr_sdram_s1_begins_xfer;
  wire             ddr_sdram_s1_burstcount;
  wire    [  7: 0] ddr_sdram_s1_byteenable;
  wire             ddr_sdram_s1_end_xfer;
  wire             ddr_sdram_s1_firsttransfer;
  wire             ddr_sdram_s1_grant_vector;
  wire             ddr_sdram_s1_in_a_read_cycle;
  wire             ddr_sdram_s1_in_a_write_cycle;
  wire             ddr_sdram_s1_master_qreq_vector;
  wire             ddr_sdram_s1_move_on_to_next_transaction;
  wire             ddr_sdram_s1_non_bursting_master_requests;
  wire             ddr_sdram_s1_read;
  wire    [ 63: 0] ddr_sdram_s1_readdata_from_sa;
  wire             ddr_sdram_s1_readdatavalid_from_sa;
  reg              ddr_sdram_s1_reg_firsttransfer;
  wire             ddr_sdram_s1_resetrequest_n_from_sa;
  reg              ddr_sdram_s1_slavearbiterlockenable;
  wire             ddr_sdram_s1_slavearbiterlockenable2;
  wire             ddr_sdram_s1_unreg_firsttransfer;
  wire             ddr_sdram_s1_waitrequest_n_from_sa;
  wire             ddr_sdram_s1_waits_for_read;
  wire             ddr_sdram_s1_waits_for_write;
  wire             ddr_sdram_s1_write;
  wire    [ 63: 0] ddr_sdram_s1_writedata;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_ddr_sdram_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_ddr_sdram_s1_from_cpu_ddr_clock_bridge_m1;
  wire             wait_for_ddr_sdram_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~ddr_sdram_s1_end_xfer;
    end


  assign ddr_sdram_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_ddr_clock_bridge_m1_qualified_request_ddr_sdram_s1));
  //assign ddr_sdram_s1_readdata_from_sa = ddr_sdram_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign ddr_sdram_s1_readdata_from_sa = ddr_sdram_s1_readdata;

  assign cpu_ddr_clock_bridge_m1_requests_ddr_sdram_s1 = (1) & (cpu_ddr_clock_bridge_m1_read | cpu_ddr_clock_bridge_m1_write);
  //assign ddr_sdram_s1_waitrequest_n_from_sa = ddr_sdram_s1_waitrequest_n so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign ddr_sdram_s1_waitrequest_n_from_sa = ddr_sdram_s1_waitrequest_n;

  //assign ddr_sdram_s1_readdatavalid_from_sa = ddr_sdram_s1_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign ddr_sdram_s1_readdatavalid_from_sa = ddr_sdram_s1_readdatavalid;

  //ddr_sdram_s1_arb_share_counter set values, which is an e_mux
  assign ddr_sdram_s1_arb_share_set_values = (cpu_ddr_clock_bridge_m1_granted_ddr_sdram_s1)? 8 :
    1;

  //ddr_sdram_s1_non_bursting_master_requests mux, which is an e_mux
  assign ddr_sdram_s1_non_bursting_master_requests = cpu_ddr_clock_bridge_m1_requests_ddr_sdram_s1;

  //ddr_sdram_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign ddr_sdram_s1_any_bursting_master_saved_grant = 0;

  //ddr_sdram_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign ddr_sdram_s1_arb_share_counter_next_value = ddr_sdram_s1_firsttransfer ? (ddr_sdram_s1_arb_share_set_values - 1) : |ddr_sdram_s1_arb_share_counter ? (ddr_sdram_s1_arb_share_counter - 1) : 0;

  //ddr_sdram_s1_allgrants all slave grants, which is an e_mux
  assign ddr_sdram_s1_allgrants = |ddr_sdram_s1_grant_vector;

  //ddr_sdram_s1_end_xfer assignment, which is an e_assign
  assign ddr_sdram_s1_end_xfer = ~(ddr_sdram_s1_waits_for_read | ddr_sdram_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_ddr_sdram_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_ddr_sdram_s1 = ddr_sdram_s1_end_xfer & (~ddr_sdram_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //ddr_sdram_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign ddr_sdram_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_ddr_sdram_s1 & ddr_sdram_s1_allgrants) | (end_xfer_arb_share_counter_term_ddr_sdram_s1 & ~ddr_sdram_s1_non_bursting_master_requests);

  //ddr_sdram_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ddr_sdram_s1_arb_share_counter <= 0;
      else if (ddr_sdram_s1_arb_counter_enable)
          ddr_sdram_s1_arb_share_counter <= ddr_sdram_s1_arb_share_counter_next_value;
    end


  //ddr_sdram_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ddr_sdram_s1_slavearbiterlockenable <= 0;
      else if ((|ddr_sdram_s1_master_qreq_vector & end_xfer_arb_share_counter_term_ddr_sdram_s1) | (end_xfer_arb_share_counter_term_ddr_sdram_s1 & ~ddr_sdram_s1_non_bursting_master_requests))
          ddr_sdram_s1_slavearbiterlockenable <= |ddr_sdram_s1_arb_share_counter_next_value;
    end


  //cpu_ddr_clock_bridge/m1 ddr_sdram/s1 arbiterlock, which is an e_assign
  assign cpu_ddr_clock_bridge_m1_arbiterlock = ddr_sdram_s1_slavearbiterlockenable & cpu_ddr_clock_bridge_m1_continuerequest;

  //ddr_sdram_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign ddr_sdram_s1_slavearbiterlockenable2 = |ddr_sdram_s1_arb_share_counter_next_value;

  //cpu_ddr_clock_bridge/m1 ddr_sdram/s1 arbiterlock2, which is an e_assign
  assign cpu_ddr_clock_bridge_m1_arbiterlock2 = ddr_sdram_s1_slavearbiterlockenable2 & cpu_ddr_clock_bridge_m1_continuerequest;

  //ddr_sdram_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign ddr_sdram_s1_any_continuerequest = 1;

  //cpu_ddr_clock_bridge_m1_continuerequest continued request, which is an e_assign
  assign cpu_ddr_clock_bridge_m1_continuerequest = 1;

  assign cpu_ddr_clock_bridge_m1_qualified_request_ddr_sdram_s1 = cpu_ddr_clock_bridge_m1_requests_ddr_sdram_s1 & ~((cpu_ddr_clock_bridge_m1_read & ((cpu_ddr_clock_bridge_m1_latency_counter != 0) | (1 < cpu_ddr_clock_bridge_m1_latency_counter))));
  //unique name for ddr_sdram_s1_move_on_to_next_transaction, which is an e_assign
  assign ddr_sdram_s1_move_on_to_next_transaction = ddr_sdram_s1_readdatavalid_from_sa;

  //rdv_fifo_for_cpu_ddr_clock_bridge_m1_to_ddr_sdram_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_ddr_clock_bridge_m1_to_ddr_sdram_s1_module rdv_fifo_for_cpu_ddr_clock_bridge_m1_to_ddr_sdram_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_ddr_clock_bridge_m1_granted_ddr_sdram_s1),
      .data_out             (cpu_ddr_clock_bridge_m1_rdv_fifo_output_from_ddr_sdram_s1),
      .empty                (),
      .fifo_contains_ones_n (cpu_ddr_clock_bridge_m1_rdv_fifo_empty_ddr_sdram_s1),
      .full                 (),
      .read                 (ddr_sdram_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~ddr_sdram_s1_waits_for_read)
    );

  assign cpu_ddr_clock_bridge_m1_read_data_valid_ddr_sdram_s1_shift_register = ~cpu_ddr_clock_bridge_m1_rdv_fifo_empty_ddr_sdram_s1;
  //local readdatavalid cpu_ddr_clock_bridge_m1_read_data_valid_ddr_sdram_s1, which is an e_mux
  assign cpu_ddr_clock_bridge_m1_read_data_valid_ddr_sdram_s1 = ddr_sdram_s1_readdatavalid_from_sa;

  //replicate narrow data for wide slave
  assign cpu_ddr_clock_bridge_m1_writedata_replicated = {cpu_ddr_clock_bridge_m1_writedata,
    cpu_ddr_clock_bridge_m1_writedata};

  //ddr_sdram_s1_writedata mux, which is an e_mux
  assign ddr_sdram_s1_writedata = cpu_ddr_clock_bridge_m1_writedata_replicated;

  //master is always granted when requested
  assign cpu_ddr_clock_bridge_m1_granted_ddr_sdram_s1 = cpu_ddr_clock_bridge_m1_qualified_request_ddr_sdram_s1;

  //cpu_ddr_clock_bridge/m1 saved-grant ddr_sdram/s1, which is an e_assign
  assign cpu_ddr_clock_bridge_m1_saved_grant_ddr_sdram_s1 = cpu_ddr_clock_bridge_m1_requests_ddr_sdram_s1;

  //allow new arb cycle for ddr_sdram/s1, which is an e_assign
  assign ddr_sdram_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign ddr_sdram_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign ddr_sdram_s1_master_qreq_vector = 1;

  //assign ddr_sdram_s1_resetrequest_n_from_sa = ddr_sdram_s1_resetrequest_n so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign ddr_sdram_s1_resetrequest_n_from_sa = ddr_sdram_s1_resetrequest_n;

  //ddr_sdram_s1_firsttransfer first transaction, which is an e_assign
  assign ddr_sdram_s1_firsttransfer = ddr_sdram_s1_begins_xfer ? ddr_sdram_s1_unreg_firsttransfer : ddr_sdram_s1_reg_firsttransfer;

  //ddr_sdram_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign ddr_sdram_s1_unreg_firsttransfer = ~(ddr_sdram_s1_slavearbiterlockenable & ddr_sdram_s1_any_continuerequest);

  //ddr_sdram_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ddr_sdram_s1_reg_firsttransfer <= 1'b1;
      else if (ddr_sdram_s1_begins_xfer)
          ddr_sdram_s1_reg_firsttransfer <= ddr_sdram_s1_unreg_firsttransfer;
    end


  //ddr_sdram_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign ddr_sdram_s1_beginbursttransfer_internal = ddr_sdram_s1_begins_xfer;

  //ddr_sdram/s1 begin burst transfer to slave, which is an e_assign
  assign ddr_sdram_s1_beginbursttransfer = ddr_sdram_s1_beginbursttransfer_internal;

  //ddr_sdram_s1_read assignment, which is an e_mux
  assign ddr_sdram_s1_read = cpu_ddr_clock_bridge_m1_granted_ddr_sdram_s1 & cpu_ddr_clock_bridge_m1_read;

  //ddr_sdram_s1_write assignment, which is an e_mux
  assign ddr_sdram_s1_write = cpu_ddr_clock_bridge_m1_granted_ddr_sdram_s1 & cpu_ddr_clock_bridge_m1_write;

  assign shifted_address_to_ddr_sdram_s1_from_cpu_ddr_clock_bridge_m1 = cpu_ddr_clock_bridge_m1_address_to_slave;
  //ddr_sdram_s1_address mux, which is an e_mux
  assign ddr_sdram_s1_address = shifted_address_to_ddr_sdram_s1_from_cpu_ddr_clock_bridge_m1 >> 3;

  //d1_ddr_sdram_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_ddr_sdram_s1_end_xfer <= 1;
      else if (1)
          d1_ddr_sdram_s1_end_xfer <= ddr_sdram_s1_end_xfer;
    end


  //ddr_sdram_s1_waits_for_read in a cycle, which is an e_mux
  assign ddr_sdram_s1_waits_for_read = ddr_sdram_s1_in_a_read_cycle & ~ddr_sdram_s1_waitrequest_n_from_sa;

  //ddr_sdram_s1_in_a_read_cycle assignment, which is an e_assign
  assign ddr_sdram_s1_in_a_read_cycle = cpu_ddr_clock_bridge_m1_granted_ddr_sdram_s1 & cpu_ddr_clock_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = ddr_sdram_s1_in_a_read_cycle;

  //ddr_sdram_s1_waits_for_write in a cycle, which is an e_mux
  assign ddr_sdram_s1_waits_for_write = ddr_sdram_s1_in_a_write_cycle & ~ddr_sdram_s1_waitrequest_n_from_sa;

  //ddr_sdram_s1_in_a_write_cycle assignment, which is an e_assign
  assign ddr_sdram_s1_in_a_write_cycle = cpu_ddr_clock_bridge_m1_granted_ddr_sdram_s1 & cpu_ddr_clock_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = ddr_sdram_s1_in_a_write_cycle;

  assign wait_for_ddr_sdram_s1_counter = 0;
  //ddr_sdram_s1_byteenable byte enable port mux, which is an e_mux
  assign ddr_sdram_s1_byteenable = (cpu_ddr_clock_bridge_m1_granted_ddr_sdram_s1)? cpu_ddr_clock_bridge_m1_byteenable_ddr_sdram_s1 :
    -1;

  //byte_enable_mux for cpu_ddr_clock_bridge/m1 and ddr_sdram/s1, which is an e_mux
  assign cpu_ddr_clock_bridge_m1_byteenable_ddr_sdram_s1 = (cpu_ddr_clock_bridge_m1_address_to_slave[2] == 0)? cpu_ddr_clock_bridge_m1_byteenable :
    {cpu_ddr_clock_bridge_m1_byteenable, {4'b0}};

  //burstcount mux, which is an e_mux
  assign ddr_sdram_s1_burstcount = 1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //ddr_sdram/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cycloneIII_3c25_niosII_standard_sopc_reset_clk_domain_synch_module (
                                                                            // inputs:
                                                                             clk,
                                                                             data_in,
                                                                             reset_n,

                                                                            // outputs:
                                                                             data_out
                                                                          )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else if (1)
          data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else if (1)
          data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_data_master_to_flash_ssram_pipeline_bridge_s1_module (
                                                                               // inputs:
                                                                                clear_fifo,
                                                                                clk,
                                                                                data_in,
                                                                                read,
                                                                                reset_n,
                                                                                sync_reset,
                                                                                write,

                                                                               // outputs:
                                                                                data_out,
                                                                                empty,
                                                                                fifo_contains_ones_n,
                                                                                full
                                                                             )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  wire             full_10;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  reg              full_7;
  reg              full_8;
  reg              full_9;
  reg     [  4: 0] how_many_ones;
  wire    [  4: 0] one_count_minus_one;
  wire    [  4: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  wire             p7_full_7;
  wire             p7_stage_7;
  wire             p8_full_8;
  wire             p8_stage_8;
  wire             p9_full_9;
  wire             p9_stage_9;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  reg              stage_7;
  reg              stage_8;
  reg              stage_9;
  wire    [  4: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_9;
  assign empty = !full_0;
  assign full_10 = 0;
  //data_9, which is an e_mux
  assign p9_stage_9 = ((full_10 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_9 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_9))
          if (sync_reset & full_9 & !((full_10 == 0) & read & write))
              stage_9 <= 0;
          else 
            stage_9 <= p9_stage_9;
    end


  //control_9, which is an e_mux
  assign p9_full_9 = ((read & !write) == 0)? full_8 :
    0;

  //control_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_9 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_9 <= 0;
          else 
            full_9 <= p9_full_9;
    end


  //data_8, which is an e_mux
  assign p8_stage_8 = ((full_9 & ~clear_fifo) == 0)? data_in :
    stage_9;

  //data_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_8 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_8))
          if (sync_reset & full_8 & !((full_9 == 0) & read & write))
              stage_8 <= 0;
          else 
            stage_8 <= p8_stage_8;
    end


  //control_8, which is an e_mux
  assign p8_full_8 = ((read & !write) == 0)? full_7 :
    full_9;

  //control_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_8 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_8 <= 0;
          else 
            full_8 <= p8_full_8;
    end


  //data_7, which is an e_mux
  assign p7_stage_7 = ((full_8 & ~clear_fifo) == 0)? data_in :
    stage_8;

  //data_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_7 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_7))
          if (sync_reset & full_7 & !((full_8 == 0) & read & write))
              stage_7 <= 0;
          else 
            stage_7 <= p7_stage_7;
    end


  //control_7, which is an e_mux
  assign p7_full_7 = ((read & !write) == 0)? full_6 :
    full_8;

  //control_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_7 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_7 <= 0;
          else 
            full_7 <= p7_full_7;
    end


  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    stage_7;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    full_7;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_instruction_master_to_flash_ssram_pipeline_bridge_s1_module (
                                                                                      // inputs:
                                                                                       clear_fifo,
                                                                                       clk,
                                                                                       data_in,
                                                                                       read,
                                                                                       reset_n,
                                                                                       sync_reset,
                                                                                       write,

                                                                                      // outputs:
                                                                                       data_out,
                                                                                       empty,
                                                                                       fifo_contains_ones_n,
                                                                                       full
                                                                                    )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  wire             full_10;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  reg              full_7;
  reg              full_8;
  reg              full_9;
  reg     [  4: 0] how_many_ones;
  wire    [  4: 0] one_count_minus_one;
  wire    [  4: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  wire             p7_full_7;
  wire             p7_stage_7;
  wire             p8_full_8;
  wire             p8_stage_8;
  wire             p9_full_9;
  wire             p9_stage_9;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  reg              stage_7;
  reg              stage_8;
  reg              stage_9;
  wire    [  4: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_9;
  assign empty = !full_0;
  assign full_10 = 0;
  //data_9, which is an e_mux
  assign p9_stage_9 = ((full_10 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_9 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_9))
          if (sync_reset & full_9 & !((full_10 == 0) & read & write))
              stage_9 <= 0;
          else 
            stage_9 <= p9_stage_9;
    end


  //control_9, which is an e_mux
  assign p9_full_9 = ((read & !write) == 0)? full_8 :
    0;

  //control_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_9 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_9 <= 0;
          else 
            full_9 <= p9_full_9;
    end


  //data_8, which is an e_mux
  assign p8_stage_8 = ((full_9 & ~clear_fifo) == 0)? data_in :
    stage_9;

  //data_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_8 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_8))
          if (sync_reset & full_8 & !((full_9 == 0) & read & write))
              stage_8 <= 0;
          else 
            stage_8 <= p8_stage_8;
    end


  //control_8, which is an e_mux
  assign p8_full_8 = ((read & !write) == 0)? full_7 :
    full_9;

  //control_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_8 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_8 <= 0;
          else 
            full_8 <= p8_full_8;
    end


  //data_7, which is an e_mux
  assign p7_stage_7 = ((full_8 & ~clear_fifo) == 0)? data_in :
    stage_8;

  //data_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_7 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_7))
          if (sync_reset & full_7 & !((full_8 == 0) & read & write))
              stage_7 <= 0;
          else 
            stage_7 <= p7_stage_7;
    end


  //control_7, which is an e_mux
  assign p7_full_7 = ((read & !write) == 0)? full_6 :
    full_8;

  //control_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_7 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_7 <= 0;
          else 
            full_7 <= p7_full_7;
    end


  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    stage_7;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    full_7;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module flash_ssram_pipeline_bridge_s1_arbitrator (
                                                   // inputs:
                                                    clk,
                                                    cpu_data_master_address_to_slave,
                                                    cpu_data_master_byteenable,
                                                    cpu_data_master_debugaccess,
                                                    cpu_data_master_latency_counter,
                                                    cpu_data_master_read,
                                                    cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register,
                                                    cpu_data_master_read_data_valid_slow_peripheral_bridge_s1_shift_register,
                                                    cpu_data_master_write,
                                                    cpu_data_master_writedata,
                                                    cpu_instruction_master_address_to_slave,
                                                    cpu_instruction_master_latency_counter,
                                                    cpu_instruction_master_read,
                                                    cpu_instruction_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register,
                                                    flash_ssram_pipeline_bridge_s1_endofpacket,
                                                    flash_ssram_pipeline_bridge_s1_readdata,
                                                    flash_ssram_pipeline_bridge_s1_readdatavalid,
                                                    flash_ssram_pipeline_bridge_s1_waitrequest,
                                                    reset_n,

                                                   // outputs:
                                                    cpu_data_master_granted_flash_ssram_pipeline_bridge_s1,
                                                    cpu_data_master_qualified_request_flash_ssram_pipeline_bridge_s1,
                                                    cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1,
                                                    cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register,
                                                    cpu_data_master_requests_flash_ssram_pipeline_bridge_s1,
                                                    cpu_instruction_master_granted_flash_ssram_pipeline_bridge_s1,
                                                    cpu_instruction_master_qualified_request_flash_ssram_pipeline_bridge_s1,
                                                    cpu_instruction_master_read_data_valid_flash_ssram_pipeline_bridge_s1,
                                                    cpu_instruction_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register,
                                                    cpu_instruction_master_requests_flash_ssram_pipeline_bridge_s1,
                                                    d1_flash_ssram_pipeline_bridge_s1_end_xfer,
                                                    flash_ssram_pipeline_bridge_s1_address,
                                                    flash_ssram_pipeline_bridge_s1_arbiterlock,
                                                    flash_ssram_pipeline_bridge_s1_arbiterlock2,
                                                    flash_ssram_pipeline_bridge_s1_burstcount,
                                                    flash_ssram_pipeline_bridge_s1_byteenable,
                                                    flash_ssram_pipeline_bridge_s1_chipselect,
                                                    flash_ssram_pipeline_bridge_s1_debugaccess,
                                                    flash_ssram_pipeline_bridge_s1_endofpacket_from_sa,
                                                    flash_ssram_pipeline_bridge_s1_nativeaddress,
                                                    flash_ssram_pipeline_bridge_s1_read,
                                                    flash_ssram_pipeline_bridge_s1_readdata_from_sa,
                                                    flash_ssram_pipeline_bridge_s1_reset_n,
                                                    flash_ssram_pipeline_bridge_s1_waitrequest_from_sa,
                                                    flash_ssram_pipeline_bridge_s1_write,
                                                    flash_ssram_pipeline_bridge_s1_writedata
                                                 )
;

  output           cpu_data_master_granted_flash_ssram_pipeline_bridge_s1;
  output           cpu_data_master_qualified_request_flash_ssram_pipeline_bridge_s1;
  output           cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1;
  output           cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register;
  output           cpu_data_master_requests_flash_ssram_pipeline_bridge_s1;
  output           cpu_instruction_master_granted_flash_ssram_pipeline_bridge_s1;
  output           cpu_instruction_master_qualified_request_flash_ssram_pipeline_bridge_s1;
  output           cpu_instruction_master_read_data_valid_flash_ssram_pipeline_bridge_s1;
  output           cpu_instruction_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register;
  output           cpu_instruction_master_requests_flash_ssram_pipeline_bridge_s1;
  output           d1_flash_ssram_pipeline_bridge_s1_end_xfer;
  output  [ 22: 0] flash_ssram_pipeline_bridge_s1_address;
  output           flash_ssram_pipeline_bridge_s1_arbiterlock;
  output           flash_ssram_pipeline_bridge_s1_arbiterlock2;
  output           flash_ssram_pipeline_bridge_s1_burstcount;
  output  [  3: 0] flash_ssram_pipeline_bridge_s1_byteenable;
  output           flash_ssram_pipeline_bridge_s1_chipselect;
  output           flash_ssram_pipeline_bridge_s1_debugaccess;
  output           flash_ssram_pipeline_bridge_s1_endofpacket_from_sa;
  output  [ 22: 0] flash_ssram_pipeline_bridge_s1_nativeaddress;
  output           flash_ssram_pipeline_bridge_s1_read;
  output  [ 31: 0] flash_ssram_pipeline_bridge_s1_readdata_from_sa;
  output           flash_ssram_pipeline_bridge_s1_reset_n;
  output           flash_ssram_pipeline_bridge_s1_waitrequest_from_sa;
  output           flash_ssram_pipeline_bridge_s1_write;
  output  [ 31: 0] flash_ssram_pipeline_bridge_s1_writedata;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_debugaccess;
  input            cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register;
  input            cpu_data_master_read_data_valid_slow_peripheral_bridge_s1_shift_register;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 26: 0] cpu_instruction_master_address_to_slave;
  input            cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input            cpu_instruction_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register;
  input            flash_ssram_pipeline_bridge_s1_endofpacket;
  input   [ 31: 0] flash_ssram_pipeline_bridge_s1_readdata;
  input            flash_ssram_pipeline_bridge_s1_readdatavalid;
  input            flash_ssram_pipeline_bridge_s1_waitrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_flash_ssram_pipeline_bridge_s1;
  wire             cpu_data_master_qualified_request_flash_ssram_pipeline_bridge_s1;
  wire             cpu_data_master_rdv_fifo_empty_flash_ssram_pipeline_bridge_s1;
  wire             cpu_data_master_rdv_fifo_output_from_flash_ssram_pipeline_bridge_s1;
  wire             cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1;
  wire             cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register;
  wire             cpu_data_master_requests_flash_ssram_pipeline_bridge_s1;
  wire             cpu_data_master_saved_grant_flash_ssram_pipeline_bridge_s1;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_flash_ssram_pipeline_bridge_s1;
  wire             cpu_instruction_master_qualified_request_flash_ssram_pipeline_bridge_s1;
  wire             cpu_instruction_master_rdv_fifo_empty_flash_ssram_pipeline_bridge_s1;
  wire             cpu_instruction_master_rdv_fifo_output_from_flash_ssram_pipeline_bridge_s1;
  wire             cpu_instruction_master_read_data_valid_flash_ssram_pipeline_bridge_s1;
  wire             cpu_instruction_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register;
  wire             cpu_instruction_master_requests_flash_ssram_pipeline_bridge_s1;
  wire             cpu_instruction_master_saved_grant_flash_ssram_pipeline_bridge_s1;
  reg              d1_flash_ssram_pipeline_bridge_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_flash_ssram_pipeline_bridge_s1;
  wire    [ 22: 0] flash_ssram_pipeline_bridge_s1_address;
  wire             flash_ssram_pipeline_bridge_s1_allgrants;
  wire             flash_ssram_pipeline_bridge_s1_allow_new_arb_cycle;
  wire             flash_ssram_pipeline_bridge_s1_any_bursting_master_saved_grant;
  wire             flash_ssram_pipeline_bridge_s1_any_continuerequest;
  reg     [  1: 0] flash_ssram_pipeline_bridge_s1_arb_addend;
  wire             flash_ssram_pipeline_bridge_s1_arb_counter_enable;
  reg              flash_ssram_pipeline_bridge_s1_arb_share_counter;
  wire             flash_ssram_pipeline_bridge_s1_arb_share_counter_next_value;
  wire             flash_ssram_pipeline_bridge_s1_arb_share_set_values;
  wire    [  1: 0] flash_ssram_pipeline_bridge_s1_arb_winner;
  wire             flash_ssram_pipeline_bridge_s1_arbiterlock;
  wire             flash_ssram_pipeline_bridge_s1_arbiterlock2;
  wire             flash_ssram_pipeline_bridge_s1_arbitration_holdoff_internal;
  wire             flash_ssram_pipeline_bridge_s1_beginbursttransfer_internal;
  wire             flash_ssram_pipeline_bridge_s1_begins_xfer;
  wire             flash_ssram_pipeline_bridge_s1_burstcount;
  wire    [  3: 0] flash_ssram_pipeline_bridge_s1_byteenable;
  wire             flash_ssram_pipeline_bridge_s1_chipselect;
  wire    [  3: 0] flash_ssram_pipeline_bridge_s1_chosen_master_double_vector;
  wire    [  1: 0] flash_ssram_pipeline_bridge_s1_chosen_master_rot_left;
  wire             flash_ssram_pipeline_bridge_s1_debugaccess;
  wire             flash_ssram_pipeline_bridge_s1_end_xfer;
  wire             flash_ssram_pipeline_bridge_s1_endofpacket_from_sa;
  wire             flash_ssram_pipeline_bridge_s1_firsttransfer;
  wire    [  1: 0] flash_ssram_pipeline_bridge_s1_grant_vector;
  wire             flash_ssram_pipeline_bridge_s1_in_a_read_cycle;
  wire             flash_ssram_pipeline_bridge_s1_in_a_write_cycle;
  wire    [  1: 0] flash_ssram_pipeline_bridge_s1_master_qreq_vector;
  wire             flash_ssram_pipeline_bridge_s1_move_on_to_next_transaction;
  wire    [ 22: 0] flash_ssram_pipeline_bridge_s1_nativeaddress;
  wire             flash_ssram_pipeline_bridge_s1_non_bursting_master_requests;
  wire             flash_ssram_pipeline_bridge_s1_read;
  wire    [ 31: 0] flash_ssram_pipeline_bridge_s1_readdata_from_sa;
  wire             flash_ssram_pipeline_bridge_s1_readdatavalid_from_sa;
  reg              flash_ssram_pipeline_bridge_s1_reg_firsttransfer;
  wire             flash_ssram_pipeline_bridge_s1_reset_n;
  reg     [  1: 0] flash_ssram_pipeline_bridge_s1_saved_chosen_master_vector;
  reg              flash_ssram_pipeline_bridge_s1_slavearbiterlockenable;
  wire             flash_ssram_pipeline_bridge_s1_slavearbiterlockenable2;
  wire             flash_ssram_pipeline_bridge_s1_unreg_firsttransfer;
  wire             flash_ssram_pipeline_bridge_s1_waitrequest_from_sa;
  wire             flash_ssram_pipeline_bridge_s1_waits_for_read;
  wire             flash_ssram_pipeline_bridge_s1_waits_for_write;
  wire             flash_ssram_pipeline_bridge_s1_write;
  wire    [ 31: 0] flash_ssram_pipeline_bridge_s1_writedata;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_flash_ssram_pipeline_bridge_s1;
  reg              last_cycle_cpu_instruction_master_granted_slave_flash_ssram_pipeline_bridge_s1;
  wire    [ 27: 0] shifted_address_to_flash_ssram_pipeline_bridge_s1_from_cpu_data_master;
  wire    [ 26: 0] shifted_address_to_flash_ssram_pipeline_bridge_s1_from_cpu_instruction_master;
  wire             wait_for_flash_ssram_pipeline_bridge_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~flash_ssram_pipeline_bridge_s1_end_xfer;
    end


  assign flash_ssram_pipeline_bridge_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_flash_ssram_pipeline_bridge_s1 | cpu_instruction_master_qualified_request_flash_ssram_pipeline_bridge_s1));
  //assign flash_ssram_pipeline_bridge_s1_readdatavalid_from_sa = flash_ssram_pipeline_bridge_s1_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign flash_ssram_pipeline_bridge_s1_readdatavalid_from_sa = flash_ssram_pipeline_bridge_s1_readdatavalid;

  //assign flash_ssram_pipeline_bridge_s1_readdata_from_sa = flash_ssram_pipeline_bridge_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign flash_ssram_pipeline_bridge_s1_readdata_from_sa = flash_ssram_pipeline_bridge_s1_readdata;

  assign cpu_data_master_requests_flash_ssram_pipeline_bridge_s1 = ({cpu_data_master_address_to_slave[27 : 25] , 25'b0} == 28'h4000000) & (cpu_data_master_read | cpu_data_master_write);
  //assign flash_ssram_pipeline_bridge_s1_waitrequest_from_sa = flash_ssram_pipeline_bridge_s1_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign flash_ssram_pipeline_bridge_s1_waitrequest_from_sa = flash_ssram_pipeline_bridge_s1_waitrequest;

  //flash_ssram_pipeline_bridge_s1_arb_share_counter set values, which is an e_mux
  assign flash_ssram_pipeline_bridge_s1_arb_share_set_values = 1;

  //flash_ssram_pipeline_bridge_s1_non_bursting_master_requests mux, which is an e_mux
  assign flash_ssram_pipeline_bridge_s1_non_bursting_master_requests = cpu_data_master_requests_flash_ssram_pipeline_bridge_s1 |
    cpu_instruction_master_requests_flash_ssram_pipeline_bridge_s1 |
    cpu_data_master_requests_flash_ssram_pipeline_bridge_s1 |
    cpu_instruction_master_requests_flash_ssram_pipeline_bridge_s1 |
    cpu_data_master_requests_flash_ssram_pipeline_bridge_s1 |
    cpu_instruction_master_requests_flash_ssram_pipeline_bridge_s1;

  //flash_ssram_pipeline_bridge_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign flash_ssram_pipeline_bridge_s1_any_bursting_master_saved_grant = 0;

  //flash_ssram_pipeline_bridge_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign flash_ssram_pipeline_bridge_s1_arb_share_counter_next_value = flash_ssram_pipeline_bridge_s1_firsttransfer ? (flash_ssram_pipeline_bridge_s1_arb_share_set_values - 1) : |flash_ssram_pipeline_bridge_s1_arb_share_counter ? (flash_ssram_pipeline_bridge_s1_arb_share_counter - 1) : 0;

  //flash_ssram_pipeline_bridge_s1_allgrants all slave grants, which is an e_mux
  assign flash_ssram_pipeline_bridge_s1_allgrants = |flash_ssram_pipeline_bridge_s1_grant_vector |
    |flash_ssram_pipeline_bridge_s1_grant_vector |
    |flash_ssram_pipeline_bridge_s1_grant_vector |
    |flash_ssram_pipeline_bridge_s1_grant_vector |
    |flash_ssram_pipeline_bridge_s1_grant_vector |
    |flash_ssram_pipeline_bridge_s1_grant_vector;

  //flash_ssram_pipeline_bridge_s1_end_xfer assignment, which is an e_assign
  assign flash_ssram_pipeline_bridge_s1_end_xfer = ~(flash_ssram_pipeline_bridge_s1_waits_for_read | flash_ssram_pipeline_bridge_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_flash_ssram_pipeline_bridge_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_flash_ssram_pipeline_bridge_s1 = flash_ssram_pipeline_bridge_s1_end_xfer & (~flash_ssram_pipeline_bridge_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //flash_ssram_pipeline_bridge_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign flash_ssram_pipeline_bridge_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_flash_ssram_pipeline_bridge_s1 & flash_ssram_pipeline_bridge_s1_allgrants) | (end_xfer_arb_share_counter_term_flash_ssram_pipeline_bridge_s1 & ~flash_ssram_pipeline_bridge_s1_non_bursting_master_requests);

  //flash_ssram_pipeline_bridge_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          flash_ssram_pipeline_bridge_s1_arb_share_counter <= 0;
      else if (flash_ssram_pipeline_bridge_s1_arb_counter_enable)
          flash_ssram_pipeline_bridge_s1_arb_share_counter <= flash_ssram_pipeline_bridge_s1_arb_share_counter_next_value;
    end


  //flash_ssram_pipeline_bridge_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          flash_ssram_pipeline_bridge_s1_slavearbiterlockenable <= 0;
      else if ((|flash_ssram_pipeline_bridge_s1_master_qreq_vector & end_xfer_arb_share_counter_term_flash_ssram_pipeline_bridge_s1) | (end_xfer_arb_share_counter_term_flash_ssram_pipeline_bridge_s1 & ~flash_ssram_pipeline_bridge_s1_non_bursting_master_requests))
          flash_ssram_pipeline_bridge_s1_slavearbiterlockenable <= |flash_ssram_pipeline_bridge_s1_arb_share_counter_next_value;
    end


  //cpu/data_master flash_ssram_pipeline_bridge/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = flash_ssram_pipeline_bridge_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //flash_ssram_pipeline_bridge_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign flash_ssram_pipeline_bridge_s1_slavearbiterlockenable2 = |flash_ssram_pipeline_bridge_s1_arb_share_counter_next_value;

  //cpu/data_master flash_ssram_pipeline_bridge/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = flash_ssram_pipeline_bridge_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master flash_ssram_pipeline_bridge/s1 arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = flash_ssram_pipeline_bridge_s1_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master flash_ssram_pipeline_bridge/s1 arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = flash_ssram_pipeline_bridge_s1_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted flash_ssram_pipeline_bridge/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_flash_ssram_pipeline_bridge_s1 <= 0;
      else if (1)
          last_cycle_cpu_instruction_master_granted_slave_flash_ssram_pipeline_bridge_s1 <= cpu_instruction_master_saved_grant_flash_ssram_pipeline_bridge_s1 ? 1 : (flash_ssram_pipeline_bridge_s1_arbitration_holdoff_internal | ~cpu_instruction_master_requests_flash_ssram_pipeline_bridge_s1) ? 0 : last_cycle_cpu_instruction_master_granted_slave_flash_ssram_pipeline_bridge_s1;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_flash_ssram_pipeline_bridge_s1 & cpu_instruction_master_requests_flash_ssram_pipeline_bridge_s1;

  //flash_ssram_pipeline_bridge_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign flash_ssram_pipeline_bridge_s1_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_flash_ssram_pipeline_bridge_s1 = cpu_data_master_requests_flash_ssram_pipeline_bridge_s1 & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0) | (1 < cpu_data_master_latency_counter) | (|cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register) | (|cpu_data_master_read_data_valid_slow_peripheral_bridge_s1_shift_register))) | cpu_instruction_master_arbiterlock);
  //unique name for flash_ssram_pipeline_bridge_s1_move_on_to_next_transaction, which is an e_assign
  assign flash_ssram_pipeline_bridge_s1_move_on_to_next_transaction = flash_ssram_pipeline_bridge_s1_readdatavalid_from_sa;

  //rdv_fifo_for_cpu_data_master_to_flash_ssram_pipeline_bridge_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_data_master_to_flash_ssram_pipeline_bridge_s1_module rdv_fifo_for_cpu_data_master_to_flash_ssram_pipeline_bridge_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_data_master_granted_flash_ssram_pipeline_bridge_s1),
      .data_out             (cpu_data_master_rdv_fifo_output_from_flash_ssram_pipeline_bridge_s1),
      .empty                (),
      .fifo_contains_ones_n (cpu_data_master_rdv_fifo_empty_flash_ssram_pipeline_bridge_s1),
      .full                 (),
      .read                 (flash_ssram_pipeline_bridge_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~flash_ssram_pipeline_bridge_s1_waits_for_read)
    );

  assign cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register = ~cpu_data_master_rdv_fifo_empty_flash_ssram_pipeline_bridge_s1;
  //local readdatavalid cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1 = (flash_ssram_pipeline_bridge_s1_readdatavalid_from_sa & cpu_data_master_rdv_fifo_output_from_flash_ssram_pipeline_bridge_s1) & ~ cpu_data_master_rdv_fifo_empty_flash_ssram_pipeline_bridge_s1;

  //flash_ssram_pipeline_bridge_s1_writedata mux, which is an e_mux
  assign flash_ssram_pipeline_bridge_s1_writedata = cpu_data_master_writedata;

  //assign flash_ssram_pipeline_bridge_s1_endofpacket_from_sa = flash_ssram_pipeline_bridge_s1_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign flash_ssram_pipeline_bridge_s1_endofpacket_from_sa = flash_ssram_pipeline_bridge_s1_endofpacket;

  assign cpu_instruction_master_requests_flash_ssram_pipeline_bridge_s1 = (({cpu_instruction_master_address_to_slave[26 : 25] , 25'b0} == 27'h4000000) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted flash_ssram_pipeline_bridge/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_flash_ssram_pipeline_bridge_s1 <= 0;
      else if (1)
          last_cycle_cpu_data_master_granted_slave_flash_ssram_pipeline_bridge_s1 <= cpu_data_master_saved_grant_flash_ssram_pipeline_bridge_s1 ? 1 : (flash_ssram_pipeline_bridge_s1_arbitration_holdoff_internal | ~cpu_data_master_requests_flash_ssram_pipeline_bridge_s1) ? 0 : last_cycle_cpu_data_master_granted_slave_flash_ssram_pipeline_bridge_s1;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_flash_ssram_pipeline_bridge_s1 & cpu_data_master_requests_flash_ssram_pipeline_bridge_s1;

  assign cpu_instruction_master_qualified_request_flash_ssram_pipeline_bridge_s1 = cpu_instruction_master_requests_flash_ssram_pipeline_bridge_s1 & ~((cpu_instruction_master_read & ((cpu_instruction_master_latency_counter != 0) | (1 < cpu_instruction_master_latency_counter) | (|cpu_instruction_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register))) | cpu_data_master_arbiterlock);
  //rdv_fifo_for_cpu_instruction_master_to_flash_ssram_pipeline_bridge_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_instruction_master_to_flash_ssram_pipeline_bridge_s1_module rdv_fifo_for_cpu_instruction_master_to_flash_ssram_pipeline_bridge_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_instruction_master_granted_flash_ssram_pipeline_bridge_s1),
      .data_out             (cpu_instruction_master_rdv_fifo_output_from_flash_ssram_pipeline_bridge_s1),
      .empty                (),
      .fifo_contains_ones_n (cpu_instruction_master_rdv_fifo_empty_flash_ssram_pipeline_bridge_s1),
      .full                 (),
      .read                 (flash_ssram_pipeline_bridge_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~flash_ssram_pipeline_bridge_s1_waits_for_read)
    );

  assign cpu_instruction_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register = ~cpu_instruction_master_rdv_fifo_empty_flash_ssram_pipeline_bridge_s1;
  //local readdatavalid cpu_instruction_master_read_data_valid_flash_ssram_pipeline_bridge_s1, which is an e_mux
  assign cpu_instruction_master_read_data_valid_flash_ssram_pipeline_bridge_s1 = (flash_ssram_pipeline_bridge_s1_readdatavalid_from_sa & cpu_instruction_master_rdv_fifo_output_from_flash_ssram_pipeline_bridge_s1) & ~ cpu_instruction_master_rdv_fifo_empty_flash_ssram_pipeline_bridge_s1;

  //allow new arb cycle for flash_ssram_pipeline_bridge/s1, which is an e_assign
  assign flash_ssram_pipeline_bridge_s1_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for flash_ssram_pipeline_bridge/s1, which is an e_assign
  assign flash_ssram_pipeline_bridge_s1_master_qreq_vector[0] = cpu_instruction_master_qualified_request_flash_ssram_pipeline_bridge_s1;

  //cpu/instruction_master grant flash_ssram_pipeline_bridge/s1, which is an e_assign
  assign cpu_instruction_master_granted_flash_ssram_pipeline_bridge_s1 = flash_ssram_pipeline_bridge_s1_grant_vector[0];

  //cpu/instruction_master saved-grant flash_ssram_pipeline_bridge/s1, which is an e_assign
  assign cpu_instruction_master_saved_grant_flash_ssram_pipeline_bridge_s1 = flash_ssram_pipeline_bridge_s1_arb_winner[0] && cpu_instruction_master_requests_flash_ssram_pipeline_bridge_s1;

  //cpu/data_master assignment into master qualified-requests vector for flash_ssram_pipeline_bridge/s1, which is an e_assign
  assign flash_ssram_pipeline_bridge_s1_master_qreq_vector[1] = cpu_data_master_qualified_request_flash_ssram_pipeline_bridge_s1;

  //cpu/data_master grant flash_ssram_pipeline_bridge/s1, which is an e_assign
  assign cpu_data_master_granted_flash_ssram_pipeline_bridge_s1 = flash_ssram_pipeline_bridge_s1_grant_vector[1];

  //cpu/data_master saved-grant flash_ssram_pipeline_bridge/s1, which is an e_assign
  assign cpu_data_master_saved_grant_flash_ssram_pipeline_bridge_s1 = flash_ssram_pipeline_bridge_s1_arb_winner[1] && cpu_data_master_requests_flash_ssram_pipeline_bridge_s1;

  //flash_ssram_pipeline_bridge/s1 chosen-master double-vector, which is an e_assign
  assign flash_ssram_pipeline_bridge_s1_chosen_master_double_vector = {flash_ssram_pipeline_bridge_s1_master_qreq_vector, flash_ssram_pipeline_bridge_s1_master_qreq_vector} & ({~flash_ssram_pipeline_bridge_s1_master_qreq_vector, ~flash_ssram_pipeline_bridge_s1_master_qreq_vector} + flash_ssram_pipeline_bridge_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign flash_ssram_pipeline_bridge_s1_arb_winner = (flash_ssram_pipeline_bridge_s1_allow_new_arb_cycle & | flash_ssram_pipeline_bridge_s1_grant_vector) ? flash_ssram_pipeline_bridge_s1_grant_vector : flash_ssram_pipeline_bridge_s1_saved_chosen_master_vector;

  //saved flash_ssram_pipeline_bridge_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          flash_ssram_pipeline_bridge_s1_saved_chosen_master_vector <= 0;
      else if (flash_ssram_pipeline_bridge_s1_allow_new_arb_cycle)
          flash_ssram_pipeline_bridge_s1_saved_chosen_master_vector <= |flash_ssram_pipeline_bridge_s1_grant_vector ? flash_ssram_pipeline_bridge_s1_grant_vector : flash_ssram_pipeline_bridge_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign flash_ssram_pipeline_bridge_s1_grant_vector = {(flash_ssram_pipeline_bridge_s1_chosen_master_double_vector[1] | flash_ssram_pipeline_bridge_s1_chosen_master_double_vector[3]),
    (flash_ssram_pipeline_bridge_s1_chosen_master_double_vector[0] | flash_ssram_pipeline_bridge_s1_chosen_master_double_vector[2])};

  //flash_ssram_pipeline_bridge/s1 chosen master rotated left, which is an e_assign
  assign flash_ssram_pipeline_bridge_s1_chosen_master_rot_left = (flash_ssram_pipeline_bridge_s1_arb_winner << 1) ? (flash_ssram_pipeline_bridge_s1_arb_winner << 1) : 1;

  //flash_ssram_pipeline_bridge/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          flash_ssram_pipeline_bridge_s1_arb_addend <= 1;
      else if (|flash_ssram_pipeline_bridge_s1_grant_vector)
          flash_ssram_pipeline_bridge_s1_arb_addend <= flash_ssram_pipeline_bridge_s1_end_xfer? flash_ssram_pipeline_bridge_s1_chosen_master_rot_left : flash_ssram_pipeline_bridge_s1_grant_vector;
    end


  //flash_ssram_pipeline_bridge_s1_reset_n assignment, which is an e_assign
  assign flash_ssram_pipeline_bridge_s1_reset_n = reset_n;

  assign flash_ssram_pipeline_bridge_s1_chipselect = cpu_data_master_granted_flash_ssram_pipeline_bridge_s1 | cpu_instruction_master_granted_flash_ssram_pipeline_bridge_s1;
  //flash_ssram_pipeline_bridge_s1_firsttransfer first transaction, which is an e_assign
  assign flash_ssram_pipeline_bridge_s1_firsttransfer = flash_ssram_pipeline_bridge_s1_begins_xfer ? flash_ssram_pipeline_bridge_s1_unreg_firsttransfer : flash_ssram_pipeline_bridge_s1_reg_firsttransfer;

  //flash_ssram_pipeline_bridge_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign flash_ssram_pipeline_bridge_s1_unreg_firsttransfer = ~(flash_ssram_pipeline_bridge_s1_slavearbiterlockenable & flash_ssram_pipeline_bridge_s1_any_continuerequest);

  //flash_ssram_pipeline_bridge_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          flash_ssram_pipeline_bridge_s1_reg_firsttransfer <= 1'b1;
      else if (flash_ssram_pipeline_bridge_s1_begins_xfer)
          flash_ssram_pipeline_bridge_s1_reg_firsttransfer <= flash_ssram_pipeline_bridge_s1_unreg_firsttransfer;
    end


  //flash_ssram_pipeline_bridge_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign flash_ssram_pipeline_bridge_s1_beginbursttransfer_internal = flash_ssram_pipeline_bridge_s1_begins_xfer;

  //flash_ssram_pipeline_bridge_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign flash_ssram_pipeline_bridge_s1_arbitration_holdoff_internal = flash_ssram_pipeline_bridge_s1_begins_xfer & flash_ssram_pipeline_bridge_s1_firsttransfer;

  //flash_ssram_pipeline_bridge_s1_read assignment, which is an e_mux
  assign flash_ssram_pipeline_bridge_s1_read = (cpu_data_master_granted_flash_ssram_pipeline_bridge_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_flash_ssram_pipeline_bridge_s1 & cpu_instruction_master_read);

  //flash_ssram_pipeline_bridge_s1_write assignment, which is an e_mux
  assign flash_ssram_pipeline_bridge_s1_write = cpu_data_master_granted_flash_ssram_pipeline_bridge_s1 & cpu_data_master_write;

  assign shifted_address_to_flash_ssram_pipeline_bridge_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //flash_ssram_pipeline_bridge_s1_address mux, which is an e_mux
  assign flash_ssram_pipeline_bridge_s1_address = (cpu_data_master_granted_flash_ssram_pipeline_bridge_s1)? (shifted_address_to_flash_ssram_pipeline_bridge_s1_from_cpu_data_master >> 2) :
    (shifted_address_to_flash_ssram_pipeline_bridge_s1_from_cpu_instruction_master >> 2);

  assign shifted_address_to_flash_ssram_pipeline_bridge_s1_from_cpu_instruction_master = cpu_instruction_master_address_to_slave;
  //slaveid flash_ssram_pipeline_bridge_s1_nativeaddress nativeaddress mux, which is an e_mux
  assign flash_ssram_pipeline_bridge_s1_nativeaddress = (cpu_data_master_granted_flash_ssram_pipeline_bridge_s1)? (cpu_data_master_address_to_slave >> 2) :
    (cpu_instruction_master_address_to_slave >> 2);

  //d1_flash_ssram_pipeline_bridge_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_flash_ssram_pipeline_bridge_s1_end_xfer <= 1;
      else if (1)
          d1_flash_ssram_pipeline_bridge_s1_end_xfer <= flash_ssram_pipeline_bridge_s1_end_xfer;
    end


  //flash_ssram_pipeline_bridge_s1_waits_for_read in a cycle, which is an e_mux
  assign flash_ssram_pipeline_bridge_s1_waits_for_read = flash_ssram_pipeline_bridge_s1_in_a_read_cycle & flash_ssram_pipeline_bridge_s1_waitrequest_from_sa;

  //flash_ssram_pipeline_bridge_s1_in_a_read_cycle assignment, which is an e_assign
  assign flash_ssram_pipeline_bridge_s1_in_a_read_cycle = (cpu_data_master_granted_flash_ssram_pipeline_bridge_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_flash_ssram_pipeline_bridge_s1 & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = flash_ssram_pipeline_bridge_s1_in_a_read_cycle;

  //flash_ssram_pipeline_bridge_s1_waits_for_write in a cycle, which is an e_mux
  assign flash_ssram_pipeline_bridge_s1_waits_for_write = flash_ssram_pipeline_bridge_s1_in_a_write_cycle & flash_ssram_pipeline_bridge_s1_waitrequest_from_sa;

  //flash_ssram_pipeline_bridge_s1_in_a_write_cycle assignment, which is an e_assign
  assign flash_ssram_pipeline_bridge_s1_in_a_write_cycle = cpu_data_master_granted_flash_ssram_pipeline_bridge_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = flash_ssram_pipeline_bridge_s1_in_a_write_cycle;

  assign wait_for_flash_ssram_pipeline_bridge_s1_counter = 0;
  //flash_ssram_pipeline_bridge_s1_byteenable byte enable port mux, which is an e_mux
  assign flash_ssram_pipeline_bridge_s1_byteenable = (cpu_data_master_granted_flash_ssram_pipeline_bridge_s1)? cpu_data_master_byteenable :
    -1;

  //burstcount mux, which is an e_mux
  assign flash_ssram_pipeline_bridge_s1_burstcount = 1;

  //flash_ssram_pipeline_bridge/s1 arbiterlock assigned from _handle_arbiterlock, which is an e_mux
  assign flash_ssram_pipeline_bridge_s1_arbiterlock = (cpu_data_master_arbiterlock)? cpu_data_master_arbiterlock :
    cpu_instruction_master_arbiterlock;

  //flash_ssram_pipeline_bridge/s1 arbiterlock2 assigned from _handle_arbiterlock2, which is an e_mux
  assign flash_ssram_pipeline_bridge_s1_arbiterlock2 = (cpu_data_master_arbiterlock2)? cpu_data_master_arbiterlock2 :
    cpu_instruction_master_arbiterlock2;

  //debugaccess mux, which is an e_mux
  assign flash_ssram_pipeline_bridge_s1_debugaccess = (cpu_data_master_granted_flash_ssram_pipeline_bridge_s1)? cpu_data_master_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //flash_ssram_pipeline_bridge/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_flash_ssram_pipeline_bridge_s1 + cpu_instruction_master_granted_flash_ssram_pipeline_bridge_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_flash_ssram_pipeline_bridge_s1 + cpu_instruction_master_saved_grant_flash_ssram_pipeline_bridge_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module flash_ssram_pipeline_bridge_m1_arbitrator (
                                                   // inputs:
                                                    clk,
                                                    d1_pipeline_bridge_before_tristate_bridge_s1_end_xfer,
                                                    flash_ssram_pipeline_bridge_m1_address,
                                                    flash_ssram_pipeline_bridge_m1_burstcount,
                                                    flash_ssram_pipeline_bridge_m1_byteenable,
                                                    flash_ssram_pipeline_bridge_m1_chipselect,
                                                    flash_ssram_pipeline_bridge_m1_granted_pipeline_bridge_before_tristate_bridge_s1,
                                                    flash_ssram_pipeline_bridge_m1_qualified_request_pipeline_bridge_before_tristate_bridge_s1,
                                                    flash_ssram_pipeline_bridge_m1_read,
                                                    flash_ssram_pipeline_bridge_m1_read_data_valid_pipeline_bridge_before_tristate_bridge_s1,
                                                    flash_ssram_pipeline_bridge_m1_read_data_valid_pipeline_bridge_before_tristate_bridge_s1_shift_register,
                                                    flash_ssram_pipeline_bridge_m1_requests_pipeline_bridge_before_tristate_bridge_s1,
                                                    flash_ssram_pipeline_bridge_m1_write,
                                                    flash_ssram_pipeline_bridge_m1_writedata,
                                                    pipeline_bridge_before_tristate_bridge_s1_endofpacket_from_sa,
                                                    pipeline_bridge_before_tristate_bridge_s1_readdata_from_sa,
                                                    pipeline_bridge_before_tristate_bridge_s1_waitrequest_from_sa,
                                                    reset_n,

                                                   // outputs:
                                                    flash_ssram_pipeline_bridge_m1_address_to_slave,
                                                    flash_ssram_pipeline_bridge_m1_endofpacket,
                                                    flash_ssram_pipeline_bridge_m1_latency_counter,
                                                    flash_ssram_pipeline_bridge_m1_readdata,
                                                    flash_ssram_pipeline_bridge_m1_readdatavalid,
                                                    flash_ssram_pipeline_bridge_m1_waitrequest
                                                 )
;

  output  [ 24: 0] flash_ssram_pipeline_bridge_m1_address_to_slave;
  output           flash_ssram_pipeline_bridge_m1_endofpacket;
  output           flash_ssram_pipeline_bridge_m1_latency_counter;
  output  [ 31: 0] flash_ssram_pipeline_bridge_m1_readdata;
  output           flash_ssram_pipeline_bridge_m1_readdatavalid;
  output           flash_ssram_pipeline_bridge_m1_waitrequest;
  input            clk;
  input            d1_pipeline_bridge_before_tristate_bridge_s1_end_xfer;
  input   [ 24: 0] flash_ssram_pipeline_bridge_m1_address;
  input            flash_ssram_pipeline_bridge_m1_burstcount;
  input   [  3: 0] flash_ssram_pipeline_bridge_m1_byteenable;
  input            flash_ssram_pipeline_bridge_m1_chipselect;
  input            flash_ssram_pipeline_bridge_m1_granted_pipeline_bridge_before_tristate_bridge_s1;
  input            flash_ssram_pipeline_bridge_m1_qualified_request_pipeline_bridge_before_tristate_bridge_s1;
  input            flash_ssram_pipeline_bridge_m1_read;
  input            flash_ssram_pipeline_bridge_m1_read_data_valid_pipeline_bridge_before_tristate_bridge_s1;
  input            flash_ssram_pipeline_bridge_m1_read_data_valid_pipeline_bridge_before_tristate_bridge_s1_shift_register;
  input            flash_ssram_pipeline_bridge_m1_requests_pipeline_bridge_before_tristate_bridge_s1;
  input            flash_ssram_pipeline_bridge_m1_write;
  input   [ 31: 0] flash_ssram_pipeline_bridge_m1_writedata;
  input            pipeline_bridge_before_tristate_bridge_s1_endofpacket_from_sa;
  input   [ 31: 0] pipeline_bridge_before_tristate_bridge_s1_readdata_from_sa;
  input            pipeline_bridge_before_tristate_bridge_s1_waitrequest_from_sa;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [ 24: 0] flash_ssram_pipeline_bridge_m1_address_last_time;
  wire    [ 24: 0] flash_ssram_pipeline_bridge_m1_address_to_slave;
  reg              flash_ssram_pipeline_bridge_m1_burstcount_last_time;
  reg     [  3: 0] flash_ssram_pipeline_bridge_m1_byteenable_last_time;
  reg              flash_ssram_pipeline_bridge_m1_chipselect_last_time;
  wire             flash_ssram_pipeline_bridge_m1_endofpacket;
  wire             flash_ssram_pipeline_bridge_m1_latency_counter;
  reg              flash_ssram_pipeline_bridge_m1_read_last_time;
  wire    [ 31: 0] flash_ssram_pipeline_bridge_m1_readdata;
  wire             flash_ssram_pipeline_bridge_m1_readdatavalid;
  wire             flash_ssram_pipeline_bridge_m1_run;
  wire             flash_ssram_pipeline_bridge_m1_waitrequest;
  reg              flash_ssram_pipeline_bridge_m1_write_last_time;
  reg     [ 31: 0] flash_ssram_pipeline_bridge_m1_writedata_last_time;
  wire             pre_flush_flash_ssram_pipeline_bridge_m1_readdatavalid;
  wire             r_1;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (flash_ssram_pipeline_bridge_m1_qualified_request_pipeline_bridge_before_tristate_bridge_s1 | ~flash_ssram_pipeline_bridge_m1_requests_pipeline_bridge_before_tristate_bridge_s1) & ((~flash_ssram_pipeline_bridge_m1_qualified_request_pipeline_bridge_before_tristate_bridge_s1 | ~flash_ssram_pipeline_bridge_m1_chipselect | (1 & ~pipeline_bridge_before_tristate_bridge_s1_waitrequest_from_sa & flash_ssram_pipeline_bridge_m1_chipselect))) & ((~flash_ssram_pipeline_bridge_m1_qualified_request_pipeline_bridge_before_tristate_bridge_s1 | ~flash_ssram_pipeline_bridge_m1_chipselect | (1 & ~pipeline_bridge_before_tristate_bridge_s1_waitrequest_from_sa & flash_ssram_pipeline_bridge_m1_chipselect)));

  //cascaded wait assignment, which is an e_assign
  assign flash_ssram_pipeline_bridge_m1_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign flash_ssram_pipeline_bridge_m1_address_to_slave = flash_ssram_pipeline_bridge_m1_address[24 : 0];

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_flash_ssram_pipeline_bridge_m1_readdatavalid = flash_ssram_pipeline_bridge_m1_read_data_valid_pipeline_bridge_before_tristate_bridge_s1;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign flash_ssram_pipeline_bridge_m1_readdatavalid = 0 |
    pre_flush_flash_ssram_pipeline_bridge_m1_readdatavalid;

  //flash_ssram_pipeline_bridge/m1 readdata mux, which is an e_mux
  assign flash_ssram_pipeline_bridge_m1_readdata = pipeline_bridge_before_tristate_bridge_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign flash_ssram_pipeline_bridge_m1_waitrequest = ~flash_ssram_pipeline_bridge_m1_run;

  //latent max counter, which is an e_assign
  assign flash_ssram_pipeline_bridge_m1_latency_counter = 0;

  //mux flash_ssram_pipeline_bridge_m1_endofpacket, which is an e_mux
  assign flash_ssram_pipeline_bridge_m1_endofpacket = pipeline_bridge_before_tristate_bridge_s1_endofpacket_from_sa;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //flash_ssram_pipeline_bridge_m1_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          flash_ssram_pipeline_bridge_m1_address_last_time <= 0;
      else if (1)
          flash_ssram_pipeline_bridge_m1_address_last_time <= flash_ssram_pipeline_bridge_m1_address;
    end


  //flash_ssram_pipeline_bridge/m1 waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else if (1)
          active_and_waiting_last_time <= flash_ssram_pipeline_bridge_m1_waitrequest & flash_ssram_pipeline_bridge_m1_chipselect;
    end


  //flash_ssram_pipeline_bridge_m1_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (flash_ssram_pipeline_bridge_m1_address != flash_ssram_pipeline_bridge_m1_address_last_time))
        begin
          $write("%0d ns: flash_ssram_pipeline_bridge_m1_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //flash_ssram_pipeline_bridge_m1_chipselect check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          flash_ssram_pipeline_bridge_m1_chipselect_last_time <= 0;
      else if (1)
          flash_ssram_pipeline_bridge_m1_chipselect_last_time <= flash_ssram_pipeline_bridge_m1_chipselect;
    end


  //flash_ssram_pipeline_bridge_m1_chipselect matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (flash_ssram_pipeline_bridge_m1_chipselect != flash_ssram_pipeline_bridge_m1_chipselect_last_time))
        begin
          $write("%0d ns: flash_ssram_pipeline_bridge_m1_chipselect did not heed wait!!!", $time);
          $stop;
        end
    end


  //flash_ssram_pipeline_bridge_m1_burstcount check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          flash_ssram_pipeline_bridge_m1_burstcount_last_time <= 0;
      else if (1)
          flash_ssram_pipeline_bridge_m1_burstcount_last_time <= flash_ssram_pipeline_bridge_m1_burstcount;
    end


  //flash_ssram_pipeline_bridge_m1_burstcount matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (flash_ssram_pipeline_bridge_m1_burstcount != flash_ssram_pipeline_bridge_m1_burstcount_last_time))
        begin
          $write("%0d ns: flash_ssram_pipeline_bridge_m1_burstcount did not heed wait!!!", $time);
          $stop;
        end
    end


  //flash_ssram_pipeline_bridge_m1_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          flash_ssram_pipeline_bridge_m1_byteenable_last_time <= 0;
      else if (1)
          flash_ssram_pipeline_bridge_m1_byteenable_last_time <= flash_ssram_pipeline_bridge_m1_byteenable;
    end


  //flash_ssram_pipeline_bridge_m1_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (flash_ssram_pipeline_bridge_m1_byteenable != flash_ssram_pipeline_bridge_m1_byteenable_last_time))
        begin
          $write("%0d ns: flash_ssram_pipeline_bridge_m1_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //flash_ssram_pipeline_bridge_m1_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          flash_ssram_pipeline_bridge_m1_read_last_time <= 0;
      else if (1)
          flash_ssram_pipeline_bridge_m1_read_last_time <= flash_ssram_pipeline_bridge_m1_read;
    end


  //flash_ssram_pipeline_bridge_m1_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (flash_ssram_pipeline_bridge_m1_read != flash_ssram_pipeline_bridge_m1_read_last_time))
        begin
          $write("%0d ns: flash_ssram_pipeline_bridge_m1_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //flash_ssram_pipeline_bridge_m1_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          flash_ssram_pipeline_bridge_m1_write_last_time <= 0;
      else if (1)
          flash_ssram_pipeline_bridge_m1_write_last_time <= flash_ssram_pipeline_bridge_m1_write;
    end


  //flash_ssram_pipeline_bridge_m1_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (flash_ssram_pipeline_bridge_m1_write != flash_ssram_pipeline_bridge_m1_write_last_time))
        begin
          $write("%0d ns: flash_ssram_pipeline_bridge_m1_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //flash_ssram_pipeline_bridge_m1_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          flash_ssram_pipeline_bridge_m1_writedata_last_time <= 0;
      else if (1)
          flash_ssram_pipeline_bridge_m1_writedata_last_time <= flash_ssram_pipeline_bridge_m1_writedata;
    end


  //flash_ssram_pipeline_bridge_m1_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (flash_ssram_pipeline_bridge_m1_writedata != flash_ssram_pipeline_bridge_m1_writedata_last_time) & (flash_ssram_pipeline_bridge_m1_write & flash_ssram_pipeline_bridge_m1_chipselect))
        begin
          $write("%0d ns: flash_ssram_pipeline_bridge_m1_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module flash_ssram_pipeline_bridge_bridge_arbitrator 
;



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module flash_ssram_tristate_bridge_avalon_slave_arbitrator (
                                                             // inputs:
                                                              clk,
                                                              pipeline_bridge_before_tristate_bridge_m1_address_to_slave,
                                                              pipeline_bridge_before_tristate_bridge_m1_burstcount,
                                                              pipeline_bridge_before_tristate_bridge_m1_byteenable,
                                                              pipeline_bridge_before_tristate_bridge_m1_chipselect,
                                                              pipeline_bridge_before_tristate_bridge_m1_dbs_address,
                                                              pipeline_bridge_before_tristate_bridge_m1_dbs_write_16,
                                                              pipeline_bridge_before_tristate_bridge_m1_latency_counter,
                                                              pipeline_bridge_before_tristate_bridge_m1_read,
                                                              pipeline_bridge_before_tristate_bridge_m1_write,
                                                              pipeline_bridge_before_tristate_bridge_m1_writedata,
                                                              reset_n,

                                                             // outputs:
                                                              adsc_n_to_the_ssram,
                                                              bw_n_to_the_ssram,
                                                              bwe_n_to_the_ssram,
                                                              chipenable1_n_to_the_ssram,
                                                              d1_flash_ssram_tristate_bridge_avalon_slave_end_xfer,
                                                              ext_flash_s1_wait_counter_eq_0,
                                                              flash_ssram_tristate_bridge_address,
                                                              flash_ssram_tristate_bridge_data,
                                                              incoming_flash_ssram_tristate_bridge_data,
                                                              incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0,
                                                              outputenable_n_to_the_ssram,
                                                              pipeline_bridge_before_tristate_bridge_m1_byteenable_ext_flash_s1,
                                                              pipeline_bridge_before_tristate_bridge_m1_granted_ext_flash_s1,
                                                              pipeline_bridge_before_tristate_bridge_m1_granted_ssram_s1,
                                                              pipeline_bridge_before_tristate_bridge_m1_qualified_request_ext_flash_s1,
                                                              pipeline_bridge_before_tristate_bridge_m1_qualified_request_ssram_s1,
                                                              pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ext_flash_s1,
                                                              pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ssram_s1,
                                                              pipeline_bridge_before_tristate_bridge_m1_requests_ext_flash_s1,
                                                              pipeline_bridge_before_tristate_bridge_m1_requests_ssram_s1,
                                                              read_n_to_the_ext_flash,
                                                              select_n_to_the_ext_flash,
                                                              write_n_to_the_ext_flash
                                                           )
;

  output           adsc_n_to_the_ssram;
  output  [  3: 0] bw_n_to_the_ssram;
  output           bwe_n_to_the_ssram;
  output           chipenable1_n_to_the_ssram;
  output           d1_flash_ssram_tristate_bridge_avalon_slave_end_xfer;
  output           ext_flash_s1_wait_counter_eq_0;
  output  [ 23: 0] flash_ssram_tristate_bridge_address;
  inout   [ 31: 0] flash_ssram_tristate_bridge_data;
  output  [ 31: 0] incoming_flash_ssram_tristate_bridge_data;
  output  [ 15: 0] incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0;
  output           outputenable_n_to_the_ssram;
  output  [  1: 0] pipeline_bridge_before_tristate_bridge_m1_byteenable_ext_flash_s1;
  output           pipeline_bridge_before_tristate_bridge_m1_granted_ext_flash_s1;
  output           pipeline_bridge_before_tristate_bridge_m1_granted_ssram_s1;
  output           pipeline_bridge_before_tristate_bridge_m1_qualified_request_ext_flash_s1;
  output           pipeline_bridge_before_tristate_bridge_m1_qualified_request_ssram_s1;
  output           pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ext_flash_s1;
  output           pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ssram_s1;
  output           pipeline_bridge_before_tristate_bridge_m1_requests_ext_flash_s1;
  output           pipeline_bridge_before_tristate_bridge_m1_requests_ssram_s1;
  output           read_n_to_the_ext_flash;
  output           select_n_to_the_ext_flash;
  output           write_n_to_the_ext_flash;
  input            clk;
  input   [ 24: 0] pipeline_bridge_before_tristate_bridge_m1_address_to_slave;
  input            pipeline_bridge_before_tristate_bridge_m1_burstcount;
  input   [  3: 0] pipeline_bridge_before_tristate_bridge_m1_byteenable;
  input            pipeline_bridge_before_tristate_bridge_m1_chipselect;
  input   [  1: 0] pipeline_bridge_before_tristate_bridge_m1_dbs_address;
  input   [ 15: 0] pipeline_bridge_before_tristate_bridge_m1_dbs_write_16;
  input   [  2: 0] pipeline_bridge_before_tristate_bridge_m1_latency_counter;
  input            pipeline_bridge_before_tristate_bridge_m1_read;
  input            pipeline_bridge_before_tristate_bridge_m1_write;
  input   [ 31: 0] pipeline_bridge_before_tristate_bridge_m1_writedata;
  input            reset_n;

  reg              adsc_n_to_the_ssram /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg     [  3: 0] bw_n_to_the_ssram /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              bwe_n_to_the_ssram /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              chipenable1_n_to_the_ssram /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              d1_flash_ssram_tristate_bridge_avalon_slave_end_xfer;
  reg              d1_in_a_write_cycle /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_ENABLE_REGISTER=ON"  */;
  reg     [ 31: 0] d1_outgoing_flash_ssram_tristate_bridge_data /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_flash_ssram_tristate_bridge_avalon_slave;
  wire    [  3: 0] ext_flash_s1_counter_load_value;
  wire             ext_flash_s1_in_a_read_cycle;
  wire             ext_flash_s1_in_a_write_cycle;
  reg     [  3: 0] ext_flash_s1_wait_counter;
  wire             ext_flash_s1_wait_counter_eq_0;
  wire             ext_flash_s1_waits_for_read;
  wire             ext_flash_s1_waits_for_write;
  wire             ext_flash_s1_with_write_latency;
  reg     [ 23: 0] flash_ssram_tristate_bridge_address /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire             flash_ssram_tristate_bridge_avalon_slave_allgrants;
  wire             flash_ssram_tristate_bridge_avalon_slave_allow_new_arb_cycle;
  wire             flash_ssram_tristate_bridge_avalon_slave_any_bursting_master_saved_grant;
  wire             flash_ssram_tristate_bridge_avalon_slave_any_continuerequest;
  wire             flash_ssram_tristate_bridge_avalon_slave_arb_counter_enable;
  reg     [  1: 0] flash_ssram_tristate_bridge_avalon_slave_arb_share_counter;
  wire    [  1: 0] flash_ssram_tristate_bridge_avalon_slave_arb_share_counter_next_value;
  wire    [  1: 0] flash_ssram_tristate_bridge_avalon_slave_arb_share_set_values;
  wire             flash_ssram_tristate_bridge_avalon_slave_beginbursttransfer_internal;
  wire             flash_ssram_tristate_bridge_avalon_slave_begins_xfer;
  wire             flash_ssram_tristate_bridge_avalon_slave_end_xfer;
  wire             flash_ssram_tristate_bridge_avalon_slave_firsttransfer;
  wire             flash_ssram_tristate_bridge_avalon_slave_grant_vector;
  wire             flash_ssram_tristate_bridge_avalon_slave_master_qreq_vector;
  wire             flash_ssram_tristate_bridge_avalon_slave_non_bursting_master_requests;
  wire             flash_ssram_tristate_bridge_avalon_slave_read_pending;
  reg              flash_ssram_tristate_bridge_avalon_slave_reg_firsttransfer;
  reg              flash_ssram_tristate_bridge_avalon_slave_slavearbiterlockenable;
  wire             flash_ssram_tristate_bridge_avalon_slave_slavearbiterlockenable2;
  wire             flash_ssram_tristate_bridge_avalon_slave_unreg_firsttransfer;
  wire             flash_ssram_tristate_bridge_avalon_slave_write_pending;
  wire    [ 31: 0] flash_ssram_tristate_bridge_data;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg     [ 31: 0] incoming_flash_ssram_tristate_bridge_data /* synthesis ALTERA_ATTRIBUTE = "FAST_INPUT_REGISTER=ON"  */;
  wire             incoming_flash_ssram_tristate_bridge_data_bit_0_is_x;
  wire             incoming_flash_ssram_tristate_bridge_data_bit_10_is_x;
  wire             incoming_flash_ssram_tristate_bridge_data_bit_11_is_x;
  wire             incoming_flash_ssram_tristate_bridge_data_bit_12_is_x;
  wire             incoming_flash_ssram_tristate_bridge_data_bit_13_is_x;
  wire             incoming_flash_ssram_tristate_bridge_data_bit_14_is_x;
  wire             incoming_flash_ssram_tristate_bridge_data_bit_15_is_x;
  wire             incoming_flash_ssram_tristate_bridge_data_bit_1_is_x;
  wire             incoming_flash_ssram_tristate_bridge_data_bit_2_is_x;
  wire             incoming_flash_ssram_tristate_bridge_data_bit_3_is_x;
  wire             incoming_flash_ssram_tristate_bridge_data_bit_4_is_x;
  wire             incoming_flash_ssram_tristate_bridge_data_bit_5_is_x;
  wire             incoming_flash_ssram_tristate_bridge_data_bit_6_is_x;
  wire             incoming_flash_ssram_tristate_bridge_data_bit_7_is_x;
  wire             incoming_flash_ssram_tristate_bridge_data_bit_8_is_x;
  wire             incoming_flash_ssram_tristate_bridge_data_bit_9_is_x;
  wire    [ 15: 0] incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0;
  wire    [ 31: 0] outgoing_flash_ssram_tristate_bridge_data;
  reg              outputenable_n_to_the_ssram /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire             p1_adsc_n_to_the_ssram;
  wire    [  3: 0] p1_bw_n_to_the_ssram;
  wire             p1_bwe_n_to_the_ssram;
  wire             p1_chipenable1_n_to_the_ssram;
  wire    [ 23: 0] p1_flash_ssram_tristate_bridge_address;
  wire             p1_outputenable_n_to_the_ssram;
  wire    [  1: 0] p1_pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ext_flash_s1_shift_register;
  wire    [  3: 0] p1_pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ssram_s1_shift_register;
  wire             p1_read_n_to_the_ext_flash;
  wire             p1_select_n_to_the_ext_flash;
  wire             p1_write_n_to_the_ext_flash;
  wire             pipeline_bridge_before_tristate_bridge_m1_arbiterlock;
  wire             pipeline_bridge_before_tristate_bridge_m1_arbiterlock2;
  wire    [  1: 0] pipeline_bridge_before_tristate_bridge_m1_byteenable_ext_flash_s1;
  wire    [  1: 0] pipeline_bridge_before_tristate_bridge_m1_byteenable_ext_flash_s1_segment_0;
  wire    [  1: 0] pipeline_bridge_before_tristate_bridge_m1_byteenable_ext_flash_s1_segment_1;
  wire             pipeline_bridge_before_tristate_bridge_m1_continuerequest;
  wire             pipeline_bridge_before_tristate_bridge_m1_granted_ext_flash_s1;
  wire             pipeline_bridge_before_tristate_bridge_m1_granted_ssram_s1;
  wire             pipeline_bridge_before_tristate_bridge_m1_qualified_request_ext_flash_s1;
  wire             pipeline_bridge_before_tristate_bridge_m1_qualified_request_ssram_s1;
  wire             pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ext_flash_s1;
  reg     [  1: 0] pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ext_flash_s1_shift_register;
  wire             pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ext_flash_s1_shift_register_in;
  wire             pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ssram_s1;
  reg     [  3: 0] pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ssram_s1_shift_register;
  wire             pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ssram_s1_shift_register_in;
  wire             pipeline_bridge_before_tristate_bridge_m1_requests_ext_flash_s1;
  wire             pipeline_bridge_before_tristate_bridge_m1_requests_ssram_s1;
  wire             pipeline_bridge_before_tristate_bridge_m1_saved_grant_ext_flash_s1;
  wire             pipeline_bridge_before_tristate_bridge_m1_saved_grant_ssram_s1;
  reg              read_n_to_the_ext_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              select_n_to_the_ext_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire             ssram_s1_in_a_read_cycle;
  wire             ssram_s1_in_a_write_cycle;
  wire             ssram_s1_waits_for_read;
  wire             ssram_s1_waits_for_write;
  wire             ssram_s1_with_write_latency;
  wire             time_to_write;
  wire             wait_for_ext_flash_s1_counter;
  wire             wait_for_ssram_s1_counter;
  reg              write_n_to_the_ext_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~flash_ssram_tristate_bridge_avalon_slave_end_xfer;
    end


  assign flash_ssram_tristate_bridge_avalon_slave_begins_xfer = ~d1_reasons_to_wait & ((pipeline_bridge_before_tristate_bridge_m1_qualified_request_ext_flash_s1 | pipeline_bridge_before_tristate_bridge_m1_qualified_request_ssram_s1));
  assign pipeline_bridge_before_tristate_bridge_m1_requests_ext_flash_s1 = ({pipeline_bridge_before_tristate_bridge_m1_address_to_slave[24] , 24'b0} == 25'h4000000) & pipeline_bridge_before_tristate_bridge_m1_chipselect;
  //~select_n_to_the_ext_flash of type chipselect to ~p1_select_n_to_the_ext_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          select_n_to_the_ext_flash <= ~0;
      else if (1)
          select_n_to_the_ext_flash <= p1_select_n_to_the_ext_flash;
    end


  //~chipenable1_n_to_the_ssram of type chipselect to ~p1_chipenable1_n_to_the_ssram, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          chipenable1_n_to_the_ssram <= ~0;
      else if (1)
          chipenable1_n_to_the_ssram <= p1_chipenable1_n_to_the_ssram;
    end


  assign flash_ssram_tristate_bridge_avalon_slave_write_pending = 0;
  //flash_ssram_tristate_bridge/avalon_slave read pending calc, which is an e_assign
  assign flash_ssram_tristate_bridge_avalon_slave_read_pending = |pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ssram_s1_shift_register[1 : 0];

  //flash_ssram_tristate_bridge_avalon_slave_arb_share_counter set values, which is an e_mux
  assign flash_ssram_tristate_bridge_avalon_slave_arb_share_set_values = (pipeline_bridge_before_tristate_bridge_m1_granted_ext_flash_s1)? 2 :
    1;

  //flash_ssram_tristate_bridge_avalon_slave_non_bursting_master_requests mux, which is an e_mux
  assign flash_ssram_tristate_bridge_avalon_slave_non_bursting_master_requests = pipeline_bridge_before_tristate_bridge_m1_requests_ext_flash_s1 |
    pipeline_bridge_before_tristate_bridge_m1_requests_ssram_s1;

  //flash_ssram_tristate_bridge_avalon_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign flash_ssram_tristate_bridge_avalon_slave_any_bursting_master_saved_grant = 0;

  //flash_ssram_tristate_bridge_avalon_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign flash_ssram_tristate_bridge_avalon_slave_arb_share_counter_next_value = flash_ssram_tristate_bridge_avalon_slave_firsttransfer ? (flash_ssram_tristate_bridge_avalon_slave_arb_share_set_values - 1) : |flash_ssram_tristate_bridge_avalon_slave_arb_share_counter ? (flash_ssram_tristate_bridge_avalon_slave_arb_share_counter - 1) : 0;

  //flash_ssram_tristate_bridge_avalon_slave_allgrants all slave grants, which is an e_mux
  assign flash_ssram_tristate_bridge_avalon_slave_allgrants = |flash_ssram_tristate_bridge_avalon_slave_grant_vector |
    |flash_ssram_tristate_bridge_avalon_slave_grant_vector;

  //flash_ssram_tristate_bridge_avalon_slave_end_xfer assignment, which is an e_assign
  assign flash_ssram_tristate_bridge_avalon_slave_end_xfer = ~(ext_flash_s1_waits_for_read | ext_flash_s1_waits_for_write | ssram_s1_waits_for_read | ssram_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_flash_ssram_tristate_bridge_avalon_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_flash_ssram_tristate_bridge_avalon_slave = flash_ssram_tristate_bridge_avalon_slave_end_xfer & (~flash_ssram_tristate_bridge_avalon_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //flash_ssram_tristate_bridge_avalon_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign flash_ssram_tristate_bridge_avalon_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_flash_ssram_tristate_bridge_avalon_slave & flash_ssram_tristate_bridge_avalon_slave_allgrants) | (end_xfer_arb_share_counter_term_flash_ssram_tristate_bridge_avalon_slave & ~flash_ssram_tristate_bridge_avalon_slave_non_bursting_master_requests);

  //flash_ssram_tristate_bridge_avalon_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          flash_ssram_tristate_bridge_avalon_slave_arb_share_counter <= 0;
      else if (flash_ssram_tristate_bridge_avalon_slave_arb_counter_enable)
          flash_ssram_tristate_bridge_avalon_slave_arb_share_counter <= flash_ssram_tristate_bridge_avalon_slave_arb_share_counter_next_value;
    end


  //flash_ssram_tristate_bridge_avalon_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          flash_ssram_tristate_bridge_avalon_slave_slavearbiterlockenable <= 0;
      else if ((|flash_ssram_tristate_bridge_avalon_slave_master_qreq_vector & end_xfer_arb_share_counter_term_flash_ssram_tristate_bridge_avalon_slave) | (end_xfer_arb_share_counter_term_flash_ssram_tristate_bridge_avalon_slave & ~flash_ssram_tristate_bridge_avalon_slave_non_bursting_master_requests))
          flash_ssram_tristate_bridge_avalon_slave_slavearbiterlockenable <= |flash_ssram_tristate_bridge_avalon_slave_arb_share_counter_next_value;
    end


  //pipeline_bridge_before_tristate_bridge/m1 flash_ssram_tristate_bridge/avalon_slave arbiterlock, which is an e_assign
  assign pipeline_bridge_before_tristate_bridge_m1_arbiterlock = flash_ssram_tristate_bridge_avalon_slave_slavearbiterlockenable & pipeline_bridge_before_tristate_bridge_m1_continuerequest;

  //flash_ssram_tristate_bridge_avalon_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign flash_ssram_tristate_bridge_avalon_slave_slavearbiterlockenable2 = |flash_ssram_tristate_bridge_avalon_slave_arb_share_counter_next_value;

  //pipeline_bridge_before_tristate_bridge/m1 flash_ssram_tristate_bridge/avalon_slave arbiterlock2, which is an e_assign
  assign pipeline_bridge_before_tristate_bridge_m1_arbiterlock2 = flash_ssram_tristate_bridge_avalon_slave_slavearbiterlockenable2 & pipeline_bridge_before_tristate_bridge_m1_continuerequest;

  //flash_ssram_tristate_bridge_avalon_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign flash_ssram_tristate_bridge_avalon_slave_any_continuerequest = 1;

  //pipeline_bridge_before_tristate_bridge_m1_continuerequest continued request, which is an e_assign
  assign pipeline_bridge_before_tristate_bridge_m1_continuerequest = 1;

  assign pipeline_bridge_before_tristate_bridge_m1_qualified_request_ext_flash_s1 = pipeline_bridge_before_tristate_bridge_m1_requests_ext_flash_s1 & ~(((pipeline_bridge_before_tristate_bridge_m1_read & pipeline_bridge_before_tristate_bridge_m1_chipselect) & (flash_ssram_tristate_bridge_avalon_slave_write_pending | (flash_ssram_tristate_bridge_avalon_slave_read_pending) | (2 < pipeline_bridge_before_tristate_bridge_m1_latency_counter))) | ((flash_ssram_tristate_bridge_avalon_slave_read_pending | !pipeline_bridge_before_tristate_bridge_m1_byteenable_ext_flash_s1) & (pipeline_bridge_before_tristate_bridge_m1_write & pipeline_bridge_before_tristate_bridge_m1_chipselect)));
  //pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ext_flash_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ext_flash_s1_shift_register_in = pipeline_bridge_before_tristate_bridge_m1_granted_ext_flash_s1 & (pipeline_bridge_before_tristate_bridge_m1_read & pipeline_bridge_before_tristate_bridge_m1_chipselect) & ~ext_flash_s1_waits_for_read;

  //shift register p1 pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ext_flash_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ext_flash_s1_shift_register = {pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ext_flash_s1_shift_register, pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ext_flash_s1_shift_register_in};

  //pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ext_flash_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ext_flash_s1_shift_register <= 0;
      else if (1)
          pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ext_flash_s1_shift_register <= p1_pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ext_flash_s1_shift_register;
    end


  //local readdatavalid pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ext_flash_s1, which is an e_mux
  assign pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ext_flash_s1 = pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ext_flash_s1_shift_register[1];

  //flash_ssram_tristate_bridge_data register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          incoming_flash_ssram_tristate_bridge_data <= 0;
      else if (1)
          incoming_flash_ssram_tristate_bridge_data <= flash_ssram_tristate_bridge_data;
    end


  //ext_flash_s1_with_write_latency assignment, which is an e_assign
  assign ext_flash_s1_with_write_latency = in_a_write_cycle & (pipeline_bridge_before_tristate_bridge_m1_qualified_request_ext_flash_s1);

  //time to write the data, which is an e_mux
  assign time_to_write = (ext_flash_s1_with_write_latency)? 1 :
    (ssram_s1_with_write_latency)? 1 :
    0;

  //d1_outgoing_flash_ssram_tristate_bridge_data register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_outgoing_flash_ssram_tristate_bridge_data <= 0;
      else if (1)
          d1_outgoing_flash_ssram_tristate_bridge_data <= outgoing_flash_ssram_tristate_bridge_data;
    end


  //write cycle delayed by 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_in_a_write_cycle <= 0;
      else if (1)
          d1_in_a_write_cycle <= time_to_write;
    end


  //d1_outgoing_flash_ssram_tristate_bridge_data tristate driver, which is an e_assign
  assign flash_ssram_tristate_bridge_data = (d1_in_a_write_cycle)? d1_outgoing_flash_ssram_tristate_bridge_data:{32{1'bz}};

  //outgoing_flash_ssram_tristate_bridge_data mux, which is an e_mux
  assign outgoing_flash_ssram_tristate_bridge_data = (pipeline_bridge_before_tristate_bridge_m1_granted_ext_flash_s1)? pipeline_bridge_before_tristate_bridge_m1_dbs_write_16 :
    pipeline_bridge_before_tristate_bridge_m1_writedata;

  assign pipeline_bridge_before_tristate_bridge_m1_requests_ssram_s1 = ({pipeline_bridge_before_tristate_bridge_m1_address_to_slave[24 : 20] , 20'b0} == 25'h5000000) & pipeline_bridge_before_tristate_bridge_m1_chipselect;
  assign pipeline_bridge_before_tristate_bridge_m1_qualified_request_ssram_s1 = pipeline_bridge_before_tristate_bridge_m1_requests_ssram_s1 & ~(((pipeline_bridge_before_tristate_bridge_m1_read & pipeline_bridge_before_tristate_bridge_m1_chipselect) & (flash_ssram_tristate_bridge_avalon_slave_write_pending | (flash_ssram_tristate_bridge_avalon_slave_read_pending & !((((|pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ssram_s1_shift_register[1 : 0]))))) | (4 < pipeline_bridge_before_tristate_bridge_m1_latency_counter))) | ((flash_ssram_tristate_bridge_avalon_slave_read_pending) & (pipeline_bridge_before_tristate_bridge_m1_write & pipeline_bridge_before_tristate_bridge_m1_chipselect)));
  //pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ssram_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ssram_s1_shift_register_in = pipeline_bridge_before_tristate_bridge_m1_granted_ssram_s1 & (pipeline_bridge_before_tristate_bridge_m1_read & pipeline_bridge_before_tristate_bridge_m1_chipselect) & ~ssram_s1_waits_for_read;

  //shift register p1 pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ssram_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ssram_s1_shift_register = {pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ssram_s1_shift_register, pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ssram_s1_shift_register_in};

  //pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ssram_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ssram_s1_shift_register <= 0;
      else if (1)
          pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ssram_s1_shift_register <= p1_pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ssram_s1_shift_register;
    end


  //local readdatavalid pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ssram_s1, which is an e_mux
  assign pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ssram_s1 = pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ssram_s1_shift_register[3];

  //ssram_s1_with_write_latency assignment, which is an e_assign
  assign ssram_s1_with_write_latency = in_a_write_cycle & (pipeline_bridge_before_tristate_bridge_m1_qualified_request_ssram_s1);

  //master is always granted when requested
  assign pipeline_bridge_before_tristate_bridge_m1_granted_ext_flash_s1 = pipeline_bridge_before_tristate_bridge_m1_qualified_request_ext_flash_s1;

  //pipeline_bridge_before_tristate_bridge/m1 saved-grant ext_flash/s1, which is an e_assign
  assign pipeline_bridge_before_tristate_bridge_m1_saved_grant_ext_flash_s1 = pipeline_bridge_before_tristate_bridge_m1_requests_ext_flash_s1;

  //allow new arb cycle for flash_ssram_tristate_bridge/avalon_slave, which is an e_assign
  assign flash_ssram_tristate_bridge_avalon_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign flash_ssram_tristate_bridge_avalon_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign flash_ssram_tristate_bridge_avalon_slave_master_qreq_vector = 1;

  //master is always granted when requested
  assign pipeline_bridge_before_tristate_bridge_m1_granted_ssram_s1 = pipeline_bridge_before_tristate_bridge_m1_qualified_request_ssram_s1;

  //pipeline_bridge_before_tristate_bridge/m1 saved-grant ssram/s1, which is an e_assign
  assign pipeline_bridge_before_tristate_bridge_m1_saved_grant_ssram_s1 = pipeline_bridge_before_tristate_bridge_m1_requests_ssram_s1;

  assign p1_select_n_to_the_ext_flash = ~pipeline_bridge_before_tristate_bridge_m1_granted_ext_flash_s1;
  //flash_ssram_tristate_bridge_avalon_slave_firsttransfer first transaction, which is an e_assign
  assign flash_ssram_tristate_bridge_avalon_slave_firsttransfer = flash_ssram_tristate_bridge_avalon_slave_begins_xfer ? flash_ssram_tristate_bridge_avalon_slave_unreg_firsttransfer : flash_ssram_tristate_bridge_avalon_slave_reg_firsttransfer;

  //flash_ssram_tristate_bridge_avalon_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign flash_ssram_tristate_bridge_avalon_slave_unreg_firsttransfer = ~(flash_ssram_tristate_bridge_avalon_slave_slavearbiterlockenable & flash_ssram_tristate_bridge_avalon_slave_any_continuerequest);

  //flash_ssram_tristate_bridge_avalon_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          flash_ssram_tristate_bridge_avalon_slave_reg_firsttransfer <= 1'b1;
      else if (flash_ssram_tristate_bridge_avalon_slave_begins_xfer)
          flash_ssram_tristate_bridge_avalon_slave_reg_firsttransfer <= flash_ssram_tristate_bridge_avalon_slave_unreg_firsttransfer;
    end


  //flash_ssram_tristate_bridge_avalon_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign flash_ssram_tristate_bridge_avalon_slave_beginbursttransfer_internal = flash_ssram_tristate_bridge_avalon_slave_begins_xfer;

  //~read_n_to_the_ext_flash of type read to ~p1_read_n_to_the_ext_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          read_n_to_the_ext_flash <= ~0;
      else if (1)
          read_n_to_the_ext_flash <= p1_read_n_to_the_ext_flash;
    end


  //~p1_read_n_to_the_ext_flash assignment, which is an e_mux
  assign p1_read_n_to_the_ext_flash = ~(((pipeline_bridge_before_tristate_bridge_m1_granted_ext_flash_s1 & (pipeline_bridge_before_tristate_bridge_m1_read & pipeline_bridge_before_tristate_bridge_m1_chipselect)))& ~flash_ssram_tristate_bridge_avalon_slave_begins_xfer & (ext_flash_s1_wait_counter < 10));

  //~write_n_to_the_ext_flash of type write to ~p1_write_n_to_the_ext_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          write_n_to_the_ext_flash <= ~0;
      else if (1)
          write_n_to_the_ext_flash <= p1_write_n_to_the_ext_flash;
    end


  //~p1_write_n_to_the_ext_flash assignment, which is an e_mux
  assign p1_write_n_to_the_ext_flash = ~(((pipeline_bridge_before_tristate_bridge_m1_granted_ext_flash_s1 & (pipeline_bridge_before_tristate_bridge_m1_write & pipeline_bridge_before_tristate_bridge_m1_chipselect))) & ~flash_ssram_tristate_bridge_avalon_slave_begins_xfer & (ext_flash_s1_wait_counter >= 2) & (ext_flash_s1_wait_counter < 12));

  //flash_ssram_tristate_bridge_address of type address to p1_flash_ssram_tristate_bridge_address, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          flash_ssram_tristate_bridge_address <= 0;
      else if (1)
          flash_ssram_tristate_bridge_address <= p1_flash_ssram_tristate_bridge_address;
    end


  //p1_flash_ssram_tristate_bridge_address mux, which is an e_mux
  assign p1_flash_ssram_tristate_bridge_address = (pipeline_bridge_before_tristate_bridge_m1_granted_ext_flash_s1)? ({pipeline_bridge_before_tristate_bridge_m1_address_to_slave >> 2,
    pipeline_bridge_before_tristate_bridge_m1_dbs_address[1],
    {1 {1'b0}}}) :
    pipeline_bridge_before_tristate_bridge_m1_address_to_slave;

  //d1_flash_ssram_tristate_bridge_avalon_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_flash_ssram_tristate_bridge_avalon_slave_end_xfer <= 1;
      else if (1)
          d1_flash_ssram_tristate_bridge_avalon_slave_end_xfer <= flash_ssram_tristate_bridge_avalon_slave_end_xfer;
    end


  //ext_flash_s1_waits_for_read in a cycle, which is an e_mux
  assign ext_flash_s1_waits_for_read = ext_flash_s1_in_a_read_cycle & wait_for_ext_flash_s1_counter;

  //ext_flash_s1_in_a_read_cycle assignment, which is an e_assign
  assign ext_flash_s1_in_a_read_cycle = pipeline_bridge_before_tristate_bridge_m1_granted_ext_flash_s1 & (pipeline_bridge_before_tristate_bridge_m1_read & pipeline_bridge_before_tristate_bridge_m1_chipselect);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = ext_flash_s1_in_a_read_cycle |
    ssram_s1_in_a_read_cycle;

  //ext_flash_s1_waits_for_write in a cycle, which is an e_mux
  assign ext_flash_s1_waits_for_write = ext_flash_s1_in_a_write_cycle & wait_for_ext_flash_s1_counter;

  //ext_flash_s1_in_a_write_cycle assignment, which is an e_assign
  assign ext_flash_s1_in_a_write_cycle = pipeline_bridge_before_tristate_bridge_m1_granted_ext_flash_s1 & (pipeline_bridge_before_tristate_bridge_m1_write & pipeline_bridge_before_tristate_bridge_m1_chipselect);

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = ext_flash_s1_in_a_write_cycle |
    ssram_s1_in_a_write_cycle;

  assign ext_flash_s1_wait_counter_eq_0 = ext_flash_s1_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ext_flash_s1_wait_counter <= 0;
      else if (1)
          ext_flash_s1_wait_counter <= ext_flash_s1_counter_load_value;
    end


  assign ext_flash_s1_counter_load_value = ((ext_flash_s1_in_a_read_cycle & flash_ssram_tristate_bridge_avalon_slave_begins_xfer))? 11 :
    ((ext_flash_s1_in_a_write_cycle & flash_ssram_tristate_bridge_avalon_slave_begins_xfer))? 13 :
    (~ext_flash_s1_wait_counter_eq_0)? ext_flash_s1_wait_counter - 1 :
    0;

  assign wait_for_ext_flash_s1_counter = flash_ssram_tristate_bridge_avalon_slave_begins_xfer | ~ext_flash_s1_wait_counter_eq_0;
  assign {pipeline_bridge_before_tristate_bridge_m1_byteenable_ext_flash_s1_segment_1,
pipeline_bridge_before_tristate_bridge_m1_byteenable_ext_flash_s1_segment_0} = pipeline_bridge_before_tristate_bridge_m1_byteenable;
  assign pipeline_bridge_before_tristate_bridge_m1_byteenable_ext_flash_s1 = ((pipeline_bridge_before_tristate_bridge_m1_dbs_address[1] == 0))? pipeline_bridge_before_tristate_bridge_m1_byteenable_ext_flash_s1_segment_0 :
    pipeline_bridge_before_tristate_bridge_m1_byteenable_ext_flash_s1_segment_1;

  //~adsc_n_to_the_ssram of type begintransfer to ~p1_adsc_n_to_the_ssram, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          adsc_n_to_the_ssram <= ~0;
      else if (1)
          adsc_n_to_the_ssram <= p1_adsc_n_to_the_ssram;
    end


  assign p1_adsc_n_to_the_ssram = ~flash_ssram_tristate_bridge_avalon_slave_begins_xfer;
  //~outputenable_n_to_the_ssram of type outputenable to ~p1_outputenable_n_to_the_ssram, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          outputenable_n_to_the_ssram <= ~0;
      else if (1)
          outputenable_n_to_the_ssram <= p1_outputenable_n_to_the_ssram;
    end


  //~p1_outputenable_n_to_the_ssram assignment, which is an e_mux
  assign p1_outputenable_n_to_the_ssram = ~((|pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ssram_s1_shift_register[1 : 0]) | ssram_s1_in_a_read_cycle);

  assign p1_chipenable1_n_to_the_ssram = ~(pipeline_bridge_before_tristate_bridge_m1_granted_ssram_s1 | (|pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ssram_s1_shift_register[1 : 0]));
  //~bwe_n_to_the_ssram of type write to ~p1_bwe_n_to_the_ssram, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          bwe_n_to_the_ssram <= ~0;
      else if (1)
          bwe_n_to_the_ssram <= p1_bwe_n_to_the_ssram;
    end


  //~bw_n_to_the_ssram of type byteenable to ~p1_bw_n_to_the_ssram, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          bw_n_to_the_ssram <= ~0;
      else if (1)
          bw_n_to_the_ssram <= p1_bw_n_to_the_ssram;
    end


  //~p1_bwe_n_to_the_ssram assignment, which is an e_mux
  assign p1_bwe_n_to_the_ssram = ~(pipeline_bridge_before_tristate_bridge_m1_granted_ssram_s1 & (pipeline_bridge_before_tristate_bridge_m1_write & pipeline_bridge_before_tristate_bridge_m1_chipselect));

  //ssram_s1_waits_for_read in a cycle, which is an e_mux
  assign ssram_s1_waits_for_read = ssram_s1_in_a_read_cycle & 0;

  //ssram_s1_in_a_read_cycle assignment, which is an e_assign
  assign ssram_s1_in_a_read_cycle = pipeline_bridge_before_tristate_bridge_m1_granted_ssram_s1 & (pipeline_bridge_before_tristate_bridge_m1_read & pipeline_bridge_before_tristate_bridge_m1_chipselect);

  //ssram_s1_waits_for_write in a cycle, which is an e_mux
  assign ssram_s1_waits_for_write = ssram_s1_in_a_write_cycle & 0;

  //ssram_s1_in_a_write_cycle assignment, which is an e_assign
  assign ssram_s1_in_a_write_cycle = pipeline_bridge_before_tristate_bridge_m1_granted_ssram_s1 & (pipeline_bridge_before_tristate_bridge_m1_write & pipeline_bridge_before_tristate_bridge_m1_chipselect);

  assign wait_for_ssram_s1_counter = 0;
  //~p1_bw_n_to_the_ssram byte enable port mux, which is an e_mux
  assign p1_bw_n_to_the_ssram = ~((pipeline_bridge_before_tristate_bridge_m1_granted_ssram_s1)? pipeline_bridge_before_tristate_bridge_m1_byteenable :
    -1);


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //incoming_flash_ssram_tristate_bridge_data_bit_0_is_x x check, which is an e_assign_is_x
  assign incoming_flash_ssram_tristate_bridge_data_bit_0_is_x = ^(incoming_flash_ssram_tristate_bridge_data[0]) === 1'bx;

  //Crush incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0[0] Xs to 0, which is an e_assign
  assign incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0[0] = incoming_flash_ssram_tristate_bridge_data_bit_0_is_x ? 1'b0 : incoming_flash_ssram_tristate_bridge_data[0];

  //incoming_flash_ssram_tristate_bridge_data_bit_1_is_x x check, which is an e_assign_is_x
  assign incoming_flash_ssram_tristate_bridge_data_bit_1_is_x = ^(incoming_flash_ssram_tristate_bridge_data[1]) === 1'bx;

  //Crush incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0[1] Xs to 0, which is an e_assign
  assign incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0[1] = incoming_flash_ssram_tristate_bridge_data_bit_1_is_x ? 1'b0 : incoming_flash_ssram_tristate_bridge_data[1];

  //incoming_flash_ssram_tristate_bridge_data_bit_2_is_x x check, which is an e_assign_is_x
  assign incoming_flash_ssram_tristate_bridge_data_bit_2_is_x = ^(incoming_flash_ssram_tristate_bridge_data[2]) === 1'bx;

  //Crush incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0[2] Xs to 0, which is an e_assign
  assign incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0[2] = incoming_flash_ssram_tristate_bridge_data_bit_2_is_x ? 1'b0 : incoming_flash_ssram_tristate_bridge_data[2];

  //incoming_flash_ssram_tristate_bridge_data_bit_3_is_x x check, which is an e_assign_is_x
  assign incoming_flash_ssram_tristate_bridge_data_bit_3_is_x = ^(incoming_flash_ssram_tristate_bridge_data[3]) === 1'bx;

  //Crush incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0[3] Xs to 0, which is an e_assign
  assign incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0[3] = incoming_flash_ssram_tristate_bridge_data_bit_3_is_x ? 1'b0 : incoming_flash_ssram_tristate_bridge_data[3];

  //incoming_flash_ssram_tristate_bridge_data_bit_4_is_x x check, which is an e_assign_is_x
  assign incoming_flash_ssram_tristate_bridge_data_bit_4_is_x = ^(incoming_flash_ssram_tristate_bridge_data[4]) === 1'bx;

  //Crush incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0[4] Xs to 0, which is an e_assign
  assign incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0[4] = incoming_flash_ssram_tristate_bridge_data_bit_4_is_x ? 1'b0 : incoming_flash_ssram_tristate_bridge_data[4];

  //incoming_flash_ssram_tristate_bridge_data_bit_5_is_x x check, which is an e_assign_is_x
  assign incoming_flash_ssram_tristate_bridge_data_bit_5_is_x = ^(incoming_flash_ssram_tristate_bridge_data[5]) === 1'bx;

  //Crush incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0[5] Xs to 0, which is an e_assign
  assign incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0[5] = incoming_flash_ssram_tristate_bridge_data_bit_5_is_x ? 1'b0 : incoming_flash_ssram_tristate_bridge_data[5];

  //incoming_flash_ssram_tristate_bridge_data_bit_6_is_x x check, which is an e_assign_is_x
  assign incoming_flash_ssram_tristate_bridge_data_bit_6_is_x = ^(incoming_flash_ssram_tristate_bridge_data[6]) === 1'bx;

  //Crush incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0[6] Xs to 0, which is an e_assign
  assign incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0[6] = incoming_flash_ssram_tristate_bridge_data_bit_6_is_x ? 1'b0 : incoming_flash_ssram_tristate_bridge_data[6];

  //incoming_flash_ssram_tristate_bridge_data_bit_7_is_x x check, which is an e_assign_is_x
  assign incoming_flash_ssram_tristate_bridge_data_bit_7_is_x = ^(incoming_flash_ssram_tristate_bridge_data[7]) === 1'bx;

  //Crush incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0[7] Xs to 0, which is an e_assign
  assign incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0[7] = incoming_flash_ssram_tristate_bridge_data_bit_7_is_x ? 1'b0 : incoming_flash_ssram_tristate_bridge_data[7];

  //incoming_flash_ssram_tristate_bridge_data_bit_8_is_x x check, which is an e_assign_is_x
  assign incoming_flash_ssram_tristate_bridge_data_bit_8_is_x = ^(incoming_flash_ssram_tristate_bridge_data[8]) === 1'bx;

  //Crush incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0[8] Xs to 0, which is an e_assign
  assign incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0[8] = incoming_flash_ssram_tristate_bridge_data_bit_8_is_x ? 1'b0 : incoming_flash_ssram_tristate_bridge_data[8];

  //incoming_flash_ssram_tristate_bridge_data_bit_9_is_x x check, which is an e_assign_is_x
  assign incoming_flash_ssram_tristate_bridge_data_bit_9_is_x = ^(incoming_flash_ssram_tristate_bridge_data[9]) === 1'bx;

  //Crush incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0[9] Xs to 0, which is an e_assign
  assign incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0[9] = incoming_flash_ssram_tristate_bridge_data_bit_9_is_x ? 1'b0 : incoming_flash_ssram_tristate_bridge_data[9];

  //incoming_flash_ssram_tristate_bridge_data_bit_10_is_x x check, which is an e_assign_is_x
  assign incoming_flash_ssram_tristate_bridge_data_bit_10_is_x = ^(incoming_flash_ssram_tristate_bridge_data[10]) === 1'bx;

  //Crush incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0[10] Xs to 0, which is an e_assign
  assign incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0[10] = incoming_flash_ssram_tristate_bridge_data_bit_10_is_x ? 1'b0 : incoming_flash_ssram_tristate_bridge_data[10];

  //incoming_flash_ssram_tristate_bridge_data_bit_11_is_x x check, which is an e_assign_is_x
  assign incoming_flash_ssram_tristate_bridge_data_bit_11_is_x = ^(incoming_flash_ssram_tristate_bridge_data[11]) === 1'bx;

  //Crush incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0[11] Xs to 0, which is an e_assign
  assign incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0[11] = incoming_flash_ssram_tristate_bridge_data_bit_11_is_x ? 1'b0 : incoming_flash_ssram_tristate_bridge_data[11];

  //incoming_flash_ssram_tristate_bridge_data_bit_12_is_x x check, which is an e_assign_is_x
  assign incoming_flash_ssram_tristate_bridge_data_bit_12_is_x = ^(incoming_flash_ssram_tristate_bridge_data[12]) === 1'bx;

  //Crush incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0[12] Xs to 0, which is an e_assign
  assign incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0[12] = incoming_flash_ssram_tristate_bridge_data_bit_12_is_x ? 1'b0 : incoming_flash_ssram_tristate_bridge_data[12];

  //incoming_flash_ssram_tristate_bridge_data_bit_13_is_x x check, which is an e_assign_is_x
  assign incoming_flash_ssram_tristate_bridge_data_bit_13_is_x = ^(incoming_flash_ssram_tristate_bridge_data[13]) === 1'bx;

  //Crush incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0[13] Xs to 0, which is an e_assign
  assign incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0[13] = incoming_flash_ssram_tristate_bridge_data_bit_13_is_x ? 1'b0 : incoming_flash_ssram_tristate_bridge_data[13];

  //incoming_flash_ssram_tristate_bridge_data_bit_14_is_x x check, which is an e_assign_is_x
  assign incoming_flash_ssram_tristate_bridge_data_bit_14_is_x = ^(incoming_flash_ssram_tristate_bridge_data[14]) === 1'bx;

  //Crush incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0[14] Xs to 0, which is an e_assign
  assign incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0[14] = incoming_flash_ssram_tristate_bridge_data_bit_14_is_x ? 1'b0 : incoming_flash_ssram_tristate_bridge_data[14];

  //incoming_flash_ssram_tristate_bridge_data_bit_15_is_x x check, which is an e_assign_is_x
  assign incoming_flash_ssram_tristate_bridge_data_bit_15_is_x = ^(incoming_flash_ssram_tristate_bridge_data[15]) === 1'bx;

  //Crush incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0[15] Xs to 0, which is an e_assign
  assign incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0[15] = incoming_flash_ssram_tristate_bridge_data_bit_15_is_x ? 1'b0 : incoming_flash_ssram_tristate_bridge_data[15];

  //ext_flash/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end


  //pipeline_bridge_before_tristate_bridge/m1 non-zero burstcount assertion, which is an e_process
  always @(posedge clk)
    begin
      if (pipeline_bridge_before_tristate_bridge_m1_requests_ext_flash_s1 && (pipeline_bridge_before_tristate_bridge_m1_burstcount == 0) && enable_nonzero_assertions)
        begin
          $write("%0d ns: pipeline_bridge_before_tristate_bridge/m1 drove 0 on its 'burstcount' port while accessing slave ext_flash/s1", $time);
          $stop;
        end
    end


  //ssram/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (pipeline_bridge_before_tristate_bridge_m1_granted_ext_flash_s1 + pipeline_bridge_before_tristate_bridge_m1_granted_ssram_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (pipeline_bridge_before_tristate_bridge_m1_saved_grant_ext_flash_s1 + pipeline_bridge_before_tristate_bridge_m1_saved_grant_ssram_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  
//  assign incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0 = incoming_flash_ssram_tristate_bridge_data;
//
//synthesis read_comments_as_HDL off

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module flash_ssram_tristate_bridge_bridge_arbitrator 
;



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module high_res_timer_s1_arbitrator (
                                      // inputs:
                                       clk,
                                       high_res_timer_s1_irq,
                                       high_res_timer_s1_readdata,
                                       reset_n,
                                       slow_peripheral_bridge_m1_address_to_slave,
                                       slow_peripheral_bridge_m1_latency_counter,
                                       slow_peripheral_bridge_m1_nativeaddress,
                                       slow_peripheral_bridge_m1_read,
                                       slow_peripheral_bridge_m1_write,
                                       slow_peripheral_bridge_m1_writedata,

                                      // outputs:
                                       d1_high_res_timer_s1_end_xfer,
                                       high_res_timer_s1_address,
                                       high_res_timer_s1_chipselect,
                                       high_res_timer_s1_irq_from_sa,
                                       high_res_timer_s1_readdata_from_sa,
                                       high_res_timer_s1_reset_n,
                                       high_res_timer_s1_write_n,
                                       high_res_timer_s1_writedata,
                                       slow_peripheral_bridge_m1_granted_high_res_timer_s1,
                                       slow_peripheral_bridge_m1_qualified_request_high_res_timer_s1,
                                       slow_peripheral_bridge_m1_read_data_valid_high_res_timer_s1,
                                       slow_peripheral_bridge_m1_requests_high_res_timer_s1
                                    )
;

  output           d1_high_res_timer_s1_end_xfer;
  output  [  2: 0] high_res_timer_s1_address;
  output           high_res_timer_s1_chipselect;
  output           high_res_timer_s1_irq_from_sa;
  output  [ 15: 0] high_res_timer_s1_readdata_from_sa;
  output           high_res_timer_s1_reset_n;
  output           high_res_timer_s1_write_n;
  output  [ 15: 0] high_res_timer_s1_writedata;
  output           slow_peripheral_bridge_m1_granted_high_res_timer_s1;
  output           slow_peripheral_bridge_m1_qualified_request_high_res_timer_s1;
  output           slow_peripheral_bridge_m1_read_data_valid_high_res_timer_s1;
  output           slow_peripheral_bridge_m1_requests_high_res_timer_s1;
  input            clk;
  input            high_res_timer_s1_irq;
  input   [ 15: 0] high_res_timer_s1_readdata;
  input            reset_n;
  input   [  8: 0] slow_peripheral_bridge_m1_address_to_slave;
  input            slow_peripheral_bridge_m1_latency_counter;
  input   [  6: 0] slow_peripheral_bridge_m1_nativeaddress;
  input            slow_peripheral_bridge_m1_read;
  input            slow_peripheral_bridge_m1_write;
  input   [ 31: 0] slow_peripheral_bridge_m1_writedata;

  reg              d1_high_res_timer_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_high_res_timer_s1;
  wire    [  2: 0] high_res_timer_s1_address;
  wire             high_res_timer_s1_allgrants;
  wire             high_res_timer_s1_allow_new_arb_cycle;
  wire             high_res_timer_s1_any_bursting_master_saved_grant;
  wire             high_res_timer_s1_any_continuerequest;
  wire             high_res_timer_s1_arb_counter_enable;
  reg              high_res_timer_s1_arb_share_counter;
  wire             high_res_timer_s1_arb_share_counter_next_value;
  wire             high_res_timer_s1_arb_share_set_values;
  wire             high_res_timer_s1_beginbursttransfer_internal;
  wire             high_res_timer_s1_begins_xfer;
  wire             high_res_timer_s1_chipselect;
  wire             high_res_timer_s1_end_xfer;
  wire             high_res_timer_s1_firsttransfer;
  wire             high_res_timer_s1_grant_vector;
  wire             high_res_timer_s1_in_a_read_cycle;
  wire             high_res_timer_s1_in_a_write_cycle;
  wire             high_res_timer_s1_irq_from_sa;
  wire             high_res_timer_s1_master_qreq_vector;
  wire             high_res_timer_s1_non_bursting_master_requests;
  wire    [ 15: 0] high_res_timer_s1_readdata_from_sa;
  reg              high_res_timer_s1_reg_firsttransfer;
  wire             high_res_timer_s1_reset_n;
  reg              high_res_timer_s1_slavearbiterlockenable;
  wire             high_res_timer_s1_slavearbiterlockenable2;
  wire             high_res_timer_s1_unreg_firsttransfer;
  wire             high_res_timer_s1_waits_for_read;
  wire             high_res_timer_s1_waits_for_write;
  wire             high_res_timer_s1_write_n;
  wire    [ 15: 0] high_res_timer_s1_writedata;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             slow_peripheral_bridge_m1_arbiterlock;
  wire             slow_peripheral_bridge_m1_arbiterlock2;
  wire             slow_peripheral_bridge_m1_continuerequest;
  wire             slow_peripheral_bridge_m1_granted_high_res_timer_s1;
  wire             slow_peripheral_bridge_m1_qualified_request_high_res_timer_s1;
  wire             slow_peripheral_bridge_m1_read_data_valid_high_res_timer_s1;
  wire             slow_peripheral_bridge_m1_requests_high_res_timer_s1;
  wire             slow_peripheral_bridge_m1_saved_grant_high_res_timer_s1;
  wire             wait_for_high_res_timer_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~high_res_timer_s1_end_xfer;
    end


  assign high_res_timer_s1_begins_xfer = ~d1_reasons_to_wait & ((slow_peripheral_bridge_m1_qualified_request_high_res_timer_s1));
  //assign high_res_timer_s1_readdata_from_sa = high_res_timer_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign high_res_timer_s1_readdata_from_sa = high_res_timer_s1_readdata;

  assign slow_peripheral_bridge_m1_requests_high_res_timer_s1 = ({slow_peripheral_bridge_m1_address_to_slave[8 : 5] , 5'b0} == 9'h100) & (slow_peripheral_bridge_m1_read | slow_peripheral_bridge_m1_write);
  //high_res_timer_s1_arb_share_counter set values, which is an e_mux
  assign high_res_timer_s1_arb_share_set_values = 1;

  //high_res_timer_s1_non_bursting_master_requests mux, which is an e_mux
  assign high_res_timer_s1_non_bursting_master_requests = slow_peripheral_bridge_m1_requests_high_res_timer_s1;

  //high_res_timer_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign high_res_timer_s1_any_bursting_master_saved_grant = 0;

  //high_res_timer_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign high_res_timer_s1_arb_share_counter_next_value = high_res_timer_s1_firsttransfer ? (high_res_timer_s1_arb_share_set_values - 1) : |high_res_timer_s1_arb_share_counter ? (high_res_timer_s1_arb_share_counter - 1) : 0;

  //high_res_timer_s1_allgrants all slave grants, which is an e_mux
  assign high_res_timer_s1_allgrants = |high_res_timer_s1_grant_vector;

  //high_res_timer_s1_end_xfer assignment, which is an e_assign
  assign high_res_timer_s1_end_xfer = ~(high_res_timer_s1_waits_for_read | high_res_timer_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_high_res_timer_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_high_res_timer_s1 = high_res_timer_s1_end_xfer & (~high_res_timer_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //high_res_timer_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign high_res_timer_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_high_res_timer_s1 & high_res_timer_s1_allgrants) | (end_xfer_arb_share_counter_term_high_res_timer_s1 & ~high_res_timer_s1_non_bursting_master_requests);

  //high_res_timer_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          high_res_timer_s1_arb_share_counter <= 0;
      else if (high_res_timer_s1_arb_counter_enable)
          high_res_timer_s1_arb_share_counter <= high_res_timer_s1_arb_share_counter_next_value;
    end


  //high_res_timer_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          high_res_timer_s1_slavearbiterlockenable <= 0;
      else if ((|high_res_timer_s1_master_qreq_vector & end_xfer_arb_share_counter_term_high_res_timer_s1) | (end_xfer_arb_share_counter_term_high_res_timer_s1 & ~high_res_timer_s1_non_bursting_master_requests))
          high_res_timer_s1_slavearbiterlockenable <= |high_res_timer_s1_arb_share_counter_next_value;
    end


  //slow_peripheral_bridge/m1 high_res_timer/s1 arbiterlock, which is an e_assign
  assign slow_peripheral_bridge_m1_arbiterlock = high_res_timer_s1_slavearbiterlockenable & slow_peripheral_bridge_m1_continuerequest;

  //high_res_timer_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign high_res_timer_s1_slavearbiterlockenable2 = |high_res_timer_s1_arb_share_counter_next_value;

  //slow_peripheral_bridge/m1 high_res_timer/s1 arbiterlock2, which is an e_assign
  assign slow_peripheral_bridge_m1_arbiterlock2 = high_res_timer_s1_slavearbiterlockenable2 & slow_peripheral_bridge_m1_continuerequest;

  //high_res_timer_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign high_res_timer_s1_any_continuerequest = 1;

  //slow_peripheral_bridge_m1_continuerequest continued request, which is an e_assign
  assign slow_peripheral_bridge_m1_continuerequest = 1;

  assign slow_peripheral_bridge_m1_qualified_request_high_res_timer_s1 = slow_peripheral_bridge_m1_requests_high_res_timer_s1 & ~((slow_peripheral_bridge_m1_read & ((slow_peripheral_bridge_m1_latency_counter != 0))));
  //local readdatavalid slow_peripheral_bridge_m1_read_data_valid_high_res_timer_s1, which is an e_mux
  assign slow_peripheral_bridge_m1_read_data_valid_high_res_timer_s1 = slow_peripheral_bridge_m1_granted_high_res_timer_s1 & slow_peripheral_bridge_m1_read & ~high_res_timer_s1_waits_for_read;

  //high_res_timer_s1_writedata mux, which is an e_mux
  assign high_res_timer_s1_writedata = slow_peripheral_bridge_m1_writedata;

  //master is always granted when requested
  assign slow_peripheral_bridge_m1_granted_high_res_timer_s1 = slow_peripheral_bridge_m1_qualified_request_high_res_timer_s1;

  //slow_peripheral_bridge/m1 saved-grant high_res_timer/s1, which is an e_assign
  assign slow_peripheral_bridge_m1_saved_grant_high_res_timer_s1 = slow_peripheral_bridge_m1_requests_high_res_timer_s1;

  //allow new arb cycle for high_res_timer/s1, which is an e_assign
  assign high_res_timer_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign high_res_timer_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign high_res_timer_s1_master_qreq_vector = 1;

  //high_res_timer_s1_reset_n assignment, which is an e_assign
  assign high_res_timer_s1_reset_n = reset_n;

  assign high_res_timer_s1_chipselect = slow_peripheral_bridge_m1_granted_high_res_timer_s1;
  //high_res_timer_s1_firsttransfer first transaction, which is an e_assign
  assign high_res_timer_s1_firsttransfer = high_res_timer_s1_begins_xfer ? high_res_timer_s1_unreg_firsttransfer : high_res_timer_s1_reg_firsttransfer;

  //high_res_timer_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign high_res_timer_s1_unreg_firsttransfer = ~(high_res_timer_s1_slavearbiterlockenable & high_res_timer_s1_any_continuerequest);

  //high_res_timer_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          high_res_timer_s1_reg_firsttransfer <= 1'b1;
      else if (high_res_timer_s1_begins_xfer)
          high_res_timer_s1_reg_firsttransfer <= high_res_timer_s1_unreg_firsttransfer;
    end


  //high_res_timer_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign high_res_timer_s1_beginbursttransfer_internal = high_res_timer_s1_begins_xfer;

  //~high_res_timer_s1_write_n assignment, which is an e_mux
  assign high_res_timer_s1_write_n = ~(slow_peripheral_bridge_m1_granted_high_res_timer_s1 & slow_peripheral_bridge_m1_write);

  //high_res_timer_s1_address mux, which is an e_mux
  assign high_res_timer_s1_address = slow_peripheral_bridge_m1_nativeaddress;

  //d1_high_res_timer_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_high_res_timer_s1_end_xfer <= 1;
      else if (1)
          d1_high_res_timer_s1_end_xfer <= high_res_timer_s1_end_xfer;
    end


  //high_res_timer_s1_waits_for_read in a cycle, which is an e_mux
  assign high_res_timer_s1_waits_for_read = high_res_timer_s1_in_a_read_cycle & high_res_timer_s1_begins_xfer;

  //high_res_timer_s1_in_a_read_cycle assignment, which is an e_assign
  assign high_res_timer_s1_in_a_read_cycle = slow_peripheral_bridge_m1_granted_high_res_timer_s1 & slow_peripheral_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = high_res_timer_s1_in_a_read_cycle;

  //high_res_timer_s1_waits_for_write in a cycle, which is an e_mux
  assign high_res_timer_s1_waits_for_write = high_res_timer_s1_in_a_write_cycle & 0;

  //high_res_timer_s1_in_a_write_cycle assignment, which is an e_assign
  assign high_res_timer_s1_in_a_write_cycle = slow_peripheral_bridge_m1_granted_high_res_timer_s1 & slow_peripheral_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = high_res_timer_s1_in_a_write_cycle;

  assign wait_for_high_res_timer_s1_counter = 0;
  //assign high_res_timer_s1_irq_from_sa = high_res_timer_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign high_res_timer_s1_irq_from_sa = high_res_timer_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //high_res_timer/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module jtag_uart_avalon_jtag_slave_arbitrator (
                                                // inputs:
                                                 clk,
                                                 jtag_uart_avalon_jtag_slave_dataavailable,
                                                 jtag_uart_avalon_jtag_slave_irq,
                                                 jtag_uart_avalon_jtag_slave_readdata,
                                                 jtag_uart_avalon_jtag_slave_readyfordata,
                                                 jtag_uart_avalon_jtag_slave_waitrequest,
                                                 reset_n,
                                                 slow_peripheral_bridge_m1_address_to_slave,
                                                 slow_peripheral_bridge_m1_latency_counter,
                                                 slow_peripheral_bridge_m1_nativeaddress,
                                                 slow_peripheral_bridge_m1_read,
                                                 slow_peripheral_bridge_m1_write,
                                                 slow_peripheral_bridge_m1_writedata,

                                                // outputs:
                                                 d1_jtag_uart_avalon_jtag_slave_end_xfer,
                                                 jtag_uart_avalon_jtag_slave_address,
                                                 jtag_uart_avalon_jtag_slave_chipselect,
                                                 jtag_uart_avalon_jtag_slave_dataavailable_from_sa,
                                                 jtag_uart_avalon_jtag_slave_irq_from_sa,
                                                 jtag_uart_avalon_jtag_slave_read_n,
                                                 jtag_uart_avalon_jtag_slave_readdata_from_sa,
                                                 jtag_uart_avalon_jtag_slave_readyfordata_from_sa,
                                                 jtag_uart_avalon_jtag_slave_reset_n,
                                                 jtag_uart_avalon_jtag_slave_waitrequest_from_sa,
                                                 jtag_uart_avalon_jtag_slave_write_n,
                                                 jtag_uart_avalon_jtag_slave_writedata,
                                                 slow_peripheral_bridge_m1_granted_jtag_uart_avalon_jtag_slave,
                                                 slow_peripheral_bridge_m1_qualified_request_jtag_uart_avalon_jtag_slave,
                                                 slow_peripheral_bridge_m1_read_data_valid_jtag_uart_avalon_jtag_slave,
                                                 slow_peripheral_bridge_m1_requests_jtag_uart_avalon_jtag_slave
                                              )
;

  output           d1_jtag_uart_avalon_jtag_slave_end_xfer;
  output           jtag_uart_avalon_jtag_slave_address;
  output           jtag_uart_avalon_jtag_slave_chipselect;
  output           jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  output           jtag_uart_avalon_jtag_slave_irq_from_sa;
  output           jtag_uart_avalon_jtag_slave_read_n;
  output  [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  output           jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  output           jtag_uart_avalon_jtag_slave_reset_n;
  output           jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  output           jtag_uart_avalon_jtag_slave_write_n;
  output  [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  output           slow_peripheral_bridge_m1_granted_jtag_uart_avalon_jtag_slave;
  output           slow_peripheral_bridge_m1_qualified_request_jtag_uart_avalon_jtag_slave;
  output           slow_peripheral_bridge_m1_read_data_valid_jtag_uart_avalon_jtag_slave;
  output           slow_peripheral_bridge_m1_requests_jtag_uart_avalon_jtag_slave;
  input            clk;
  input            jtag_uart_avalon_jtag_slave_dataavailable;
  input            jtag_uart_avalon_jtag_slave_irq;
  input   [ 31: 0] jtag_uart_avalon_jtag_slave_readdata;
  input            jtag_uart_avalon_jtag_slave_readyfordata;
  input            jtag_uart_avalon_jtag_slave_waitrequest;
  input            reset_n;
  input   [  8: 0] slow_peripheral_bridge_m1_address_to_slave;
  input            slow_peripheral_bridge_m1_latency_counter;
  input   [  6: 0] slow_peripheral_bridge_m1_nativeaddress;
  input            slow_peripheral_bridge_m1_read;
  input            slow_peripheral_bridge_m1_write;
  input   [ 31: 0] slow_peripheral_bridge_m1_writedata;

  reg              d1_jtag_uart_avalon_jtag_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             jtag_uart_avalon_jtag_slave_address;
  wire             jtag_uart_avalon_jtag_slave_allgrants;
  wire             jtag_uart_avalon_jtag_slave_allow_new_arb_cycle;
  wire             jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant;
  wire             jtag_uart_avalon_jtag_slave_any_continuerequest;
  wire             jtag_uart_avalon_jtag_slave_arb_counter_enable;
  reg              jtag_uart_avalon_jtag_slave_arb_share_counter;
  wire             jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
  wire             jtag_uart_avalon_jtag_slave_arb_share_set_values;
  wire             jtag_uart_avalon_jtag_slave_beginbursttransfer_internal;
  wire             jtag_uart_avalon_jtag_slave_begins_xfer;
  wire             jtag_uart_avalon_jtag_slave_chipselect;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_end_xfer;
  wire             jtag_uart_avalon_jtag_slave_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_grant_vector;
  wire             jtag_uart_avalon_jtag_slave_in_a_read_cycle;
  wire             jtag_uart_avalon_jtag_slave_in_a_write_cycle;
  wire             jtag_uart_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_avalon_jtag_slave_master_qreq_vector;
  wire             jtag_uart_avalon_jtag_slave_non_bursting_master_requests;
  wire             jtag_uart_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  reg              jtag_uart_avalon_jtag_slave_reg_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_reset_n;
  reg              jtag_uart_avalon_jtag_slave_slavearbiterlockenable;
  wire             jtag_uart_avalon_jtag_slave_slavearbiterlockenable2;
  wire             jtag_uart_avalon_jtag_slave_unreg_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_avalon_jtag_slave_waits_for_read;
  wire             jtag_uart_avalon_jtag_slave_waits_for_write;
  wire             jtag_uart_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  wire             slow_peripheral_bridge_m1_arbiterlock;
  wire             slow_peripheral_bridge_m1_arbiterlock2;
  wire             slow_peripheral_bridge_m1_continuerequest;
  wire             slow_peripheral_bridge_m1_granted_jtag_uart_avalon_jtag_slave;
  wire             slow_peripheral_bridge_m1_qualified_request_jtag_uart_avalon_jtag_slave;
  wire             slow_peripheral_bridge_m1_read_data_valid_jtag_uart_avalon_jtag_slave;
  wire             slow_peripheral_bridge_m1_requests_jtag_uart_avalon_jtag_slave;
  wire             slow_peripheral_bridge_m1_saved_grant_jtag_uart_avalon_jtag_slave;
  wire             wait_for_jtag_uart_avalon_jtag_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~jtag_uart_avalon_jtag_slave_end_xfer;
    end


  assign jtag_uart_avalon_jtag_slave_begins_xfer = ~d1_reasons_to_wait & ((slow_peripheral_bridge_m1_qualified_request_jtag_uart_avalon_jtag_slave));
  //assign jtag_uart_avalon_jtag_slave_readdata_from_sa = jtag_uart_avalon_jtag_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_readdata_from_sa = jtag_uart_avalon_jtag_slave_readdata;

  assign slow_peripheral_bridge_m1_requests_jtag_uart_avalon_jtag_slave = ({slow_peripheral_bridge_m1_address_to_slave[8 : 3] , 3'b0} == 9'h1a0) & (slow_peripheral_bridge_m1_read | slow_peripheral_bridge_m1_write);
  //assign jtag_uart_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_avalon_jtag_slave_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_avalon_jtag_slave_dataavailable;

  //assign jtag_uart_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_avalon_jtag_slave_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_avalon_jtag_slave_readyfordata;

  //assign jtag_uart_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_avalon_jtag_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_avalon_jtag_slave_waitrequest;

  //jtag_uart_avalon_jtag_slave_arb_share_counter set values, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_arb_share_set_values = 1;

  //jtag_uart_avalon_jtag_slave_non_bursting_master_requests mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_non_bursting_master_requests = slow_peripheral_bridge_m1_requests_jtag_uart_avalon_jtag_slave;

  //jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant = 0;

  //jtag_uart_avalon_jtag_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_arb_share_counter_next_value = jtag_uart_avalon_jtag_slave_firsttransfer ? (jtag_uart_avalon_jtag_slave_arb_share_set_values - 1) : |jtag_uart_avalon_jtag_slave_arb_share_counter ? (jtag_uart_avalon_jtag_slave_arb_share_counter - 1) : 0;

  //jtag_uart_avalon_jtag_slave_allgrants all slave grants, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_allgrants = |jtag_uart_avalon_jtag_slave_grant_vector;

  //jtag_uart_avalon_jtag_slave_end_xfer assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_end_xfer = ~(jtag_uart_avalon_jtag_slave_waits_for_read | jtag_uart_avalon_jtag_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave = jtag_uart_avalon_jtag_slave_end_xfer & (~jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //jtag_uart_avalon_jtag_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & jtag_uart_avalon_jtag_slave_allgrants) | (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & ~jtag_uart_avalon_jtag_slave_non_bursting_master_requests);

  //jtag_uart_avalon_jtag_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_arb_share_counter <= 0;
      else if (jtag_uart_avalon_jtag_slave_arb_counter_enable)
          jtag_uart_avalon_jtag_slave_arb_share_counter <= jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //jtag_uart_avalon_jtag_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_slavearbiterlockenable <= 0;
      else if ((|jtag_uart_avalon_jtag_slave_master_qreq_vector & end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave) | (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & ~jtag_uart_avalon_jtag_slave_non_bursting_master_requests))
          jtag_uart_avalon_jtag_slave_slavearbiterlockenable <= |jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //slow_peripheral_bridge/m1 jtag_uart/avalon_jtag_slave arbiterlock, which is an e_assign
  assign slow_peripheral_bridge_m1_arbiterlock = jtag_uart_avalon_jtag_slave_slavearbiterlockenable & slow_peripheral_bridge_m1_continuerequest;

  //jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 = |jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;

  //slow_peripheral_bridge/m1 jtag_uart/avalon_jtag_slave arbiterlock2, which is an e_assign
  assign slow_peripheral_bridge_m1_arbiterlock2 = jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 & slow_peripheral_bridge_m1_continuerequest;

  //jtag_uart_avalon_jtag_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_any_continuerequest = 1;

  //slow_peripheral_bridge_m1_continuerequest continued request, which is an e_assign
  assign slow_peripheral_bridge_m1_continuerequest = 1;

  assign slow_peripheral_bridge_m1_qualified_request_jtag_uart_avalon_jtag_slave = slow_peripheral_bridge_m1_requests_jtag_uart_avalon_jtag_slave & ~((slow_peripheral_bridge_m1_read & ((slow_peripheral_bridge_m1_latency_counter != 0))));
  //local readdatavalid slow_peripheral_bridge_m1_read_data_valid_jtag_uart_avalon_jtag_slave, which is an e_mux
  assign slow_peripheral_bridge_m1_read_data_valid_jtag_uart_avalon_jtag_slave = slow_peripheral_bridge_m1_granted_jtag_uart_avalon_jtag_slave & slow_peripheral_bridge_m1_read & ~jtag_uart_avalon_jtag_slave_waits_for_read;

  //jtag_uart_avalon_jtag_slave_writedata mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_writedata = slow_peripheral_bridge_m1_writedata;

  //master is always granted when requested
  assign slow_peripheral_bridge_m1_granted_jtag_uart_avalon_jtag_slave = slow_peripheral_bridge_m1_qualified_request_jtag_uart_avalon_jtag_slave;

  //slow_peripheral_bridge/m1 saved-grant jtag_uart/avalon_jtag_slave, which is an e_assign
  assign slow_peripheral_bridge_m1_saved_grant_jtag_uart_avalon_jtag_slave = slow_peripheral_bridge_m1_requests_jtag_uart_avalon_jtag_slave;

  //allow new arb cycle for jtag_uart/avalon_jtag_slave, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign jtag_uart_avalon_jtag_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign jtag_uart_avalon_jtag_slave_master_qreq_vector = 1;

  //jtag_uart_avalon_jtag_slave_reset_n assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_reset_n = reset_n;

  assign jtag_uart_avalon_jtag_slave_chipselect = slow_peripheral_bridge_m1_granted_jtag_uart_avalon_jtag_slave;
  //jtag_uart_avalon_jtag_slave_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_firsttransfer = jtag_uart_avalon_jtag_slave_begins_xfer ? jtag_uart_avalon_jtag_slave_unreg_firsttransfer : jtag_uart_avalon_jtag_slave_reg_firsttransfer;

  //jtag_uart_avalon_jtag_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_unreg_firsttransfer = ~(jtag_uart_avalon_jtag_slave_slavearbiterlockenable & jtag_uart_avalon_jtag_slave_any_continuerequest);

  //jtag_uart_avalon_jtag_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_reg_firsttransfer <= 1'b1;
      else if (jtag_uart_avalon_jtag_slave_begins_xfer)
          jtag_uart_avalon_jtag_slave_reg_firsttransfer <= jtag_uart_avalon_jtag_slave_unreg_firsttransfer;
    end


  //jtag_uart_avalon_jtag_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_beginbursttransfer_internal = jtag_uart_avalon_jtag_slave_begins_xfer;

  //~jtag_uart_avalon_jtag_slave_read_n assignment, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_read_n = ~(slow_peripheral_bridge_m1_granted_jtag_uart_avalon_jtag_slave & slow_peripheral_bridge_m1_read);

  //~jtag_uart_avalon_jtag_slave_write_n assignment, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_write_n = ~(slow_peripheral_bridge_m1_granted_jtag_uart_avalon_jtag_slave & slow_peripheral_bridge_m1_write);

  //jtag_uart_avalon_jtag_slave_address mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_address = slow_peripheral_bridge_m1_nativeaddress;

  //d1_jtag_uart_avalon_jtag_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_jtag_uart_avalon_jtag_slave_end_xfer <= 1;
      else if (1)
          d1_jtag_uart_avalon_jtag_slave_end_xfer <= jtag_uart_avalon_jtag_slave_end_xfer;
    end


  //jtag_uart_avalon_jtag_slave_waits_for_read in a cycle, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_waits_for_read = jtag_uart_avalon_jtag_slave_in_a_read_cycle & jtag_uart_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_avalon_jtag_slave_in_a_read_cycle assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_in_a_read_cycle = slow_peripheral_bridge_m1_granted_jtag_uart_avalon_jtag_slave & slow_peripheral_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = jtag_uart_avalon_jtag_slave_in_a_read_cycle;

  //jtag_uart_avalon_jtag_slave_waits_for_write in a cycle, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_waits_for_write = jtag_uart_avalon_jtag_slave_in_a_write_cycle & jtag_uart_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_avalon_jtag_slave_in_a_write_cycle assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_in_a_write_cycle = slow_peripheral_bridge_m1_granted_jtag_uart_avalon_jtag_slave & slow_peripheral_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = jtag_uart_avalon_jtag_slave_in_a_write_cycle;

  assign wait_for_jtag_uart_avalon_jtag_slave_counter = 0;
  //assign jtag_uart_avalon_jtag_slave_irq_from_sa = jtag_uart_avalon_jtag_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_irq_from_sa = jtag_uart_avalon_jtag_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //jtag_uart/avalon_jtag_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module led_pio_s1_arbitrator (
                               // inputs:
                                clk,
                                reset_n,
                                slow_peripheral_bridge_m1_address_to_slave,
                                slow_peripheral_bridge_m1_latency_counter,
                                slow_peripheral_bridge_m1_nativeaddress,
                                slow_peripheral_bridge_m1_read,
                                slow_peripheral_bridge_m1_write,
                                slow_peripheral_bridge_m1_writedata,

                               // outputs:
                                d1_led_pio_s1_end_xfer,
                                led_pio_s1_address,
                                led_pio_s1_chipselect,
                                led_pio_s1_reset_n,
                                led_pio_s1_write_n,
                                led_pio_s1_writedata,
                                slow_peripheral_bridge_m1_granted_led_pio_s1,
                                slow_peripheral_bridge_m1_qualified_request_led_pio_s1,
                                slow_peripheral_bridge_m1_read_data_valid_led_pio_s1,
                                slow_peripheral_bridge_m1_requests_led_pio_s1
                             )
;

  output           d1_led_pio_s1_end_xfer;
  output  [  1: 0] led_pio_s1_address;
  output           led_pio_s1_chipselect;
  output           led_pio_s1_reset_n;
  output           led_pio_s1_write_n;
  output  [  1: 0] led_pio_s1_writedata;
  output           slow_peripheral_bridge_m1_granted_led_pio_s1;
  output           slow_peripheral_bridge_m1_qualified_request_led_pio_s1;
  output           slow_peripheral_bridge_m1_read_data_valid_led_pio_s1;
  output           slow_peripheral_bridge_m1_requests_led_pio_s1;
  input            clk;
  input            reset_n;
  input   [  8: 0] slow_peripheral_bridge_m1_address_to_slave;
  input            slow_peripheral_bridge_m1_latency_counter;
  input   [  6: 0] slow_peripheral_bridge_m1_nativeaddress;
  input            slow_peripheral_bridge_m1_read;
  input            slow_peripheral_bridge_m1_write;
  input   [ 31: 0] slow_peripheral_bridge_m1_writedata;

  reg              d1_led_pio_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_led_pio_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] led_pio_s1_address;
  wire             led_pio_s1_allgrants;
  wire             led_pio_s1_allow_new_arb_cycle;
  wire             led_pio_s1_any_bursting_master_saved_grant;
  wire             led_pio_s1_any_continuerequest;
  wire             led_pio_s1_arb_counter_enable;
  reg              led_pio_s1_arb_share_counter;
  wire             led_pio_s1_arb_share_counter_next_value;
  wire             led_pio_s1_arb_share_set_values;
  wire             led_pio_s1_beginbursttransfer_internal;
  wire             led_pio_s1_begins_xfer;
  wire             led_pio_s1_chipselect;
  wire             led_pio_s1_end_xfer;
  wire             led_pio_s1_firsttransfer;
  wire             led_pio_s1_grant_vector;
  wire             led_pio_s1_in_a_read_cycle;
  wire             led_pio_s1_in_a_write_cycle;
  wire             led_pio_s1_master_qreq_vector;
  wire             led_pio_s1_non_bursting_master_requests;
  reg              led_pio_s1_reg_firsttransfer;
  wire             led_pio_s1_reset_n;
  reg              led_pio_s1_slavearbiterlockenable;
  wire             led_pio_s1_slavearbiterlockenable2;
  wire             led_pio_s1_unreg_firsttransfer;
  wire             led_pio_s1_waits_for_read;
  wire             led_pio_s1_waits_for_write;
  wire             led_pio_s1_write_n;
  wire    [  1: 0] led_pio_s1_writedata;
  wire             slow_peripheral_bridge_m1_arbiterlock;
  wire             slow_peripheral_bridge_m1_arbiterlock2;
  wire             slow_peripheral_bridge_m1_continuerequest;
  wire             slow_peripheral_bridge_m1_granted_led_pio_s1;
  wire             slow_peripheral_bridge_m1_qualified_request_led_pio_s1;
  wire             slow_peripheral_bridge_m1_read_data_valid_led_pio_s1;
  wire             slow_peripheral_bridge_m1_requests_led_pio_s1;
  wire             slow_peripheral_bridge_m1_saved_grant_led_pio_s1;
  wire             wait_for_led_pio_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~led_pio_s1_end_xfer;
    end


  assign led_pio_s1_begins_xfer = ~d1_reasons_to_wait & ((slow_peripheral_bridge_m1_qualified_request_led_pio_s1));
  assign slow_peripheral_bridge_m1_requests_led_pio_s1 = (({slow_peripheral_bridge_m1_address_to_slave[8 : 4] , 4'b0} == 9'h190) & (slow_peripheral_bridge_m1_read | slow_peripheral_bridge_m1_write)) & slow_peripheral_bridge_m1_write;
  //led_pio_s1_arb_share_counter set values, which is an e_mux
  assign led_pio_s1_arb_share_set_values = 1;

  //led_pio_s1_non_bursting_master_requests mux, which is an e_mux
  assign led_pio_s1_non_bursting_master_requests = slow_peripheral_bridge_m1_requests_led_pio_s1;

  //led_pio_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign led_pio_s1_any_bursting_master_saved_grant = 0;

  //led_pio_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign led_pio_s1_arb_share_counter_next_value = led_pio_s1_firsttransfer ? (led_pio_s1_arb_share_set_values - 1) : |led_pio_s1_arb_share_counter ? (led_pio_s1_arb_share_counter - 1) : 0;

  //led_pio_s1_allgrants all slave grants, which is an e_mux
  assign led_pio_s1_allgrants = |led_pio_s1_grant_vector;

  //led_pio_s1_end_xfer assignment, which is an e_assign
  assign led_pio_s1_end_xfer = ~(led_pio_s1_waits_for_read | led_pio_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_led_pio_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_led_pio_s1 = led_pio_s1_end_xfer & (~led_pio_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //led_pio_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign led_pio_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_led_pio_s1 & led_pio_s1_allgrants) | (end_xfer_arb_share_counter_term_led_pio_s1 & ~led_pio_s1_non_bursting_master_requests);

  //led_pio_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          led_pio_s1_arb_share_counter <= 0;
      else if (led_pio_s1_arb_counter_enable)
          led_pio_s1_arb_share_counter <= led_pio_s1_arb_share_counter_next_value;
    end


  //led_pio_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          led_pio_s1_slavearbiterlockenable <= 0;
      else if ((|led_pio_s1_master_qreq_vector & end_xfer_arb_share_counter_term_led_pio_s1) | (end_xfer_arb_share_counter_term_led_pio_s1 & ~led_pio_s1_non_bursting_master_requests))
          led_pio_s1_slavearbiterlockenable <= |led_pio_s1_arb_share_counter_next_value;
    end


  //slow_peripheral_bridge/m1 led_pio/s1 arbiterlock, which is an e_assign
  assign slow_peripheral_bridge_m1_arbiterlock = led_pio_s1_slavearbiterlockenable & slow_peripheral_bridge_m1_continuerequest;

  //led_pio_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign led_pio_s1_slavearbiterlockenable2 = |led_pio_s1_arb_share_counter_next_value;

  //slow_peripheral_bridge/m1 led_pio/s1 arbiterlock2, which is an e_assign
  assign slow_peripheral_bridge_m1_arbiterlock2 = led_pio_s1_slavearbiterlockenable2 & slow_peripheral_bridge_m1_continuerequest;

  //led_pio_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign led_pio_s1_any_continuerequest = 1;

  //slow_peripheral_bridge_m1_continuerequest continued request, which is an e_assign
  assign slow_peripheral_bridge_m1_continuerequest = 1;

  assign slow_peripheral_bridge_m1_qualified_request_led_pio_s1 = slow_peripheral_bridge_m1_requests_led_pio_s1;
  //local readdatavalid slow_peripheral_bridge_m1_read_data_valid_led_pio_s1, which is an e_mux
  assign slow_peripheral_bridge_m1_read_data_valid_led_pio_s1 = slow_peripheral_bridge_m1_granted_led_pio_s1 & slow_peripheral_bridge_m1_read & ~led_pio_s1_waits_for_read;

  //led_pio_s1_writedata mux, which is an e_mux
  assign led_pio_s1_writedata = slow_peripheral_bridge_m1_writedata;

  //master is always granted when requested
  assign slow_peripheral_bridge_m1_granted_led_pio_s1 = slow_peripheral_bridge_m1_qualified_request_led_pio_s1;

  //slow_peripheral_bridge/m1 saved-grant led_pio/s1, which is an e_assign
  assign slow_peripheral_bridge_m1_saved_grant_led_pio_s1 = slow_peripheral_bridge_m1_requests_led_pio_s1;

  //allow new arb cycle for led_pio/s1, which is an e_assign
  assign led_pio_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign led_pio_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign led_pio_s1_master_qreq_vector = 1;

  //led_pio_s1_reset_n assignment, which is an e_assign
  assign led_pio_s1_reset_n = reset_n;

  assign led_pio_s1_chipselect = slow_peripheral_bridge_m1_granted_led_pio_s1;
  //led_pio_s1_firsttransfer first transaction, which is an e_assign
  assign led_pio_s1_firsttransfer = led_pio_s1_begins_xfer ? led_pio_s1_unreg_firsttransfer : led_pio_s1_reg_firsttransfer;

  //led_pio_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign led_pio_s1_unreg_firsttransfer = ~(led_pio_s1_slavearbiterlockenable & led_pio_s1_any_continuerequest);

  //led_pio_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          led_pio_s1_reg_firsttransfer <= 1'b1;
      else if (led_pio_s1_begins_xfer)
          led_pio_s1_reg_firsttransfer <= led_pio_s1_unreg_firsttransfer;
    end


  //led_pio_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign led_pio_s1_beginbursttransfer_internal = led_pio_s1_begins_xfer;

  //~led_pio_s1_write_n assignment, which is an e_mux
  assign led_pio_s1_write_n = ~(slow_peripheral_bridge_m1_granted_led_pio_s1 & slow_peripheral_bridge_m1_write);

  //led_pio_s1_address mux, which is an e_mux
  assign led_pio_s1_address = slow_peripheral_bridge_m1_nativeaddress;

  //d1_led_pio_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_led_pio_s1_end_xfer <= 1;
      else if (1)
          d1_led_pio_s1_end_xfer <= led_pio_s1_end_xfer;
    end


  //led_pio_s1_waits_for_read in a cycle, which is an e_mux
  assign led_pio_s1_waits_for_read = led_pio_s1_in_a_read_cycle & led_pio_s1_begins_xfer;

  //led_pio_s1_in_a_read_cycle assignment, which is an e_assign
  assign led_pio_s1_in_a_read_cycle = slow_peripheral_bridge_m1_granted_led_pio_s1 & slow_peripheral_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = led_pio_s1_in_a_read_cycle;

  //led_pio_s1_waits_for_write in a cycle, which is an e_mux
  assign led_pio_s1_waits_for_write = led_pio_s1_in_a_write_cycle & 0;

  //led_pio_s1_in_a_write_cycle assignment, which is an e_assign
  assign led_pio_s1_in_a_write_cycle = slow_peripheral_bridge_m1_granted_led_pio_s1 & slow_peripheral_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = led_pio_s1_in_a_write_cycle;

  assign wait_for_led_pio_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //led_pio/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_flash_ssram_pipeline_bridge_m1_to_pipeline_bridge_before_tristate_bridge_s1_module (
                                                                                                         // inputs:
                                                                                                          clear_fifo,
                                                                                                          clk,
                                                                                                          data_in,
                                                                                                          read,
                                                                                                          reset_n,
                                                                                                          sync_reset,
                                                                                                          write,

                                                                                                         // outputs:
                                                                                                          data_out,
                                                                                                          empty,
                                                                                                          fifo_contains_ones_n,
                                                                                                          full
                                                                                                       )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pipeline_bridge_before_tristate_bridge_s1_arbitrator (
                                                              // inputs:
                                                               clk,
                                                               flash_ssram_pipeline_bridge_m1_address_to_slave,
                                                               flash_ssram_pipeline_bridge_m1_burstcount,
                                                               flash_ssram_pipeline_bridge_m1_byteenable,
                                                               flash_ssram_pipeline_bridge_m1_chipselect,
                                                               flash_ssram_pipeline_bridge_m1_debugaccess,
                                                               flash_ssram_pipeline_bridge_m1_latency_counter,
                                                               flash_ssram_pipeline_bridge_m1_read,
                                                               flash_ssram_pipeline_bridge_m1_write,
                                                               flash_ssram_pipeline_bridge_m1_writedata,
                                                               pipeline_bridge_before_tristate_bridge_s1_endofpacket,
                                                               pipeline_bridge_before_tristate_bridge_s1_readdata,
                                                               pipeline_bridge_before_tristate_bridge_s1_readdatavalid,
                                                               pipeline_bridge_before_tristate_bridge_s1_waitrequest,
                                                               reset_n,

                                                              // outputs:
                                                               d1_pipeline_bridge_before_tristate_bridge_s1_end_xfer,
                                                               flash_ssram_pipeline_bridge_m1_granted_pipeline_bridge_before_tristate_bridge_s1,
                                                               flash_ssram_pipeline_bridge_m1_qualified_request_pipeline_bridge_before_tristate_bridge_s1,
                                                               flash_ssram_pipeline_bridge_m1_read_data_valid_pipeline_bridge_before_tristate_bridge_s1,
                                                               flash_ssram_pipeline_bridge_m1_read_data_valid_pipeline_bridge_before_tristate_bridge_s1_shift_register,
                                                               flash_ssram_pipeline_bridge_m1_requests_pipeline_bridge_before_tristate_bridge_s1,
                                                               pipeline_bridge_before_tristate_bridge_s1_address,
                                                               pipeline_bridge_before_tristate_bridge_s1_arbiterlock,
                                                               pipeline_bridge_before_tristate_bridge_s1_arbiterlock2,
                                                               pipeline_bridge_before_tristate_bridge_s1_burstcount,
                                                               pipeline_bridge_before_tristate_bridge_s1_byteenable,
                                                               pipeline_bridge_before_tristate_bridge_s1_chipselect,
                                                               pipeline_bridge_before_tristate_bridge_s1_debugaccess,
                                                               pipeline_bridge_before_tristate_bridge_s1_endofpacket_from_sa,
                                                               pipeline_bridge_before_tristate_bridge_s1_nativeaddress,
                                                               pipeline_bridge_before_tristate_bridge_s1_read,
                                                               pipeline_bridge_before_tristate_bridge_s1_readdata_from_sa,
                                                               pipeline_bridge_before_tristate_bridge_s1_reset_n,
                                                               pipeline_bridge_before_tristate_bridge_s1_waitrequest_from_sa,
                                                               pipeline_bridge_before_tristate_bridge_s1_write,
                                                               pipeline_bridge_before_tristate_bridge_s1_writedata
                                                            )
;

  output           d1_pipeline_bridge_before_tristate_bridge_s1_end_xfer;
  output           flash_ssram_pipeline_bridge_m1_granted_pipeline_bridge_before_tristate_bridge_s1;
  output           flash_ssram_pipeline_bridge_m1_qualified_request_pipeline_bridge_before_tristate_bridge_s1;
  output           flash_ssram_pipeline_bridge_m1_read_data_valid_pipeline_bridge_before_tristate_bridge_s1;
  output           flash_ssram_pipeline_bridge_m1_read_data_valid_pipeline_bridge_before_tristate_bridge_s1_shift_register;
  output           flash_ssram_pipeline_bridge_m1_requests_pipeline_bridge_before_tristate_bridge_s1;
  output  [ 22: 0] pipeline_bridge_before_tristate_bridge_s1_address;
  output           pipeline_bridge_before_tristate_bridge_s1_arbiterlock;
  output           pipeline_bridge_before_tristate_bridge_s1_arbiterlock2;
  output           pipeline_bridge_before_tristate_bridge_s1_burstcount;
  output  [  3: 0] pipeline_bridge_before_tristate_bridge_s1_byteenable;
  output           pipeline_bridge_before_tristate_bridge_s1_chipselect;
  output           pipeline_bridge_before_tristate_bridge_s1_debugaccess;
  output           pipeline_bridge_before_tristate_bridge_s1_endofpacket_from_sa;
  output  [ 22: 0] pipeline_bridge_before_tristate_bridge_s1_nativeaddress;
  output           pipeline_bridge_before_tristate_bridge_s1_read;
  output  [ 31: 0] pipeline_bridge_before_tristate_bridge_s1_readdata_from_sa;
  output           pipeline_bridge_before_tristate_bridge_s1_reset_n;
  output           pipeline_bridge_before_tristate_bridge_s1_waitrequest_from_sa;
  output           pipeline_bridge_before_tristate_bridge_s1_write;
  output  [ 31: 0] pipeline_bridge_before_tristate_bridge_s1_writedata;
  input            clk;
  input   [ 24: 0] flash_ssram_pipeline_bridge_m1_address_to_slave;
  input            flash_ssram_pipeline_bridge_m1_burstcount;
  input   [  3: 0] flash_ssram_pipeline_bridge_m1_byteenable;
  input            flash_ssram_pipeline_bridge_m1_chipselect;
  input            flash_ssram_pipeline_bridge_m1_debugaccess;
  input            flash_ssram_pipeline_bridge_m1_latency_counter;
  input            flash_ssram_pipeline_bridge_m1_read;
  input            flash_ssram_pipeline_bridge_m1_write;
  input   [ 31: 0] flash_ssram_pipeline_bridge_m1_writedata;
  input            pipeline_bridge_before_tristate_bridge_s1_endofpacket;
  input   [ 31: 0] pipeline_bridge_before_tristate_bridge_s1_readdata;
  input            pipeline_bridge_before_tristate_bridge_s1_readdatavalid;
  input            pipeline_bridge_before_tristate_bridge_s1_waitrequest;
  input            reset_n;

  reg              d1_pipeline_bridge_before_tristate_bridge_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pipeline_bridge_before_tristate_bridge_s1;
  wire             flash_ssram_pipeline_bridge_m1_arbiterlock;
  wire             flash_ssram_pipeline_bridge_m1_arbiterlock2;
  wire             flash_ssram_pipeline_bridge_m1_continuerequest;
  wire             flash_ssram_pipeline_bridge_m1_granted_pipeline_bridge_before_tristate_bridge_s1;
  wire             flash_ssram_pipeline_bridge_m1_qualified_request_pipeline_bridge_before_tristate_bridge_s1;
  wire             flash_ssram_pipeline_bridge_m1_rdv_fifo_empty_pipeline_bridge_before_tristate_bridge_s1;
  wire             flash_ssram_pipeline_bridge_m1_rdv_fifo_output_from_pipeline_bridge_before_tristate_bridge_s1;
  wire             flash_ssram_pipeline_bridge_m1_read_data_valid_pipeline_bridge_before_tristate_bridge_s1;
  wire             flash_ssram_pipeline_bridge_m1_read_data_valid_pipeline_bridge_before_tristate_bridge_s1_shift_register;
  wire             flash_ssram_pipeline_bridge_m1_requests_pipeline_bridge_before_tristate_bridge_s1;
  wire             flash_ssram_pipeline_bridge_m1_saved_grant_pipeline_bridge_before_tristate_bridge_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 22: 0] pipeline_bridge_before_tristate_bridge_s1_address;
  wire             pipeline_bridge_before_tristate_bridge_s1_allgrants;
  wire             pipeline_bridge_before_tristate_bridge_s1_allow_new_arb_cycle;
  wire             pipeline_bridge_before_tristate_bridge_s1_any_bursting_master_saved_grant;
  wire             pipeline_bridge_before_tristate_bridge_s1_any_continuerequest;
  wire             pipeline_bridge_before_tristate_bridge_s1_arb_counter_enable;
  reg     [  3: 0] pipeline_bridge_before_tristate_bridge_s1_arb_share_counter;
  wire    [  3: 0] pipeline_bridge_before_tristate_bridge_s1_arb_share_counter_next_value;
  wire    [  3: 0] pipeline_bridge_before_tristate_bridge_s1_arb_share_set_values;
  wire             pipeline_bridge_before_tristate_bridge_s1_arbiterlock;
  wire             pipeline_bridge_before_tristate_bridge_s1_arbiterlock2;
  wire             pipeline_bridge_before_tristate_bridge_s1_arbitration_holdoff_internal;
  wire             pipeline_bridge_before_tristate_bridge_s1_beginbursttransfer_internal;
  wire             pipeline_bridge_before_tristate_bridge_s1_begins_xfer;
  wire             pipeline_bridge_before_tristate_bridge_s1_burstcount;
  wire    [  3: 0] pipeline_bridge_before_tristate_bridge_s1_byteenable;
  wire             pipeline_bridge_before_tristate_bridge_s1_chipselect;
  wire             pipeline_bridge_before_tristate_bridge_s1_debugaccess;
  wire             pipeline_bridge_before_tristate_bridge_s1_end_xfer;
  wire             pipeline_bridge_before_tristate_bridge_s1_endofpacket_from_sa;
  wire             pipeline_bridge_before_tristate_bridge_s1_firsttransfer;
  wire             pipeline_bridge_before_tristate_bridge_s1_grant_vector;
  wire             pipeline_bridge_before_tristate_bridge_s1_in_a_read_cycle;
  wire             pipeline_bridge_before_tristate_bridge_s1_in_a_write_cycle;
  wire             pipeline_bridge_before_tristate_bridge_s1_master_qreq_vector;
  wire             pipeline_bridge_before_tristate_bridge_s1_move_on_to_next_transaction;
  wire    [ 22: 0] pipeline_bridge_before_tristate_bridge_s1_nativeaddress;
  wire             pipeline_bridge_before_tristate_bridge_s1_non_bursting_master_requests;
  wire             pipeline_bridge_before_tristate_bridge_s1_read;
  wire    [ 31: 0] pipeline_bridge_before_tristate_bridge_s1_readdata_from_sa;
  wire             pipeline_bridge_before_tristate_bridge_s1_readdatavalid_from_sa;
  reg              pipeline_bridge_before_tristate_bridge_s1_reg_firsttransfer;
  wire             pipeline_bridge_before_tristate_bridge_s1_reset_n;
  reg              pipeline_bridge_before_tristate_bridge_s1_slavearbiterlockenable;
  wire             pipeline_bridge_before_tristate_bridge_s1_slavearbiterlockenable2;
  wire             pipeline_bridge_before_tristate_bridge_s1_unreg_firsttransfer;
  wire             pipeline_bridge_before_tristate_bridge_s1_waitrequest_from_sa;
  wire             pipeline_bridge_before_tristate_bridge_s1_waits_for_read;
  wire             pipeline_bridge_before_tristate_bridge_s1_waits_for_write;
  wire             pipeline_bridge_before_tristate_bridge_s1_write;
  wire    [ 31: 0] pipeline_bridge_before_tristate_bridge_s1_writedata;
  wire    [ 24: 0] shifted_address_to_pipeline_bridge_before_tristate_bridge_s1_from_flash_ssram_pipeline_bridge_m1;
  wire             wait_for_pipeline_bridge_before_tristate_bridge_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~pipeline_bridge_before_tristate_bridge_s1_end_xfer;
    end


  assign pipeline_bridge_before_tristate_bridge_s1_begins_xfer = ~d1_reasons_to_wait & ((flash_ssram_pipeline_bridge_m1_qualified_request_pipeline_bridge_before_tristate_bridge_s1));
  //assign pipeline_bridge_before_tristate_bridge_s1_readdata_from_sa = pipeline_bridge_before_tristate_bridge_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pipeline_bridge_before_tristate_bridge_s1_readdata_from_sa = pipeline_bridge_before_tristate_bridge_s1_readdata;

  assign flash_ssram_pipeline_bridge_m1_requests_pipeline_bridge_before_tristate_bridge_s1 = (1) & flash_ssram_pipeline_bridge_m1_chipselect;
  //assign pipeline_bridge_before_tristate_bridge_s1_waitrequest_from_sa = pipeline_bridge_before_tristate_bridge_s1_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pipeline_bridge_before_tristate_bridge_s1_waitrequest_from_sa = pipeline_bridge_before_tristate_bridge_s1_waitrequest;

  //assign pipeline_bridge_before_tristate_bridge_s1_readdatavalid_from_sa = pipeline_bridge_before_tristate_bridge_s1_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pipeline_bridge_before_tristate_bridge_s1_readdatavalid_from_sa = pipeline_bridge_before_tristate_bridge_s1_readdatavalid;

  //pipeline_bridge_before_tristate_bridge_s1_arb_share_counter set values, which is an e_mux
  assign pipeline_bridge_before_tristate_bridge_s1_arb_share_set_values = (flash_ssram_pipeline_bridge_m1_granted_pipeline_bridge_before_tristate_bridge_s1)? 8 :
    (flash_ssram_pipeline_bridge_m1_granted_pipeline_bridge_before_tristate_bridge_s1)? 8 :
    1;

  //pipeline_bridge_before_tristate_bridge_s1_non_bursting_master_requests mux, which is an e_mux
  assign pipeline_bridge_before_tristate_bridge_s1_non_bursting_master_requests = flash_ssram_pipeline_bridge_m1_requests_pipeline_bridge_before_tristate_bridge_s1 |
    flash_ssram_pipeline_bridge_m1_requests_pipeline_bridge_before_tristate_bridge_s1;

  //pipeline_bridge_before_tristate_bridge_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign pipeline_bridge_before_tristate_bridge_s1_any_bursting_master_saved_grant = 0;

  //pipeline_bridge_before_tristate_bridge_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign pipeline_bridge_before_tristate_bridge_s1_arb_share_counter_next_value = pipeline_bridge_before_tristate_bridge_s1_firsttransfer ? (pipeline_bridge_before_tristate_bridge_s1_arb_share_set_values - 1) : |pipeline_bridge_before_tristate_bridge_s1_arb_share_counter ? (pipeline_bridge_before_tristate_bridge_s1_arb_share_counter - 1) : 0;

  //pipeline_bridge_before_tristate_bridge_s1_allgrants all slave grants, which is an e_mux
  assign pipeline_bridge_before_tristate_bridge_s1_allgrants = |pipeline_bridge_before_tristate_bridge_s1_grant_vector |
    |pipeline_bridge_before_tristate_bridge_s1_grant_vector;

  //pipeline_bridge_before_tristate_bridge_s1_end_xfer assignment, which is an e_assign
  assign pipeline_bridge_before_tristate_bridge_s1_end_xfer = ~(pipeline_bridge_before_tristate_bridge_s1_waits_for_read | pipeline_bridge_before_tristate_bridge_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_pipeline_bridge_before_tristate_bridge_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pipeline_bridge_before_tristate_bridge_s1 = pipeline_bridge_before_tristate_bridge_s1_end_xfer & (~pipeline_bridge_before_tristate_bridge_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pipeline_bridge_before_tristate_bridge_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign pipeline_bridge_before_tristate_bridge_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_pipeline_bridge_before_tristate_bridge_s1 & pipeline_bridge_before_tristate_bridge_s1_allgrants) | (end_xfer_arb_share_counter_term_pipeline_bridge_before_tristate_bridge_s1 & ~pipeline_bridge_before_tristate_bridge_s1_non_bursting_master_requests);

  //pipeline_bridge_before_tristate_bridge_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pipeline_bridge_before_tristate_bridge_s1_arb_share_counter <= 0;
      else if (pipeline_bridge_before_tristate_bridge_s1_arb_counter_enable)
          pipeline_bridge_before_tristate_bridge_s1_arb_share_counter <= pipeline_bridge_before_tristate_bridge_s1_arb_share_counter_next_value;
    end


  //pipeline_bridge_before_tristate_bridge_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pipeline_bridge_before_tristate_bridge_s1_slavearbiterlockenable <= 0;
      else if ((|pipeline_bridge_before_tristate_bridge_s1_master_qreq_vector & end_xfer_arb_share_counter_term_pipeline_bridge_before_tristate_bridge_s1) | (end_xfer_arb_share_counter_term_pipeline_bridge_before_tristate_bridge_s1 & ~pipeline_bridge_before_tristate_bridge_s1_non_bursting_master_requests))
          pipeline_bridge_before_tristate_bridge_s1_slavearbiterlockenable <= |pipeline_bridge_before_tristate_bridge_s1_arb_share_counter_next_value;
    end


  //flash_ssram_pipeline_bridge/m1 pipeline_bridge_before_tristate_bridge/s1 arbiterlock, which is an e_assign
  assign flash_ssram_pipeline_bridge_m1_arbiterlock = pipeline_bridge_before_tristate_bridge_s1_slavearbiterlockenable & flash_ssram_pipeline_bridge_m1_continuerequest;

  //pipeline_bridge_before_tristate_bridge_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pipeline_bridge_before_tristate_bridge_s1_slavearbiterlockenable2 = |pipeline_bridge_before_tristate_bridge_s1_arb_share_counter_next_value;

  //flash_ssram_pipeline_bridge/m1 pipeline_bridge_before_tristate_bridge/s1 arbiterlock2, which is an e_assign
  assign flash_ssram_pipeline_bridge_m1_arbiterlock2 = pipeline_bridge_before_tristate_bridge_s1_slavearbiterlockenable2 & flash_ssram_pipeline_bridge_m1_continuerequest;

  //pipeline_bridge_before_tristate_bridge_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pipeline_bridge_before_tristate_bridge_s1_any_continuerequest = 1;

  //flash_ssram_pipeline_bridge_m1_continuerequest continued request, which is an e_assign
  assign flash_ssram_pipeline_bridge_m1_continuerequest = 1;

  assign flash_ssram_pipeline_bridge_m1_qualified_request_pipeline_bridge_before_tristate_bridge_s1 = flash_ssram_pipeline_bridge_m1_requests_pipeline_bridge_before_tristate_bridge_s1 & ~(((flash_ssram_pipeline_bridge_m1_read & flash_ssram_pipeline_bridge_m1_chipselect) & ((flash_ssram_pipeline_bridge_m1_latency_counter != 0) | (1 < flash_ssram_pipeline_bridge_m1_latency_counter))));
  //unique name for pipeline_bridge_before_tristate_bridge_s1_move_on_to_next_transaction, which is an e_assign
  assign pipeline_bridge_before_tristate_bridge_s1_move_on_to_next_transaction = pipeline_bridge_before_tristate_bridge_s1_readdatavalid_from_sa;

  //rdv_fifo_for_flash_ssram_pipeline_bridge_m1_to_pipeline_bridge_before_tristate_bridge_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_flash_ssram_pipeline_bridge_m1_to_pipeline_bridge_before_tristate_bridge_s1_module rdv_fifo_for_flash_ssram_pipeline_bridge_m1_to_pipeline_bridge_before_tristate_bridge_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (flash_ssram_pipeline_bridge_m1_granted_pipeline_bridge_before_tristate_bridge_s1),
      .data_out             (flash_ssram_pipeline_bridge_m1_rdv_fifo_output_from_pipeline_bridge_before_tristate_bridge_s1),
      .empty                (),
      .fifo_contains_ones_n (flash_ssram_pipeline_bridge_m1_rdv_fifo_empty_pipeline_bridge_before_tristate_bridge_s1),
      .full                 (),
      .read                 (pipeline_bridge_before_tristate_bridge_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~pipeline_bridge_before_tristate_bridge_s1_waits_for_read)
    );

  assign flash_ssram_pipeline_bridge_m1_read_data_valid_pipeline_bridge_before_tristate_bridge_s1_shift_register = ~flash_ssram_pipeline_bridge_m1_rdv_fifo_empty_pipeline_bridge_before_tristate_bridge_s1;
  //local readdatavalid flash_ssram_pipeline_bridge_m1_read_data_valid_pipeline_bridge_before_tristate_bridge_s1, which is an e_mux
  assign flash_ssram_pipeline_bridge_m1_read_data_valid_pipeline_bridge_before_tristate_bridge_s1 = pipeline_bridge_before_tristate_bridge_s1_readdatavalid_from_sa;

  //pipeline_bridge_before_tristate_bridge_s1_writedata mux, which is an e_mux
  assign pipeline_bridge_before_tristate_bridge_s1_writedata = flash_ssram_pipeline_bridge_m1_writedata;

  //assign pipeline_bridge_before_tristate_bridge_s1_endofpacket_from_sa = pipeline_bridge_before_tristate_bridge_s1_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pipeline_bridge_before_tristate_bridge_s1_endofpacket_from_sa = pipeline_bridge_before_tristate_bridge_s1_endofpacket;

  //master is always granted when requested
  assign flash_ssram_pipeline_bridge_m1_granted_pipeline_bridge_before_tristate_bridge_s1 = flash_ssram_pipeline_bridge_m1_qualified_request_pipeline_bridge_before_tristate_bridge_s1;

  //flash_ssram_pipeline_bridge/m1 saved-grant pipeline_bridge_before_tristate_bridge/s1, which is an e_assign
  assign flash_ssram_pipeline_bridge_m1_saved_grant_pipeline_bridge_before_tristate_bridge_s1 = flash_ssram_pipeline_bridge_m1_requests_pipeline_bridge_before_tristate_bridge_s1;

  //allow new arb cycle for pipeline_bridge_before_tristate_bridge/s1, which is an e_assign
  assign pipeline_bridge_before_tristate_bridge_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pipeline_bridge_before_tristate_bridge_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pipeline_bridge_before_tristate_bridge_s1_master_qreq_vector = 1;

  //pipeline_bridge_before_tristate_bridge_s1_reset_n assignment, which is an e_assign
  assign pipeline_bridge_before_tristate_bridge_s1_reset_n = reset_n;

  assign pipeline_bridge_before_tristate_bridge_s1_chipselect = flash_ssram_pipeline_bridge_m1_granted_pipeline_bridge_before_tristate_bridge_s1;
  //pipeline_bridge_before_tristate_bridge_s1_firsttransfer first transaction, which is an e_assign
  assign pipeline_bridge_before_tristate_bridge_s1_firsttransfer = pipeline_bridge_before_tristate_bridge_s1_begins_xfer ? pipeline_bridge_before_tristate_bridge_s1_unreg_firsttransfer : pipeline_bridge_before_tristate_bridge_s1_reg_firsttransfer;

  //pipeline_bridge_before_tristate_bridge_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign pipeline_bridge_before_tristate_bridge_s1_unreg_firsttransfer = ~(pipeline_bridge_before_tristate_bridge_s1_slavearbiterlockenable & pipeline_bridge_before_tristate_bridge_s1_any_continuerequest);

  //pipeline_bridge_before_tristate_bridge_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pipeline_bridge_before_tristate_bridge_s1_reg_firsttransfer <= 1'b1;
      else if (pipeline_bridge_before_tristate_bridge_s1_begins_xfer)
          pipeline_bridge_before_tristate_bridge_s1_reg_firsttransfer <= pipeline_bridge_before_tristate_bridge_s1_unreg_firsttransfer;
    end


  //pipeline_bridge_before_tristate_bridge_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pipeline_bridge_before_tristate_bridge_s1_beginbursttransfer_internal = pipeline_bridge_before_tristate_bridge_s1_begins_xfer;

  //pipeline_bridge_before_tristate_bridge_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign pipeline_bridge_before_tristate_bridge_s1_arbitration_holdoff_internal = pipeline_bridge_before_tristate_bridge_s1_begins_xfer & pipeline_bridge_before_tristate_bridge_s1_firsttransfer;

  //pipeline_bridge_before_tristate_bridge_s1_read assignment, which is an e_mux
  assign pipeline_bridge_before_tristate_bridge_s1_read = flash_ssram_pipeline_bridge_m1_granted_pipeline_bridge_before_tristate_bridge_s1 & (flash_ssram_pipeline_bridge_m1_read & flash_ssram_pipeline_bridge_m1_chipselect);

  //pipeline_bridge_before_tristate_bridge_s1_write assignment, which is an e_mux
  assign pipeline_bridge_before_tristate_bridge_s1_write = flash_ssram_pipeline_bridge_m1_granted_pipeline_bridge_before_tristate_bridge_s1 & (flash_ssram_pipeline_bridge_m1_write & flash_ssram_pipeline_bridge_m1_chipselect);

  assign shifted_address_to_pipeline_bridge_before_tristate_bridge_s1_from_flash_ssram_pipeline_bridge_m1 = flash_ssram_pipeline_bridge_m1_address_to_slave;
  //pipeline_bridge_before_tristate_bridge_s1_address mux, which is an e_mux
  assign pipeline_bridge_before_tristate_bridge_s1_address = shifted_address_to_pipeline_bridge_before_tristate_bridge_s1_from_flash_ssram_pipeline_bridge_m1 >> 2;

  //slaveid pipeline_bridge_before_tristate_bridge_s1_nativeaddress nativeaddress mux, which is an e_mux
  assign pipeline_bridge_before_tristate_bridge_s1_nativeaddress = flash_ssram_pipeline_bridge_m1_address_to_slave >> 2;

  //d1_pipeline_bridge_before_tristate_bridge_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pipeline_bridge_before_tristate_bridge_s1_end_xfer <= 1;
      else if (1)
          d1_pipeline_bridge_before_tristate_bridge_s1_end_xfer <= pipeline_bridge_before_tristate_bridge_s1_end_xfer;
    end


  //pipeline_bridge_before_tristate_bridge_s1_waits_for_read in a cycle, which is an e_mux
  assign pipeline_bridge_before_tristate_bridge_s1_waits_for_read = pipeline_bridge_before_tristate_bridge_s1_in_a_read_cycle & pipeline_bridge_before_tristate_bridge_s1_waitrequest_from_sa;

  //pipeline_bridge_before_tristate_bridge_s1_in_a_read_cycle assignment, which is an e_assign
  assign pipeline_bridge_before_tristate_bridge_s1_in_a_read_cycle = flash_ssram_pipeline_bridge_m1_granted_pipeline_bridge_before_tristate_bridge_s1 & (flash_ssram_pipeline_bridge_m1_read & flash_ssram_pipeline_bridge_m1_chipselect);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pipeline_bridge_before_tristate_bridge_s1_in_a_read_cycle;

  //pipeline_bridge_before_tristate_bridge_s1_waits_for_write in a cycle, which is an e_mux
  assign pipeline_bridge_before_tristate_bridge_s1_waits_for_write = pipeline_bridge_before_tristate_bridge_s1_in_a_write_cycle & pipeline_bridge_before_tristate_bridge_s1_waitrequest_from_sa;

  //pipeline_bridge_before_tristate_bridge_s1_in_a_write_cycle assignment, which is an e_assign
  assign pipeline_bridge_before_tristate_bridge_s1_in_a_write_cycle = flash_ssram_pipeline_bridge_m1_granted_pipeline_bridge_before_tristate_bridge_s1 & (flash_ssram_pipeline_bridge_m1_write & flash_ssram_pipeline_bridge_m1_chipselect);

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pipeline_bridge_before_tristate_bridge_s1_in_a_write_cycle;

  assign wait_for_pipeline_bridge_before_tristate_bridge_s1_counter = 0;
  //pipeline_bridge_before_tristate_bridge_s1_byteenable byte enable port mux, which is an e_mux
  assign pipeline_bridge_before_tristate_bridge_s1_byteenable = (flash_ssram_pipeline_bridge_m1_granted_pipeline_bridge_before_tristate_bridge_s1)? flash_ssram_pipeline_bridge_m1_byteenable :
    -1;

  //burstcount mux, which is an e_mux
  assign pipeline_bridge_before_tristate_bridge_s1_burstcount = (flash_ssram_pipeline_bridge_m1_granted_pipeline_bridge_before_tristate_bridge_s1)? flash_ssram_pipeline_bridge_m1_burstcount :
    1;

  //pipeline_bridge_before_tristate_bridge/s1 arbiterlock assigned from _handle_arbiterlock, which is an e_mux
  assign pipeline_bridge_before_tristate_bridge_s1_arbiterlock = flash_ssram_pipeline_bridge_m1_arbiterlock;

  //pipeline_bridge_before_tristate_bridge/s1 arbiterlock2 assigned from _handle_arbiterlock2, which is an e_mux
  assign pipeline_bridge_before_tristate_bridge_s1_arbiterlock2 = flash_ssram_pipeline_bridge_m1_arbiterlock2;

  //debugaccess mux, which is an e_mux
  assign pipeline_bridge_before_tristate_bridge_s1_debugaccess = (flash_ssram_pipeline_bridge_m1_granted_pipeline_bridge_before_tristate_bridge_s1)? flash_ssram_pipeline_bridge_m1_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pipeline_bridge_before_tristate_bridge/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end


  //flash_ssram_pipeline_bridge/m1 non-zero burstcount assertion, which is an e_process
  always @(posedge clk)
    begin
      if (flash_ssram_pipeline_bridge_m1_requests_pipeline_bridge_before_tristate_bridge_s1 && (flash_ssram_pipeline_bridge_m1_burstcount == 0) && enable_nonzero_assertions)
        begin
          $write("%0d ns: flash_ssram_pipeline_bridge/m1 drove 0 on its 'burstcount' port while accessing slave pipeline_bridge_before_tristate_bridge/s1", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pipeline_bridge_before_tristate_bridge_m1_arbitrator (
                                                              // inputs:
                                                               clk,
                                                               d1_flash_ssram_tristate_bridge_avalon_slave_end_xfer,
                                                               ext_flash_s1_wait_counter_eq_0,
                                                               incoming_flash_ssram_tristate_bridge_data,
                                                               incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0,
                                                               pipeline_bridge_before_tristate_bridge_m1_address,
                                                               pipeline_bridge_before_tristate_bridge_m1_burstcount,
                                                               pipeline_bridge_before_tristate_bridge_m1_byteenable,
                                                               pipeline_bridge_before_tristate_bridge_m1_byteenable_ext_flash_s1,
                                                               pipeline_bridge_before_tristate_bridge_m1_chipselect,
                                                               pipeline_bridge_before_tristate_bridge_m1_granted_ext_flash_s1,
                                                               pipeline_bridge_before_tristate_bridge_m1_granted_ssram_s1,
                                                               pipeline_bridge_before_tristate_bridge_m1_qualified_request_ext_flash_s1,
                                                               pipeline_bridge_before_tristate_bridge_m1_qualified_request_ssram_s1,
                                                               pipeline_bridge_before_tristate_bridge_m1_read,
                                                               pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ext_flash_s1,
                                                               pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ssram_s1,
                                                               pipeline_bridge_before_tristate_bridge_m1_requests_ext_flash_s1,
                                                               pipeline_bridge_before_tristate_bridge_m1_requests_ssram_s1,
                                                               pipeline_bridge_before_tristate_bridge_m1_write,
                                                               pipeline_bridge_before_tristate_bridge_m1_writedata,
                                                               reset_n,

                                                              // outputs:
                                                               pipeline_bridge_before_tristate_bridge_m1_address_to_slave,
                                                               pipeline_bridge_before_tristate_bridge_m1_dbs_address,
                                                               pipeline_bridge_before_tristate_bridge_m1_dbs_write_16,
                                                               pipeline_bridge_before_tristate_bridge_m1_latency_counter,
                                                               pipeline_bridge_before_tristate_bridge_m1_readdata,
                                                               pipeline_bridge_before_tristate_bridge_m1_readdatavalid,
                                                               pipeline_bridge_before_tristate_bridge_m1_waitrequest
                                                            )
;

  output  [ 24: 0] pipeline_bridge_before_tristate_bridge_m1_address_to_slave;
  output  [  1: 0] pipeline_bridge_before_tristate_bridge_m1_dbs_address;
  output  [ 15: 0] pipeline_bridge_before_tristate_bridge_m1_dbs_write_16;
  output  [  2: 0] pipeline_bridge_before_tristate_bridge_m1_latency_counter;
  output  [ 31: 0] pipeline_bridge_before_tristate_bridge_m1_readdata;
  output           pipeline_bridge_before_tristate_bridge_m1_readdatavalid;
  output           pipeline_bridge_before_tristate_bridge_m1_waitrequest;
  input            clk;
  input            d1_flash_ssram_tristate_bridge_avalon_slave_end_xfer;
  input            ext_flash_s1_wait_counter_eq_0;
  input   [ 31: 0] incoming_flash_ssram_tristate_bridge_data;
  input   [ 15: 0] incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0;
  input   [ 24: 0] pipeline_bridge_before_tristate_bridge_m1_address;
  input            pipeline_bridge_before_tristate_bridge_m1_burstcount;
  input   [  3: 0] pipeline_bridge_before_tristate_bridge_m1_byteenable;
  input   [  1: 0] pipeline_bridge_before_tristate_bridge_m1_byteenable_ext_flash_s1;
  input            pipeline_bridge_before_tristate_bridge_m1_chipselect;
  input            pipeline_bridge_before_tristate_bridge_m1_granted_ext_flash_s1;
  input            pipeline_bridge_before_tristate_bridge_m1_granted_ssram_s1;
  input            pipeline_bridge_before_tristate_bridge_m1_qualified_request_ext_flash_s1;
  input            pipeline_bridge_before_tristate_bridge_m1_qualified_request_ssram_s1;
  input            pipeline_bridge_before_tristate_bridge_m1_read;
  input            pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ext_flash_s1;
  input            pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ssram_s1;
  input            pipeline_bridge_before_tristate_bridge_m1_requests_ext_flash_s1;
  input            pipeline_bridge_before_tristate_bridge_m1_requests_ssram_s1;
  input            pipeline_bridge_before_tristate_bridge_m1_write;
  input   [ 31: 0] pipeline_bridge_before_tristate_bridge_m1_writedata;
  input            reset_n;

  reg              active_and_waiting_last_time;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  reg     [ 15: 0] dbs_latent_16_reg_segment_0;
  wire             dbs_rdv_count_enable;
  wire             dbs_rdv_counter_overflow;
  wire    [  2: 0] latency_load_value;
  wire    [  1: 0] next_dbs_address;
  wire    [ 15: 0] p1_dbs_latent_16_reg_segment_0;
  wire    [  2: 0] p1_pipeline_bridge_before_tristate_bridge_m1_latency_counter;
  reg     [ 24: 0] pipeline_bridge_before_tristate_bridge_m1_address_last_time;
  wire    [ 24: 0] pipeline_bridge_before_tristate_bridge_m1_address_to_slave;
  reg              pipeline_bridge_before_tristate_bridge_m1_burstcount_last_time;
  reg     [  3: 0] pipeline_bridge_before_tristate_bridge_m1_byteenable_last_time;
  reg              pipeline_bridge_before_tristate_bridge_m1_chipselect_last_time;
  reg     [  1: 0] pipeline_bridge_before_tristate_bridge_m1_dbs_address;
  wire    [  1: 0] pipeline_bridge_before_tristate_bridge_m1_dbs_increment;
  reg     [  1: 0] pipeline_bridge_before_tristate_bridge_m1_dbs_rdv_counter;
  wire    [  1: 0] pipeline_bridge_before_tristate_bridge_m1_dbs_rdv_counter_inc;
  wire    [ 15: 0] pipeline_bridge_before_tristate_bridge_m1_dbs_write_16;
  wire             pipeline_bridge_before_tristate_bridge_m1_is_granted_some_slave;
  reg     [  2: 0] pipeline_bridge_before_tristate_bridge_m1_latency_counter;
  wire    [  1: 0] pipeline_bridge_before_tristate_bridge_m1_next_dbs_rdv_counter;
  reg              pipeline_bridge_before_tristate_bridge_m1_read_but_no_slave_selected;
  reg              pipeline_bridge_before_tristate_bridge_m1_read_last_time;
  wire    [ 31: 0] pipeline_bridge_before_tristate_bridge_m1_readdata;
  wire             pipeline_bridge_before_tristate_bridge_m1_readdatavalid;
  wire             pipeline_bridge_before_tristate_bridge_m1_run;
  wire             pipeline_bridge_before_tristate_bridge_m1_waitrequest;
  reg              pipeline_bridge_before_tristate_bridge_m1_write_last_time;
  reg     [ 31: 0] pipeline_bridge_before_tristate_bridge_m1_writedata_last_time;
  wire             pre_dbs_count_enable;
  wire             pre_flush_pipeline_bridge_before_tristate_bridge_m1_readdatavalid;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & ((pipeline_bridge_before_tristate_bridge_m1_qualified_request_ext_flash_s1 | ((pipeline_bridge_before_tristate_bridge_m1_write & pipeline_bridge_before_tristate_bridge_m1_chipselect) & !pipeline_bridge_before_tristate_bridge_m1_byteenable_ext_flash_s1 & pipeline_bridge_before_tristate_bridge_m1_dbs_address[1]) | ~pipeline_bridge_before_tristate_bridge_m1_requests_ext_flash_s1)) & (pipeline_bridge_before_tristate_bridge_m1_qualified_request_ssram_s1 | ~pipeline_bridge_before_tristate_bridge_m1_requests_ssram_s1) & ((~pipeline_bridge_before_tristate_bridge_m1_qualified_request_ext_flash_s1 | ~(pipeline_bridge_before_tristate_bridge_m1_read & pipeline_bridge_before_tristate_bridge_m1_chipselect) | (1 & ((ext_flash_s1_wait_counter_eq_0 & ~d1_flash_ssram_tristate_bridge_avalon_slave_end_xfer)) & (pipeline_bridge_before_tristate_bridge_m1_dbs_address[1]) & (pipeline_bridge_before_tristate_bridge_m1_read & pipeline_bridge_before_tristate_bridge_m1_chipselect)))) & ((~pipeline_bridge_before_tristate_bridge_m1_qualified_request_ext_flash_s1 | ~(pipeline_bridge_before_tristate_bridge_m1_write & pipeline_bridge_before_tristate_bridge_m1_chipselect) | (1 & ((ext_flash_s1_wait_counter_eq_0 & ~d1_flash_ssram_tristate_bridge_avalon_slave_end_xfer)) & (pipeline_bridge_before_tristate_bridge_m1_dbs_address[1]) & (pipeline_bridge_before_tristate_bridge_m1_write & pipeline_bridge_before_tristate_bridge_m1_chipselect)))) & ((~pipeline_bridge_before_tristate_bridge_m1_qualified_request_ssram_s1 | ~pipeline_bridge_before_tristate_bridge_m1_chipselect | (1 & pipeline_bridge_before_tristate_bridge_m1_chipselect))) & ((~pipeline_bridge_before_tristate_bridge_m1_qualified_request_ssram_s1 | ~pipeline_bridge_before_tristate_bridge_m1_chipselect | (1 & pipeline_bridge_before_tristate_bridge_m1_chipselect)));

  //cascaded wait assignment, which is an e_assign
  assign pipeline_bridge_before_tristate_bridge_m1_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign pipeline_bridge_before_tristate_bridge_m1_address_to_slave = pipeline_bridge_before_tristate_bridge_m1_address[24 : 0];

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = (((~0) & pipeline_bridge_before_tristate_bridge_m1_requests_ext_flash_s1 & (pipeline_bridge_before_tristate_bridge_m1_write & pipeline_bridge_before_tristate_bridge_m1_chipselect) & !pipeline_bridge_before_tristate_bridge_m1_byteenable_ext_flash_s1)) |
    ((pipeline_bridge_before_tristate_bridge_m1_granted_ext_flash_s1 & (pipeline_bridge_before_tristate_bridge_m1_read & pipeline_bridge_before_tristate_bridge_m1_chipselect) & 1 & 1 & ({ext_flash_s1_wait_counter_eq_0 & ~d1_flash_ssram_tristate_bridge_avalon_slave_end_xfer}))) |
    ((pipeline_bridge_before_tristate_bridge_m1_granted_ext_flash_s1 & (pipeline_bridge_before_tristate_bridge_m1_write & pipeline_bridge_before_tristate_bridge_m1_chipselect) & 1 & 1 & ({ext_flash_s1_wait_counter_eq_0 & ~d1_flash_ssram_tristate_bridge_avalon_slave_end_xfer})));

  //pipeline_bridge_before_tristate_bridge_m1_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pipeline_bridge_before_tristate_bridge_m1_read_but_no_slave_selected <= 0;
      else if (1)
          pipeline_bridge_before_tristate_bridge_m1_read_but_no_slave_selected <= (pipeline_bridge_before_tristate_bridge_m1_read & pipeline_bridge_before_tristate_bridge_m1_chipselect) & pipeline_bridge_before_tristate_bridge_m1_run & ~pipeline_bridge_before_tristate_bridge_m1_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign pipeline_bridge_before_tristate_bridge_m1_is_granted_some_slave = pipeline_bridge_before_tristate_bridge_m1_granted_ext_flash_s1 |
    pipeline_bridge_before_tristate_bridge_m1_granted_ssram_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_pipeline_bridge_before_tristate_bridge_m1_readdatavalid = (pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ext_flash_s1 & dbs_rdv_counter_overflow) |
    pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ssram_s1;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign pipeline_bridge_before_tristate_bridge_m1_readdatavalid = pipeline_bridge_before_tristate_bridge_m1_read_but_no_slave_selected |
    pre_flush_pipeline_bridge_before_tristate_bridge_m1_readdatavalid |
    pipeline_bridge_before_tristate_bridge_m1_read_but_no_slave_selected |
    pre_flush_pipeline_bridge_before_tristate_bridge_m1_readdatavalid;

  //input to latent dbs-16 stored 0, which is an e_mux
  assign p1_dbs_latent_16_reg_segment_0 = incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0;

  //dbs register for latent dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_16_reg_segment_0 <= 0;
      else if (dbs_rdv_count_enable & ((pipeline_bridge_before_tristate_bridge_m1_dbs_rdv_counter[1]) == 0))
          dbs_latent_16_reg_segment_0 <= p1_dbs_latent_16_reg_segment_0;
    end


  //pipeline_bridge_before_tristate_bridge/m1 readdata mux, which is an e_mux
  assign pipeline_bridge_before_tristate_bridge_m1_readdata = ({32 {~pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ext_flash_s1}} | {incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0[15 : 0],
    dbs_latent_16_reg_segment_0}) &
    ({32 {~pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ssram_s1}} | incoming_flash_ssram_tristate_bridge_data);

  //mux write dbs 1, which is an e_mux
  assign pipeline_bridge_before_tristate_bridge_m1_dbs_write_16 = (pipeline_bridge_before_tristate_bridge_m1_dbs_address[1])? pipeline_bridge_before_tristate_bridge_m1_writedata[31 : 16] :
    pipeline_bridge_before_tristate_bridge_m1_writedata[15 : 0];

  //actual waitrequest port, which is an e_assign
  assign pipeline_bridge_before_tristate_bridge_m1_waitrequest = ~pipeline_bridge_before_tristate_bridge_m1_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pipeline_bridge_before_tristate_bridge_m1_latency_counter <= 0;
      else if (1)
          pipeline_bridge_before_tristate_bridge_m1_latency_counter <= p1_pipeline_bridge_before_tristate_bridge_m1_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_pipeline_bridge_before_tristate_bridge_m1_latency_counter = ((pipeline_bridge_before_tristate_bridge_m1_run & (pipeline_bridge_before_tristate_bridge_m1_read & pipeline_bridge_before_tristate_bridge_m1_chipselect)))? latency_load_value :
    (pipeline_bridge_before_tristate_bridge_m1_latency_counter)? pipeline_bridge_before_tristate_bridge_m1_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = ({3 {pipeline_bridge_before_tristate_bridge_m1_requests_ext_flash_s1}} & 2) |
    ({3 {pipeline_bridge_before_tristate_bridge_m1_requests_ssram_s1}} & 4);

  //dbs count increment, which is an e_mux
  assign pipeline_bridge_before_tristate_bridge_m1_dbs_increment = (pipeline_bridge_before_tristate_bridge_m1_requests_ext_flash_s1)? 2 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = pipeline_bridge_before_tristate_bridge_m1_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = pipeline_bridge_before_tristate_bridge_m1_dbs_address + pipeline_bridge_before_tristate_bridge_m1_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pipeline_bridge_before_tristate_bridge_m1_dbs_address <= 0;
      else if (dbs_count_enable)
          pipeline_bridge_before_tristate_bridge_m1_dbs_address <= next_dbs_address;
    end


  //p1 dbs rdv counter, which is an e_assign
  assign pipeline_bridge_before_tristate_bridge_m1_next_dbs_rdv_counter = pipeline_bridge_before_tristate_bridge_m1_dbs_rdv_counter + pipeline_bridge_before_tristate_bridge_m1_dbs_rdv_counter_inc;

  //pipeline_bridge_before_tristate_bridge_m1_rdv_inc_mux, which is an e_mux
  assign pipeline_bridge_before_tristate_bridge_m1_dbs_rdv_counter_inc = 2;

  //master any slave rdv, which is an e_mux
  assign dbs_rdv_count_enable = pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ext_flash_s1;

  //dbs rdv counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pipeline_bridge_before_tristate_bridge_m1_dbs_rdv_counter <= 0;
      else if (dbs_rdv_count_enable)
          pipeline_bridge_before_tristate_bridge_m1_dbs_rdv_counter <= pipeline_bridge_before_tristate_bridge_m1_next_dbs_rdv_counter;
    end


  //dbs rdv counter overflow, which is an e_assign
  assign dbs_rdv_counter_overflow = pipeline_bridge_before_tristate_bridge_m1_dbs_rdv_counter[1] & ~pipeline_bridge_before_tristate_bridge_m1_next_dbs_rdv_counter[1];


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pipeline_bridge_before_tristate_bridge_m1_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pipeline_bridge_before_tristate_bridge_m1_address_last_time <= 0;
      else if (1)
          pipeline_bridge_before_tristate_bridge_m1_address_last_time <= pipeline_bridge_before_tristate_bridge_m1_address;
    end


  //pipeline_bridge_before_tristate_bridge/m1 waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else if (1)
          active_and_waiting_last_time <= pipeline_bridge_before_tristate_bridge_m1_waitrequest & pipeline_bridge_before_tristate_bridge_m1_chipselect;
    end


  //pipeline_bridge_before_tristate_bridge_m1_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (pipeline_bridge_before_tristate_bridge_m1_address != pipeline_bridge_before_tristate_bridge_m1_address_last_time))
        begin
          $write("%0d ns: pipeline_bridge_before_tristate_bridge_m1_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //pipeline_bridge_before_tristate_bridge_m1_chipselect check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pipeline_bridge_before_tristate_bridge_m1_chipselect_last_time <= 0;
      else if (1)
          pipeline_bridge_before_tristate_bridge_m1_chipselect_last_time <= pipeline_bridge_before_tristate_bridge_m1_chipselect;
    end


  //pipeline_bridge_before_tristate_bridge_m1_chipselect matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (pipeline_bridge_before_tristate_bridge_m1_chipselect != pipeline_bridge_before_tristate_bridge_m1_chipselect_last_time))
        begin
          $write("%0d ns: pipeline_bridge_before_tristate_bridge_m1_chipselect did not heed wait!!!", $time);
          $stop;
        end
    end


  //pipeline_bridge_before_tristate_bridge_m1_burstcount check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pipeline_bridge_before_tristate_bridge_m1_burstcount_last_time <= 0;
      else if (1)
          pipeline_bridge_before_tristate_bridge_m1_burstcount_last_time <= pipeline_bridge_before_tristate_bridge_m1_burstcount;
    end


  //pipeline_bridge_before_tristate_bridge_m1_burstcount matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (pipeline_bridge_before_tristate_bridge_m1_burstcount != pipeline_bridge_before_tristate_bridge_m1_burstcount_last_time))
        begin
          $write("%0d ns: pipeline_bridge_before_tristate_bridge_m1_burstcount did not heed wait!!!", $time);
          $stop;
        end
    end


  //pipeline_bridge_before_tristate_bridge_m1_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pipeline_bridge_before_tristate_bridge_m1_byteenable_last_time <= 0;
      else if (1)
          pipeline_bridge_before_tristate_bridge_m1_byteenable_last_time <= pipeline_bridge_before_tristate_bridge_m1_byteenable;
    end


  //pipeline_bridge_before_tristate_bridge_m1_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (pipeline_bridge_before_tristate_bridge_m1_byteenable != pipeline_bridge_before_tristate_bridge_m1_byteenable_last_time))
        begin
          $write("%0d ns: pipeline_bridge_before_tristate_bridge_m1_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //pipeline_bridge_before_tristate_bridge_m1_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pipeline_bridge_before_tristate_bridge_m1_read_last_time <= 0;
      else if (1)
          pipeline_bridge_before_tristate_bridge_m1_read_last_time <= pipeline_bridge_before_tristate_bridge_m1_read;
    end


  //pipeline_bridge_before_tristate_bridge_m1_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (pipeline_bridge_before_tristate_bridge_m1_read != pipeline_bridge_before_tristate_bridge_m1_read_last_time))
        begin
          $write("%0d ns: pipeline_bridge_before_tristate_bridge_m1_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //pipeline_bridge_before_tristate_bridge_m1_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pipeline_bridge_before_tristate_bridge_m1_write_last_time <= 0;
      else if (1)
          pipeline_bridge_before_tristate_bridge_m1_write_last_time <= pipeline_bridge_before_tristate_bridge_m1_write;
    end


  //pipeline_bridge_before_tristate_bridge_m1_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (pipeline_bridge_before_tristate_bridge_m1_write != pipeline_bridge_before_tristate_bridge_m1_write_last_time))
        begin
          $write("%0d ns: pipeline_bridge_before_tristate_bridge_m1_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //pipeline_bridge_before_tristate_bridge_m1_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pipeline_bridge_before_tristate_bridge_m1_writedata_last_time <= 0;
      else if (1)
          pipeline_bridge_before_tristate_bridge_m1_writedata_last_time <= pipeline_bridge_before_tristate_bridge_m1_writedata;
    end


  //pipeline_bridge_before_tristate_bridge_m1_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (pipeline_bridge_before_tristate_bridge_m1_writedata != pipeline_bridge_before_tristate_bridge_m1_writedata_last_time) & (pipeline_bridge_before_tristate_bridge_m1_write & pipeline_bridge_before_tristate_bridge_m1_chipselect))
        begin
          $write("%0d ns: pipeline_bridge_before_tristate_bridge_m1_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pipeline_bridge_before_tristate_bridge_bridge_arbitrator 
;



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pll_s1_arbitrator (
                           // inputs:
                            clk,
                            cycloneIII_3c25_niosII_standard_sopc_clock_0_out_address_to_slave,
                            cycloneIII_3c25_niosII_standard_sopc_clock_0_out_nativeaddress,
                            cycloneIII_3c25_niosII_standard_sopc_clock_0_out_read,
                            cycloneIII_3c25_niosII_standard_sopc_clock_0_out_write,
                            cycloneIII_3c25_niosII_standard_sopc_clock_0_out_writedata,
                            pll_s1_readdata,
                            pll_s1_resetrequest,
                            reset_n,

                           // outputs:
                            cycloneIII_3c25_niosII_standard_sopc_clock_0_out_granted_pll_s1,
                            cycloneIII_3c25_niosII_standard_sopc_clock_0_out_qualified_request_pll_s1,
                            cycloneIII_3c25_niosII_standard_sopc_clock_0_out_read_data_valid_pll_s1,
                            cycloneIII_3c25_niosII_standard_sopc_clock_0_out_requests_pll_s1,
                            d1_pll_s1_end_xfer,
                            pll_s1_address,
                            pll_s1_chipselect,
                            pll_s1_read,
                            pll_s1_readdata_from_sa,
                            pll_s1_reset_n,
                            pll_s1_resetrequest_from_sa,
                            pll_s1_write,
                            pll_s1_writedata
                         )
;

  output           cycloneIII_3c25_niosII_standard_sopc_clock_0_out_granted_pll_s1;
  output           cycloneIII_3c25_niosII_standard_sopc_clock_0_out_qualified_request_pll_s1;
  output           cycloneIII_3c25_niosII_standard_sopc_clock_0_out_read_data_valid_pll_s1;
  output           cycloneIII_3c25_niosII_standard_sopc_clock_0_out_requests_pll_s1;
  output           d1_pll_s1_end_xfer;
  output  [  2: 0] pll_s1_address;
  output           pll_s1_chipselect;
  output           pll_s1_read;
  output  [ 15: 0] pll_s1_readdata_from_sa;
  output           pll_s1_reset_n;
  output           pll_s1_resetrequest_from_sa;
  output           pll_s1_write;
  output  [ 15: 0] pll_s1_writedata;
  input            clk;
  input   [  3: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_out_address_to_slave;
  input   [  2: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_out_nativeaddress;
  input            cycloneIII_3c25_niosII_standard_sopc_clock_0_out_read;
  input            cycloneIII_3c25_niosII_standard_sopc_clock_0_out_write;
  input   [ 15: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_out_writedata;
  input   [ 15: 0] pll_s1_readdata;
  input            pll_s1_resetrequest;
  input            reset_n;

  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_out_arbiterlock;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_out_arbiterlock2;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_out_continuerequest;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_out_granted_pll_s1;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_out_qualified_request_pll_s1;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_out_read_data_valid_pll_s1;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_out_requests_pll_s1;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_out_saved_grant_pll_s1;
  reg              d1_pll_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pll_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  2: 0] pll_s1_address;
  wire             pll_s1_allgrants;
  wire             pll_s1_allow_new_arb_cycle;
  wire             pll_s1_any_bursting_master_saved_grant;
  wire             pll_s1_any_continuerequest;
  wire             pll_s1_arb_counter_enable;
  reg              pll_s1_arb_share_counter;
  wire             pll_s1_arb_share_counter_next_value;
  wire             pll_s1_arb_share_set_values;
  wire             pll_s1_beginbursttransfer_internal;
  wire             pll_s1_begins_xfer;
  wire             pll_s1_chipselect;
  wire             pll_s1_end_xfer;
  wire             pll_s1_firsttransfer;
  wire             pll_s1_grant_vector;
  wire             pll_s1_in_a_read_cycle;
  wire             pll_s1_in_a_write_cycle;
  wire             pll_s1_master_qreq_vector;
  wire             pll_s1_non_bursting_master_requests;
  wire             pll_s1_read;
  wire    [ 15: 0] pll_s1_readdata_from_sa;
  reg              pll_s1_reg_firsttransfer;
  wire             pll_s1_reset_n;
  wire             pll_s1_resetrequest_from_sa;
  reg              pll_s1_slavearbiterlockenable;
  wire             pll_s1_slavearbiterlockenable2;
  wire             pll_s1_unreg_firsttransfer;
  wire             pll_s1_waits_for_read;
  wire             pll_s1_waits_for_write;
  wire             pll_s1_write;
  wire    [ 15: 0] pll_s1_writedata;
  wire             wait_for_pll_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~pll_s1_end_xfer;
    end


  assign pll_s1_begins_xfer = ~d1_reasons_to_wait & ((cycloneIII_3c25_niosII_standard_sopc_clock_0_out_qualified_request_pll_s1));
  //assign pll_s1_readdata_from_sa = pll_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pll_s1_readdata_from_sa = pll_s1_readdata;

  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_out_requests_pll_s1 = (1) & (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_read | cycloneIII_3c25_niosII_standard_sopc_clock_0_out_write);
  //pll_s1_arb_share_counter set values, which is an e_mux
  assign pll_s1_arb_share_set_values = 1;

  //pll_s1_non_bursting_master_requests mux, which is an e_mux
  assign pll_s1_non_bursting_master_requests = cycloneIII_3c25_niosII_standard_sopc_clock_0_out_requests_pll_s1;

  //pll_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign pll_s1_any_bursting_master_saved_grant = 0;

  //pll_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign pll_s1_arb_share_counter_next_value = pll_s1_firsttransfer ? (pll_s1_arb_share_set_values - 1) : |pll_s1_arb_share_counter ? (pll_s1_arb_share_counter - 1) : 0;

  //pll_s1_allgrants all slave grants, which is an e_mux
  assign pll_s1_allgrants = |pll_s1_grant_vector;

  //pll_s1_end_xfer assignment, which is an e_assign
  assign pll_s1_end_xfer = ~(pll_s1_waits_for_read | pll_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_pll_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pll_s1 = pll_s1_end_xfer & (~pll_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pll_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign pll_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_pll_s1 & pll_s1_allgrants) | (end_xfer_arb_share_counter_term_pll_s1 & ~pll_s1_non_bursting_master_requests);

  //pll_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pll_s1_arb_share_counter <= 0;
      else if (pll_s1_arb_counter_enable)
          pll_s1_arb_share_counter <= pll_s1_arb_share_counter_next_value;
    end


  //pll_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pll_s1_slavearbiterlockenable <= 0;
      else if ((|pll_s1_master_qreq_vector & end_xfer_arb_share_counter_term_pll_s1) | (end_xfer_arb_share_counter_term_pll_s1 & ~pll_s1_non_bursting_master_requests))
          pll_s1_slavearbiterlockenable <= |pll_s1_arb_share_counter_next_value;
    end


  //cycloneIII_3c25_niosII_standard_sopc_clock_0/out pll/s1 arbiterlock, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_out_arbiterlock = pll_s1_slavearbiterlockenable & cycloneIII_3c25_niosII_standard_sopc_clock_0_out_continuerequest;

  //pll_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pll_s1_slavearbiterlockenable2 = |pll_s1_arb_share_counter_next_value;

  //cycloneIII_3c25_niosII_standard_sopc_clock_0/out pll/s1 arbiterlock2, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_out_arbiterlock2 = pll_s1_slavearbiterlockenable2 & cycloneIII_3c25_niosII_standard_sopc_clock_0_out_continuerequest;

  //pll_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pll_s1_any_continuerequest = 1;

  //cycloneIII_3c25_niosII_standard_sopc_clock_0_out_continuerequest continued request, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_out_continuerequest = 1;

  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_out_qualified_request_pll_s1 = cycloneIII_3c25_niosII_standard_sopc_clock_0_out_requests_pll_s1;
  //pll_s1_writedata mux, which is an e_mux
  assign pll_s1_writedata = cycloneIII_3c25_niosII_standard_sopc_clock_0_out_writedata;

  //master is always granted when requested
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_out_granted_pll_s1 = cycloneIII_3c25_niosII_standard_sopc_clock_0_out_qualified_request_pll_s1;

  //cycloneIII_3c25_niosII_standard_sopc_clock_0/out saved-grant pll/s1, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_out_saved_grant_pll_s1 = cycloneIII_3c25_niosII_standard_sopc_clock_0_out_requests_pll_s1;

  //allow new arb cycle for pll/s1, which is an e_assign
  assign pll_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pll_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pll_s1_master_qreq_vector = 1;

  //pll_s1_reset_n assignment, which is an e_assign
  assign pll_s1_reset_n = reset_n;

  //assign pll_s1_resetrequest_from_sa = pll_s1_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pll_s1_resetrequest_from_sa = pll_s1_resetrequest;

  assign pll_s1_chipselect = cycloneIII_3c25_niosII_standard_sopc_clock_0_out_granted_pll_s1;
  //pll_s1_firsttransfer first transaction, which is an e_assign
  assign pll_s1_firsttransfer = pll_s1_begins_xfer ? pll_s1_unreg_firsttransfer : pll_s1_reg_firsttransfer;

  //pll_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign pll_s1_unreg_firsttransfer = ~(pll_s1_slavearbiterlockenable & pll_s1_any_continuerequest);

  //pll_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pll_s1_reg_firsttransfer <= 1'b1;
      else if (pll_s1_begins_xfer)
          pll_s1_reg_firsttransfer <= pll_s1_unreg_firsttransfer;
    end


  //pll_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pll_s1_beginbursttransfer_internal = pll_s1_begins_xfer;

  //pll_s1_read assignment, which is an e_mux
  assign pll_s1_read = cycloneIII_3c25_niosII_standard_sopc_clock_0_out_granted_pll_s1 & cycloneIII_3c25_niosII_standard_sopc_clock_0_out_read;

  //pll_s1_write assignment, which is an e_mux
  assign pll_s1_write = cycloneIII_3c25_niosII_standard_sopc_clock_0_out_granted_pll_s1 & cycloneIII_3c25_niosII_standard_sopc_clock_0_out_write;

  //pll_s1_address mux, which is an e_mux
  assign pll_s1_address = cycloneIII_3c25_niosII_standard_sopc_clock_0_out_nativeaddress;

  //d1_pll_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pll_s1_end_xfer <= 1;
      else if (1)
          d1_pll_s1_end_xfer <= pll_s1_end_xfer;
    end


  //pll_s1_waits_for_read in a cycle, which is an e_mux
  assign pll_s1_waits_for_read = pll_s1_in_a_read_cycle & pll_s1_begins_xfer;

  //pll_s1_in_a_read_cycle assignment, which is an e_assign
  assign pll_s1_in_a_read_cycle = cycloneIII_3c25_niosII_standard_sopc_clock_0_out_granted_pll_s1 & cycloneIII_3c25_niosII_standard_sopc_clock_0_out_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pll_s1_in_a_read_cycle;

  //pll_s1_waits_for_write in a cycle, which is an e_mux
  assign pll_s1_waits_for_write = pll_s1_in_a_write_cycle & 0;

  //pll_s1_in_a_write_cycle assignment, which is an e_assign
  assign pll_s1_in_a_write_cycle = cycloneIII_3c25_niosII_standard_sopc_clock_0_out_granted_pll_s1 & cycloneIII_3c25_niosII_standard_sopc_clock_0_out_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pll_s1_in_a_write_cycle;

  assign wait_for_pll_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pll/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module remote_update_s1_arbitrator (
                                     // inputs:
                                      clk,
                                      cycloneIII_3c25_niosII_standard_sopc_clock_1_out_address_to_slave,
                                      cycloneIII_3c25_niosII_standard_sopc_clock_1_out_nativeaddress,
                                      cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read,
                                      cycloneIII_3c25_niosII_standard_sopc_clock_1_out_write,
                                      cycloneIII_3c25_niosII_standard_sopc_clock_1_out_writedata,
                                      remote_update_s1_readdata,
                                      remote_update_s1_waitrequest,
                                      reset_n,

                                     // outputs:
                                      cycloneIII_3c25_niosII_standard_sopc_clock_1_out_granted_remote_update_s1,
                                      cycloneIII_3c25_niosII_standard_sopc_clock_1_out_qualified_request_remote_update_s1,
                                      cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read_data_valid_remote_update_s1,
                                      cycloneIII_3c25_niosII_standard_sopc_clock_1_out_requests_remote_update_s1,
                                      d1_remote_update_s1_end_xfer,
                                      remote_update_s1_address,
                                      remote_update_s1_chipselect,
                                      remote_update_s1_read,
                                      remote_update_s1_readdata_from_sa,
                                      remote_update_s1_reset,
                                      remote_update_s1_waitrequest_from_sa,
                                      remote_update_s1_write,
                                      remote_update_s1_writedata
                                   )
;

  output           cycloneIII_3c25_niosII_standard_sopc_clock_1_out_granted_remote_update_s1;
  output           cycloneIII_3c25_niosII_standard_sopc_clock_1_out_qualified_request_remote_update_s1;
  output           cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read_data_valid_remote_update_s1;
  output           cycloneIII_3c25_niosII_standard_sopc_clock_1_out_requests_remote_update_s1;
  output           d1_remote_update_s1_end_xfer;
  output  [  5: 0] remote_update_s1_address;
  output           remote_update_s1_chipselect;
  output           remote_update_s1_read;
  output  [ 31: 0] remote_update_s1_readdata_from_sa;
  output           remote_update_s1_reset;
  output           remote_update_s1_waitrequest_from_sa;
  output           remote_update_s1_write;
  output  [ 31: 0] remote_update_s1_writedata;
  input            clk;
  input   [  7: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_out_address_to_slave;
  input   [  5: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_out_nativeaddress;
  input            cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read;
  input            cycloneIII_3c25_niosII_standard_sopc_clock_1_out_write;
  input   [ 31: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_out_writedata;
  input   [ 31: 0] remote_update_s1_readdata;
  input            remote_update_s1_waitrequest;
  input            reset_n;

  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_out_arbiterlock;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_out_arbiterlock2;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_out_continuerequest;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_out_granted_remote_update_s1;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_out_qualified_request_remote_update_s1;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read_data_valid_remote_update_s1;
  reg     [  1: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read_data_valid_remote_update_s1_shift_register;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read_data_valid_remote_update_s1_shift_register_in;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_out_requests_remote_update_s1;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_out_saved_grant_remote_update_s1;
  reg              d1_reasons_to_wait;
  reg              d1_remote_update_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_remote_update_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] p1_cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read_data_valid_remote_update_s1_shift_register;
  wire    [  5: 0] remote_update_s1_address;
  wire             remote_update_s1_allgrants;
  wire             remote_update_s1_allow_new_arb_cycle;
  wire             remote_update_s1_any_bursting_master_saved_grant;
  wire             remote_update_s1_any_continuerequest;
  wire             remote_update_s1_arb_counter_enable;
  reg              remote_update_s1_arb_share_counter;
  wire             remote_update_s1_arb_share_counter_next_value;
  wire             remote_update_s1_arb_share_set_values;
  wire             remote_update_s1_beginbursttransfer_internal;
  wire             remote_update_s1_begins_xfer;
  wire             remote_update_s1_chipselect;
  wire             remote_update_s1_end_xfer;
  wire             remote_update_s1_firsttransfer;
  wire             remote_update_s1_grant_vector;
  wire             remote_update_s1_in_a_read_cycle;
  wire             remote_update_s1_in_a_write_cycle;
  wire             remote_update_s1_master_qreq_vector;
  wire             remote_update_s1_non_bursting_master_requests;
  wire             remote_update_s1_read;
  wire    [ 31: 0] remote_update_s1_readdata_from_sa;
  reg              remote_update_s1_reg_firsttransfer;
  wire             remote_update_s1_reset;
  reg              remote_update_s1_slavearbiterlockenable;
  wire             remote_update_s1_slavearbiterlockenable2;
  wire             remote_update_s1_unreg_firsttransfer;
  wire             remote_update_s1_waitrequest_from_sa;
  wire             remote_update_s1_waits_for_read;
  wire             remote_update_s1_waits_for_write;
  wire             remote_update_s1_write;
  wire    [ 31: 0] remote_update_s1_writedata;
  wire             wait_for_remote_update_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~remote_update_s1_end_xfer;
    end


  assign remote_update_s1_begins_xfer = ~d1_reasons_to_wait & ((cycloneIII_3c25_niosII_standard_sopc_clock_1_out_qualified_request_remote_update_s1));
  //assign remote_update_s1_readdata_from_sa = remote_update_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign remote_update_s1_readdata_from_sa = remote_update_s1_readdata;

  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_out_requests_remote_update_s1 = (1) & (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read | cycloneIII_3c25_niosII_standard_sopc_clock_1_out_write);
  //assign remote_update_s1_waitrequest_from_sa = remote_update_s1_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign remote_update_s1_waitrequest_from_sa = remote_update_s1_waitrequest;

  //remote_update_s1_arb_share_counter set values, which is an e_mux
  assign remote_update_s1_arb_share_set_values = 1;

  //remote_update_s1_non_bursting_master_requests mux, which is an e_mux
  assign remote_update_s1_non_bursting_master_requests = cycloneIII_3c25_niosII_standard_sopc_clock_1_out_requests_remote_update_s1;

  //remote_update_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign remote_update_s1_any_bursting_master_saved_grant = 0;

  //remote_update_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign remote_update_s1_arb_share_counter_next_value = remote_update_s1_firsttransfer ? (remote_update_s1_arb_share_set_values - 1) : |remote_update_s1_arb_share_counter ? (remote_update_s1_arb_share_counter - 1) : 0;

  //remote_update_s1_allgrants all slave grants, which is an e_mux
  assign remote_update_s1_allgrants = |remote_update_s1_grant_vector;

  //remote_update_s1_end_xfer assignment, which is an e_assign
  assign remote_update_s1_end_xfer = ~(remote_update_s1_waits_for_read | remote_update_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_remote_update_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_remote_update_s1 = remote_update_s1_end_xfer & (~remote_update_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //remote_update_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign remote_update_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_remote_update_s1 & remote_update_s1_allgrants) | (end_xfer_arb_share_counter_term_remote_update_s1 & ~remote_update_s1_non_bursting_master_requests);

  //remote_update_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          remote_update_s1_arb_share_counter <= 0;
      else if (remote_update_s1_arb_counter_enable)
          remote_update_s1_arb_share_counter <= remote_update_s1_arb_share_counter_next_value;
    end


  //remote_update_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          remote_update_s1_slavearbiterlockenable <= 0;
      else if ((|remote_update_s1_master_qreq_vector & end_xfer_arb_share_counter_term_remote_update_s1) | (end_xfer_arb_share_counter_term_remote_update_s1 & ~remote_update_s1_non_bursting_master_requests))
          remote_update_s1_slavearbiterlockenable <= |remote_update_s1_arb_share_counter_next_value;
    end


  //cycloneIII_3c25_niosII_standard_sopc_clock_1/out remote_update/s1 arbiterlock, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_out_arbiterlock = remote_update_s1_slavearbiterlockenable & cycloneIII_3c25_niosII_standard_sopc_clock_1_out_continuerequest;

  //remote_update_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign remote_update_s1_slavearbiterlockenable2 = |remote_update_s1_arb_share_counter_next_value;

  //cycloneIII_3c25_niosII_standard_sopc_clock_1/out remote_update/s1 arbiterlock2, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_out_arbiterlock2 = remote_update_s1_slavearbiterlockenable2 & cycloneIII_3c25_niosII_standard_sopc_clock_1_out_continuerequest;

  //remote_update_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign remote_update_s1_any_continuerequest = 1;

  //cycloneIII_3c25_niosII_standard_sopc_clock_1_out_continuerequest continued request, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_out_continuerequest = 1;

  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_out_qualified_request_remote_update_s1 = cycloneIII_3c25_niosII_standard_sopc_clock_1_out_requests_remote_update_s1 & ~((cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read & ((|cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read_data_valid_remote_update_s1_shift_register))));
  //cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read_data_valid_remote_update_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read_data_valid_remote_update_s1_shift_register_in = cycloneIII_3c25_niosII_standard_sopc_clock_1_out_granted_remote_update_s1 & cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read & ~remote_update_s1_waits_for_read & ~(|cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read_data_valid_remote_update_s1_shift_register);

  //shift register p1 cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read_data_valid_remote_update_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read_data_valid_remote_update_s1_shift_register = {cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read_data_valid_remote_update_s1_shift_register, cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read_data_valid_remote_update_s1_shift_register_in};

  //cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read_data_valid_remote_update_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read_data_valid_remote_update_s1_shift_register <= 0;
      else if (1)
          cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read_data_valid_remote_update_s1_shift_register <= p1_cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read_data_valid_remote_update_s1_shift_register;
    end


  //local readdatavalid cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read_data_valid_remote_update_s1, which is an e_mux
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read_data_valid_remote_update_s1 = cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read_data_valid_remote_update_s1_shift_register[1];

  //remote_update_s1_writedata mux, which is an e_mux
  assign remote_update_s1_writedata = cycloneIII_3c25_niosII_standard_sopc_clock_1_out_writedata;

  //master is always granted when requested
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_out_granted_remote_update_s1 = cycloneIII_3c25_niosII_standard_sopc_clock_1_out_qualified_request_remote_update_s1;

  //cycloneIII_3c25_niosII_standard_sopc_clock_1/out saved-grant remote_update/s1, which is an e_assign
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_out_saved_grant_remote_update_s1 = cycloneIII_3c25_niosII_standard_sopc_clock_1_out_requests_remote_update_s1;

  //allow new arb cycle for remote_update/s1, which is an e_assign
  assign remote_update_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign remote_update_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign remote_update_s1_master_qreq_vector = 1;

  //~remote_update_s1_reset assignment, which is an e_assign
  assign remote_update_s1_reset = ~reset_n;

  assign remote_update_s1_chipselect = cycloneIII_3c25_niosII_standard_sopc_clock_1_out_granted_remote_update_s1;
  //remote_update_s1_firsttransfer first transaction, which is an e_assign
  assign remote_update_s1_firsttransfer = remote_update_s1_begins_xfer ? remote_update_s1_unreg_firsttransfer : remote_update_s1_reg_firsttransfer;

  //remote_update_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign remote_update_s1_unreg_firsttransfer = ~(remote_update_s1_slavearbiterlockenable & remote_update_s1_any_continuerequest);

  //remote_update_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          remote_update_s1_reg_firsttransfer <= 1'b1;
      else if (remote_update_s1_begins_xfer)
          remote_update_s1_reg_firsttransfer <= remote_update_s1_unreg_firsttransfer;
    end


  //remote_update_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign remote_update_s1_beginbursttransfer_internal = remote_update_s1_begins_xfer;

  //remote_update_s1_read assignment, which is an e_mux
  assign remote_update_s1_read = cycloneIII_3c25_niosII_standard_sopc_clock_1_out_granted_remote_update_s1 & cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read;

  //remote_update_s1_write assignment, which is an e_mux
  assign remote_update_s1_write = cycloneIII_3c25_niosII_standard_sopc_clock_1_out_granted_remote_update_s1 & cycloneIII_3c25_niosII_standard_sopc_clock_1_out_write;

  //remote_update_s1_address mux, which is an e_mux
  assign remote_update_s1_address = cycloneIII_3c25_niosII_standard_sopc_clock_1_out_nativeaddress;

  //d1_remote_update_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_remote_update_s1_end_xfer <= 1;
      else if (1)
          d1_remote_update_s1_end_xfer <= remote_update_s1_end_xfer;
    end


  //remote_update_s1_waits_for_read in a cycle, which is an e_mux
  assign remote_update_s1_waits_for_read = remote_update_s1_in_a_read_cycle & remote_update_s1_waitrequest_from_sa;

  //remote_update_s1_in_a_read_cycle assignment, which is an e_assign
  assign remote_update_s1_in_a_read_cycle = cycloneIII_3c25_niosII_standard_sopc_clock_1_out_granted_remote_update_s1 & cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = remote_update_s1_in_a_read_cycle;

  //remote_update_s1_waits_for_write in a cycle, which is an e_mux
  assign remote_update_s1_waits_for_write = remote_update_s1_in_a_write_cycle & remote_update_s1_waitrequest_from_sa;

  //remote_update_s1_in_a_write_cycle assignment, which is an e_assign
  assign remote_update_s1_in_a_write_cycle = cycloneIII_3c25_niosII_standard_sopc_clock_1_out_granted_remote_update_s1 & cycloneIII_3c25_niosII_standard_sopc_clock_1_out_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = remote_update_s1_in_a_write_cycle;

  assign wait_for_remote_update_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //remote_update/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_data_master_to_slow_peripheral_bridge_s1_module (
                                                                          // inputs:
                                                                           clear_fifo,
                                                                           clk,
                                                                           data_in,
                                                                           read,
                                                                           reset_n,
                                                                           sync_reset,
                                                                           write,

                                                                          // outputs:
                                                                           data_out,
                                                                           empty,
                                                                           fifo_contains_ones_n,
                                                                           full
                                                                        )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_10;
  reg              full_11;
  reg              full_12;
  reg              full_13;
  reg              full_14;
  reg              full_15;
  reg              full_16;
  reg              full_17;
  reg              full_18;
  reg              full_19;
  reg              full_2;
  reg              full_20;
  reg              full_21;
  reg              full_22;
  reg              full_23;
  reg              full_24;
  reg              full_25;
  reg              full_26;
  reg              full_27;
  reg              full_28;
  reg              full_29;
  reg              full_3;
  reg              full_30;
  reg              full_31;
  reg              full_32;
  reg              full_33;
  wire             full_34;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  reg              full_7;
  reg              full_8;
  reg              full_9;
  reg     [  6: 0] how_many_ones;
  wire    [  6: 0] one_count_minus_one;
  wire    [  6: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p10_full_10;
  wire             p10_stage_10;
  wire             p11_full_11;
  wire             p11_stage_11;
  wire             p12_full_12;
  wire             p12_stage_12;
  wire             p13_full_13;
  wire             p13_stage_13;
  wire             p14_full_14;
  wire             p14_stage_14;
  wire             p15_full_15;
  wire             p15_stage_15;
  wire             p16_full_16;
  wire             p16_stage_16;
  wire             p17_full_17;
  wire             p17_stage_17;
  wire             p18_full_18;
  wire             p18_stage_18;
  wire             p19_full_19;
  wire             p19_stage_19;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p20_full_20;
  wire             p20_stage_20;
  wire             p21_full_21;
  wire             p21_stage_21;
  wire             p22_full_22;
  wire             p22_stage_22;
  wire             p23_full_23;
  wire             p23_stage_23;
  wire             p24_full_24;
  wire             p24_stage_24;
  wire             p25_full_25;
  wire             p25_stage_25;
  wire             p26_full_26;
  wire             p26_stage_26;
  wire             p27_full_27;
  wire             p27_stage_27;
  wire             p28_full_28;
  wire             p28_stage_28;
  wire             p29_full_29;
  wire             p29_stage_29;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p30_full_30;
  wire             p30_stage_30;
  wire             p31_full_31;
  wire             p31_stage_31;
  wire             p32_full_32;
  wire             p32_stage_32;
  wire             p33_full_33;
  wire             p33_stage_33;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  wire             p7_full_7;
  wire             p7_stage_7;
  wire             p8_full_8;
  wire             p8_stage_8;
  wire             p9_full_9;
  wire             p9_stage_9;
  reg              stage_0;
  reg              stage_1;
  reg              stage_10;
  reg              stage_11;
  reg              stage_12;
  reg              stage_13;
  reg              stage_14;
  reg              stage_15;
  reg              stage_16;
  reg              stage_17;
  reg              stage_18;
  reg              stage_19;
  reg              stage_2;
  reg              stage_20;
  reg              stage_21;
  reg              stage_22;
  reg              stage_23;
  reg              stage_24;
  reg              stage_25;
  reg              stage_26;
  reg              stage_27;
  reg              stage_28;
  reg              stage_29;
  reg              stage_3;
  reg              stage_30;
  reg              stage_31;
  reg              stage_32;
  reg              stage_33;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  reg              stage_7;
  reg              stage_8;
  reg              stage_9;
  wire    [  6: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_33;
  assign empty = !full_0;
  assign full_34 = 0;
  //data_33, which is an e_mux
  assign p33_stage_33 = ((full_34 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_33, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_33 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_33))
          if (sync_reset & full_33 & !((full_34 == 0) & read & write))
              stage_33 <= 0;
          else 
            stage_33 <= p33_stage_33;
    end


  //control_33, which is an e_mux
  assign p33_full_33 = ((read & !write) == 0)? full_32 :
    0;

  //control_reg_33, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_33 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_33 <= 0;
          else 
            full_33 <= p33_full_33;
    end


  //data_32, which is an e_mux
  assign p32_stage_32 = ((full_33 & ~clear_fifo) == 0)? data_in :
    stage_33;

  //data_reg_32, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_32 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_32))
          if (sync_reset & full_32 & !((full_33 == 0) & read & write))
              stage_32 <= 0;
          else 
            stage_32 <= p32_stage_32;
    end


  //control_32, which is an e_mux
  assign p32_full_32 = ((read & !write) == 0)? full_31 :
    full_33;

  //control_reg_32, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_32 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_32 <= 0;
          else 
            full_32 <= p32_full_32;
    end


  //data_31, which is an e_mux
  assign p31_stage_31 = ((full_32 & ~clear_fifo) == 0)? data_in :
    stage_32;

  //data_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_31 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_31))
          if (sync_reset & full_31 & !((full_32 == 0) & read & write))
              stage_31 <= 0;
          else 
            stage_31 <= p31_stage_31;
    end


  //control_31, which is an e_mux
  assign p31_full_31 = ((read & !write) == 0)? full_30 :
    full_32;

  //control_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_31 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_31 <= 0;
          else 
            full_31 <= p31_full_31;
    end


  //data_30, which is an e_mux
  assign p30_stage_30 = ((full_31 & ~clear_fifo) == 0)? data_in :
    stage_31;

  //data_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_30 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_30))
          if (sync_reset & full_30 & !((full_31 == 0) & read & write))
              stage_30 <= 0;
          else 
            stage_30 <= p30_stage_30;
    end


  //control_30, which is an e_mux
  assign p30_full_30 = ((read & !write) == 0)? full_29 :
    full_31;

  //control_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_30 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_30 <= 0;
          else 
            full_30 <= p30_full_30;
    end


  //data_29, which is an e_mux
  assign p29_stage_29 = ((full_30 & ~clear_fifo) == 0)? data_in :
    stage_30;

  //data_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_29 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_29))
          if (sync_reset & full_29 & !((full_30 == 0) & read & write))
              stage_29 <= 0;
          else 
            stage_29 <= p29_stage_29;
    end


  //control_29, which is an e_mux
  assign p29_full_29 = ((read & !write) == 0)? full_28 :
    full_30;

  //control_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_29 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_29 <= 0;
          else 
            full_29 <= p29_full_29;
    end


  //data_28, which is an e_mux
  assign p28_stage_28 = ((full_29 & ~clear_fifo) == 0)? data_in :
    stage_29;

  //data_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_28 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_28))
          if (sync_reset & full_28 & !((full_29 == 0) & read & write))
              stage_28 <= 0;
          else 
            stage_28 <= p28_stage_28;
    end


  //control_28, which is an e_mux
  assign p28_full_28 = ((read & !write) == 0)? full_27 :
    full_29;

  //control_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_28 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_28 <= 0;
          else 
            full_28 <= p28_full_28;
    end


  //data_27, which is an e_mux
  assign p27_stage_27 = ((full_28 & ~clear_fifo) == 0)? data_in :
    stage_28;

  //data_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_27 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_27))
          if (sync_reset & full_27 & !((full_28 == 0) & read & write))
              stage_27 <= 0;
          else 
            stage_27 <= p27_stage_27;
    end


  //control_27, which is an e_mux
  assign p27_full_27 = ((read & !write) == 0)? full_26 :
    full_28;

  //control_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_27 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_27 <= 0;
          else 
            full_27 <= p27_full_27;
    end


  //data_26, which is an e_mux
  assign p26_stage_26 = ((full_27 & ~clear_fifo) == 0)? data_in :
    stage_27;

  //data_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_26 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_26))
          if (sync_reset & full_26 & !((full_27 == 0) & read & write))
              stage_26 <= 0;
          else 
            stage_26 <= p26_stage_26;
    end


  //control_26, which is an e_mux
  assign p26_full_26 = ((read & !write) == 0)? full_25 :
    full_27;

  //control_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_26 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_26 <= 0;
          else 
            full_26 <= p26_full_26;
    end


  //data_25, which is an e_mux
  assign p25_stage_25 = ((full_26 & ~clear_fifo) == 0)? data_in :
    stage_26;

  //data_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_25 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_25))
          if (sync_reset & full_25 & !((full_26 == 0) & read & write))
              stage_25 <= 0;
          else 
            stage_25 <= p25_stage_25;
    end


  //control_25, which is an e_mux
  assign p25_full_25 = ((read & !write) == 0)? full_24 :
    full_26;

  //control_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_25 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_25 <= 0;
          else 
            full_25 <= p25_full_25;
    end


  //data_24, which is an e_mux
  assign p24_stage_24 = ((full_25 & ~clear_fifo) == 0)? data_in :
    stage_25;

  //data_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_24 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_24))
          if (sync_reset & full_24 & !((full_25 == 0) & read & write))
              stage_24 <= 0;
          else 
            stage_24 <= p24_stage_24;
    end


  //control_24, which is an e_mux
  assign p24_full_24 = ((read & !write) == 0)? full_23 :
    full_25;

  //control_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_24 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_24 <= 0;
          else 
            full_24 <= p24_full_24;
    end


  //data_23, which is an e_mux
  assign p23_stage_23 = ((full_24 & ~clear_fifo) == 0)? data_in :
    stage_24;

  //data_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_23 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_23))
          if (sync_reset & full_23 & !((full_24 == 0) & read & write))
              stage_23 <= 0;
          else 
            stage_23 <= p23_stage_23;
    end


  //control_23, which is an e_mux
  assign p23_full_23 = ((read & !write) == 0)? full_22 :
    full_24;

  //control_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_23 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_23 <= 0;
          else 
            full_23 <= p23_full_23;
    end


  //data_22, which is an e_mux
  assign p22_stage_22 = ((full_23 & ~clear_fifo) == 0)? data_in :
    stage_23;

  //data_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_22 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_22))
          if (sync_reset & full_22 & !((full_23 == 0) & read & write))
              stage_22 <= 0;
          else 
            stage_22 <= p22_stage_22;
    end


  //control_22, which is an e_mux
  assign p22_full_22 = ((read & !write) == 0)? full_21 :
    full_23;

  //control_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_22 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_22 <= 0;
          else 
            full_22 <= p22_full_22;
    end


  //data_21, which is an e_mux
  assign p21_stage_21 = ((full_22 & ~clear_fifo) == 0)? data_in :
    stage_22;

  //data_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_21 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_21))
          if (sync_reset & full_21 & !((full_22 == 0) & read & write))
              stage_21 <= 0;
          else 
            stage_21 <= p21_stage_21;
    end


  //control_21, which is an e_mux
  assign p21_full_21 = ((read & !write) == 0)? full_20 :
    full_22;

  //control_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_21 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_21 <= 0;
          else 
            full_21 <= p21_full_21;
    end


  //data_20, which is an e_mux
  assign p20_stage_20 = ((full_21 & ~clear_fifo) == 0)? data_in :
    stage_21;

  //data_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_20 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_20))
          if (sync_reset & full_20 & !((full_21 == 0) & read & write))
              stage_20 <= 0;
          else 
            stage_20 <= p20_stage_20;
    end


  //control_20, which is an e_mux
  assign p20_full_20 = ((read & !write) == 0)? full_19 :
    full_21;

  //control_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_20 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_20 <= 0;
          else 
            full_20 <= p20_full_20;
    end


  //data_19, which is an e_mux
  assign p19_stage_19 = ((full_20 & ~clear_fifo) == 0)? data_in :
    stage_20;

  //data_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_19 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_19))
          if (sync_reset & full_19 & !((full_20 == 0) & read & write))
              stage_19 <= 0;
          else 
            stage_19 <= p19_stage_19;
    end


  //control_19, which is an e_mux
  assign p19_full_19 = ((read & !write) == 0)? full_18 :
    full_20;

  //control_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_19 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_19 <= 0;
          else 
            full_19 <= p19_full_19;
    end


  //data_18, which is an e_mux
  assign p18_stage_18 = ((full_19 & ~clear_fifo) == 0)? data_in :
    stage_19;

  //data_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_18 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_18))
          if (sync_reset & full_18 & !((full_19 == 0) & read & write))
              stage_18 <= 0;
          else 
            stage_18 <= p18_stage_18;
    end


  //control_18, which is an e_mux
  assign p18_full_18 = ((read & !write) == 0)? full_17 :
    full_19;

  //control_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_18 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_18 <= 0;
          else 
            full_18 <= p18_full_18;
    end


  //data_17, which is an e_mux
  assign p17_stage_17 = ((full_18 & ~clear_fifo) == 0)? data_in :
    stage_18;

  //data_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_17 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_17))
          if (sync_reset & full_17 & !((full_18 == 0) & read & write))
              stage_17 <= 0;
          else 
            stage_17 <= p17_stage_17;
    end


  //control_17, which is an e_mux
  assign p17_full_17 = ((read & !write) == 0)? full_16 :
    full_18;

  //control_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_17 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_17 <= 0;
          else 
            full_17 <= p17_full_17;
    end


  //data_16, which is an e_mux
  assign p16_stage_16 = ((full_17 & ~clear_fifo) == 0)? data_in :
    stage_17;

  //data_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_16 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_16))
          if (sync_reset & full_16 & !((full_17 == 0) & read & write))
              stage_16 <= 0;
          else 
            stage_16 <= p16_stage_16;
    end


  //control_16, which is an e_mux
  assign p16_full_16 = ((read & !write) == 0)? full_15 :
    full_17;

  //control_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_16 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_16 <= 0;
          else 
            full_16 <= p16_full_16;
    end


  //data_15, which is an e_mux
  assign p15_stage_15 = ((full_16 & ~clear_fifo) == 0)? data_in :
    stage_16;

  //data_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_15 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_15))
          if (sync_reset & full_15 & !((full_16 == 0) & read & write))
              stage_15 <= 0;
          else 
            stage_15 <= p15_stage_15;
    end


  //control_15, which is an e_mux
  assign p15_full_15 = ((read & !write) == 0)? full_14 :
    full_16;

  //control_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_15 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_15 <= 0;
          else 
            full_15 <= p15_full_15;
    end


  //data_14, which is an e_mux
  assign p14_stage_14 = ((full_15 & ~clear_fifo) == 0)? data_in :
    stage_15;

  //data_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_14 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_14))
          if (sync_reset & full_14 & !((full_15 == 0) & read & write))
              stage_14 <= 0;
          else 
            stage_14 <= p14_stage_14;
    end


  //control_14, which is an e_mux
  assign p14_full_14 = ((read & !write) == 0)? full_13 :
    full_15;

  //control_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_14 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_14 <= 0;
          else 
            full_14 <= p14_full_14;
    end


  //data_13, which is an e_mux
  assign p13_stage_13 = ((full_14 & ~clear_fifo) == 0)? data_in :
    stage_14;

  //data_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_13 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_13))
          if (sync_reset & full_13 & !((full_14 == 0) & read & write))
              stage_13 <= 0;
          else 
            stage_13 <= p13_stage_13;
    end


  //control_13, which is an e_mux
  assign p13_full_13 = ((read & !write) == 0)? full_12 :
    full_14;

  //control_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_13 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_13 <= 0;
          else 
            full_13 <= p13_full_13;
    end


  //data_12, which is an e_mux
  assign p12_stage_12 = ((full_13 & ~clear_fifo) == 0)? data_in :
    stage_13;

  //data_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_12 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_12))
          if (sync_reset & full_12 & !((full_13 == 0) & read & write))
              stage_12 <= 0;
          else 
            stage_12 <= p12_stage_12;
    end


  //control_12, which is an e_mux
  assign p12_full_12 = ((read & !write) == 0)? full_11 :
    full_13;

  //control_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_12 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_12 <= 0;
          else 
            full_12 <= p12_full_12;
    end


  //data_11, which is an e_mux
  assign p11_stage_11 = ((full_12 & ~clear_fifo) == 0)? data_in :
    stage_12;

  //data_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_11 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_11))
          if (sync_reset & full_11 & !((full_12 == 0) & read & write))
              stage_11 <= 0;
          else 
            stage_11 <= p11_stage_11;
    end


  //control_11, which is an e_mux
  assign p11_full_11 = ((read & !write) == 0)? full_10 :
    full_12;

  //control_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_11 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_11 <= 0;
          else 
            full_11 <= p11_full_11;
    end


  //data_10, which is an e_mux
  assign p10_stage_10 = ((full_11 & ~clear_fifo) == 0)? data_in :
    stage_11;

  //data_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_10 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_10))
          if (sync_reset & full_10 & !((full_11 == 0) & read & write))
              stage_10 <= 0;
          else 
            stage_10 <= p10_stage_10;
    end


  //control_10, which is an e_mux
  assign p10_full_10 = ((read & !write) == 0)? full_9 :
    full_11;

  //control_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_10 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_10 <= 0;
          else 
            full_10 <= p10_full_10;
    end


  //data_9, which is an e_mux
  assign p9_stage_9 = ((full_10 & ~clear_fifo) == 0)? data_in :
    stage_10;

  //data_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_9 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_9))
          if (sync_reset & full_9 & !((full_10 == 0) & read & write))
              stage_9 <= 0;
          else 
            stage_9 <= p9_stage_9;
    end


  //control_9, which is an e_mux
  assign p9_full_9 = ((read & !write) == 0)? full_8 :
    full_10;

  //control_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_9 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_9 <= 0;
          else 
            full_9 <= p9_full_9;
    end


  //data_8, which is an e_mux
  assign p8_stage_8 = ((full_9 & ~clear_fifo) == 0)? data_in :
    stage_9;

  //data_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_8 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_8))
          if (sync_reset & full_8 & !((full_9 == 0) & read & write))
              stage_8 <= 0;
          else 
            stage_8 <= p8_stage_8;
    end


  //control_8, which is an e_mux
  assign p8_full_8 = ((read & !write) == 0)? full_7 :
    full_9;

  //control_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_8 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_8 <= 0;
          else 
            full_8 <= p8_full_8;
    end


  //data_7, which is an e_mux
  assign p7_stage_7 = ((full_8 & ~clear_fifo) == 0)? data_in :
    stage_8;

  //data_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_7 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_7))
          if (sync_reset & full_7 & !((full_8 == 0) & read & write))
              stage_7 <= 0;
          else 
            stage_7 <= p7_stage_7;
    end


  //control_7, which is an e_mux
  assign p7_full_7 = ((read & !write) == 0)? full_6 :
    full_8;

  //control_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_7 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_7 <= 0;
          else 
            full_7 <= p7_full_7;
    end


  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    stage_7;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    full_7;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module slow_peripheral_bridge_s1_arbitrator (
                                              // inputs:
                                               clk,
                                               cpu_data_master_address_to_slave,
                                               cpu_data_master_byteenable,
                                               cpu_data_master_latency_counter,
                                               cpu_data_master_read,
                                               cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register,
                                               cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register,
                                               cpu_data_master_write,
                                               cpu_data_master_writedata,
                                               reset_n,
                                               slow_peripheral_bridge_s1_endofpacket,
                                               slow_peripheral_bridge_s1_readdata,
                                               slow_peripheral_bridge_s1_readdatavalid,
                                               slow_peripheral_bridge_s1_waitrequest,

                                              // outputs:
                                               cpu_data_master_granted_slow_peripheral_bridge_s1,
                                               cpu_data_master_qualified_request_slow_peripheral_bridge_s1,
                                               cpu_data_master_read_data_valid_slow_peripheral_bridge_s1,
                                               cpu_data_master_read_data_valid_slow_peripheral_bridge_s1_shift_register,
                                               cpu_data_master_requests_slow_peripheral_bridge_s1,
                                               d1_slow_peripheral_bridge_s1_end_xfer,
                                               slow_peripheral_bridge_s1_address,
                                               slow_peripheral_bridge_s1_byteenable,
                                               slow_peripheral_bridge_s1_endofpacket_from_sa,
                                               slow_peripheral_bridge_s1_nativeaddress,
                                               slow_peripheral_bridge_s1_read,
                                               slow_peripheral_bridge_s1_readdata_from_sa,
                                               slow_peripheral_bridge_s1_reset_n,
                                               slow_peripheral_bridge_s1_waitrequest_from_sa,
                                               slow_peripheral_bridge_s1_write,
                                               slow_peripheral_bridge_s1_writedata
                                            )
;

  output           cpu_data_master_granted_slow_peripheral_bridge_s1;
  output           cpu_data_master_qualified_request_slow_peripheral_bridge_s1;
  output           cpu_data_master_read_data_valid_slow_peripheral_bridge_s1;
  output           cpu_data_master_read_data_valid_slow_peripheral_bridge_s1_shift_register;
  output           cpu_data_master_requests_slow_peripheral_bridge_s1;
  output           d1_slow_peripheral_bridge_s1_end_xfer;
  output  [  6: 0] slow_peripheral_bridge_s1_address;
  output  [  3: 0] slow_peripheral_bridge_s1_byteenable;
  output           slow_peripheral_bridge_s1_endofpacket_from_sa;
  output  [  6: 0] slow_peripheral_bridge_s1_nativeaddress;
  output           slow_peripheral_bridge_s1_read;
  output  [ 31: 0] slow_peripheral_bridge_s1_readdata_from_sa;
  output           slow_peripheral_bridge_s1_reset_n;
  output           slow_peripheral_bridge_s1_waitrequest_from_sa;
  output           slow_peripheral_bridge_s1_write;
  output  [ 31: 0] slow_peripheral_bridge_s1_writedata;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register;
  input            cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;
  input            slow_peripheral_bridge_s1_endofpacket;
  input   [ 31: 0] slow_peripheral_bridge_s1_readdata;
  input            slow_peripheral_bridge_s1_readdatavalid;
  input            slow_peripheral_bridge_s1_waitrequest;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_slow_peripheral_bridge_s1;
  wire             cpu_data_master_qualified_request_slow_peripheral_bridge_s1;
  wire             cpu_data_master_rdv_fifo_empty_slow_peripheral_bridge_s1;
  wire             cpu_data_master_rdv_fifo_output_from_slow_peripheral_bridge_s1;
  wire             cpu_data_master_read_data_valid_slow_peripheral_bridge_s1;
  wire             cpu_data_master_read_data_valid_slow_peripheral_bridge_s1_shift_register;
  wire             cpu_data_master_requests_slow_peripheral_bridge_s1;
  wire             cpu_data_master_saved_grant_slow_peripheral_bridge_s1;
  reg              d1_reasons_to_wait;
  reg              d1_slow_peripheral_bridge_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_slow_peripheral_bridge_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 27: 0] shifted_address_to_slow_peripheral_bridge_s1_from_cpu_data_master;
  wire    [  6: 0] slow_peripheral_bridge_s1_address;
  wire             slow_peripheral_bridge_s1_allgrants;
  wire             slow_peripheral_bridge_s1_allow_new_arb_cycle;
  wire             slow_peripheral_bridge_s1_any_bursting_master_saved_grant;
  wire             slow_peripheral_bridge_s1_any_continuerequest;
  wire             slow_peripheral_bridge_s1_arb_counter_enable;
  reg     [  3: 0] slow_peripheral_bridge_s1_arb_share_counter;
  wire    [  3: 0] slow_peripheral_bridge_s1_arb_share_counter_next_value;
  wire    [  3: 0] slow_peripheral_bridge_s1_arb_share_set_values;
  wire             slow_peripheral_bridge_s1_beginbursttransfer_internal;
  wire             slow_peripheral_bridge_s1_begins_xfer;
  wire    [  3: 0] slow_peripheral_bridge_s1_byteenable;
  wire             slow_peripheral_bridge_s1_end_xfer;
  wire             slow_peripheral_bridge_s1_endofpacket_from_sa;
  wire             slow_peripheral_bridge_s1_firsttransfer;
  wire             slow_peripheral_bridge_s1_grant_vector;
  wire             slow_peripheral_bridge_s1_in_a_read_cycle;
  wire             slow_peripheral_bridge_s1_in_a_write_cycle;
  wire             slow_peripheral_bridge_s1_master_qreq_vector;
  wire             slow_peripheral_bridge_s1_move_on_to_next_transaction;
  wire    [  6: 0] slow_peripheral_bridge_s1_nativeaddress;
  wire             slow_peripheral_bridge_s1_non_bursting_master_requests;
  wire             slow_peripheral_bridge_s1_read;
  wire    [ 31: 0] slow_peripheral_bridge_s1_readdata_from_sa;
  wire             slow_peripheral_bridge_s1_readdatavalid_from_sa;
  reg              slow_peripheral_bridge_s1_reg_firsttransfer;
  wire             slow_peripheral_bridge_s1_reset_n;
  reg              slow_peripheral_bridge_s1_slavearbiterlockenable;
  wire             slow_peripheral_bridge_s1_slavearbiterlockenable2;
  wire             slow_peripheral_bridge_s1_unreg_firsttransfer;
  wire             slow_peripheral_bridge_s1_waitrequest_from_sa;
  wire             slow_peripheral_bridge_s1_waits_for_read;
  wire             slow_peripheral_bridge_s1_waits_for_write;
  wire             slow_peripheral_bridge_s1_write;
  wire    [ 31: 0] slow_peripheral_bridge_s1_writedata;
  wire             wait_for_slow_peripheral_bridge_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~slow_peripheral_bridge_s1_end_xfer;
    end


  assign slow_peripheral_bridge_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_slow_peripheral_bridge_s1));
  //assign slow_peripheral_bridge_s1_readdatavalid_from_sa = slow_peripheral_bridge_s1_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign slow_peripheral_bridge_s1_readdatavalid_from_sa = slow_peripheral_bridge_s1_readdatavalid;

  //assign slow_peripheral_bridge_s1_readdata_from_sa = slow_peripheral_bridge_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign slow_peripheral_bridge_s1_readdata_from_sa = slow_peripheral_bridge_s1_readdata;

  assign cpu_data_master_requests_slow_peripheral_bridge_s1 = ({cpu_data_master_address_to_slave[27 : 9] , 9'b0} == 28'h8000000) & (cpu_data_master_read | cpu_data_master_write);
  //assign slow_peripheral_bridge_s1_waitrequest_from_sa = slow_peripheral_bridge_s1_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign slow_peripheral_bridge_s1_waitrequest_from_sa = slow_peripheral_bridge_s1_waitrequest;

  //slow_peripheral_bridge_s1_arb_share_counter set values, which is an e_mux
  assign slow_peripheral_bridge_s1_arb_share_set_values = (cpu_data_master_granted_slow_peripheral_bridge_s1)? 8 :
    1;

  //slow_peripheral_bridge_s1_non_bursting_master_requests mux, which is an e_mux
  assign slow_peripheral_bridge_s1_non_bursting_master_requests = cpu_data_master_requests_slow_peripheral_bridge_s1;

  //slow_peripheral_bridge_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign slow_peripheral_bridge_s1_any_bursting_master_saved_grant = 0;

  //slow_peripheral_bridge_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign slow_peripheral_bridge_s1_arb_share_counter_next_value = slow_peripheral_bridge_s1_firsttransfer ? (slow_peripheral_bridge_s1_arb_share_set_values - 1) : |slow_peripheral_bridge_s1_arb_share_counter ? (slow_peripheral_bridge_s1_arb_share_counter - 1) : 0;

  //slow_peripheral_bridge_s1_allgrants all slave grants, which is an e_mux
  assign slow_peripheral_bridge_s1_allgrants = |slow_peripheral_bridge_s1_grant_vector;

  //slow_peripheral_bridge_s1_end_xfer assignment, which is an e_assign
  assign slow_peripheral_bridge_s1_end_xfer = ~(slow_peripheral_bridge_s1_waits_for_read | slow_peripheral_bridge_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_slow_peripheral_bridge_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_slow_peripheral_bridge_s1 = slow_peripheral_bridge_s1_end_xfer & (~slow_peripheral_bridge_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //slow_peripheral_bridge_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign slow_peripheral_bridge_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_slow_peripheral_bridge_s1 & slow_peripheral_bridge_s1_allgrants) | (end_xfer_arb_share_counter_term_slow_peripheral_bridge_s1 & ~slow_peripheral_bridge_s1_non_bursting_master_requests);

  //slow_peripheral_bridge_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          slow_peripheral_bridge_s1_arb_share_counter <= 0;
      else if (slow_peripheral_bridge_s1_arb_counter_enable)
          slow_peripheral_bridge_s1_arb_share_counter <= slow_peripheral_bridge_s1_arb_share_counter_next_value;
    end


  //slow_peripheral_bridge_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          slow_peripheral_bridge_s1_slavearbiterlockenable <= 0;
      else if ((|slow_peripheral_bridge_s1_master_qreq_vector & end_xfer_arb_share_counter_term_slow_peripheral_bridge_s1) | (end_xfer_arb_share_counter_term_slow_peripheral_bridge_s1 & ~slow_peripheral_bridge_s1_non_bursting_master_requests))
          slow_peripheral_bridge_s1_slavearbiterlockenable <= |slow_peripheral_bridge_s1_arb_share_counter_next_value;
    end


  //cpu/data_master slow_peripheral_bridge/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = slow_peripheral_bridge_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //slow_peripheral_bridge_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign slow_peripheral_bridge_s1_slavearbiterlockenable2 = |slow_peripheral_bridge_s1_arb_share_counter_next_value;

  //cpu/data_master slow_peripheral_bridge/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = slow_peripheral_bridge_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //slow_peripheral_bridge_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign slow_peripheral_bridge_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_slow_peripheral_bridge_s1 = cpu_data_master_requests_slow_peripheral_bridge_s1 & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0) | (1 < cpu_data_master_latency_counter) | (|cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register) | (|cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register))));
  //unique name for slow_peripheral_bridge_s1_move_on_to_next_transaction, which is an e_assign
  assign slow_peripheral_bridge_s1_move_on_to_next_transaction = slow_peripheral_bridge_s1_readdatavalid_from_sa;

  //rdv_fifo_for_cpu_data_master_to_slow_peripheral_bridge_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_data_master_to_slow_peripheral_bridge_s1_module rdv_fifo_for_cpu_data_master_to_slow_peripheral_bridge_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_data_master_granted_slow_peripheral_bridge_s1),
      .data_out             (cpu_data_master_rdv_fifo_output_from_slow_peripheral_bridge_s1),
      .empty                (),
      .fifo_contains_ones_n (cpu_data_master_rdv_fifo_empty_slow_peripheral_bridge_s1),
      .full                 (),
      .read                 (slow_peripheral_bridge_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~slow_peripheral_bridge_s1_waits_for_read)
    );

  assign cpu_data_master_read_data_valid_slow_peripheral_bridge_s1_shift_register = ~cpu_data_master_rdv_fifo_empty_slow_peripheral_bridge_s1;
  //local readdatavalid cpu_data_master_read_data_valid_slow_peripheral_bridge_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_slow_peripheral_bridge_s1 = slow_peripheral_bridge_s1_readdatavalid_from_sa;

  //slow_peripheral_bridge_s1_writedata mux, which is an e_mux
  assign slow_peripheral_bridge_s1_writedata = cpu_data_master_writedata;

  //assign slow_peripheral_bridge_s1_endofpacket_from_sa = slow_peripheral_bridge_s1_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign slow_peripheral_bridge_s1_endofpacket_from_sa = slow_peripheral_bridge_s1_endofpacket;

  //master is always granted when requested
  assign cpu_data_master_granted_slow_peripheral_bridge_s1 = cpu_data_master_qualified_request_slow_peripheral_bridge_s1;

  //cpu/data_master saved-grant slow_peripheral_bridge/s1, which is an e_assign
  assign cpu_data_master_saved_grant_slow_peripheral_bridge_s1 = cpu_data_master_requests_slow_peripheral_bridge_s1;

  //allow new arb cycle for slow_peripheral_bridge/s1, which is an e_assign
  assign slow_peripheral_bridge_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign slow_peripheral_bridge_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign slow_peripheral_bridge_s1_master_qreq_vector = 1;

  //slow_peripheral_bridge_s1_reset_n assignment, which is an e_assign
  assign slow_peripheral_bridge_s1_reset_n = reset_n;

  //slow_peripheral_bridge_s1_firsttransfer first transaction, which is an e_assign
  assign slow_peripheral_bridge_s1_firsttransfer = slow_peripheral_bridge_s1_begins_xfer ? slow_peripheral_bridge_s1_unreg_firsttransfer : slow_peripheral_bridge_s1_reg_firsttransfer;

  //slow_peripheral_bridge_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign slow_peripheral_bridge_s1_unreg_firsttransfer = ~(slow_peripheral_bridge_s1_slavearbiterlockenable & slow_peripheral_bridge_s1_any_continuerequest);

  //slow_peripheral_bridge_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          slow_peripheral_bridge_s1_reg_firsttransfer <= 1'b1;
      else if (slow_peripheral_bridge_s1_begins_xfer)
          slow_peripheral_bridge_s1_reg_firsttransfer <= slow_peripheral_bridge_s1_unreg_firsttransfer;
    end


  //slow_peripheral_bridge_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign slow_peripheral_bridge_s1_beginbursttransfer_internal = slow_peripheral_bridge_s1_begins_xfer;

  //slow_peripheral_bridge_s1_read assignment, which is an e_mux
  assign slow_peripheral_bridge_s1_read = cpu_data_master_granted_slow_peripheral_bridge_s1 & cpu_data_master_read;

  //slow_peripheral_bridge_s1_write assignment, which is an e_mux
  assign slow_peripheral_bridge_s1_write = cpu_data_master_granted_slow_peripheral_bridge_s1 & cpu_data_master_write;

  assign shifted_address_to_slow_peripheral_bridge_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //slow_peripheral_bridge_s1_address mux, which is an e_mux
  assign slow_peripheral_bridge_s1_address = shifted_address_to_slow_peripheral_bridge_s1_from_cpu_data_master >> 2;

  //slaveid slow_peripheral_bridge_s1_nativeaddress nativeaddress mux, which is an e_mux
  assign slow_peripheral_bridge_s1_nativeaddress = cpu_data_master_address_to_slave >> 2;

  //d1_slow_peripheral_bridge_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_slow_peripheral_bridge_s1_end_xfer <= 1;
      else if (1)
          d1_slow_peripheral_bridge_s1_end_xfer <= slow_peripheral_bridge_s1_end_xfer;
    end


  //slow_peripheral_bridge_s1_waits_for_read in a cycle, which is an e_mux
  assign slow_peripheral_bridge_s1_waits_for_read = slow_peripheral_bridge_s1_in_a_read_cycle & slow_peripheral_bridge_s1_waitrequest_from_sa;

  //slow_peripheral_bridge_s1_in_a_read_cycle assignment, which is an e_assign
  assign slow_peripheral_bridge_s1_in_a_read_cycle = cpu_data_master_granted_slow_peripheral_bridge_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = slow_peripheral_bridge_s1_in_a_read_cycle;

  //slow_peripheral_bridge_s1_waits_for_write in a cycle, which is an e_mux
  assign slow_peripheral_bridge_s1_waits_for_write = slow_peripheral_bridge_s1_in_a_write_cycle & slow_peripheral_bridge_s1_waitrequest_from_sa;

  //slow_peripheral_bridge_s1_in_a_write_cycle assignment, which is an e_assign
  assign slow_peripheral_bridge_s1_in_a_write_cycle = cpu_data_master_granted_slow_peripheral_bridge_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = slow_peripheral_bridge_s1_in_a_write_cycle;

  assign wait_for_slow_peripheral_bridge_s1_counter = 0;
  //slow_peripheral_bridge_s1_byteenable byte enable port mux, which is an e_mux
  assign slow_peripheral_bridge_s1_byteenable = (cpu_data_master_granted_slow_peripheral_bridge_s1)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //slow_peripheral_bridge/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module slow_peripheral_bridge_m1_arbitrator (
                                              // inputs:
                                               button_pio_s1_readdata_from_sa,
                                               clk,
                                               cycloneIII_3c25_niosII_standard_sopc_clock_0_in_endofpacket_from_sa,
                                               cycloneIII_3c25_niosII_standard_sopc_clock_0_in_readdata_from_sa,
                                               cycloneIII_3c25_niosII_standard_sopc_clock_0_in_waitrequest_from_sa,
                                               cycloneIII_3c25_niosII_standard_sopc_clock_1_in_endofpacket_from_sa,
                                               cycloneIII_3c25_niosII_standard_sopc_clock_1_in_readdata_from_sa,
                                               cycloneIII_3c25_niosII_standard_sopc_clock_1_in_waitrequest_from_sa,
                                               d1_button_pio_s1_end_xfer,
                                               d1_cycloneIII_3c25_niosII_standard_sopc_clock_0_in_end_xfer,
                                               d1_cycloneIII_3c25_niosII_standard_sopc_clock_1_in_end_xfer,
                                               d1_high_res_timer_s1_end_xfer,
                                               d1_jtag_uart_avalon_jtag_slave_end_xfer,
                                               d1_led_pio_s1_end_xfer,
                                               d1_sys_clk_timer_s1_end_xfer,
                                               d1_sysid_control_slave_end_xfer,
                                               high_res_timer_s1_readdata_from_sa,
                                               jtag_uart_avalon_jtag_slave_readdata_from_sa,
                                               jtag_uart_avalon_jtag_slave_waitrequest_from_sa,
                                               reset_n,
                                               slow_peripheral_bridge_m1_address,
                                               slow_peripheral_bridge_m1_byteenable,
                                               slow_peripheral_bridge_m1_granted_button_pio_s1,
                                               slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_0_in,
                                               slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_1_in,
                                               slow_peripheral_bridge_m1_granted_high_res_timer_s1,
                                               slow_peripheral_bridge_m1_granted_jtag_uart_avalon_jtag_slave,
                                               slow_peripheral_bridge_m1_granted_led_pio_s1,
                                               slow_peripheral_bridge_m1_granted_sys_clk_timer_s1,
                                               slow_peripheral_bridge_m1_granted_sysid_control_slave,
                                               slow_peripheral_bridge_m1_qualified_request_button_pio_s1,
                                               slow_peripheral_bridge_m1_qualified_request_cycloneIII_3c25_niosII_standard_sopc_clock_0_in,
                                               slow_peripheral_bridge_m1_qualified_request_cycloneIII_3c25_niosII_standard_sopc_clock_1_in,
                                               slow_peripheral_bridge_m1_qualified_request_high_res_timer_s1,
                                               slow_peripheral_bridge_m1_qualified_request_jtag_uart_avalon_jtag_slave,
                                               slow_peripheral_bridge_m1_qualified_request_led_pio_s1,
                                               slow_peripheral_bridge_m1_qualified_request_sys_clk_timer_s1,
                                               slow_peripheral_bridge_m1_qualified_request_sysid_control_slave,
                                               slow_peripheral_bridge_m1_read,
                                               slow_peripheral_bridge_m1_read_data_valid_button_pio_s1,
                                               slow_peripheral_bridge_m1_read_data_valid_cycloneIII_3c25_niosII_standard_sopc_clock_0_in,
                                               slow_peripheral_bridge_m1_read_data_valid_cycloneIII_3c25_niosII_standard_sopc_clock_1_in,
                                               slow_peripheral_bridge_m1_read_data_valid_high_res_timer_s1,
                                               slow_peripheral_bridge_m1_read_data_valid_jtag_uart_avalon_jtag_slave,
                                               slow_peripheral_bridge_m1_read_data_valid_led_pio_s1,
                                               slow_peripheral_bridge_m1_read_data_valid_sys_clk_timer_s1,
                                               slow_peripheral_bridge_m1_read_data_valid_sysid_control_slave,
                                               slow_peripheral_bridge_m1_requests_button_pio_s1,
                                               slow_peripheral_bridge_m1_requests_cycloneIII_3c25_niosII_standard_sopc_clock_0_in,
                                               slow_peripheral_bridge_m1_requests_cycloneIII_3c25_niosII_standard_sopc_clock_1_in,
                                               slow_peripheral_bridge_m1_requests_high_res_timer_s1,
                                               slow_peripheral_bridge_m1_requests_jtag_uart_avalon_jtag_slave,
                                               slow_peripheral_bridge_m1_requests_led_pio_s1,
                                               slow_peripheral_bridge_m1_requests_sys_clk_timer_s1,
                                               slow_peripheral_bridge_m1_requests_sysid_control_slave,
                                               slow_peripheral_bridge_m1_write,
                                               slow_peripheral_bridge_m1_writedata,
                                               sys_clk_timer_s1_readdata_from_sa,
                                               sysid_control_slave_readdata_from_sa,

                                              // outputs:
                                               slow_peripheral_bridge_m1_address_to_slave,
                                               slow_peripheral_bridge_m1_endofpacket,
                                               slow_peripheral_bridge_m1_latency_counter,
                                               slow_peripheral_bridge_m1_readdata,
                                               slow_peripheral_bridge_m1_readdatavalid,
                                               slow_peripheral_bridge_m1_reset_n,
                                               slow_peripheral_bridge_m1_waitrequest
                                            )
;

  output  [  8: 0] slow_peripheral_bridge_m1_address_to_slave;
  output           slow_peripheral_bridge_m1_endofpacket;
  output           slow_peripheral_bridge_m1_latency_counter;
  output  [ 31: 0] slow_peripheral_bridge_m1_readdata;
  output           slow_peripheral_bridge_m1_readdatavalid;
  output           slow_peripheral_bridge_m1_reset_n;
  output           slow_peripheral_bridge_m1_waitrequest;
  input   [  3: 0] button_pio_s1_readdata_from_sa;
  input            clk;
  input            cycloneIII_3c25_niosII_standard_sopc_clock_0_in_endofpacket_from_sa;
  input   [ 15: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_in_readdata_from_sa;
  input            cycloneIII_3c25_niosII_standard_sopc_clock_0_in_waitrequest_from_sa;
  input            cycloneIII_3c25_niosII_standard_sopc_clock_1_in_endofpacket_from_sa;
  input   [ 31: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_in_readdata_from_sa;
  input            cycloneIII_3c25_niosII_standard_sopc_clock_1_in_waitrequest_from_sa;
  input            d1_button_pio_s1_end_xfer;
  input            d1_cycloneIII_3c25_niosII_standard_sopc_clock_0_in_end_xfer;
  input            d1_cycloneIII_3c25_niosII_standard_sopc_clock_1_in_end_xfer;
  input            d1_high_res_timer_s1_end_xfer;
  input            d1_jtag_uart_avalon_jtag_slave_end_xfer;
  input            d1_led_pio_s1_end_xfer;
  input            d1_sys_clk_timer_s1_end_xfer;
  input            d1_sysid_control_slave_end_xfer;
  input   [ 15: 0] high_res_timer_s1_readdata_from_sa;
  input   [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  input            jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  input            reset_n;
  input   [  8: 0] slow_peripheral_bridge_m1_address;
  input   [  3: 0] slow_peripheral_bridge_m1_byteenable;
  input            slow_peripheral_bridge_m1_granted_button_pio_s1;
  input            slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_0_in;
  input            slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_1_in;
  input            slow_peripheral_bridge_m1_granted_high_res_timer_s1;
  input            slow_peripheral_bridge_m1_granted_jtag_uart_avalon_jtag_slave;
  input            slow_peripheral_bridge_m1_granted_led_pio_s1;
  input            slow_peripheral_bridge_m1_granted_sys_clk_timer_s1;
  input            slow_peripheral_bridge_m1_granted_sysid_control_slave;
  input            slow_peripheral_bridge_m1_qualified_request_button_pio_s1;
  input            slow_peripheral_bridge_m1_qualified_request_cycloneIII_3c25_niosII_standard_sopc_clock_0_in;
  input            slow_peripheral_bridge_m1_qualified_request_cycloneIII_3c25_niosII_standard_sopc_clock_1_in;
  input            slow_peripheral_bridge_m1_qualified_request_high_res_timer_s1;
  input            slow_peripheral_bridge_m1_qualified_request_jtag_uart_avalon_jtag_slave;
  input            slow_peripheral_bridge_m1_qualified_request_led_pio_s1;
  input            slow_peripheral_bridge_m1_qualified_request_sys_clk_timer_s1;
  input            slow_peripheral_bridge_m1_qualified_request_sysid_control_slave;
  input            slow_peripheral_bridge_m1_read;
  input            slow_peripheral_bridge_m1_read_data_valid_button_pio_s1;
  input            slow_peripheral_bridge_m1_read_data_valid_cycloneIII_3c25_niosII_standard_sopc_clock_0_in;
  input            slow_peripheral_bridge_m1_read_data_valid_cycloneIII_3c25_niosII_standard_sopc_clock_1_in;
  input            slow_peripheral_bridge_m1_read_data_valid_high_res_timer_s1;
  input            slow_peripheral_bridge_m1_read_data_valid_jtag_uart_avalon_jtag_slave;
  input            slow_peripheral_bridge_m1_read_data_valid_led_pio_s1;
  input            slow_peripheral_bridge_m1_read_data_valid_sys_clk_timer_s1;
  input            slow_peripheral_bridge_m1_read_data_valid_sysid_control_slave;
  input            slow_peripheral_bridge_m1_requests_button_pio_s1;
  input            slow_peripheral_bridge_m1_requests_cycloneIII_3c25_niosII_standard_sopc_clock_0_in;
  input            slow_peripheral_bridge_m1_requests_cycloneIII_3c25_niosII_standard_sopc_clock_1_in;
  input            slow_peripheral_bridge_m1_requests_high_res_timer_s1;
  input            slow_peripheral_bridge_m1_requests_jtag_uart_avalon_jtag_slave;
  input            slow_peripheral_bridge_m1_requests_led_pio_s1;
  input            slow_peripheral_bridge_m1_requests_sys_clk_timer_s1;
  input            slow_peripheral_bridge_m1_requests_sysid_control_slave;
  input            slow_peripheral_bridge_m1_write;
  input   [ 31: 0] slow_peripheral_bridge_m1_writedata;
  input   [ 15: 0] sys_clk_timer_s1_readdata_from_sa;
  input   [ 31: 0] sysid_control_slave_readdata_from_sa;

  reg              active_and_waiting_last_time;
  wire             latency_load_value;
  wire             p1_slow_peripheral_bridge_m1_latency_counter;
  wire             pre_flush_slow_peripheral_bridge_m1_readdatavalid;
  wire             r_0;
  wire             r_1;
  reg     [  8: 0] slow_peripheral_bridge_m1_address_last_time;
  wire    [  8: 0] slow_peripheral_bridge_m1_address_to_slave;
  reg     [  3: 0] slow_peripheral_bridge_m1_byteenable_last_time;
  wire             slow_peripheral_bridge_m1_endofpacket;
  wire             slow_peripheral_bridge_m1_is_granted_some_slave;
  reg              slow_peripheral_bridge_m1_latency_counter;
  reg              slow_peripheral_bridge_m1_read_but_no_slave_selected;
  reg              slow_peripheral_bridge_m1_read_last_time;
  wire    [ 31: 0] slow_peripheral_bridge_m1_readdata;
  wire             slow_peripheral_bridge_m1_readdatavalid;
  wire             slow_peripheral_bridge_m1_reset_n;
  wire             slow_peripheral_bridge_m1_run;
  wire             slow_peripheral_bridge_m1_waitrequest;
  reg              slow_peripheral_bridge_m1_write_last_time;
  reg     [ 31: 0] slow_peripheral_bridge_m1_writedata_last_time;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (slow_peripheral_bridge_m1_qualified_request_button_pio_s1 | ~slow_peripheral_bridge_m1_requests_button_pio_s1) & ((~slow_peripheral_bridge_m1_qualified_request_button_pio_s1 | ~slow_peripheral_bridge_m1_read | (1 & ~d1_button_pio_s1_end_xfer & slow_peripheral_bridge_m1_read))) & ((~slow_peripheral_bridge_m1_qualified_request_button_pio_s1 | ~slow_peripheral_bridge_m1_write | (1 & slow_peripheral_bridge_m1_write))) & 1 & (slow_peripheral_bridge_m1_qualified_request_cycloneIII_3c25_niosII_standard_sopc_clock_0_in | ~slow_peripheral_bridge_m1_requests_cycloneIII_3c25_niosII_standard_sopc_clock_0_in) & ((~slow_peripheral_bridge_m1_qualified_request_cycloneIII_3c25_niosII_standard_sopc_clock_0_in | ~(slow_peripheral_bridge_m1_read | slow_peripheral_bridge_m1_write) | (1 & ~cycloneIII_3c25_niosII_standard_sopc_clock_0_in_waitrequest_from_sa & (slow_peripheral_bridge_m1_read | slow_peripheral_bridge_m1_write)))) & ((~slow_peripheral_bridge_m1_qualified_request_cycloneIII_3c25_niosII_standard_sopc_clock_0_in | ~(slow_peripheral_bridge_m1_read | slow_peripheral_bridge_m1_write) | (1 & ~cycloneIII_3c25_niosII_standard_sopc_clock_0_in_waitrequest_from_sa & (slow_peripheral_bridge_m1_read | slow_peripheral_bridge_m1_write)))) & 1 & (slow_peripheral_bridge_m1_qualified_request_cycloneIII_3c25_niosII_standard_sopc_clock_1_in | ~slow_peripheral_bridge_m1_requests_cycloneIII_3c25_niosII_standard_sopc_clock_1_in) & ((~slow_peripheral_bridge_m1_qualified_request_cycloneIII_3c25_niosII_standard_sopc_clock_1_in | ~(slow_peripheral_bridge_m1_read | slow_peripheral_bridge_m1_write) | (1 & ~cycloneIII_3c25_niosII_standard_sopc_clock_1_in_waitrequest_from_sa & (slow_peripheral_bridge_m1_read | slow_peripheral_bridge_m1_write)))) & ((~slow_peripheral_bridge_m1_qualified_request_cycloneIII_3c25_niosII_standard_sopc_clock_1_in | ~(slow_peripheral_bridge_m1_read | slow_peripheral_bridge_m1_write) | (1 & ~cycloneIII_3c25_niosII_standard_sopc_clock_1_in_waitrequest_from_sa & (slow_peripheral_bridge_m1_read | slow_peripheral_bridge_m1_write)))) & 1 & (slow_peripheral_bridge_m1_qualified_request_high_res_timer_s1 | ~slow_peripheral_bridge_m1_requests_high_res_timer_s1) & ((~slow_peripheral_bridge_m1_qualified_request_high_res_timer_s1 | ~slow_peripheral_bridge_m1_read | (1 & ~d1_high_res_timer_s1_end_xfer & slow_peripheral_bridge_m1_read))) & ((~slow_peripheral_bridge_m1_qualified_request_high_res_timer_s1 | ~slow_peripheral_bridge_m1_write | (1 & slow_peripheral_bridge_m1_write))) & 1 & (slow_peripheral_bridge_m1_qualified_request_jtag_uart_avalon_jtag_slave | ~slow_peripheral_bridge_m1_requests_jtag_uart_avalon_jtag_slave) & ((~slow_peripheral_bridge_m1_qualified_request_jtag_uart_avalon_jtag_slave | ~(slow_peripheral_bridge_m1_read | slow_peripheral_bridge_m1_write) | (1 & ~jtag_uart_avalon_jtag_slave_waitrequest_from_sa & (slow_peripheral_bridge_m1_read | slow_peripheral_bridge_m1_write)))) & ((~slow_peripheral_bridge_m1_qualified_request_jtag_uart_avalon_jtag_slave | ~(slow_peripheral_bridge_m1_read | slow_peripheral_bridge_m1_write) | (1 & ~jtag_uart_avalon_jtag_slave_waitrequest_from_sa & (slow_peripheral_bridge_m1_read | slow_peripheral_bridge_m1_write))));

  //cascaded wait assignment, which is an e_assign
  assign slow_peripheral_bridge_m1_run = r_0 & r_1;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & ((~slow_peripheral_bridge_m1_qualified_request_led_pio_s1 | ~slow_peripheral_bridge_m1_read | (1 & ~d1_led_pio_s1_end_xfer & slow_peripheral_bridge_m1_read))) & ((~slow_peripheral_bridge_m1_qualified_request_led_pio_s1 | ~slow_peripheral_bridge_m1_write | (1 & slow_peripheral_bridge_m1_write))) & 1 & (slow_peripheral_bridge_m1_qualified_request_sys_clk_timer_s1 | ~slow_peripheral_bridge_m1_requests_sys_clk_timer_s1) & ((~slow_peripheral_bridge_m1_qualified_request_sys_clk_timer_s1 | ~slow_peripheral_bridge_m1_read | (1 & ~d1_sys_clk_timer_s1_end_xfer & slow_peripheral_bridge_m1_read))) & ((~slow_peripheral_bridge_m1_qualified_request_sys_clk_timer_s1 | ~slow_peripheral_bridge_m1_write | (1 & slow_peripheral_bridge_m1_write))) & 1 & (slow_peripheral_bridge_m1_qualified_request_sysid_control_slave | ~slow_peripheral_bridge_m1_requests_sysid_control_slave) & ((~slow_peripheral_bridge_m1_qualified_request_sysid_control_slave | ~slow_peripheral_bridge_m1_read | (1 & ~d1_sysid_control_slave_end_xfer & slow_peripheral_bridge_m1_read))) & ((~slow_peripheral_bridge_m1_qualified_request_sysid_control_slave | ~slow_peripheral_bridge_m1_write | (1 & slow_peripheral_bridge_m1_write)));

  //optimize select-logic by passing only those address bits which matter.
  assign slow_peripheral_bridge_m1_address_to_slave = slow_peripheral_bridge_m1_address[8 : 0];

  //slow_peripheral_bridge_m1_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          slow_peripheral_bridge_m1_read_but_no_slave_selected <= 0;
      else if (1)
          slow_peripheral_bridge_m1_read_but_no_slave_selected <= slow_peripheral_bridge_m1_read & slow_peripheral_bridge_m1_run & ~slow_peripheral_bridge_m1_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign slow_peripheral_bridge_m1_is_granted_some_slave = slow_peripheral_bridge_m1_granted_button_pio_s1 |
    slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_0_in |
    slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_1_in |
    slow_peripheral_bridge_m1_granted_high_res_timer_s1 |
    slow_peripheral_bridge_m1_granted_jtag_uart_avalon_jtag_slave |
    slow_peripheral_bridge_m1_granted_led_pio_s1 |
    slow_peripheral_bridge_m1_granted_sys_clk_timer_s1 |
    slow_peripheral_bridge_m1_granted_sysid_control_slave;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_slow_peripheral_bridge_m1_readdatavalid = 0;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign slow_peripheral_bridge_m1_readdatavalid = slow_peripheral_bridge_m1_read_but_no_slave_selected |
    pre_flush_slow_peripheral_bridge_m1_readdatavalid |
    slow_peripheral_bridge_m1_read_data_valid_button_pio_s1 |
    slow_peripheral_bridge_m1_read_but_no_slave_selected |
    pre_flush_slow_peripheral_bridge_m1_readdatavalid |
    slow_peripheral_bridge_m1_read_data_valid_cycloneIII_3c25_niosII_standard_sopc_clock_0_in |
    slow_peripheral_bridge_m1_read_but_no_slave_selected |
    pre_flush_slow_peripheral_bridge_m1_readdatavalid |
    slow_peripheral_bridge_m1_read_data_valid_cycloneIII_3c25_niosII_standard_sopc_clock_1_in |
    slow_peripheral_bridge_m1_read_but_no_slave_selected |
    pre_flush_slow_peripheral_bridge_m1_readdatavalid |
    slow_peripheral_bridge_m1_read_data_valid_high_res_timer_s1 |
    slow_peripheral_bridge_m1_read_but_no_slave_selected |
    pre_flush_slow_peripheral_bridge_m1_readdatavalid |
    slow_peripheral_bridge_m1_read_data_valid_jtag_uart_avalon_jtag_slave |
    slow_peripheral_bridge_m1_read_but_no_slave_selected |
    pre_flush_slow_peripheral_bridge_m1_readdatavalid |
    slow_peripheral_bridge_m1_read_data_valid_led_pio_s1 |
    slow_peripheral_bridge_m1_read_but_no_slave_selected |
    pre_flush_slow_peripheral_bridge_m1_readdatavalid |
    slow_peripheral_bridge_m1_read_data_valid_sys_clk_timer_s1 |
    slow_peripheral_bridge_m1_read_but_no_slave_selected |
    pre_flush_slow_peripheral_bridge_m1_readdatavalid |
    slow_peripheral_bridge_m1_read_data_valid_sysid_control_slave;

  //slow_peripheral_bridge/m1 readdata mux, which is an e_mux
  assign slow_peripheral_bridge_m1_readdata = ({32 {~(slow_peripheral_bridge_m1_qualified_request_button_pio_s1 & slow_peripheral_bridge_m1_read)}} | button_pio_s1_readdata_from_sa) &
    ({32 {~(slow_peripheral_bridge_m1_qualified_request_cycloneIII_3c25_niosII_standard_sopc_clock_0_in & slow_peripheral_bridge_m1_read)}} | cycloneIII_3c25_niosII_standard_sopc_clock_0_in_readdata_from_sa) &
    ({32 {~(slow_peripheral_bridge_m1_qualified_request_cycloneIII_3c25_niosII_standard_sopc_clock_1_in & slow_peripheral_bridge_m1_read)}} | cycloneIII_3c25_niosII_standard_sopc_clock_1_in_readdata_from_sa) &
    ({32 {~(slow_peripheral_bridge_m1_qualified_request_high_res_timer_s1 & slow_peripheral_bridge_m1_read)}} | high_res_timer_s1_readdata_from_sa) &
    ({32 {~(slow_peripheral_bridge_m1_qualified_request_jtag_uart_avalon_jtag_slave & slow_peripheral_bridge_m1_read)}} | jtag_uart_avalon_jtag_slave_readdata_from_sa) &
    ({32 {~(slow_peripheral_bridge_m1_qualified_request_sys_clk_timer_s1 & slow_peripheral_bridge_m1_read)}} | sys_clk_timer_s1_readdata_from_sa) &
    ({32 {~(slow_peripheral_bridge_m1_qualified_request_sysid_control_slave & slow_peripheral_bridge_m1_read)}} | sysid_control_slave_readdata_from_sa);

  //actual waitrequest port, which is an e_assign
  assign slow_peripheral_bridge_m1_waitrequest = ~slow_peripheral_bridge_m1_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          slow_peripheral_bridge_m1_latency_counter <= 0;
      else if (1)
          slow_peripheral_bridge_m1_latency_counter <= p1_slow_peripheral_bridge_m1_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_slow_peripheral_bridge_m1_latency_counter = ((slow_peripheral_bridge_m1_run & slow_peripheral_bridge_m1_read))? latency_load_value :
    (slow_peripheral_bridge_m1_latency_counter)? slow_peripheral_bridge_m1_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = 0;

  //slow_peripheral_bridge_m1_reset_n assignment, which is an e_assign
  assign slow_peripheral_bridge_m1_reset_n = reset_n;

  //mux slow_peripheral_bridge_m1_endofpacket, which is an e_mux
  assign slow_peripheral_bridge_m1_endofpacket = (slow_peripheral_bridge_m1_requests_cycloneIII_3c25_niosII_standard_sopc_clock_0_in)? cycloneIII_3c25_niosII_standard_sopc_clock_0_in_endofpacket_from_sa :
    cycloneIII_3c25_niosII_standard_sopc_clock_1_in_endofpacket_from_sa;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //slow_peripheral_bridge_m1_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          slow_peripheral_bridge_m1_address_last_time <= 0;
      else if (1)
          slow_peripheral_bridge_m1_address_last_time <= slow_peripheral_bridge_m1_address;
    end


  //slow_peripheral_bridge/m1 waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else if (1)
          active_and_waiting_last_time <= slow_peripheral_bridge_m1_waitrequest & (slow_peripheral_bridge_m1_read | slow_peripheral_bridge_m1_write);
    end


  //slow_peripheral_bridge_m1_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (slow_peripheral_bridge_m1_address != slow_peripheral_bridge_m1_address_last_time))
        begin
          $write("%0d ns: slow_peripheral_bridge_m1_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //slow_peripheral_bridge_m1_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          slow_peripheral_bridge_m1_byteenable_last_time <= 0;
      else if (1)
          slow_peripheral_bridge_m1_byteenable_last_time <= slow_peripheral_bridge_m1_byteenable;
    end


  //slow_peripheral_bridge_m1_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (slow_peripheral_bridge_m1_byteenable != slow_peripheral_bridge_m1_byteenable_last_time))
        begin
          $write("%0d ns: slow_peripheral_bridge_m1_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //slow_peripheral_bridge_m1_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          slow_peripheral_bridge_m1_read_last_time <= 0;
      else if (1)
          slow_peripheral_bridge_m1_read_last_time <= slow_peripheral_bridge_m1_read;
    end


  //slow_peripheral_bridge_m1_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (slow_peripheral_bridge_m1_read != slow_peripheral_bridge_m1_read_last_time))
        begin
          $write("%0d ns: slow_peripheral_bridge_m1_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //slow_peripheral_bridge_m1_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          slow_peripheral_bridge_m1_write_last_time <= 0;
      else if (1)
          slow_peripheral_bridge_m1_write_last_time <= slow_peripheral_bridge_m1_write;
    end


  //slow_peripheral_bridge_m1_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (slow_peripheral_bridge_m1_write != slow_peripheral_bridge_m1_write_last_time))
        begin
          $write("%0d ns: slow_peripheral_bridge_m1_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //slow_peripheral_bridge_m1_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          slow_peripheral_bridge_m1_writedata_last_time <= 0;
      else if (1)
          slow_peripheral_bridge_m1_writedata_last_time <= slow_peripheral_bridge_m1_writedata;
    end


  //slow_peripheral_bridge_m1_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (slow_peripheral_bridge_m1_writedata != slow_peripheral_bridge_m1_writedata_last_time) & slow_peripheral_bridge_m1_write)
        begin
          $write("%0d ns: slow_peripheral_bridge_m1_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module slow_peripheral_bridge_bridge_arbitrator 
;



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sys_clk_timer_s1_arbitrator (
                                     // inputs:
                                      clk,
                                      reset_n,
                                      slow_peripheral_bridge_m1_address_to_slave,
                                      slow_peripheral_bridge_m1_latency_counter,
                                      slow_peripheral_bridge_m1_nativeaddress,
                                      slow_peripheral_bridge_m1_read,
                                      slow_peripheral_bridge_m1_write,
                                      slow_peripheral_bridge_m1_writedata,
                                      sys_clk_timer_s1_irq,
                                      sys_clk_timer_s1_readdata,

                                     // outputs:
                                      d1_sys_clk_timer_s1_end_xfer,
                                      slow_peripheral_bridge_m1_granted_sys_clk_timer_s1,
                                      slow_peripheral_bridge_m1_qualified_request_sys_clk_timer_s1,
                                      slow_peripheral_bridge_m1_read_data_valid_sys_clk_timer_s1,
                                      slow_peripheral_bridge_m1_requests_sys_clk_timer_s1,
                                      sys_clk_timer_s1_address,
                                      sys_clk_timer_s1_chipselect,
                                      sys_clk_timer_s1_irq_from_sa,
                                      sys_clk_timer_s1_readdata_from_sa,
                                      sys_clk_timer_s1_reset_n,
                                      sys_clk_timer_s1_write_n,
                                      sys_clk_timer_s1_writedata
                                   )
;

  output           d1_sys_clk_timer_s1_end_xfer;
  output           slow_peripheral_bridge_m1_granted_sys_clk_timer_s1;
  output           slow_peripheral_bridge_m1_qualified_request_sys_clk_timer_s1;
  output           slow_peripheral_bridge_m1_read_data_valid_sys_clk_timer_s1;
  output           slow_peripheral_bridge_m1_requests_sys_clk_timer_s1;
  output  [  2: 0] sys_clk_timer_s1_address;
  output           sys_clk_timer_s1_chipselect;
  output           sys_clk_timer_s1_irq_from_sa;
  output  [ 15: 0] sys_clk_timer_s1_readdata_from_sa;
  output           sys_clk_timer_s1_reset_n;
  output           sys_clk_timer_s1_write_n;
  output  [ 15: 0] sys_clk_timer_s1_writedata;
  input            clk;
  input            reset_n;
  input   [  8: 0] slow_peripheral_bridge_m1_address_to_slave;
  input            slow_peripheral_bridge_m1_latency_counter;
  input   [  6: 0] slow_peripheral_bridge_m1_nativeaddress;
  input            slow_peripheral_bridge_m1_read;
  input            slow_peripheral_bridge_m1_write;
  input   [ 31: 0] slow_peripheral_bridge_m1_writedata;
  input            sys_clk_timer_s1_irq;
  input   [ 15: 0] sys_clk_timer_s1_readdata;

  reg              d1_reasons_to_wait;
  reg              d1_sys_clk_timer_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sys_clk_timer_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             slow_peripheral_bridge_m1_arbiterlock;
  wire             slow_peripheral_bridge_m1_arbiterlock2;
  wire             slow_peripheral_bridge_m1_continuerequest;
  wire             slow_peripheral_bridge_m1_granted_sys_clk_timer_s1;
  wire             slow_peripheral_bridge_m1_qualified_request_sys_clk_timer_s1;
  wire             slow_peripheral_bridge_m1_read_data_valid_sys_clk_timer_s1;
  wire             slow_peripheral_bridge_m1_requests_sys_clk_timer_s1;
  wire             slow_peripheral_bridge_m1_saved_grant_sys_clk_timer_s1;
  wire    [  2: 0] sys_clk_timer_s1_address;
  wire             sys_clk_timer_s1_allgrants;
  wire             sys_clk_timer_s1_allow_new_arb_cycle;
  wire             sys_clk_timer_s1_any_bursting_master_saved_grant;
  wire             sys_clk_timer_s1_any_continuerequest;
  wire             sys_clk_timer_s1_arb_counter_enable;
  reg              sys_clk_timer_s1_arb_share_counter;
  wire             sys_clk_timer_s1_arb_share_counter_next_value;
  wire             sys_clk_timer_s1_arb_share_set_values;
  wire             sys_clk_timer_s1_beginbursttransfer_internal;
  wire             sys_clk_timer_s1_begins_xfer;
  wire             sys_clk_timer_s1_chipselect;
  wire             sys_clk_timer_s1_end_xfer;
  wire             sys_clk_timer_s1_firsttransfer;
  wire             sys_clk_timer_s1_grant_vector;
  wire             sys_clk_timer_s1_in_a_read_cycle;
  wire             sys_clk_timer_s1_in_a_write_cycle;
  wire             sys_clk_timer_s1_irq_from_sa;
  wire             sys_clk_timer_s1_master_qreq_vector;
  wire             sys_clk_timer_s1_non_bursting_master_requests;
  wire    [ 15: 0] sys_clk_timer_s1_readdata_from_sa;
  reg              sys_clk_timer_s1_reg_firsttransfer;
  wire             sys_clk_timer_s1_reset_n;
  reg              sys_clk_timer_s1_slavearbiterlockenable;
  wire             sys_clk_timer_s1_slavearbiterlockenable2;
  wire             sys_clk_timer_s1_unreg_firsttransfer;
  wire             sys_clk_timer_s1_waits_for_read;
  wire             sys_clk_timer_s1_waits_for_write;
  wire             sys_clk_timer_s1_write_n;
  wire    [ 15: 0] sys_clk_timer_s1_writedata;
  wire             wait_for_sys_clk_timer_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~sys_clk_timer_s1_end_xfer;
    end


  assign sys_clk_timer_s1_begins_xfer = ~d1_reasons_to_wait & ((slow_peripheral_bridge_m1_qualified_request_sys_clk_timer_s1));
  //assign sys_clk_timer_s1_readdata_from_sa = sys_clk_timer_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sys_clk_timer_s1_readdata_from_sa = sys_clk_timer_s1_readdata;

  assign slow_peripheral_bridge_m1_requests_sys_clk_timer_s1 = ({slow_peripheral_bridge_m1_address_to_slave[8 : 5] , 5'b0} == 9'h160) & (slow_peripheral_bridge_m1_read | slow_peripheral_bridge_m1_write);
  //sys_clk_timer_s1_arb_share_counter set values, which is an e_mux
  assign sys_clk_timer_s1_arb_share_set_values = 1;

  //sys_clk_timer_s1_non_bursting_master_requests mux, which is an e_mux
  assign sys_clk_timer_s1_non_bursting_master_requests = slow_peripheral_bridge_m1_requests_sys_clk_timer_s1;

  //sys_clk_timer_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign sys_clk_timer_s1_any_bursting_master_saved_grant = 0;

  //sys_clk_timer_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign sys_clk_timer_s1_arb_share_counter_next_value = sys_clk_timer_s1_firsttransfer ? (sys_clk_timer_s1_arb_share_set_values - 1) : |sys_clk_timer_s1_arb_share_counter ? (sys_clk_timer_s1_arb_share_counter - 1) : 0;

  //sys_clk_timer_s1_allgrants all slave grants, which is an e_mux
  assign sys_clk_timer_s1_allgrants = |sys_clk_timer_s1_grant_vector;

  //sys_clk_timer_s1_end_xfer assignment, which is an e_assign
  assign sys_clk_timer_s1_end_xfer = ~(sys_clk_timer_s1_waits_for_read | sys_clk_timer_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_sys_clk_timer_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sys_clk_timer_s1 = sys_clk_timer_s1_end_xfer & (~sys_clk_timer_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sys_clk_timer_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign sys_clk_timer_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_sys_clk_timer_s1 & sys_clk_timer_s1_allgrants) | (end_xfer_arb_share_counter_term_sys_clk_timer_s1 & ~sys_clk_timer_s1_non_bursting_master_requests);

  //sys_clk_timer_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sys_clk_timer_s1_arb_share_counter <= 0;
      else if (sys_clk_timer_s1_arb_counter_enable)
          sys_clk_timer_s1_arb_share_counter <= sys_clk_timer_s1_arb_share_counter_next_value;
    end


  //sys_clk_timer_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sys_clk_timer_s1_slavearbiterlockenable <= 0;
      else if ((|sys_clk_timer_s1_master_qreq_vector & end_xfer_arb_share_counter_term_sys_clk_timer_s1) | (end_xfer_arb_share_counter_term_sys_clk_timer_s1 & ~sys_clk_timer_s1_non_bursting_master_requests))
          sys_clk_timer_s1_slavearbiterlockenable <= |sys_clk_timer_s1_arb_share_counter_next_value;
    end


  //slow_peripheral_bridge/m1 sys_clk_timer/s1 arbiterlock, which is an e_assign
  assign slow_peripheral_bridge_m1_arbiterlock = sys_clk_timer_s1_slavearbiterlockenable & slow_peripheral_bridge_m1_continuerequest;

  //sys_clk_timer_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sys_clk_timer_s1_slavearbiterlockenable2 = |sys_clk_timer_s1_arb_share_counter_next_value;

  //slow_peripheral_bridge/m1 sys_clk_timer/s1 arbiterlock2, which is an e_assign
  assign slow_peripheral_bridge_m1_arbiterlock2 = sys_clk_timer_s1_slavearbiterlockenable2 & slow_peripheral_bridge_m1_continuerequest;

  //sys_clk_timer_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sys_clk_timer_s1_any_continuerequest = 1;

  //slow_peripheral_bridge_m1_continuerequest continued request, which is an e_assign
  assign slow_peripheral_bridge_m1_continuerequest = 1;

  assign slow_peripheral_bridge_m1_qualified_request_sys_clk_timer_s1 = slow_peripheral_bridge_m1_requests_sys_clk_timer_s1 & ~((slow_peripheral_bridge_m1_read & ((slow_peripheral_bridge_m1_latency_counter != 0))));
  //local readdatavalid slow_peripheral_bridge_m1_read_data_valid_sys_clk_timer_s1, which is an e_mux
  assign slow_peripheral_bridge_m1_read_data_valid_sys_clk_timer_s1 = slow_peripheral_bridge_m1_granted_sys_clk_timer_s1 & slow_peripheral_bridge_m1_read & ~sys_clk_timer_s1_waits_for_read;

  //sys_clk_timer_s1_writedata mux, which is an e_mux
  assign sys_clk_timer_s1_writedata = slow_peripheral_bridge_m1_writedata;

  //master is always granted when requested
  assign slow_peripheral_bridge_m1_granted_sys_clk_timer_s1 = slow_peripheral_bridge_m1_qualified_request_sys_clk_timer_s1;

  //slow_peripheral_bridge/m1 saved-grant sys_clk_timer/s1, which is an e_assign
  assign slow_peripheral_bridge_m1_saved_grant_sys_clk_timer_s1 = slow_peripheral_bridge_m1_requests_sys_clk_timer_s1;

  //allow new arb cycle for sys_clk_timer/s1, which is an e_assign
  assign sys_clk_timer_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sys_clk_timer_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sys_clk_timer_s1_master_qreq_vector = 1;

  //sys_clk_timer_s1_reset_n assignment, which is an e_assign
  assign sys_clk_timer_s1_reset_n = reset_n;

  assign sys_clk_timer_s1_chipselect = slow_peripheral_bridge_m1_granted_sys_clk_timer_s1;
  //sys_clk_timer_s1_firsttransfer first transaction, which is an e_assign
  assign sys_clk_timer_s1_firsttransfer = sys_clk_timer_s1_begins_xfer ? sys_clk_timer_s1_unreg_firsttransfer : sys_clk_timer_s1_reg_firsttransfer;

  //sys_clk_timer_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign sys_clk_timer_s1_unreg_firsttransfer = ~(sys_clk_timer_s1_slavearbiterlockenable & sys_clk_timer_s1_any_continuerequest);

  //sys_clk_timer_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sys_clk_timer_s1_reg_firsttransfer <= 1'b1;
      else if (sys_clk_timer_s1_begins_xfer)
          sys_clk_timer_s1_reg_firsttransfer <= sys_clk_timer_s1_unreg_firsttransfer;
    end


  //sys_clk_timer_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sys_clk_timer_s1_beginbursttransfer_internal = sys_clk_timer_s1_begins_xfer;

  //~sys_clk_timer_s1_write_n assignment, which is an e_mux
  assign sys_clk_timer_s1_write_n = ~(slow_peripheral_bridge_m1_granted_sys_clk_timer_s1 & slow_peripheral_bridge_m1_write);

  //sys_clk_timer_s1_address mux, which is an e_mux
  assign sys_clk_timer_s1_address = slow_peripheral_bridge_m1_nativeaddress;

  //d1_sys_clk_timer_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sys_clk_timer_s1_end_xfer <= 1;
      else if (1)
          d1_sys_clk_timer_s1_end_xfer <= sys_clk_timer_s1_end_xfer;
    end


  //sys_clk_timer_s1_waits_for_read in a cycle, which is an e_mux
  assign sys_clk_timer_s1_waits_for_read = sys_clk_timer_s1_in_a_read_cycle & sys_clk_timer_s1_begins_xfer;

  //sys_clk_timer_s1_in_a_read_cycle assignment, which is an e_assign
  assign sys_clk_timer_s1_in_a_read_cycle = slow_peripheral_bridge_m1_granted_sys_clk_timer_s1 & slow_peripheral_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sys_clk_timer_s1_in_a_read_cycle;

  //sys_clk_timer_s1_waits_for_write in a cycle, which is an e_mux
  assign sys_clk_timer_s1_waits_for_write = sys_clk_timer_s1_in_a_write_cycle & 0;

  //sys_clk_timer_s1_in_a_write_cycle assignment, which is an e_assign
  assign sys_clk_timer_s1_in_a_write_cycle = slow_peripheral_bridge_m1_granted_sys_clk_timer_s1 & slow_peripheral_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sys_clk_timer_s1_in_a_write_cycle;

  assign wait_for_sys_clk_timer_s1_counter = 0;
  //assign sys_clk_timer_s1_irq_from_sa = sys_clk_timer_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sys_clk_timer_s1_irq_from_sa = sys_clk_timer_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sys_clk_timer/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sysid_control_slave_arbitrator (
                                        // inputs:
                                         clk,
                                         reset_n,
                                         slow_peripheral_bridge_m1_address_to_slave,
                                         slow_peripheral_bridge_m1_latency_counter,
                                         slow_peripheral_bridge_m1_nativeaddress,
                                         slow_peripheral_bridge_m1_read,
                                         slow_peripheral_bridge_m1_write,
                                         sysid_control_slave_readdata,

                                        // outputs:
                                         d1_sysid_control_slave_end_xfer,
                                         slow_peripheral_bridge_m1_granted_sysid_control_slave,
                                         slow_peripheral_bridge_m1_qualified_request_sysid_control_slave,
                                         slow_peripheral_bridge_m1_read_data_valid_sysid_control_slave,
                                         slow_peripheral_bridge_m1_requests_sysid_control_slave,
                                         sysid_control_slave_address,
                                         sysid_control_slave_readdata_from_sa
                                      )
;

  output           d1_sysid_control_slave_end_xfer;
  output           slow_peripheral_bridge_m1_granted_sysid_control_slave;
  output           slow_peripheral_bridge_m1_qualified_request_sysid_control_slave;
  output           slow_peripheral_bridge_m1_read_data_valid_sysid_control_slave;
  output           slow_peripheral_bridge_m1_requests_sysid_control_slave;
  output           sysid_control_slave_address;
  output  [ 31: 0] sysid_control_slave_readdata_from_sa;
  input            clk;
  input            reset_n;
  input   [  8: 0] slow_peripheral_bridge_m1_address_to_slave;
  input            slow_peripheral_bridge_m1_latency_counter;
  input   [  6: 0] slow_peripheral_bridge_m1_nativeaddress;
  input            slow_peripheral_bridge_m1_read;
  input            slow_peripheral_bridge_m1_write;
  input   [ 31: 0] sysid_control_slave_readdata;

  reg              d1_reasons_to_wait;
  reg              d1_sysid_control_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sysid_control_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             slow_peripheral_bridge_m1_arbiterlock;
  wire             slow_peripheral_bridge_m1_arbiterlock2;
  wire             slow_peripheral_bridge_m1_continuerequest;
  wire             slow_peripheral_bridge_m1_granted_sysid_control_slave;
  wire             slow_peripheral_bridge_m1_qualified_request_sysid_control_slave;
  wire             slow_peripheral_bridge_m1_read_data_valid_sysid_control_slave;
  wire             slow_peripheral_bridge_m1_requests_sysid_control_slave;
  wire             slow_peripheral_bridge_m1_saved_grant_sysid_control_slave;
  wire             sysid_control_slave_address;
  wire             sysid_control_slave_allgrants;
  wire             sysid_control_slave_allow_new_arb_cycle;
  wire             sysid_control_slave_any_bursting_master_saved_grant;
  wire             sysid_control_slave_any_continuerequest;
  wire             sysid_control_slave_arb_counter_enable;
  reg              sysid_control_slave_arb_share_counter;
  wire             sysid_control_slave_arb_share_counter_next_value;
  wire             sysid_control_slave_arb_share_set_values;
  wire             sysid_control_slave_beginbursttransfer_internal;
  wire             sysid_control_slave_begins_xfer;
  wire             sysid_control_slave_end_xfer;
  wire             sysid_control_slave_firsttransfer;
  wire             sysid_control_slave_grant_vector;
  wire             sysid_control_slave_in_a_read_cycle;
  wire             sysid_control_slave_in_a_write_cycle;
  wire             sysid_control_slave_master_qreq_vector;
  wire             sysid_control_slave_non_bursting_master_requests;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  reg              sysid_control_slave_reg_firsttransfer;
  reg              sysid_control_slave_slavearbiterlockenable;
  wire             sysid_control_slave_slavearbiterlockenable2;
  wire             sysid_control_slave_unreg_firsttransfer;
  wire             sysid_control_slave_waits_for_read;
  wire             sysid_control_slave_waits_for_write;
  wire             wait_for_sysid_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~sysid_control_slave_end_xfer;
    end


  assign sysid_control_slave_begins_xfer = ~d1_reasons_to_wait & ((slow_peripheral_bridge_m1_qualified_request_sysid_control_slave));
  //assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata;

  assign slow_peripheral_bridge_m1_requests_sysid_control_slave = (({slow_peripheral_bridge_m1_address_to_slave[8 : 3] , 3'b0} == 9'h1a8) & (slow_peripheral_bridge_m1_read | slow_peripheral_bridge_m1_write)) & slow_peripheral_bridge_m1_read;
  //sysid_control_slave_arb_share_counter set values, which is an e_mux
  assign sysid_control_slave_arb_share_set_values = 1;

  //sysid_control_slave_non_bursting_master_requests mux, which is an e_mux
  assign sysid_control_slave_non_bursting_master_requests = slow_peripheral_bridge_m1_requests_sysid_control_slave;

  //sysid_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign sysid_control_slave_any_bursting_master_saved_grant = 0;

  //sysid_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign sysid_control_slave_arb_share_counter_next_value = sysid_control_slave_firsttransfer ? (sysid_control_slave_arb_share_set_values - 1) : |sysid_control_slave_arb_share_counter ? (sysid_control_slave_arb_share_counter - 1) : 0;

  //sysid_control_slave_allgrants all slave grants, which is an e_mux
  assign sysid_control_slave_allgrants = |sysid_control_slave_grant_vector;

  //sysid_control_slave_end_xfer assignment, which is an e_assign
  assign sysid_control_slave_end_xfer = ~(sysid_control_slave_waits_for_read | sysid_control_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_sysid_control_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sysid_control_slave = sysid_control_slave_end_xfer & (~sysid_control_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sysid_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign sysid_control_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_sysid_control_slave & sysid_control_slave_allgrants) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests);

  //sysid_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_arb_share_counter <= 0;
      else if (sysid_control_slave_arb_counter_enable)
          sysid_control_slave_arb_share_counter <= sysid_control_slave_arb_share_counter_next_value;
    end


  //sysid_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_slavearbiterlockenable <= 0;
      else if ((|sysid_control_slave_master_qreq_vector & end_xfer_arb_share_counter_term_sysid_control_slave) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests))
          sysid_control_slave_slavearbiterlockenable <= |sysid_control_slave_arb_share_counter_next_value;
    end


  //slow_peripheral_bridge/m1 sysid/control_slave arbiterlock, which is an e_assign
  assign slow_peripheral_bridge_m1_arbiterlock = sysid_control_slave_slavearbiterlockenable & slow_peripheral_bridge_m1_continuerequest;

  //sysid_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sysid_control_slave_slavearbiterlockenable2 = |sysid_control_slave_arb_share_counter_next_value;

  //slow_peripheral_bridge/m1 sysid/control_slave arbiterlock2, which is an e_assign
  assign slow_peripheral_bridge_m1_arbiterlock2 = sysid_control_slave_slavearbiterlockenable2 & slow_peripheral_bridge_m1_continuerequest;

  //sysid_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sysid_control_slave_any_continuerequest = 1;

  //slow_peripheral_bridge_m1_continuerequest continued request, which is an e_assign
  assign slow_peripheral_bridge_m1_continuerequest = 1;

  assign slow_peripheral_bridge_m1_qualified_request_sysid_control_slave = slow_peripheral_bridge_m1_requests_sysid_control_slave & ~((slow_peripheral_bridge_m1_read & ((slow_peripheral_bridge_m1_latency_counter != 0))));
  //local readdatavalid slow_peripheral_bridge_m1_read_data_valid_sysid_control_slave, which is an e_mux
  assign slow_peripheral_bridge_m1_read_data_valid_sysid_control_slave = slow_peripheral_bridge_m1_granted_sysid_control_slave & slow_peripheral_bridge_m1_read & ~sysid_control_slave_waits_for_read;

  //master is always granted when requested
  assign slow_peripheral_bridge_m1_granted_sysid_control_slave = slow_peripheral_bridge_m1_qualified_request_sysid_control_slave;

  //slow_peripheral_bridge/m1 saved-grant sysid/control_slave, which is an e_assign
  assign slow_peripheral_bridge_m1_saved_grant_sysid_control_slave = slow_peripheral_bridge_m1_requests_sysid_control_slave;

  //allow new arb cycle for sysid/control_slave, which is an e_assign
  assign sysid_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sysid_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sysid_control_slave_master_qreq_vector = 1;

  //sysid_control_slave_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_firsttransfer = sysid_control_slave_begins_xfer ? sysid_control_slave_unreg_firsttransfer : sysid_control_slave_reg_firsttransfer;

  //sysid_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_unreg_firsttransfer = ~(sysid_control_slave_slavearbiterlockenable & sysid_control_slave_any_continuerequest);

  //sysid_control_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_reg_firsttransfer <= 1'b1;
      else if (sysid_control_slave_begins_xfer)
          sysid_control_slave_reg_firsttransfer <= sysid_control_slave_unreg_firsttransfer;
    end


  //sysid_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sysid_control_slave_beginbursttransfer_internal = sysid_control_slave_begins_xfer;

  //sysid_control_slave_address mux, which is an e_mux
  assign sysid_control_slave_address = slow_peripheral_bridge_m1_nativeaddress;

  //d1_sysid_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sysid_control_slave_end_xfer <= 1;
      else if (1)
          d1_sysid_control_slave_end_xfer <= sysid_control_slave_end_xfer;
    end


  //sysid_control_slave_waits_for_read in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_read = sysid_control_slave_in_a_read_cycle & sysid_control_slave_begins_xfer;

  //sysid_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_read_cycle = slow_peripheral_bridge_m1_granted_sysid_control_slave & slow_peripheral_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sysid_control_slave_in_a_read_cycle;

  //sysid_control_slave_waits_for_write in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_write = sysid_control_slave_in_a_write_cycle & 0;

  //sysid_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_write_cycle = slow_peripheral_bridge_m1_granted_sysid_control_slave & slow_peripheral_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sysid_control_slave_in_a_write_cycle;

  assign wait_for_sysid_control_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sysid/control_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cycloneIII_3c25_niosII_standard_sopc_reset_pll_c2_out_domain_synch_module (
                                                                                   // inputs:
                                                                                    clk,
                                                                                    data_in,
                                                                                    reset_n,

                                                                                   // outputs:
                                                                                    data_out
                                                                                 )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else if (1)
          data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else if (1)
          data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cycloneIII_3c25_niosII_standard_sopc_reset_pll_c0_out_domain_synch_module (
                                                                                   // inputs:
                                                                                    clk,
                                                                                    data_in,
                                                                                    reset_n,

                                                                                   // outputs:
                                                                                    data_out
                                                                                 )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else if (1)
          data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else if (1)
          data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cycloneIII_3c25_niosII_standard_sopc_reset_ddr_sdram_phy_clk_out_domain_synch_module (
                                                                                              // inputs:
                                                                                               clk,
                                                                                               data_in,
                                                                                               reset_n,

                                                                                              // outputs:
                                                                                               data_out
                                                                                            )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else if (1)
          data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else if (1)
          data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cycloneIII_3c25_niosII_standard_sopc_reset_pll_c3_out_domain_synch_module (
                                                                                   // inputs:
                                                                                    clk,
                                                                                    data_in,
                                                                                    reset_n,

                                                                                   // outputs:
                                                                                    data_out
                                                                                 )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else if (1)
          data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else if (1)
          data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cycloneIII_3c25_niosII_standard_sopc (
                                              // 1) global signals:
                                               clk,
                                               ddr_sdram_aux_full_rate_clk_out,
                                               ddr_sdram_aux_half_rate_clk_out,
                                               ddr_sdram_phy_clk_out,
                                               pll_c0_out,
                                               pll_c1_out,
                                               pll_c2_out,
                                               pll_c3_out,
                                               reset_n,

                                              // the_button_pio
                                               in_port_to_the_button_pio,

                                              // the_ddr_sdram
                                               global_reset_n_to_the_ddr_sdram,
                                               local_init_done_from_the_ddr_sdram,
                                               local_refresh_ack_from_the_ddr_sdram,
                                               local_wdata_req_from_the_ddr_sdram,
                                               mem_addr_from_the_ddr_sdram,
                                               mem_ba_from_the_ddr_sdram,
                                               mem_cas_n_from_the_ddr_sdram,
                                               mem_cke_from_the_ddr_sdram,
                                               mem_clk_n_to_and_from_the_ddr_sdram,
                                               mem_clk_to_and_from_the_ddr_sdram,
                                               mem_cs_n_from_the_ddr_sdram,
                                               mem_dm_from_the_ddr_sdram,
                                               mem_dq_to_and_from_the_ddr_sdram,
                                               mem_dqs_to_and_from_the_ddr_sdram,
                                               mem_ras_n_from_the_ddr_sdram,
                                               mem_we_n_from_the_ddr_sdram,
                                               reset_phy_clk_n_from_the_ddr_sdram,

                                              // the_flash_ssram_tristate_bridge_avalon_slave
                                               adsc_n_to_the_ssram,
                                               bw_n_to_the_ssram,
                                               bwe_n_to_the_ssram,
                                               chipenable1_n_to_the_ssram,
                                               flash_ssram_tristate_bridge_address,
                                               flash_ssram_tristate_bridge_data,
                                               outputenable_n_to_the_ssram,
                                               read_n_to_the_ext_flash,
                                               select_n_to_the_ext_flash,
                                               write_n_to_the_ext_flash,

                                              // the_led_pio
                                               out_port_from_the_led_pio
                                            )
;

  output           adsc_n_to_the_ssram;
  output  [  3: 0] bw_n_to_the_ssram;
  output           bwe_n_to_the_ssram;
  output           chipenable1_n_to_the_ssram;
  output           ddr_sdram_aux_full_rate_clk_out;
  output           ddr_sdram_aux_half_rate_clk_out;
  output           ddr_sdram_phy_clk_out;
  output  [ 23: 0] flash_ssram_tristate_bridge_address;
  inout   [ 31: 0] flash_ssram_tristate_bridge_data;
  output           local_init_done_from_the_ddr_sdram;
  output           local_refresh_ack_from_the_ddr_sdram;
  output           local_wdata_req_from_the_ddr_sdram;
  output  [ 12: 0] mem_addr_from_the_ddr_sdram;
  output  [  1: 0] mem_ba_from_the_ddr_sdram;
  output           mem_cas_n_from_the_ddr_sdram;
  output           mem_cke_from_the_ddr_sdram;
  inout            mem_clk_n_to_and_from_the_ddr_sdram;
  inout            mem_clk_to_and_from_the_ddr_sdram;
  output           mem_cs_n_from_the_ddr_sdram;
  output  [  1: 0] mem_dm_from_the_ddr_sdram;
  inout   [ 15: 0] mem_dq_to_and_from_the_ddr_sdram;
  inout   [  1: 0] mem_dqs_to_and_from_the_ddr_sdram;
  output           mem_ras_n_from_the_ddr_sdram;
  output           mem_we_n_from_the_ddr_sdram;
  output  [  1: 0] out_port_from_the_led_pio;
  output           outputenable_n_to_the_ssram;
  output           pll_c0_out;
  output           pll_c1_out;
  output           pll_c2_out;
  output           pll_c3_out;
  output           read_n_to_the_ext_flash;
  output           reset_phy_clk_n_from_the_ddr_sdram;
  output           select_n_to_the_ext_flash;
  output           write_n_to_the_ext_flash;
  input            clk;
  input            global_reset_n_to_the_ddr_sdram;
  input   [  3: 0] in_port_to_the_button_pio;
  input            reset_n;

  wire             adsc_n_to_the_ssram;
  wire    [  1: 0] button_pio_s1_address;
  wire             button_pio_s1_chipselect;
  wire             button_pio_s1_irq;
  wire             button_pio_s1_irq_from_sa;
  wire    [  3: 0] button_pio_s1_readdata;
  wire    [  3: 0] button_pio_s1_readdata_from_sa;
  wire             button_pio_s1_reset_n;
  wire             button_pio_s1_write_n;
  wire    [  3: 0] button_pio_s1_writedata;
  wire    [  3: 0] bw_n_to_the_ssram;
  wire             bwe_n_to_the_ssram;
  wire             chipenable1_n_to_the_ssram;
  wire             clk_reset_n;
  wire    [ 27: 0] cpu_data_master_address;
  wire    [ 27: 0] cpu_data_master_address_to_slave;
  wire    [  3: 0] cpu_data_master_byteenable;
  wire             cpu_data_master_debugaccess;
  wire             cpu_data_master_granted_cpu_ddr_clock_bridge_s1;
  wire             cpu_data_master_granted_cpu_jtag_debug_module;
  wire             cpu_data_master_granted_flash_ssram_pipeline_bridge_s1;
  wire             cpu_data_master_granted_slow_peripheral_bridge_s1;
  wire    [ 31: 0] cpu_data_master_irq;
  wire             cpu_data_master_latency_counter;
  wire             cpu_data_master_qualified_request_cpu_ddr_clock_bridge_s1;
  wire             cpu_data_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_data_master_qualified_request_flash_ssram_pipeline_bridge_s1;
  wire             cpu_data_master_qualified_request_slow_peripheral_bridge_s1;
  wire             cpu_data_master_read;
  wire             cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1;
  wire             cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register;
  wire             cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1;
  wire             cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register;
  wire             cpu_data_master_read_data_valid_slow_peripheral_bridge_s1;
  wire             cpu_data_master_read_data_valid_slow_peripheral_bridge_s1_shift_register;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_readdatavalid;
  wire             cpu_data_master_requests_cpu_ddr_clock_bridge_s1;
  wire             cpu_data_master_requests_cpu_jtag_debug_module;
  wire             cpu_data_master_requests_flash_ssram_pipeline_bridge_s1;
  wire             cpu_data_master_requests_slow_peripheral_bridge_s1;
  wire             cpu_data_master_waitrequest;
  wire             cpu_data_master_write;
  wire    [ 31: 0] cpu_data_master_writedata;
  wire    [ 24: 0] cpu_ddr_clock_bridge_m1_address;
  wire    [ 24: 0] cpu_ddr_clock_bridge_m1_address_to_slave;
  wire    [  3: 0] cpu_ddr_clock_bridge_m1_byteenable;
  wire             cpu_ddr_clock_bridge_m1_endofpacket;
  wire             cpu_ddr_clock_bridge_m1_granted_ddr_sdram_s1;
  wire             cpu_ddr_clock_bridge_m1_latency_counter;
  wire    [ 22: 0] cpu_ddr_clock_bridge_m1_nativeaddress;
  wire             cpu_ddr_clock_bridge_m1_qualified_request_ddr_sdram_s1;
  wire             cpu_ddr_clock_bridge_m1_read;
  wire             cpu_ddr_clock_bridge_m1_read_data_valid_ddr_sdram_s1;
  wire             cpu_ddr_clock_bridge_m1_read_data_valid_ddr_sdram_s1_shift_register;
  wire    [ 31: 0] cpu_ddr_clock_bridge_m1_readdata;
  wire             cpu_ddr_clock_bridge_m1_readdatavalid;
  wire             cpu_ddr_clock_bridge_m1_requests_ddr_sdram_s1;
  wire             cpu_ddr_clock_bridge_m1_reset_n;
  wire             cpu_ddr_clock_bridge_m1_waitrequest;
  wire             cpu_ddr_clock_bridge_m1_write;
  wire    [ 31: 0] cpu_ddr_clock_bridge_m1_writedata;
  wire    [ 22: 0] cpu_ddr_clock_bridge_s1_address;
  wire    [  3: 0] cpu_ddr_clock_bridge_s1_byteenable;
  wire             cpu_ddr_clock_bridge_s1_endofpacket;
  wire             cpu_ddr_clock_bridge_s1_endofpacket_from_sa;
  wire    [ 22: 0] cpu_ddr_clock_bridge_s1_nativeaddress;
  wire             cpu_ddr_clock_bridge_s1_read;
  wire    [ 31: 0] cpu_ddr_clock_bridge_s1_readdata;
  wire    [ 31: 0] cpu_ddr_clock_bridge_s1_readdata_from_sa;
  wire             cpu_ddr_clock_bridge_s1_readdatavalid;
  wire             cpu_ddr_clock_bridge_s1_reset_n;
  wire             cpu_ddr_clock_bridge_s1_waitrequest;
  wire             cpu_ddr_clock_bridge_s1_waitrequest_from_sa;
  wire             cpu_ddr_clock_bridge_s1_write;
  wire    [ 31: 0] cpu_ddr_clock_bridge_s1_writedata;
  wire    [ 26: 0] cpu_instruction_master_address;
  wire    [ 26: 0] cpu_instruction_master_address_to_slave;
  wire             cpu_instruction_master_granted_cpu_ddr_clock_bridge_s1;
  wire             cpu_instruction_master_granted_cpu_jtag_debug_module;
  wire             cpu_instruction_master_granted_flash_ssram_pipeline_bridge_s1;
  wire             cpu_instruction_master_latency_counter;
  wire             cpu_instruction_master_qualified_request_cpu_ddr_clock_bridge_s1;
  wire             cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_instruction_master_qualified_request_flash_ssram_pipeline_bridge_s1;
  wire             cpu_instruction_master_read;
  wire             cpu_instruction_master_read_data_valid_cpu_ddr_clock_bridge_s1;
  wire             cpu_instruction_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register;
  wire             cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_instruction_master_read_data_valid_flash_ssram_pipeline_bridge_s1;
  wire             cpu_instruction_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register;
  wire    [ 31: 0] cpu_instruction_master_readdata;
  wire             cpu_instruction_master_readdatavalid;
  wire             cpu_instruction_master_requests_cpu_ddr_clock_bridge_s1;
  wire             cpu_instruction_master_requests_cpu_jtag_debug_module;
  wire             cpu_instruction_master_requests_flash_ssram_pipeline_bridge_s1;
  wire             cpu_instruction_master_waitrequest;
  wire    [  8: 0] cpu_jtag_debug_module_address;
  wire             cpu_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_jtag_debug_module_byteenable;
  wire             cpu_jtag_debug_module_chipselect;
  wire             cpu_jtag_debug_module_debugaccess;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  wire             cpu_jtag_debug_module_reset;
  wire             cpu_jtag_debug_module_reset_n;
  wire             cpu_jtag_debug_module_resetrequest;
  wire             cpu_jtag_debug_module_resetrequest_from_sa;
  wire             cpu_jtag_debug_module_write;
  wire    [ 31: 0] cpu_jtag_debug_module_writedata;
  wire    [  3: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_in_address;
  wire    [  1: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_in_byteenable;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_in_endofpacket;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_in_endofpacket_from_sa;
  wire    [  2: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_in_nativeaddress;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_in_read;
  wire    [ 15: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_in_readdata;
  wire    [ 15: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_in_readdata_from_sa;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_in_reset_n;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_in_waitrequest;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_in_waitrequest_from_sa;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_in_write;
  wire    [ 15: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_in_writedata;
  wire    [  3: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_out_address;
  wire    [  3: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_out_address_to_slave;
  wire    [  1: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_out_byteenable;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_out_endofpacket;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_out_granted_pll_s1;
  wire    [  2: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_out_nativeaddress;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_out_qualified_request_pll_s1;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_out_read;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_out_read_data_valid_pll_s1;
  wire    [ 15: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_out_readdata;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_out_requests_pll_s1;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_out_reset_n;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_out_waitrequest;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_out_write;
  wire    [ 15: 0] cycloneIII_3c25_niosII_standard_sopc_clock_0_out_writedata;
  wire    [  7: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_in_address;
  wire    [  3: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_in_byteenable;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_in_endofpacket;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_in_endofpacket_from_sa;
  wire    [  5: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_in_nativeaddress;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_in_read;
  wire    [ 31: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_in_readdata;
  wire    [ 31: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_in_readdata_from_sa;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_in_reset_n;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_in_waitrequest;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_in_waitrequest_from_sa;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_in_write;
  wire    [ 31: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_in_writedata;
  wire    [  7: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_out_address;
  wire    [  7: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_out_address_to_slave;
  wire    [  3: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_out_byteenable;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_out_endofpacket;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_out_granted_remote_update_s1;
  wire    [  5: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_out_nativeaddress;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_out_qualified_request_remote_update_s1;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read_data_valid_remote_update_s1;
  wire    [ 31: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_out_readdata;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_out_requests_remote_update_s1;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_out_reset_n;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_out_waitrequest;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_out_write;
  wire    [ 31: 0] cycloneIII_3c25_niosII_standard_sopc_clock_1_out_writedata;
  wire             d1_button_pio_s1_end_xfer;
  wire             d1_cpu_ddr_clock_bridge_s1_end_xfer;
  wire             d1_cpu_jtag_debug_module_end_xfer;
  wire             d1_cycloneIII_3c25_niosII_standard_sopc_clock_0_in_end_xfer;
  wire             d1_cycloneIII_3c25_niosII_standard_sopc_clock_1_in_end_xfer;
  wire             d1_ddr_sdram_s1_end_xfer;
  wire             d1_flash_ssram_pipeline_bridge_s1_end_xfer;
  wire             d1_flash_ssram_tristate_bridge_avalon_slave_end_xfer;
  wire             d1_high_res_timer_s1_end_xfer;
  wire             d1_jtag_uart_avalon_jtag_slave_end_xfer;
  wire             d1_led_pio_s1_end_xfer;
  wire             d1_pipeline_bridge_before_tristate_bridge_s1_end_xfer;
  wire             d1_pll_s1_end_xfer;
  wire             d1_remote_update_s1_end_xfer;
  wire             d1_slow_peripheral_bridge_s1_end_xfer;
  wire             d1_sys_clk_timer_s1_end_xfer;
  wire             d1_sysid_control_slave_end_xfer;
  wire             ddr_sdram_aux_full_rate_clk_out;
  wire             ddr_sdram_aux_half_rate_clk_out;
  wire             ddr_sdram_phy_clk_out;
  wire             ddr_sdram_phy_clk_out_reset_n;
  wire    [ 21: 0] ddr_sdram_s1_address;
  wire             ddr_sdram_s1_beginbursttransfer;
  wire             ddr_sdram_s1_burstcount;
  wire    [  7: 0] ddr_sdram_s1_byteenable;
  wire             ddr_sdram_s1_read;
  wire    [ 63: 0] ddr_sdram_s1_readdata;
  wire    [ 63: 0] ddr_sdram_s1_readdata_from_sa;
  wire             ddr_sdram_s1_readdatavalid;
  wire             ddr_sdram_s1_resetrequest_n;
  wire             ddr_sdram_s1_resetrequest_n_from_sa;
  wire             ddr_sdram_s1_waitrequest_n;
  wire             ddr_sdram_s1_waitrequest_n_from_sa;
  wire             ddr_sdram_s1_write;
  wire    [ 63: 0] ddr_sdram_s1_writedata;
  wire             ext_flash_s1_wait_counter_eq_0;
  wire    [ 24: 0] flash_ssram_pipeline_bridge_m1_address;
  wire    [ 24: 0] flash_ssram_pipeline_bridge_m1_address_to_slave;
  wire             flash_ssram_pipeline_bridge_m1_burstcount;
  wire    [  3: 0] flash_ssram_pipeline_bridge_m1_byteenable;
  wire             flash_ssram_pipeline_bridge_m1_chipselect;
  wire             flash_ssram_pipeline_bridge_m1_debugaccess;
  wire             flash_ssram_pipeline_bridge_m1_endofpacket;
  wire             flash_ssram_pipeline_bridge_m1_granted_pipeline_bridge_before_tristate_bridge_s1;
  wire             flash_ssram_pipeline_bridge_m1_latency_counter;
  wire             flash_ssram_pipeline_bridge_m1_qualified_request_pipeline_bridge_before_tristate_bridge_s1;
  wire             flash_ssram_pipeline_bridge_m1_read;
  wire             flash_ssram_pipeline_bridge_m1_read_data_valid_pipeline_bridge_before_tristate_bridge_s1;
  wire             flash_ssram_pipeline_bridge_m1_read_data_valid_pipeline_bridge_before_tristate_bridge_s1_shift_register;
  wire    [ 31: 0] flash_ssram_pipeline_bridge_m1_readdata;
  wire             flash_ssram_pipeline_bridge_m1_readdatavalid;
  wire             flash_ssram_pipeline_bridge_m1_requests_pipeline_bridge_before_tristate_bridge_s1;
  wire             flash_ssram_pipeline_bridge_m1_waitrequest;
  wire             flash_ssram_pipeline_bridge_m1_write;
  wire    [ 31: 0] flash_ssram_pipeline_bridge_m1_writedata;
  wire    [ 22: 0] flash_ssram_pipeline_bridge_s1_address;
  wire             flash_ssram_pipeline_bridge_s1_arbiterlock;
  wire             flash_ssram_pipeline_bridge_s1_arbiterlock2;
  wire             flash_ssram_pipeline_bridge_s1_burstcount;
  wire    [  3: 0] flash_ssram_pipeline_bridge_s1_byteenable;
  wire             flash_ssram_pipeline_bridge_s1_chipselect;
  wire             flash_ssram_pipeline_bridge_s1_debugaccess;
  wire             flash_ssram_pipeline_bridge_s1_endofpacket;
  wire             flash_ssram_pipeline_bridge_s1_endofpacket_from_sa;
  wire    [ 22: 0] flash_ssram_pipeline_bridge_s1_nativeaddress;
  wire             flash_ssram_pipeline_bridge_s1_read;
  wire    [ 31: 0] flash_ssram_pipeline_bridge_s1_readdata;
  wire    [ 31: 0] flash_ssram_pipeline_bridge_s1_readdata_from_sa;
  wire             flash_ssram_pipeline_bridge_s1_readdatavalid;
  wire             flash_ssram_pipeline_bridge_s1_reset_n;
  wire             flash_ssram_pipeline_bridge_s1_waitrequest;
  wire             flash_ssram_pipeline_bridge_s1_waitrequest_from_sa;
  wire             flash_ssram_pipeline_bridge_s1_write;
  wire    [ 31: 0] flash_ssram_pipeline_bridge_s1_writedata;
  wire    [ 23: 0] flash_ssram_tristate_bridge_address;
  wire    [ 31: 0] flash_ssram_tristate_bridge_data;
  wire    [  2: 0] high_res_timer_s1_address;
  wire             high_res_timer_s1_chipselect;
  wire             high_res_timer_s1_irq;
  wire             high_res_timer_s1_irq_from_sa;
  wire    [ 15: 0] high_res_timer_s1_readdata;
  wire    [ 15: 0] high_res_timer_s1_readdata_from_sa;
  wire             high_res_timer_s1_reset_n;
  wire             high_res_timer_s1_write_n;
  wire    [ 15: 0] high_res_timer_s1_writedata;
  wire    [ 31: 0] incoming_flash_ssram_tristate_bridge_data;
  wire    [ 15: 0] incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0;
  wire             jtag_uart_avalon_jtag_slave_address;
  wire             jtag_uart_avalon_jtag_slave_chipselect;
  wire             jtag_uart_avalon_jtag_slave_dataavailable;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_irq;
  wire             jtag_uart_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_reset_n;
  wire             jtag_uart_avalon_jtag_slave_waitrequest;
  wire             jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  wire    [  1: 0] led_pio_s1_address;
  wire             led_pio_s1_chipselect;
  wire             led_pio_s1_reset_n;
  wire             led_pio_s1_write_n;
  wire    [  1: 0] led_pio_s1_writedata;
  wire             local_init_done_from_the_ddr_sdram;
  wire             local_refresh_ack_from_the_ddr_sdram;
  wire             local_wdata_req_from_the_ddr_sdram;
  wire    [ 12: 0] mem_addr_from_the_ddr_sdram;
  wire    [  1: 0] mem_ba_from_the_ddr_sdram;
  wire             mem_cas_n_from_the_ddr_sdram;
  wire             mem_cke_from_the_ddr_sdram;
  wire             mem_clk_n_to_and_from_the_ddr_sdram;
  wire             mem_clk_to_and_from_the_ddr_sdram;
  wire             mem_cs_n_from_the_ddr_sdram;
  wire    [  1: 0] mem_dm_from_the_ddr_sdram;
  wire    [ 15: 0] mem_dq_to_and_from_the_ddr_sdram;
  wire    [  1: 0] mem_dqs_to_and_from_the_ddr_sdram;
  wire             mem_ras_n_from_the_ddr_sdram;
  wire             mem_we_n_from_the_ddr_sdram;
  wire             out_clk_ddr_sdram_aux_full_rate_clk;
  wire             out_clk_ddr_sdram_aux_half_rate_clk;
  wire             out_clk_ddr_sdram_phy_clk;
  wire             out_clk_pll_c0;
  wire             out_clk_pll_c1;
  wire             out_clk_pll_c2;
  wire             out_clk_pll_c3;
  wire    [  1: 0] out_port_from_the_led_pio;
  wire             outputenable_n_to_the_ssram;
  wire    [ 24: 0] pipeline_bridge_before_tristate_bridge_m1_address;
  wire    [ 24: 0] pipeline_bridge_before_tristate_bridge_m1_address_to_slave;
  wire             pipeline_bridge_before_tristate_bridge_m1_burstcount;
  wire    [  3: 0] pipeline_bridge_before_tristate_bridge_m1_byteenable;
  wire    [  1: 0] pipeline_bridge_before_tristate_bridge_m1_byteenable_ext_flash_s1;
  wire             pipeline_bridge_before_tristate_bridge_m1_chipselect;
  wire    [  1: 0] pipeline_bridge_before_tristate_bridge_m1_dbs_address;
  wire    [ 15: 0] pipeline_bridge_before_tristate_bridge_m1_dbs_write_16;
  wire             pipeline_bridge_before_tristate_bridge_m1_debugaccess;
  wire             pipeline_bridge_before_tristate_bridge_m1_endofpacket;
  wire             pipeline_bridge_before_tristate_bridge_m1_granted_ext_flash_s1;
  wire             pipeline_bridge_before_tristate_bridge_m1_granted_ssram_s1;
  wire    [  2: 0] pipeline_bridge_before_tristate_bridge_m1_latency_counter;
  wire             pipeline_bridge_before_tristate_bridge_m1_qualified_request_ext_flash_s1;
  wire             pipeline_bridge_before_tristate_bridge_m1_qualified_request_ssram_s1;
  wire             pipeline_bridge_before_tristate_bridge_m1_read;
  wire             pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ext_flash_s1;
  wire             pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ssram_s1;
  wire    [ 31: 0] pipeline_bridge_before_tristate_bridge_m1_readdata;
  wire             pipeline_bridge_before_tristate_bridge_m1_readdatavalid;
  wire             pipeline_bridge_before_tristate_bridge_m1_requests_ext_flash_s1;
  wire             pipeline_bridge_before_tristate_bridge_m1_requests_ssram_s1;
  wire             pipeline_bridge_before_tristate_bridge_m1_waitrequest;
  wire             pipeline_bridge_before_tristate_bridge_m1_write;
  wire    [ 31: 0] pipeline_bridge_before_tristate_bridge_m1_writedata;
  wire    [ 22: 0] pipeline_bridge_before_tristate_bridge_s1_address;
  wire             pipeline_bridge_before_tristate_bridge_s1_arbiterlock;
  wire             pipeline_bridge_before_tristate_bridge_s1_arbiterlock2;
  wire             pipeline_bridge_before_tristate_bridge_s1_burstcount;
  wire    [  3: 0] pipeline_bridge_before_tristate_bridge_s1_byteenable;
  wire             pipeline_bridge_before_tristate_bridge_s1_chipselect;
  wire             pipeline_bridge_before_tristate_bridge_s1_debugaccess;
  wire             pipeline_bridge_before_tristate_bridge_s1_endofpacket;
  wire             pipeline_bridge_before_tristate_bridge_s1_endofpacket_from_sa;
  wire    [ 22: 0] pipeline_bridge_before_tristate_bridge_s1_nativeaddress;
  wire             pipeline_bridge_before_tristate_bridge_s1_read;
  wire    [ 31: 0] pipeline_bridge_before_tristate_bridge_s1_readdata;
  wire    [ 31: 0] pipeline_bridge_before_tristate_bridge_s1_readdata_from_sa;
  wire             pipeline_bridge_before_tristate_bridge_s1_readdatavalid;
  wire             pipeline_bridge_before_tristate_bridge_s1_reset_n;
  wire             pipeline_bridge_before_tristate_bridge_s1_waitrequest;
  wire             pipeline_bridge_before_tristate_bridge_s1_waitrequest_from_sa;
  wire             pipeline_bridge_before_tristate_bridge_s1_write;
  wire    [ 31: 0] pipeline_bridge_before_tristate_bridge_s1_writedata;
  wire             pll_c0_out;
  wire             pll_c0_out_reset_n;
  wire             pll_c1_out;
  wire             pll_c2_out;
  wire             pll_c2_out_reset_n;
  wire             pll_c3_out;
  wire             pll_c3_out_reset_n;
  wire    [  2: 0] pll_s1_address;
  wire             pll_s1_chipselect;
  wire             pll_s1_read;
  wire    [ 15: 0] pll_s1_readdata;
  wire    [ 15: 0] pll_s1_readdata_from_sa;
  wire             pll_s1_reset_n;
  wire             pll_s1_resetrequest;
  wire             pll_s1_resetrequest_from_sa;
  wire             pll_s1_write;
  wire    [ 15: 0] pll_s1_writedata;
  wire             read_n_to_the_ext_flash;
  wire    [  5: 0] remote_update_s1_address;
  wire             remote_update_s1_chipselect;
  wire             remote_update_s1_read;
  wire    [ 31: 0] remote_update_s1_readdata;
  wire    [ 31: 0] remote_update_s1_readdata_from_sa;
  wire             remote_update_s1_reset;
  wire             remote_update_s1_waitrequest;
  wire             remote_update_s1_waitrequest_from_sa;
  wire             remote_update_s1_write;
  wire    [ 31: 0] remote_update_s1_writedata;
  wire             reset_n_sources;
  wire             reset_phy_clk_n_from_the_ddr_sdram;
  wire             select_n_to_the_ext_flash;
  wire    [  8: 0] slow_peripheral_bridge_m1_address;
  wire    [  8: 0] slow_peripheral_bridge_m1_address_to_slave;
  wire    [  3: 0] slow_peripheral_bridge_m1_byteenable;
  wire             slow_peripheral_bridge_m1_endofpacket;
  wire             slow_peripheral_bridge_m1_granted_button_pio_s1;
  wire             slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_0_in;
  wire             slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_1_in;
  wire             slow_peripheral_bridge_m1_granted_high_res_timer_s1;
  wire             slow_peripheral_bridge_m1_granted_jtag_uart_avalon_jtag_slave;
  wire             slow_peripheral_bridge_m1_granted_led_pio_s1;
  wire             slow_peripheral_bridge_m1_granted_sys_clk_timer_s1;
  wire             slow_peripheral_bridge_m1_granted_sysid_control_slave;
  wire             slow_peripheral_bridge_m1_latency_counter;
  wire    [  6: 0] slow_peripheral_bridge_m1_nativeaddress;
  wire             slow_peripheral_bridge_m1_qualified_request_button_pio_s1;
  wire             slow_peripheral_bridge_m1_qualified_request_cycloneIII_3c25_niosII_standard_sopc_clock_0_in;
  wire             slow_peripheral_bridge_m1_qualified_request_cycloneIII_3c25_niosII_standard_sopc_clock_1_in;
  wire             slow_peripheral_bridge_m1_qualified_request_high_res_timer_s1;
  wire             slow_peripheral_bridge_m1_qualified_request_jtag_uart_avalon_jtag_slave;
  wire             slow_peripheral_bridge_m1_qualified_request_led_pio_s1;
  wire             slow_peripheral_bridge_m1_qualified_request_sys_clk_timer_s1;
  wire             slow_peripheral_bridge_m1_qualified_request_sysid_control_slave;
  wire             slow_peripheral_bridge_m1_read;
  wire             slow_peripheral_bridge_m1_read_data_valid_button_pio_s1;
  wire             slow_peripheral_bridge_m1_read_data_valid_cycloneIII_3c25_niosII_standard_sopc_clock_0_in;
  wire             slow_peripheral_bridge_m1_read_data_valid_cycloneIII_3c25_niosII_standard_sopc_clock_1_in;
  wire             slow_peripheral_bridge_m1_read_data_valid_high_res_timer_s1;
  wire             slow_peripheral_bridge_m1_read_data_valid_jtag_uart_avalon_jtag_slave;
  wire             slow_peripheral_bridge_m1_read_data_valid_led_pio_s1;
  wire             slow_peripheral_bridge_m1_read_data_valid_sys_clk_timer_s1;
  wire             slow_peripheral_bridge_m1_read_data_valid_sysid_control_slave;
  wire    [ 31: 0] slow_peripheral_bridge_m1_readdata;
  wire             slow_peripheral_bridge_m1_readdatavalid;
  wire             slow_peripheral_bridge_m1_requests_button_pio_s1;
  wire             slow_peripheral_bridge_m1_requests_cycloneIII_3c25_niosII_standard_sopc_clock_0_in;
  wire             slow_peripheral_bridge_m1_requests_cycloneIII_3c25_niosII_standard_sopc_clock_1_in;
  wire             slow_peripheral_bridge_m1_requests_high_res_timer_s1;
  wire             slow_peripheral_bridge_m1_requests_jtag_uart_avalon_jtag_slave;
  wire             slow_peripheral_bridge_m1_requests_led_pio_s1;
  wire             slow_peripheral_bridge_m1_requests_sys_clk_timer_s1;
  wire             slow_peripheral_bridge_m1_requests_sysid_control_slave;
  wire             slow_peripheral_bridge_m1_reset_n;
  wire             slow_peripheral_bridge_m1_waitrequest;
  wire             slow_peripheral_bridge_m1_write;
  wire    [ 31: 0] slow_peripheral_bridge_m1_writedata;
  wire    [  6: 0] slow_peripheral_bridge_s1_address;
  wire    [  3: 0] slow_peripheral_bridge_s1_byteenable;
  wire             slow_peripheral_bridge_s1_endofpacket;
  wire             slow_peripheral_bridge_s1_endofpacket_from_sa;
  wire    [  6: 0] slow_peripheral_bridge_s1_nativeaddress;
  wire             slow_peripheral_bridge_s1_read;
  wire    [ 31: 0] slow_peripheral_bridge_s1_readdata;
  wire    [ 31: 0] slow_peripheral_bridge_s1_readdata_from_sa;
  wire             slow_peripheral_bridge_s1_readdatavalid;
  wire             slow_peripheral_bridge_s1_reset_n;
  wire             slow_peripheral_bridge_s1_waitrequest;
  wire             slow_peripheral_bridge_s1_waitrequest_from_sa;
  wire             slow_peripheral_bridge_s1_write;
  wire    [ 31: 0] slow_peripheral_bridge_s1_writedata;
  wire    [  2: 0] sys_clk_timer_s1_address;
  wire             sys_clk_timer_s1_chipselect;
  wire             sys_clk_timer_s1_irq;
  wire             sys_clk_timer_s1_irq_from_sa;
  wire    [ 15: 0] sys_clk_timer_s1_readdata;
  wire    [ 15: 0] sys_clk_timer_s1_readdata_from_sa;
  wire             sys_clk_timer_s1_reset_n;
  wire             sys_clk_timer_s1_write_n;
  wire    [ 15: 0] sys_clk_timer_s1_writedata;
  wire             sysid_control_slave_address;
  wire    [ 31: 0] sysid_control_slave_readdata;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  wire             write_n_to_the_ext_flash;
  button_pio_s1_arbitrator the_button_pio_s1
    (
      .button_pio_s1_address                                     (button_pio_s1_address),
      .button_pio_s1_chipselect                                  (button_pio_s1_chipselect),
      .button_pio_s1_irq                                         (button_pio_s1_irq),
      .button_pio_s1_irq_from_sa                                 (button_pio_s1_irq_from_sa),
      .button_pio_s1_readdata                                    (button_pio_s1_readdata),
      .button_pio_s1_readdata_from_sa                            (button_pio_s1_readdata_from_sa),
      .button_pio_s1_reset_n                                     (button_pio_s1_reset_n),
      .button_pio_s1_write_n                                     (button_pio_s1_write_n),
      .button_pio_s1_writedata                                   (button_pio_s1_writedata),
      .clk                                                       (pll_c2_out),
      .d1_button_pio_s1_end_xfer                                 (d1_button_pio_s1_end_xfer),
      .reset_n                                                   (pll_c2_out_reset_n),
      .slow_peripheral_bridge_m1_address_to_slave                (slow_peripheral_bridge_m1_address_to_slave),
      .slow_peripheral_bridge_m1_granted_button_pio_s1           (slow_peripheral_bridge_m1_granted_button_pio_s1),
      .slow_peripheral_bridge_m1_latency_counter                 (slow_peripheral_bridge_m1_latency_counter),
      .slow_peripheral_bridge_m1_nativeaddress                   (slow_peripheral_bridge_m1_nativeaddress),
      .slow_peripheral_bridge_m1_qualified_request_button_pio_s1 (slow_peripheral_bridge_m1_qualified_request_button_pio_s1),
      .slow_peripheral_bridge_m1_read                            (slow_peripheral_bridge_m1_read),
      .slow_peripheral_bridge_m1_read_data_valid_button_pio_s1   (slow_peripheral_bridge_m1_read_data_valid_button_pio_s1),
      .slow_peripheral_bridge_m1_requests_button_pio_s1          (slow_peripheral_bridge_m1_requests_button_pio_s1),
      .slow_peripheral_bridge_m1_write                           (slow_peripheral_bridge_m1_write),
      .slow_peripheral_bridge_m1_writedata                       (slow_peripheral_bridge_m1_writedata)
    );

  button_pio the_button_pio
    (
      .address    (button_pio_s1_address),
      .chipselect (button_pio_s1_chipselect),
      .clk        (pll_c2_out),
      .in_port    (in_port_to_the_button_pio),
      .irq        (button_pio_s1_irq),
      .readdata   (button_pio_s1_readdata),
      .reset_n    (button_pio_s1_reset_n),
      .write_n    (button_pio_s1_write_n),
      .writedata  (button_pio_s1_writedata)
    );

  cpu_jtag_debug_module_arbitrator the_cpu_jtag_debug_module
    (
      .clk                                                                                  (pll_c0_out),
      .cpu_data_master_address_to_slave                                                     (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                                           (cpu_data_master_byteenable),
      .cpu_data_master_debugaccess                                                          (cpu_data_master_debugaccess),
      .cpu_data_master_granted_cpu_jtag_debug_module                                        (cpu_data_master_granted_cpu_jtag_debug_module),
      .cpu_data_master_latency_counter                                                      (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_cpu_jtag_debug_module                              (cpu_data_master_qualified_request_cpu_jtag_debug_module),
      .cpu_data_master_read                                                                 (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register               (cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_cpu_jtag_debug_module                                (cpu_data_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register        (cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_slow_peripheral_bridge_s1_shift_register             (cpu_data_master_read_data_valid_slow_peripheral_bridge_s1_shift_register),
      .cpu_data_master_requests_cpu_jtag_debug_module                                       (cpu_data_master_requests_cpu_jtag_debug_module),
      .cpu_data_master_write                                                                (cpu_data_master_write),
      .cpu_data_master_writedata                                                            (cpu_data_master_writedata),
      .cpu_instruction_master_address_to_slave                                              (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_cpu_jtag_debug_module                                 (cpu_instruction_master_granted_cpu_jtag_debug_module),
      .cpu_instruction_master_latency_counter                                               (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_cpu_jtag_debug_module                       (cpu_instruction_master_qualified_request_cpu_jtag_debug_module),
      .cpu_instruction_master_read                                                          (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register        (cpu_instruction_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register),
      .cpu_instruction_master_read_data_valid_cpu_jtag_debug_module                         (cpu_instruction_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_instruction_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register (cpu_instruction_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register),
      .cpu_instruction_master_requests_cpu_jtag_debug_module                                (cpu_instruction_master_requests_cpu_jtag_debug_module),
      .cpu_jtag_debug_module_address                                                        (cpu_jtag_debug_module_address),
      .cpu_jtag_debug_module_begintransfer                                                  (cpu_jtag_debug_module_begintransfer),
      .cpu_jtag_debug_module_byteenable                                                     (cpu_jtag_debug_module_byteenable),
      .cpu_jtag_debug_module_chipselect                                                     (cpu_jtag_debug_module_chipselect),
      .cpu_jtag_debug_module_debugaccess                                                    (cpu_jtag_debug_module_debugaccess),
      .cpu_jtag_debug_module_readdata                                                       (cpu_jtag_debug_module_readdata),
      .cpu_jtag_debug_module_readdata_from_sa                                               (cpu_jtag_debug_module_readdata_from_sa),
      .cpu_jtag_debug_module_reset                                                          (cpu_jtag_debug_module_reset),
      .cpu_jtag_debug_module_reset_n                                                        (cpu_jtag_debug_module_reset_n),
      .cpu_jtag_debug_module_resetrequest                                                   (cpu_jtag_debug_module_resetrequest),
      .cpu_jtag_debug_module_resetrequest_from_sa                                           (cpu_jtag_debug_module_resetrequest_from_sa),
      .cpu_jtag_debug_module_write                                                          (cpu_jtag_debug_module_write),
      .cpu_jtag_debug_module_writedata                                                      (cpu_jtag_debug_module_writedata),
      .d1_cpu_jtag_debug_module_end_xfer                                                    (d1_cpu_jtag_debug_module_end_xfer),
      .reset_n                                                                              (pll_c0_out_reset_n)
    );

  cpu_data_master_arbitrator the_cpu_data_master
    (
      .button_pio_s1_irq_from_sa                                                     (button_pio_s1_irq_from_sa),
      .clk                                                                           (pll_c0_out),
      .cpu_data_master_address                                                       (cpu_data_master_address),
      .cpu_data_master_address_to_slave                                              (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                                    (cpu_data_master_byteenable),
      .cpu_data_master_granted_cpu_ddr_clock_bridge_s1                               (cpu_data_master_granted_cpu_ddr_clock_bridge_s1),
      .cpu_data_master_granted_cpu_jtag_debug_module                                 (cpu_data_master_granted_cpu_jtag_debug_module),
      .cpu_data_master_granted_flash_ssram_pipeline_bridge_s1                        (cpu_data_master_granted_flash_ssram_pipeline_bridge_s1),
      .cpu_data_master_granted_slow_peripheral_bridge_s1                             (cpu_data_master_granted_slow_peripheral_bridge_s1),
      .cpu_data_master_irq                                                           (cpu_data_master_irq),
      .cpu_data_master_latency_counter                                               (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_cpu_ddr_clock_bridge_s1                     (cpu_data_master_qualified_request_cpu_ddr_clock_bridge_s1),
      .cpu_data_master_qualified_request_cpu_jtag_debug_module                       (cpu_data_master_qualified_request_cpu_jtag_debug_module),
      .cpu_data_master_qualified_request_flash_ssram_pipeline_bridge_s1              (cpu_data_master_qualified_request_flash_ssram_pipeline_bridge_s1),
      .cpu_data_master_qualified_request_slow_peripheral_bridge_s1                   (cpu_data_master_qualified_request_slow_peripheral_bridge_s1),
      .cpu_data_master_read                                                          (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1                       (cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1),
      .cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register        (cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_cpu_jtag_debug_module                         (cpu_data_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1                (cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1),
      .cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register (cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_slow_peripheral_bridge_s1                     (cpu_data_master_read_data_valid_slow_peripheral_bridge_s1),
      .cpu_data_master_read_data_valid_slow_peripheral_bridge_s1_shift_register      (cpu_data_master_read_data_valid_slow_peripheral_bridge_s1_shift_register),
      .cpu_data_master_readdata                                                      (cpu_data_master_readdata),
      .cpu_data_master_readdatavalid                                                 (cpu_data_master_readdatavalid),
      .cpu_data_master_requests_cpu_ddr_clock_bridge_s1                              (cpu_data_master_requests_cpu_ddr_clock_bridge_s1),
      .cpu_data_master_requests_cpu_jtag_debug_module                                (cpu_data_master_requests_cpu_jtag_debug_module),
      .cpu_data_master_requests_flash_ssram_pipeline_bridge_s1                       (cpu_data_master_requests_flash_ssram_pipeline_bridge_s1),
      .cpu_data_master_requests_slow_peripheral_bridge_s1                            (cpu_data_master_requests_slow_peripheral_bridge_s1),
      .cpu_data_master_waitrequest                                                   (cpu_data_master_waitrequest),
      .cpu_data_master_write                                                         (cpu_data_master_write),
      .cpu_data_master_writedata                                                     (cpu_data_master_writedata),
      .cpu_ddr_clock_bridge_s1_readdata_from_sa                                      (cpu_ddr_clock_bridge_s1_readdata_from_sa),
      .cpu_ddr_clock_bridge_s1_waitrequest_from_sa                                   (cpu_ddr_clock_bridge_s1_waitrequest_from_sa),
      .cpu_jtag_debug_module_readdata_from_sa                                        (cpu_jtag_debug_module_readdata_from_sa),
      .d1_cpu_ddr_clock_bridge_s1_end_xfer                                           (d1_cpu_ddr_clock_bridge_s1_end_xfer),
      .d1_cpu_jtag_debug_module_end_xfer                                             (d1_cpu_jtag_debug_module_end_xfer),
      .d1_flash_ssram_pipeline_bridge_s1_end_xfer                                    (d1_flash_ssram_pipeline_bridge_s1_end_xfer),
      .d1_slow_peripheral_bridge_s1_end_xfer                                         (d1_slow_peripheral_bridge_s1_end_xfer),
      .flash_ssram_pipeline_bridge_s1_readdata_from_sa                               (flash_ssram_pipeline_bridge_s1_readdata_from_sa),
      .flash_ssram_pipeline_bridge_s1_waitrequest_from_sa                            (flash_ssram_pipeline_bridge_s1_waitrequest_from_sa),
      .high_res_timer_s1_irq_from_sa                                                 (high_res_timer_s1_irq_from_sa),
      .jtag_uart_avalon_jtag_slave_irq_from_sa                                       (jtag_uart_avalon_jtag_slave_irq_from_sa),
      .pll_c0_out                                                                    (pll_c0_out),
      .pll_c0_out_reset_n                                                            (pll_c0_out_reset_n),
      .reset_n                                                                       (pll_c0_out_reset_n),
      .slow_peripheral_bridge_s1_readdata_from_sa                                    (slow_peripheral_bridge_s1_readdata_from_sa),
      .slow_peripheral_bridge_s1_waitrequest_from_sa                                 (slow_peripheral_bridge_s1_waitrequest_from_sa),
      .sys_clk_timer_s1_irq_from_sa                                                  (sys_clk_timer_s1_irq_from_sa)
    );

  cpu_instruction_master_arbitrator the_cpu_instruction_master
    (
      .clk                                                                                  (pll_c0_out),
      .cpu_ddr_clock_bridge_s1_readdata_from_sa                                             (cpu_ddr_clock_bridge_s1_readdata_from_sa),
      .cpu_ddr_clock_bridge_s1_waitrequest_from_sa                                          (cpu_ddr_clock_bridge_s1_waitrequest_from_sa),
      .cpu_instruction_master_address                                                       (cpu_instruction_master_address),
      .cpu_instruction_master_address_to_slave                                              (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_cpu_ddr_clock_bridge_s1                               (cpu_instruction_master_granted_cpu_ddr_clock_bridge_s1),
      .cpu_instruction_master_granted_cpu_jtag_debug_module                                 (cpu_instruction_master_granted_cpu_jtag_debug_module),
      .cpu_instruction_master_granted_flash_ssram_pipeline_bridge_s1                        (cpu_instruction_master_granted_flash_ssram_pipeline_bridge_s1),
      .cpu_instruction_master_latency_counter                                               (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_cpu_ddr_clock_bridge_s1                     (cpu_instruction_master_qualified_request_cpu_ddr_clock_bridge_s1),
      .cpu_instruction_master_qualified_request_cpu_jtag_debug_module                       (cpu_instruction_master_qualified_request_cpu_jtag_debug_module),
      .cpu_instruction_master_qualified_request_flash_ssram_pipeline_bridge_s1              (cpu_instruction_master_qualified_request_flash_ssram_pipeline_bridge_s1),
      .cpu_instruction_master_read                                                          (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cpu_ddr_clock_bridge_s1                       (cpu_instruction_master_read_data_valid_cpu_ddr_clock_bridge_s1),
      .cpu_instruction_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register        (cpu_instruction_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register),
      .cpu_instruction_master_read_data_valid_cpu_jtag_debug_module                         (cpu_instruction_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_instruction_master_read_data_valid_flash_ssram_pipeline_bridge_s1                (cpu_instruction_master_read_data_valid_flash_ssram_pipeline_bridge_s1),
      .cpu_instruction_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register (cpu_instruction_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register),
      .cpu_instruction_master_readdata                                                      (cpu_instruction_master_readdata),
      .cpu_instruction_master_readdatavalid                                                 (cpu_instruction_master_readdatavalid),
      .cpu_instruction_master_requests_cpu_ddr_clock_bridge_s1                              (cpu_instruction_master_requests_cpu_ddr_clock_bridge_s1),
      .cpu_instruction_master_requests_cpu_jtag_debug_module                                (cpu_instruction_master_requests_cpu_jtag_debug_module),
      .cpu_instruction_master_requests_flash_ssram_pipeline_bridge_s1                       (cpu_instruction_master_requests_flash_ssram_pipeline_bridge_s1),
      .cpu_instruction_master_waitrequest                                                   (cpu_instruction_master_waitrequest),
      .cpu_jtag_debug_module_readdata_from_sa                                               (cpu_jtag_debug_module_readdata_from_sa),
      .d1_cpu_ddr_clock_bridge_s1_end_xfer                                                  (d1_cpu_ddr_clock_bridge_s1_end_xfer),
      .d1_cpu_jtag_debug_module_end_xfer                                                    (d1_cpu_jtag_debug_module_end_xfer),
      .d1_flash_ssram_pipeline_bridge_s1_end_xfer                                           (d1_flash_ssram_pipeline_bridge_s1_end_xfer),
      .flash_ssram_pipeline_bridge_s1_readdata_from_sa                                      (flash_ssram_pipeline_bridge_s1_readdata_from_sa),
      .flash_ssram_pipeline_bridge_s1_waitrequest_from_sa                                   (flash_ssram_pipeline_bridge_s1_waitrequest_from_sa),
      .reset_n                                                                              (pll_c0_out_reset_n)
    );

  cpu the_cpu
    (
      .clk                                   (pll_c0_out),
      .d_address                             (cpu_data_master_address),
      .d_byteenable                          (cpu_data_master_byteenable),
      .d_irq                                 (cpu_data_master_irq),
      .d_read                                (cpu_data_master_read),
      .d_readdata                            (cpu_data_master_readdata),
      .d_readdatavalid                       (cpu_data_master_readdatavalid),
      .d_waitrequest                         (cpu_data_master_waitrequest),
      .d_write                               (cpu_data_master_write),
      .d_writedata                           (cpu_data_master_writedata),
      .i_address                             (cpu_instruction_master_address),
      .i_read                                (cpu_instruction_master_read),
      .i_readdata                            (cpu_instruction_master_readdata),
      .i_readdatavalid                       (cpu_instruction_master_readdatavalid),
      .i_waitrequest                         (cpu_instruction_master_waitrequest),
      .jtag_debug_module_address             (cpu_jtag_debug_module_address),
      .jtag_debug_module_begintransfer       (cpu_jtag_debug_module_begintransfer),
      .jtag_debug_module_byteenable          (cpu_jtag_debug_module_byteenable),
      .jtag_debug_module_clk                 (pll_c0_out),
      .jtag_debug_module_debugaccess         (cpu_jtag_debug_module_debugaccess),
      .jtag_debug_module_debugaccess_to_roms (cpu_data_master_debugaccess),
      .jtag_debug_module_readdata            (cpu_jtag_debug_module_readdata),
      .jtag_debug_module_reset               (cpu_jtag_debug_module_reset),
      .jtag_debug_module_resetrequest        (cpu_jtag_debug_module_resetrequest),
      .jtag_debug_module_select              (cpu_jtag_debug_module_chipselect),
      .jtag_debug_module_write               (cpu_jtag_debug_module_write),
      .jtag_debug_module_writedata           (cpu_jtag_debug_module_writedata),
      .reset_n                               (cpu_jtag_debug_module_reset_n)
    );

  cpu_ddr_clock_bridge_s1_arbitrator the_cpu_ddr_clock_bridge_s1
    (
      .clk                                                                                  (pll_c0_out),
      .cpu_data_master_address_to_slave                                                     (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                                           (cpu_data_master_byteenable),
      .cpu_data_master_granted_cpu_ddr_clock_bridge_s1                                      (cpu_data_master_granted_cpu_ddr_clock_bridge_s1),
      .cpu_data_master_latency_counter                                                      (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_cpu_ddr_clock_bridge_s1                            (cpu_data_master_qualified_request_cpu_ddr_clock_bridge_s1),
      .cpu_data_master_read                                                                 (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1                              (cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1),
      .cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register               (cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register        (cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_slow_peripheral_bridge_s1_shift_register             (cpu_data_master_read_data_valid_slow_peripheral_bridge_s1_shift_register),
      .cpu_data_master_requests_cpu_ddr_clock_bridge_s1                                     (cpu_data_master_requests_cpu_ddr_clock_bridge_s1),
      .cpu_data_master_write                                                                (cpu_data_master_write),
      .cpu_data_master_writedata                                                            (cpu_data_master_writedata),
      .cpu_ddr_clock_bridge_s1_address                                                      (cpu_ddr_clock_bridge_s1_address),
      .cpu_ddr_clock_bridge_s1_byteenable                                                   (cpu_ddr_clock_bridge_s1_byteenable),
      .cpu_ddr_clock_bridge_s1_endofpacket                                                  (cpu_ddr_clock_bridge_s1_endofpacket),
      .cpu_ddr_clock_bridge_s1_endofpacket_from_sa                                          (cpu_ddr_clock_bridge_s1_endofpacket_from_sa),
      .cpu_ddr_clock_bridge_s1_nativeaddress                                                (cpu_ddr_clock_bridge_s1_nativeaddress),
      .cpu_ddr_clock_bridge_s1_read                                                         (cpu_ddr_clock_bridge_s1_read),
      .cpu_ddr_clock_bridge_s1_readdata                                                     (cpu_ddr_clock_bridge_s1_readdata),
      .cpu_ddr_clock_bridge_s1_readdata_from_sa                                             (cpu_ddr_clock_bridge_s1_readdata_from_sa),
      .cpu_ddr_clock_bridge_s1_readdatavalid                                                (cpu_ddr_clock_bridge_s1_readdatavalid),
      .cpu_ddr_clock_bridge_s1_reset_n                                                      (cpu_ddr_clock_bridge_s1_reset_n),
      .cpu_ddr_clock_bridge_s1_waitrequest                                                  (cpu_ddr_clock_bridge_s1_waitrequest),
      .cpu_ddr_clock_bridge_s1_waitrequest_from_sa                                          (cpu_ddr_clock_bridge_s1_waitrequest_from_sa),
      .cpu_ddr_clock_bridge_s1_write                                                        (cpu_ddr_clock_bridge_s1_write),
      .cpu_ddr_clock_bridge_s1_writedata                                                    (cpu_ddr_clock_bridge_s1_writedata),
      .cpu_instruction_master_address_to_slave                                              (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_cpu_ddr_clock_bridge_s1                               (cpu_instruction_master_granted_cpu_ddr_clock_bridge_s1),
      .cpu_instruction_master_latency_counter                                               (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_cpu_ddr_clock_bridge_s1                     (cpu_instruction_master_qualified_request_cpu_ddr_clock_bridge_s1),
      .cpu_instruction_master_read                                                          (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cpu_ddr_clock_bridge_s1                       (cpu_instruction_master_read_data_valid_cpu_ddr_clock_bridge_s1),
      .cpu_instruction_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register        (cpu_instruction_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register),
      .cpu_instruction_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register (cpu_instruction_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register),
      .cpu_instruction_master_requests_cpu_ddr_clock_bridge_s1                              (cpu_instruction_master_requests_cpu_ddr_clock_bridge_s1),
      .d1_cpu_ddr_clock_bridge_s1_end_xfer                                                  (d1_cpu_ddr_clock_bridge_s1_end_xfer),
      .reset_n                                                                              (pll_c0_out_reset_n)
    );

  cpu_ddr_clock_bridge_m1_arbitrator the_cpu_ddr_clock_bridge_m1
    (
      .clk                                                                 (ddr_sdram_phy_clk_out),
      .cpu_ddr_clock_bridge_m1_address                                     (cpu_ddr_clock_bridge_m1_address),
      .cpu_ddr_clock_bridge_m1_address_to_slave                            (cpu_ddr_clock_bridge_m1_address_to_slave),
      .cpu_ddr_clock_bridge_m1_byteenable                                  (cpu_ddr_clock_bridge_m1_byteenable),
      .cpu_ddr_clock_bridge_m1_granted_ddr_sdram_s1                        (cpu_ddr_clock_bridge_m1_granted_ddr_sdram_s1),
      .cpu_ddr_clock_bridge_m1_latency_counter                             (cpu_ddr_clock_bridge_m1_latency_counter),
      .cpu_ddr_clock_bridge_m1_qualified_request_ddr_sdram_s1              (cpu_ddr_clock_bridge_m1_qualified_request_ddr_sdram_s1),
      .cpu_ddr_clock_bridge_m1_read                                        (cpu_ddr_clock_bridge_m1_read),
      .cpu_ddr_clock_bridge_m1_read_data_valid_ddr_sdram_s1                (cpu_ddr_clock_bridge_m1_read_data_valid_ddr_sdram_s1),
      .cpu_ddr_clock_bridge_m1_read_data_valid_ddr_sdram_s1_shift_register (cpu_ddr_clock_bridge_m1_read_data_valid_ddr_sdram_s1_shift_register),
      .cpu_ddr_clock_bridge_m1_readdata                                    (cpu_ddr_clock_bridge_m1_readdata),
      .cpu_ddr_clock_bridge_m1_readdatavalid                               (cpu_ddr_clock_bridge_m1_readdatavalid),
      .cpu_ddr_clock_bridge_m1_requests_ddr_sdram_s1                       (cpu_ddr_clock_bridge_m1_requests_ddr_sdram_s1),
      .cpu_ddr_clock_bridge_m1_reset_n                                     (cpu_ddr_clock_bridge_m1_reset_n),
      .cpu_ddr_clock_bridge_m1_waitrequest                                 (cpu_ddr_clock_bridge_m1_waitrequest),
      .cpu_ddr_clock_bridge_m1_write                                       (cpu_ddr_clock_bridge_m1_write),
      .cpu_ddr_clock_bridge_m1_writedata                                   (cpu_ddr_clock_bridge_m1_writedata),
      .d1_ddr_sdram_s1_end_xfer                                            (d1_ddr_sdram_s1_end_xfer),
      .ddr_sdram_s1_readdata_from_sa                                       (ddr_sdram_s1_readdata_from_sa),
      .ddr_sdram_s1_waitrequest_n_from_sa                                  (ddr_sdram_s1_waitrequest_n_from_sa),
      .reset_n                                                             (ddr_sdram_phy_clk_out_reset_n)
    );

  cpu_ddr_clock_bridge the_cpu_ddr_clock_bridge
    (
      .master_address       (cpu_ddr_clock_bridge_m1_address),
      .master_byteenable    (cpu_ddr_clock_bridge_m1_byteenable),
      .master_clk           (ddr_sdram_phy_clk_out),
      .master_endofpacket   (cpu_ddr_clock_bridge_m1_endofpacket),
      .master_nativeaddress (cpu_ddr_clock_bridge_m1_nativeaddress),
      .master_read          (cpu_ddr_clock_bridge_m1_read),
      .master_readdata      (cpu_ddr_clock_bridge_m1_readdata),
      .master_readdatavalid (cpu_ddr_clock_bridge_m1_readdatavalid),
      .master_reset_n       (cpu_ddr_clock_bridge_m1_reset_n),
      .master_waitrequest   (cpu_ddr_clock_bridge_m1_waitrequest),
      .master_write         (cpu_ddr_clock_bridge_m1_write),
      .master_writedata     (cpu_ddr_clock_bridge_m1_writedata),
      .slave_address        (cpu_ddr_clock_bridge_s1_address),
      .slave_byteenable     (cpu_ddr_clock_bridge_s1_byteenable),
      .slave_clk            (pll_c0_out),
      .slave_endofpacket    (cpu_ddr_clock_bridge_s1_endofpacket),
      .slave_nativeaddress  (cpu_ddr_clock_bridge_s1_nativeaddress),
      .slave_read           (cpu_ddr_clock_bridge_s1_read),
      .slave_readdata       (cpu_ddr_clock_bridge_s1_readdata),
      .slave_readdatavalid  (cpu_ddr_clock_bridge_s1_readdatavalid),
      .slave_reset_n        (cpu_ddr_clock_bridge_s1_reset_n),
      .slave_waitrequest    (cpu_ddr_clock_bridge_s1_waitrequest),
      .slave_write          (cpu_ddr_clock_bridge_s1_write),
      .slave_writedata      (cpu_ddr_clock_bridge_s1_writedata)
    );

  cycloneIII_3c25_niosII_standard_sopc_clock_0_in_arbitrator the_cycloneIII_3c25_niosII_standard_sopc_clock_0_in
    (
      .clk                                                                                         (pll_c2_out),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_in_address                                     (cycloneIII_3c25_niosII_standard_sopc_clock_0_in_address),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_in_byteenable                                  (cycloneIII_3c25_niosII_standard_sopc_clock_0_in_byteenable),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_in_endofpacket                                 (cycloneIII_3c25_niosII_standard_sopc_clock_0_in_endofpacket),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_in_endofpacket_from_sa                         (cycloneIII_3c25_niosII_standard_sopc_clock_0_in_endofpacket_from_sa),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_in_nativeaddress                               (cycloneIII_3c25_niosII_standard_sopc_clock_0_in_nativeaddress),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_in_read                                        (cycloneIII_3c25_niosII_standard_sopc_clock_0_in_read),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_in_readdata                                    (cycloneIII_3c25_niosII_standard_sopc_clock_0_in_readdata),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_in_readdata_from_sa                            (cycloneIII_3c25_niosII_standard_sopc_clock_0_in_readdata_from_sa),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_in_reset_n                                     (cycloneIII_3c25_niosII_standard_sopc_clock_0_in_reset_n),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_in_waitrequest                                 (cycloneIII_3c25_niosII_standard_sopc_clock_0_in_waitrequest),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_in_waitrequest_from_sa                         (cycloneIII_3c25_niosII_standard_sopc_clock_0_in_waitrequest_from_sa),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_in_write                                       (cycloneIII_3c25_niosII_standard_sopc_clock_0_in_write),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_in_writedata                                   (cycloneIII_3c25_niosII_standard_sopc_clock_0_in_writedata),
      .d1_cycloneIII_3c25_niosII_standard_sopc_clock_0_in_end_xfer                                 (d1_cycloneIII_3c25_niosII_standard_sopc_clock_0_in_end_xfer),
      .reset_n                                                                                     (pll_c2_out_reset_n),
      .slow_peripheral_bridge_m1_address_to_slave                                                  (slow_peripheral_bridge_m1_address_to_slave),
      .slow_peripheral_bridge_m1_byteenable                                                        (slow_peripheral_bridge_m1_byteenable),
      .slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_0_in           (slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_0_in),
      .slow_peripheral_bridge_m1_latency_counter                                                   (slow_peripheral_bridge_m1_latency_counter),
      .slow_peripheral_bridge_m1_nativeaddress                                                     (slow_peripheral_bridge_m1_nativeaddress),
      .slow_peripheral_bridge_m1_qualified_request_cycloneIII_3c25_niosII_standard_sopc_clock_0_in (slow_peripheral_bridge_m1_qualified_request_cycloneIII_3c25_niosII_standard_sopc_clock_0_in),
      .slow_peripheral_bridge_m1_read                                                              (slow_peripheral_bridge_m1_read),
      .slow_peripheral_bridge_m1_read_data_valid_cycloneIII_3c25_niosII_standard_sopc_clock_0_in   (slow_peripheral_bridge_m1_read_data_valid_cycloneIII_3c25_niosII_standard_sopc_clock_0_in),
      .slow_peripheral_bridge_m1_requests_cycloneIII_3c25_niosII_standard_sopc_clock_0_in          (slow_peripheral_bridge_m1_requests_cycloneIII_3c25_niosII_standard_sopc_clock_0_in),
      .slow_peripheral_bridge_m1_write                                                             (slow_peripheral_bridge_m1_write),
      .slow_peripheral_bridge_m1_writedata                                                         (slow_peripheral_bridge_m1_writedata)
    );

  cycloneIII_3c25_niosII_standard_sopc_clock_0_out_arbitrator the_cycloneIII_3c25_niosII_standard_sopc_clock_0_out
    (
      .clk                                                                       (clk),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_out_address                  (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_address),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_out_address_to_slave         (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_address_to_slave),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_out_byteenable               (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_byteenable),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_out_granted_pll_s1           (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_granted_pll_s1),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_out_qualified_request_pll_s1 (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_qualified_request_pll_s1),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_out_read                     (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_read),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_out_read_data_valid_pll_s1   (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_read_data_valid_pll_s1),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_out_readdata                 (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_readdata),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_out_requests_pll_s1          (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_requests_pll_s1),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_out_reset_n                  (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_reset_n),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_out_waitrequest              (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_waitrequest),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_out_write                    (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_write),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_out_writedata                (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_writedata),
      .d1_pll_s1_end_xfer                                                        (d1_pll_s1_end_xfer),
      .pll_s1_readdata_from_sa                                                   (pll_s1_readdata_from_sa),
      .reset_n                                                                   (clk_reset_n)
    );

  cycloneIII_3c25_niosII_standard_sopc_clock_0 the_cycloneIII_3c25_niosII_standard_sopc_clock_0
    (
      .master_address       (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_address),
      .master_byteenable    (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_byteenable),
      .master_clk           (clk),
      .master_endofpacket   (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_endofpacket),
      .master_nativeaddress (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_nativeaddress),
      .master_read          (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_read),
      .master_readdata      (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_readdata),
      .master_reset_n       (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_reset_n),
      .master_waitrequest   (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_waitrequest),
      .master_write         (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_write),
      .master_writedata     (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_writedata),
      .slave_address        (cycloneIII_3c25_niosII_standard_sopc_clock_0_in_address),
      .slave_byteenable     (cycloneIII_3c25_niosII_standard_sopc_clock_0_in_byteenable),
      .slave_clk            (pll_c2_out),
      .slave_endofpacket    (cycloneIII_3c25_niosII_standard_sopc_clock_0_in_endofpacket),
      .slave_nativeaddress  (cycloneIII_3c25_niosII_standard_sopc_clock_0_in_nativeaddress),
      .slave_read           (cycloneIII_3c25_niosII_standard_sopc_clock_0_in_read),
      .slave_readdata       (cycloneIII_3c25_niosII_standard_sopc_clock_0_in_readdata),
      .slave_reset_n        (cycloneIII_3c25_niosII_standard_sopc_clock_0_in_reset_n),
      .slave_waitrequest    (cycloneIII_3c25_niosII_standard_sopc_clock_0_in_waitrequest),
      .slave_write          (cycloneIII_3c25_niosII_standard_sopc_clock_0_in_write),
      .slave_writedata      (cycloneIII_3c25_niosII_standard_sopc_clock_0_in_writedata)
    );

  cycloneIII_3c25_niosII_standard_sopc_clock_1_in_arbitrator the_cycloneIII_3c25_niosII_standard_sopc_clock_1_in
    (
      .clk                                                                                         (pll_c2_out),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_in_address                                     (cycloneIII_3c25_niosII_standard_sopc_clock_1_in_address),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_in_byteenable                                  (cycloneIII_3c25_niosII_standard_sopc_clock_1_in_byteenable),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_in_endofpacket                                 (cycloneIII_3c25_niosII_standard_sopc_clock_1_in_endofpacket),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_in_endofpacket_from_sa                         (cycloneIII_3c25_niosII_standard_sopc_clock_1_in_endofpacket_from_sa),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_in_nativeaddress                               (cycloneIII_3c25_niosII_standard_sopc_clock_1_in_nativeaddress),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_in_read                                        (cycloneIII_3c25_niosII_standard_sopc_clock_1_in_read),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_in_readdata                                    (cycloneIII_3c25_niosII_standard_sopc_clock_1_in_readdata),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_in_readdata_from_sa                            (cycloneIII_3c25_niosII_standard_sopc_clock_1_in_readdata_from_sa),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_in_reset_n                                     (cycloneIII_3c25_niosII_standard_sopc_clock_1_in_reset_n),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_in_waitrequest                                 (cycloneIII_3c25_niosII_standard_sopc_clock_1_in_waitrequest),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_in_waitrequest_from_sa                         (cycloneIII_3c25_niosII_standard_sopc_clock_1_in_waitrequest_from_sa),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_in_write                                       (cycloneIII_3c25_niosII_standard_sopc_clock_1_in_write),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_in_writedata                                   (cycloneIII_3c25_niosII_standard_sopc_clock_1_in_writedata),
      .d1_cycloneIII_3c25_niosII_standard_sopc_clock_1_in_end_xfer                                 (d1_cycloneIII_3c25_niosII_standard_sopc_clock_1_in_end_xfer),
      .reset_n                                                                                     (pll_c2_out_reset_n),
      .slow_peripheral_bridge_m1_address_to_slave                                                  (slow_peripheral_bridge_m1_address_to_slave),
      .slow_peripheral_bridge_m1_byteenable                                                        (slow_peripheral_bridge_m1_byteenable),
      .slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_1_in           (slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_1_in),
      .slow_peripheral_bridge_m1_latency_counter                                                   (slow_peripheral_bridge_m1_latency_counter),
      .slow_peripheral_bridge_m1_nativeaddress                                                     (slow_peripheral_bridge_m1_nativeaddress),
      .slow_peripheral_bridge_m1_qualified_request_cycloneIII_3c25_niosII_standard_sopc_clock_1_in (slow_peripheral_bridge_m1_qualified_request_cycloneIII_3c25_niosII_standard_sopc_clock_1_in),
      .slow_peripheral_bridge_m1_read                                                              (slow_peripheral_bridge_m1_read),
      .slow_peripheral_bridge_m1_read_data_valid_cycloneIII_3c25_niosII_standard_sopc_clock_1_in   (slow_peripheral_bridge_m1_read_data_valid_cycloneIII_3c25_niosII_standard_sopc_clock_1_in),
      .slow_peripheral_bridge_m1_requests_cycloneIII_3c25_niosII_standard_sopc_clock_1_in          (slow_peripheral_bridge_m1_requests_cycloneIII_3c25_niosII_standard_sopc_clock_1_in),
      .slow_peripheral_bridge_m1_write                                                             (slow_peripheral_bridge_m1_write),
      .slow_peripheral_bridge_m1_writedata                                                         (slow_peripheral_bridge_m1_writedata)
    );

  cycloneIII_3c25_niosII_standard_sopc_clock_1_out_arbitrator the_cycloneIII_3c25_niosII_standard_sopc_clock_1_out
    (
      .clk                                                                                 (pll_c3_out),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_out_address                            (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_address),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_out_address_to_slave                   (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_address_to_slave),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_out_byteenable                         (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_byteenable),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_out_granted_remote_update_s1           (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_granted_remote_update_s1),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_out_qualified_request_remote_update_s1 (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_qualified_request_remote_update_s1),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read                               (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read_data_valid_remote_update_s1   (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read_data_valid_remote_update_s1),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_out_readdata                           (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_readdata),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_out_requests_remote_update_s1          (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_requests_remote_update_s1),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_out_reset_n                            (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_reset_n),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_out_waitrequest                        (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_waitrequest),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_out_write                              (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_write),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_out_writedata                          (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_writedata),
      .d1_remote_update_s1_end_xfer                                                        (d1_remote_update_s1_end_xfer),
      .remote_update_s1_readdata_from_sa                                                   (remote_update_s1_readdata_from_sa),
      .remote_update_s1_waitrequest_from_sa                                                (remote_update_s1_waitrequest_from_sa),
      .reset_n                                                                             (pll_c3_out_reset_n)
    );

  cycloneIII_3c25_niosII_standard_sopc_clock_1 the_cycloneIII_3c25_niosII_standard_sopc_clock_1
    (
      .master_address       (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_address),
      .master_byteenable    (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_byteenable),
      .master_clk           (pll_c3_out),
      .master_endofpacket   (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_endofpacket),
      .master_nativeaddress (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_nativeaddress),
      .master_read          (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read),
      .master_readdata      (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_readdata),
      .master_reset_n       (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_reset_n),
      .master_waitrequest   (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_waitrequest),
      .master_write         (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_write),
      .master_writedata     (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_writedata),
      .slave_address        (cycloneIII_3c25_niosII_standard_sopc_clock_1_in_address),
      .slave_byteenable     (cycloneIII_3c25_niosII_standard_sopc_clock_1_in_byteenable),
      .slave_clk            (pll_c2_out),
      .slave_endofpacket    (cycloneIII_3c25_niosII_standard_sopc_clock_1_in_endofpacket),
      .slave_nativeaddress  (cycloneIII_3c25_niosII_standard_sopc_clock_1_in_nativeaddress),
      .slave_read           (cycloneIII_3c25_niosII_standard_sopc_clock_1_in_read),
      .slave_readdata       (cycloneIII_3c25_niosII_standard_sopc_clock_1_in_readdata),
      .slave_reset_n        (cycloneIII_3c25_niosII_standard_sopc_clock_1_in_reset_n),
      .slave_waitrequest    (cycloneIII_3c25_niosII_standard_sopc_clock_1_in_waitrequest),
      .slave_write          (cycloneIII_3c25_niosII_standard_sopc_clock_1_in_write),
      .slave_writedata      (cycloneIII_3c25_niosII_standard_sopc_clock_1_in_writedata)
    );

  ddr_sdram_s1_arbitrator the_ddr_sdram_s1
    (
      .clk                                                                 (ddr_sdram_phy_clk_out),
      .cpu_ddr_clock_bridge_m1_address_to_slave                            (cpu_ddr_clock_bridge_m1_address_to_slave),
      .cpu_ddr_clock_bridge_m1_byteenable                                  (cpu_ddr_clock_bridge_m1_byteenable),
      .cpu_ddr_clock_bridge_m1_granted_ddr_sdram_s1                        (cpu_ddr_clock_bridge_m1_granted_ddr_sdram_s1),
      .cpu_ddr_clock_bridge_m1_latency_counter                             (cpu_ddr_clock_bridge_m1_latency_counter),
      .cpu_ddr_clock_bridge_m1_qualified_request_ddr_sdram_s1              (cpu_ddr_clock_bridge_m1_qualified_request_ddr_sdram_s1),
      .cpu_ddr_clock_bridge_m1_read                                        (cpu_ddr_clock_bridge_m1_read),
      .cpu_ddr_clock_bridge_m1_read_data_valid_ddr_sdram_s1                (cpu_ddr_clock_bridge_m1_read_data_valid_ddr_sdram_s1),
      .cpu_ddr_clock_bridge_m1_read_data_valid_ddr_sdram_s1_shift_register (cpu_ddr_clock_bridge_m1_read_data_valid_ddr_sdram_s1_shift_register),
      .cpu_ddr_clock_bridge_m1_requests_ddr_sdram_s1                       (cpu_ddr_clock_bridge_m1_requests_ddr_sdram_s1),
      .cpu_ddr_clock_bridge_m1_write                                       (cpu_ddr_clock_bridge_m1_write),
      .cpu_ddr_clock_bridge_m1_writedata                                   (cpu_ddr_clock_bridge_m1_writedata),
      .d1_ddr_sdram_s1_end_xfer                                            (d1_ddr_sdram_s1_end_xfer),
      .ddr_sdram_s1_address                                                (ddr_sdram_s1_address),
      .ddr_sdram_s1_beginbursttransfer                                     (ddr_sdram_s1_beginbursttransfer),
      .ddr_sdram_s1_burstcount                                             (ddr_sdram_s1_burstcount),
      .ddr_sdram_s1_byteenable                                             (ddr_sdram_s1_byteenable),
      .ddr_sdram_s1_read                                                   (ddr_sdram_s1_read),
      .ddr_sdram_s1_readdata                                               (ddr_sdram_s1_readdata),
      .ddr_sdram_s1_readdata_from_sa                                       (ddr_sdram_s1_readdata_from_sa),
      .ddr_sdram_s1_readdatavalid                                          (ddr_sdram_s1_readdatavalid),
      .ddr_sdram_s1_resetrequest_n                                         (ddr_sdram_s1_resetrequest_n),
      .ddr_sdram_s1_resetrequest_n_from_sa                                 (ddr_sdram_s1_resetrequest_n_from_sa),
      .ddr_sdram_s1_waitrequest_n                                          (ddr_sdram_s1_waitrequest_n),
      .ddr_sdram_s1_waitrequest_n_from_sa                                  (ddr_sdram_s1_waitrequest_n_from_sa),
      .ddr_sdram_s1_write                                                  (ddr_sdram_s1_write),
      .ddr_sdram_s1_writedata                                              (ddr_sdram_s1_writedata),
      .reset_n                                                             (ddr_sdram_phy_clk_out_reset_n)
    );

  //ddr_sdram_aux_full_rate_clk_out out_clk assignment, which is an e_assign
  assign ddr_sdram_aux_full_rate_clk_out = out_clk_ddr_sdram_aux_full_rate_clk;

  //ddr_sdram_aux_half_rate_clk_out out_clk assignment, which is an e_assign
  assign ddr_sdram_aux_half_rate_clk_out = out_clk_ddr_sdram_aux_half_rate_clk;

  //ddr_sdram_phy_clk_out out_clk assignment, which is an e_assign
  assign ddr_sdram_phy_clk_out = out_clk_ddr_sdram_phy_clk;

  //reset is asserted asynchronously and deasserted synchronously
  cycloneIII_3c25_niosII_standard_sopc_reset_clk_domain_synch_module cycloneIII_3c25_niosII_standard_sopc_reset_clk_domain_synch
    (
      .clk      (clk),
      .data_in  (1'b1),
      .data_out (clk_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset sources mux, which is an e_mux
  assign reset_n_sources = ~(~reset_n |
    0 |
    0 |
    0 |
    cpu_jtag_debug_module_resetrequest_from_sa |
    cpu_jtag_debug_module_resetrequest_from_sa |
    0 |
    ~ddr_sdram_s1_resetrequest_n_from_sa |
    ~ddr_sdram_s1_resetrequest_n_from_sa |
    pll_s1_resetrequest_from_sa |
    pll_s1_resetrequest_from_sa |
    0);

  ddr_sdram the_ddr_sdram
    (
      .aux_full_rate_clk (out_clk_ddr_sdram_aux_full_rate_clk),
      .aux_half_rate_clk (out_clk_ddr_sdram_aux_half_rate_clk),
      .global_reset_n    (global_reset_n_to_the_ddr_sdram),
      .local_address     (ddr_sdram_s1_address),
      .local_be          (ddr_sdram_s1_byteenable),
      .local_burstbegin  (ddr_sdram_s1_beginbursttransfer),
      .local_init_done   (local_init_done_from_the_ddr_sdram),
      .local_rdata       (ddr_sdram_s1_readdata),
      .local_rdata_valid (ddr_sdram_s1_readdatavalid),
      .local_read_req    (ddr_sdram_s1_read),
      .local_ready       (ddr_sdram_s1_waitrequest_n),
      .local_refresh_ack (local_refresh_ack_from_the_ddr_sdram),
      .local_size        (ddr_sdram_s1_burstcount),
      .local_wdata       (ddr_sdram_s1_writedata),
      .local_wdata_req   (local_wdata_req_from_the_ddr_sdram),
      .local_write_req   (ddr_sdram_s1_write),
      .mem_addr          (mem_addr_from_the_ddr_sdram),
      .mem_ba            (mem_ba_from_the_ddr_sdram),
      .mem_cas_n         (mem_cas_n_from_the_ddr_sdram),
      .mem_cke           (mem_cke_from_the_ddr_sdram),
      .mem_clk           (mem_clk_to_and_from_the_ddr_sdram),
      .mem_clk_n         (mem_clk_n_to_and_from_the_ddr_sdram),
      .mem_cs_n          (mem_cs_n_from_the_ddr_sdram),
      .mem_dm            (mem_dm_from_the_ddr_sdram),
      .mem_dq            (mem_dq_to_and_from_the_ddr_sdram),
      .mem_dqs           (mem_dqs_to_and_from_the_ddr_sdram),
      .mem_ras_n         (mem_ras_n_from_the_ddr_sdram),
      .mem_we_n          (mem_we_n_from_the_ddr_sdram),
      .phy_clk           (out_clk_ddr_sdram_phy_clk),
      .pll_ref_clk       (clk),
      .reset_phy_clk_n   (reset_phy_clk_n_from_the_ddr_sdram),
      .reset_request_n   (ddr_sdram_s1_resetrequest_n),
      .soft_reset_n      (clk_reset_n)
    );

  flash_ssram_pipeline_bridge_s1_arbitrator the_flash_ssram_pipeline_bridge_s1
    (
      .clk                                                                                  (pll_c0_out),
      .cpu_data_master_address_to_slave                                                     (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                                           (cpu_data_master_byteenable),
      .cpu_data_master_debugaccess                                                          (cpu_data_master_debugaccess),
      .cpu_data_master_granted_flash_ssram_pipeline_bridge_s1                               (cpu_data_master_granted_flash_ssram_pipeline_bridge_s1),
      .cpu_data_master_latency_counter                                                      (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_flash_ssram_pipeline_bridge_s1                     (cpu_data_master_qualified_request_flash_ssram_pipeline_bridge_s1),
      .cpu_data_master_read                                                                 (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register               (cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1                       (cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1),
      .cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register        (cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_slow_peripheral_bridge_s1_shift_register             (cpu_data_master_read_data_valid_slow_peripheral_bridge_s1_shift_register),
      .cpu_data_master_requests_flash_ssram_pipeline_bridge_s1                              (cpu_data_master_requests_flash_ssram_pipeline_bridge_s1),
      .cpu_data_master_write                                                                (cpu_data_master_write),
      .cpu_data_master_writedata                                                            (cpu_data_master_writedata),
      .cpu_instruction_master_address_to_slave                                              (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_flash_ssram_pipeline_bridge_s1                        (cpu_instruction_master_granted_flash_ssram_pipeline_bridge_s1),
      .cpu_instruction_master_latency_counter                                               (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_flash_ssram_pipeline_bridge_s1              (cpu_instruction_master_qualified_request_flash_ssram_pipeline_bridge_s1),
      .cpu_instruction_master_read                                                          (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register        (cpu_instruction_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register),
      .cpu_instruction_master_read_data_valid_flash_ssram_pipeline_bridge_s1                (cpu_instruction_master_read_data_valid_flash_ssram_pipeline_bridge_s1),
      .cpu_instruction_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register (cpu_instruction_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register),
      .cpu_instruction_master_requests_flash_ssram_pipeline_bridge_s1                       (cpu_instruction_master_requests_flash_ssram_pipeline_bridge_s1),
      .d1_flash_ssram_pipeline_bridge_s1_end_xfer                                           (d1_flash_ssram_pipeline_bridge_s1_end_xfer),
      .flash_ssram_pipeline_bridge_s1_address                                               (flash_ssram_pipeline_bridge_s1_address),
      .flash_ssram_pipeline_bridge_s1_arbiterlock                                           (flash_ssram_pipeline_bridge_s1_arbiterlock),
      .flash_ssram_pipeline_bridge_s1_arbiterlock2                                          (flash_ssram_pipeline_bridge_s1_arbiterlock2),
      .flash_ssram_pipeline_bridge_s1_burstcount                                            (flash_ssram_pipeline_bridge_s1_burstcount),
      .flash_ssram_pipeline_bridge_s1_byteenable                                            (flash_ssram_pipeline_bridge_s1_byteenable),
      .flash_ssram_pipeline_bridge_s1_chipselect                                            (flash_ssram_pipeline_bridge_s1_chipselect),
      .flash_ssram_pipeline_bridge_s1_debugaccess                                           (flash_ssram_pipeline_bridge_s1_debugaccess),
      .flash_ssram_pipeline_bridge_s1_endofpacket                                           (flash_ssram_pipeline_bridge_s1_endofpacket),
      .flash_ssram_pipeline_bridge_s1_endofpacket_from_sa                                   (flash_ssram_pipeline_bridge_s1_endofpacket_from_sa),
      .flash_ssram_pipeline_bridge_s1_nativeaddress                                         (flash_ssram_pipeline_bridge_s1_nativeaddress),
      .flash_ssram_pipeline_bridge_s1_read                                                  (flash_ssram_pipeline_bridge_s1_read),
      .flash_ssram_pipeline_bridge_s1_readdata                                              (flash_ssram_pipeline_bridge_s1_readdata),
      .flash_ssram_pipeline_bridge_s1_readdata_from_sa                                      (flash_ssram_pipeline_bridge_s1_readdata_from_sa),
      .flash_ssram_pipeline_bridge_s1_readdatavalid                                         (flash_ssram_pipeline_bridge_s1_readdatavalid),
      .flash_ssram_pipeline_bridge_s1_reset_n                                               (flash_ssram_pipeline_bridge_s1_reset_n),
      .flash_ssram_pipeline_bridge_s1_waitrequest                                           (flash_ssram_pipeline_bridge_s1_waitrequest),
      .flash_ssram_pipeline_bridge_s1_waitrequest_from_sa                                   (flash_ssram_pipeline_bridge_s1_waitrequest_from_sa),
      .flash_ssram_pipeline_bridge_s1_write                                                 (flash_ssram_pipeline_bridge_s1_write),
      .flash_ssram_pipeline_bridge_s1_writedata                                             (flash_ssram_pipeline_bridge_s1_writedata),
      .reset_n                                                                              (pll_c0_out_reset_n)
    );

  flash_ssram_pipeline_bridge_m1_arbitrator the_flash_ssram_pipeline_bridge_m1
    (
      .clk                                                                                                     (pll_c0_out),
      .d1_pipeline_bridge_before_tristate_bridge_s1_end_xfer                                                   (d1_pipeline_bridge_before_tristate_bridge_s1_end_xfer),
      .flash_ssram_pipeline_bridge_m1_address                                                                  (flash_ssram_pipeline_bridge_m1_address),
      .flash_ssram_pipeline_bridge_m1_address_to_slave                                                         (flash_ssram_pipeline_bridge_m1_address_to_slave),
      .flash_ssram_pipeline_bridge_m1_burstcount                                                               (flash_ssram_pipeline_bridge_m1_burstcount),
      .flash_ssram_pipeline_bridge_m1_byteenable                                                               (flash_ssram_pipeline_bridge_m1_byteenable),
      .flash_ssram_pipeline_bridge_m1_chipselect                                                               (flash_ssram_pipeline_bridge_m1_chipselect),
      .flash_ssram_pipeline_bridge_m1_endofpacket                                                              (flash_ssram_pipeline_bridge_m1_endofpacket),
      .flash_ssram_pipeline_bridge_m1_granted_pipeline_bridge_before_tristate_bridge_s1                        (flash_ssram_pipeline_bridge_m1_granted_pipeline_bridge_before_tristate_bridge_s1),
      .flash_ssram_pipeline_bridge_m1_latency_counter                                                          (flash_ssram_pipeline_bridge_m1_latency_counter),
      .flash_ssram_pipeline_bridge_m1_qualified_request_pipeline_bridge_before_tristate_bridge_s1              (flash_ssram_pipeline_bridge_m1_qualified_request_pipeline_bridge_before_tristate_bridge_s1),
      .flash_ssram_pipeline_bridge_m1_read                                                                     (flash_ssram_pipeline_bridge_m1_read),
      .flash_ssram_pipeline_bridge_m1_read_data_valid_pipeline_bridge_before_tristate_bridge_s1                (flash_ssram_pipeline_bridge_m1_read_data_valid_pipeline_bridge_before_tristate_bridge_s1),
      .flash_ssram_pipeline_bridge_m1_read_data_valid_pipeline_bridge_before_tristate_bridge_s1_shift_register (flash_ssram_pipeline_bridge_m1_read_data_valid_pipeline_bridge_before_tristate_bridge_s1_shift_register),
      .flash_ssram_pipeline_bridge_m1_readdata                                                                 (flash_ssram_pipeline_bridge_m1_readdata),
      .flash_ssram_pipeline_bridge_m1_readdatavalid                                                            (flash_ssram_pipeline_bridge_m1_readdatavalid),
      .flash_ssram_pipeline_bridge_m1_requests_pipeline_bridge_before_tristate_bridge_s1                       (flash_ssram_pipeline_bridge_m1_requests_pipeline_bridge_before_tristate_bridge_s1),
      .flash_ssram_pipeline_bridge_m1_waitrequest                                                              (flash_ssram_pipeline_bridge_m1_waitrequest),
      .flash_ssram_pipeline_bridge_m1_write                                                                    (flash_ssram_pipeline_bridge_m1_write),
      .flash_ssram_pipeline_bridge_m1_writedata                                                                (flash_ssram_pipeline_bridge_m1_writedata),
      .pipeline_bridge_before_tristate_bridge_s1_endofpacket_from_sa                                           (pipeline_bridge_before_tristate_bridge_s1_endofpacket_from_sa),
      .pipeline_bridge_before_tristate_bridge_s1_readdata_from_sa                                              (pipeline_bridge_before_tristate_bridge_s1_readdata_from_sa),
      .pipeline_bridge_before_tristate_bridge_s1_waitrequest_from_sa                                           (pipeline_bridge_before_tristate_bridge_s1_waitrequest_from_sa),
      .reset_n                                                                                                 (pll_c0_out_reset_n)
    );

  flash_ssram_pipeline_bridge the_flash_ssram_pipeline_bridge
    (
      .clk              (pll_c0_out),
      .m1_address       (flash_ssram_pipeline_bridge_m1_address),
      .m1_burstcount    (flash_ssram_pipeline_bridge_m1_burstcount),
      .m1_byteenable    (flash_ssram_pipeline_bridge_m1_byteenable),
      .m1_chipselect    (flash_ssram_pipeline_bridge_m1_chipselect),
      .m1_debugaccess   (flash_ssram_pipeline_bridge_m1_debugaccess),
      .m1_endofpacket   (flash_ssram_pipeline_bridge_m1_endofpacket),
      .m1_read          (flash_ssram_pipeline_bridge_m1_read),
      .m1_readdata      (flash_ssram_pipeline_bridge_m1_readdata),
      .m1_readdatavalid (flash_ssram_pipeline_bridge_m1_readdatavalid),
      .m1_waitrequest   (flash_ssram_pipeline_bridge_m1_waitrequest),
      .m1_write         (flash_ssram_pipeline_bridge_m1_write),
      .m1_writedata     (flash_ssram_pipeline_bridge_m1_writedata),
      .reset_n          (flash_ssram_pipeline_bridge_s1_reset_n),
      .s1_address       (flash_ssram_pipeline_bridge_s1_address),
      .s1_arbiterlock   (flash_ssram_pipeline_bridge_s1_arbiterlock),
      .s1_arbiterlock2  (flash_ssram_pipeline_bridge_s1_arbiterlock2),
      .s1_burstcount    (flash_ssram_pipeline_bridge_s1_burstcount),
      .s1_byteenable    (flash_ssram_pipeline_bridge_s1_byteenable),
      .s1_chipselect    (flash_ssram_pipeline_bridge_s1_chipselect),
      .s1_debugaccess   (flash_ssram_pipeline_bridge_s1_debugaccess),
      .s1_endofpacket   (flash_ssram_pipeline_bridge_s1_endofpacket),
      .s1_nativeaddress (flash_ssram_pipeline_bridge_s1_nativeaddress),
      .s1_read          (flash_ssram_pipeline_bridge_s1_read),
      .s1_readdata      (flash_ssram_pipeline_bridge_s1_readdata),
      .s1_readdatavalid (flash_ssram_pipeline_bridge_s1_readdatavalid),
      .s1_waitrequest   (flash_ssram_pipeline_bridge_s1_waitrequest),
      .s1_write         (flash_ssram_pipeline_bridge_s1_write),
      .s1_writedata     (flash_ssram_pipeline_bridge_s1_writedata)
    );

  flash_ssram_tristate_bridge_avalon_slave_arbitrator the_flash_ssram_tristate_bridge_avalon_slave
    (
      .adsc_n_to_the_ssram                                                      (adsc_n_to_the_ssram),
      .bw_n_to_the_ssram                                                        (bw_n_to_the_ssram),
      .bwe_n_to_the_ssram                                                       (bwe_n_to_the_ssram),
      .chipenable1_n_to_the_ssram                                               (chipenable1_n_to_the_ssram),
      .clk                                                                      (pll_c0_out),
      .d1_flash_ssram_tristate_bridge_avalon_slave_end_xfer                     (d1_flash_ssram_tristate_bridge_avalon_slave_end_xfer),
      .ext_flash_s1_wait_counter_eq_0                                           (ext_flash_s1_wait_counter_eq_0),
      .flash_ssram_tristate_bridge_address                                      (flash_ssram_tristate_bridge_address),
      .flash_ssram_tristate_bridge_data                                         (flash_ssram_tristate_bridge_data),
      .incoming_flash_ssram_tristate_bridge_data                                (incoming_flash_ssram_tristate_bridge_data),
      .incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0         (incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0),
      .outputenable_n_to_the_ssram                                              (outputenable_n_to_the_ssram),
      .pipeline_bridge_before_tristate_bridge_m1_address_to_slave               (pipeline_bridge_before_tristate_bridge_m1_address_to_slave),
      .pipeline_bridge_before_tristate_bridge_m1_burstcount                     (pipeline_bridge_before_tristate_bridge_m1_burstcount),
      .pipeline_bridge_before_tristate_bridge_m1_byteenable                     (pipeline_bridge_before_tristate_bridge_m1_byteenable),
      .pipeline_bridge_before_tristate_bridge_m1_byteenable_ext_flash_s1        (pipeline_bridge_before_tristate_bridge_m1_byteenable_ext_flash_s1),
      .pipeline_bridge_before_tristate_bridge_m1_chipselect                     (pipeline_bridge_before_tristate_bridge_m1_chipselect),
      .pipeline_bridge_before_tristate_bridge_m1_dbs_address                    (pipeline_bridge_before_tristate_bridge_m1_dbs_address),
      .pipeline_bridge_before_tristate_bridge_m1_dbs_write_16                   (pipeline_bridge_before_tristate_bridge_m1_dbs_write_16),
      .pipeline_bridge_before_tristate_bridge_m1_granted_ext_flash_s1           (pipeline_bridge_before_tristate_bridge_m1_granted_ext_flash_s1),
      .pipeline_bridge_before_tristate_bridge_m1_granted_ssram_s1               (pipeline_bridge_before_tristate_bridge_m1_granted_ssram_s1),
      .pipeline_bridge_before_tristate_bridge_m1_latency_counter                (pipeline_bridge_before_tristate_bridge_m1_latency_counter),
      .pipeline_bridge_before_tristate_bridge_m1_qualified_request_ext_flash_s1 (pipeline_bridge_before_tristate_bridge_m1_qualified_request_ext_flash_s1),
      .pipeline_bridge_before_tristate_bridge_m1_qualified_request_ssram_s1     (pipeline_bridge_before_tristate_bridge_m1_qualified_request_ssram_s1),
      .pipeline_bridge_before_tristate_bridge_m1_read                           (pipeline_bridge_before_tristate_bridge_m1_read),
      .pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ext_flash_s1   (pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ext_flash_s1),
      .pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ssram_s1       (pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ssram_s1),
      .pipeline_bridge_before_tristate_bridge_m1_requests_ext_flash_s1          (pipeline_bridge_before_tristate_bridge_m1_requests_ext_flash_s1),
      .pipeline_bridge_before_tristate_bridge_m1_requests_ssram_s1              (pipeline_bridge_before_tristate_bridge_m1_requests_ssram_s1),
      .pipeline_bridge_before_tristate_bridge_m1_write                          (pipeline_bridge_before_tristate_bridge_m1_write),
      .pipeline_bridge_before_tristate_bridge_m1_writedata                      (pipeline_bridge_before_tristate_bridge_m1_writedata),
      .read_n_to_the_ext_flash                                                  (read_n_to_the_ext_flash),
      .reset_n                                                                  (pll_c0_out_reset_n),
      .select_n_to_the_ext_flash                                                (select_n_to_the_ext_flash),
      .write_n_to_the_ext_flash                                                 (write_n_to_the_ext_flash)
    );

  high_res_timer_s1_arbitrator the_high_res_timer_s1
    (
      .clk                                                           (pll_c2_out),
      .d1_high_res_timer_s1_end_xfer                                 (d1_high_res_timer_s1_end_xfer),
      .high_res_timer_s1_address                                     (high_res_timer_s1_address),
      .high_res_timer_s1_chipselect                                  (high_res_timer_s1_chipselect),
      .high_res_timer_s1_irq                                         (high_res_timer_s1_irq),
      .high_res_timer_s1_irq_from_sa                                 (high_res_timer_s1_irq_from_sa),
      .high_res_timer_s1_readdata                                    (high_res_timer_s1_readdata),
      .high_res_timer_s1_readdata_from_sa                            (high_res_timer_s1_readdata_from_sa),
      .high_res_timer_s1_reset_n                                     (high_res_timer_s1_reset_n),
      .high_res_timer_s1_write_n                                     (high_res_timer_s1_write_n),
      .high_res_timer_s1_writedata                                   (high_res_timer_s1_writedata),
      .reset_n                                                       (pll_c2_out_reset_n),
      .slow_peripheral_bridge_m1_address_to_slave                    (slow_peripheral_bridge_m1_address_to_slave),
      .slow_peripheral_bridge_m1_granted_high_res_timer_s1           (slow_peripheral_bridge_m1_granted_high_res_timer_s1),
      .slow_peripheral_bridge_m1_latency_counter                     (slow_peripheral_bridge_m1_latency_counter),
      .slow_peripheral_bridge_m1_nativeaddress                       (slow_peripheral_bridge_m1_nativeaddress),
      .slow_peripheral_bridge_m1_qualified_request_high_res_timer_s1 (slow_peripheral_bridge_m1_qualified_request_high_res_timer_s1),
      .slow_peripheral_bridge_m1_read                                (slow_peripheral_bridge_m1_read),
      .slow_peripheral_bridge_m1_read_data_valid_high_res_timer_s1   (slow_peripheral_bridge_m1_read_data_valid_high_res_timer_s1),
      .slow_peripheral_bridge_m1_requests_high_res_timer_s1          (slow_peripheral_bridge_m1_requests_high_res_timer_s1),
      .slow_peripheral_bridge_m1_write                               (slow_peripheral_bridge_m1_write),
      .slow_peripheral_bridge_m1_writedata                           (slow_peripheral_bridge_m1_writedata)
    );

  high_res_timer the_high_res_timer
    (
      .address    (high_res_timer_s1_address),
      .chipselect (high_res_timer_s1_chipselect),
      .clk        (pll_c2_out),
      .irq        (high_res_timer_s1_irq),
      .readdata   (high_res_timer_s1_readdata),
      .reset_n    (high_res_timer_s1_reset_n),
      .write_n    (high_res_timer_s1_write_n),
      .writedata  (high_res_timer_s1_writedata)
    );

  jtag_uart_avalon_jtag_slave_arbitrator the_jtag_uart_avalon_jtag_slave
    (
      .clk                                                                     (pll_c2_out),
      .d1_jtag_uart_avalon_jtag_slave_end_xfer                                 (d1_jtag_uart_avalon_jtag_slave_end_xfer),
      .jtag_uart_avalon_jtag_slave_address                                     (jtag_uart_avalon_jtag_slave_address),
      .jtag_uart_avalon_jtag_slave_chipselect                                  (jtag_uart_avalon_jtag_slave_chipselect),
      .jtag_uart_avalon_jtag_slave_dataavailable                               (jtag_uart_avalon_jtag_slave_dataavailable),
      .jtag_uart_avalon_jtag_slave_dataavailable_from_sa                       (jtag_uart_avalon_jtag_slave_dataavailable_from_sa),
      .jtag_uart_avalon_jtag_slave_irq                                         (jtag_uart_avalon_jtag_slave_irq),
      .jtag_uart_avalon_jtag_slave_irq_from_sa                                 (jtag_uart_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_avalon_jtag_slave_read_n                                      (jtag_uart_avalon_jtag_slave_read_n),
      .jtag_uart_avalon_jtag_slave_readdata                                    (jtag_uart_avalon_jtag_slave_readdata),
      .jtag_uart_avalon_jtag_slave_readdata_from_sa                            (jtag_uart_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_avalon_jtag_slave_readyfordata                                (jtag_uart_avalon_jtag_slave_readyfordata),
      .jtag_uart_avalon_jtag_slave_readyfordata_from_sa                        (jtag_uart_avalon_jtag_slave_readyfordata_from_sa),
      .jtag_uart_avalon_jtag_slave_reset_n                                     (jtag_uart_avalon_jtag_slave_reset_n),
      .jtag_uart_avalon_jtag_slave_waitrequest                                 (jtag_uart_avalon_jtag_slave_waitrequest),
      .jtag_uart_avalon_jtag_slave_waitrequest_from_sa                         (jtag_uart_avalon_jtag_slave_waitrequest_from_sa),
      .jtag_uart_avalon_jtag_slave_write_n                                     (jtag_uart_avalon_jtag_slave_write_n),
      .jtag_uart_avalon_jtag_slave_writedata                                   (jtag_uart_avalon_jtag_slave_writedata),
      .reset_n                                                                 (pll_c2_out_reset_n),
      .slow_peripheral_bridge_m1_address_to_slave                              (slow_peripheral_bridge_m1_address_to_slave),
      .slow_peripheral_bridge_m1_granted_jtag_uart_avalon_jtag_slave           (slow_peripheral_bridge_m1_granted_jtag_uart_avalon_jtag_slave),
      .slow_peripheral_bridge_m1_latency_counter                               (slow_peripheral_bridge_m1_latency_counter),
      .slow_peripheral_bridge_m1_nativeaddress                                 (slow_peripheral_bridge_m1_nativeaddress),
      .slow_peripheral_bridge_m1_qualified_request_jtag_uart_avalon_jtag_slave (slow_peripheral_bridge_m1_qualified_request_jtag_uart_avalon_jtag_slave),
      .slow_peripheral_bridge_m1_read                                          (slow_peripheral_bridge_m1_read),
      .slow_peripheral_bridge_m1_read_data_valid_jtag_uart_avalon_jtag_slave   (slow_peripheral_bridge_m1_read_data_valid_jtag_uart_avalon_jtag_slave),
      .slow_peripheral_bridge_m1_requests_jtag_uart_avalon_jtag_slave          (slow_peripheral_bridge_m1_requests_jtag_uart_avalon_jtag_slave),
      .slow_peripheral_bridge_m1_write                                         (slow_peripheral_bridge_m1_write),
      .slow_peripheral_bridge_m1_writedata                                     (slow_peripheral_bridge_m1_writedata)
    );

  jtag_uart the_jtag_uart
    (
      .av_address     (jtag_uart_avalon_jtag_slave_address),
      .av_chipselect  (jtag_uart_avalon_jtag_slave_chipselect),
      .av_irq         (jtag_uart_avalon_jtag_slave_irq),
      .av_read_n      (jtag_uart_avalon_jtag_slave_read_n),
      .av_readdata    (jtag_uart_avalon_jtag_slave_readdata),
      .av_waitrequest (jtag_uart_avalon_jtag_slave_waitrequest),
      .av_write_n     (jtag_uart_avalon_jtag_slave_write_n),
      .av_writedata   (jtag_uart_avalon_jtag_slave_writedata),
      .clk            (pll_c2_out),
      .dataavailable  (jtag_uart_avalon_jtag_slave_dataavailable),
      .readyfordata   (jtag_uart_avalon_jtag_slave_readyfordata),
      .rst_n          (jtag_uart_avalon_jtag_slave_reset_n)
    );

  led_pio_s1_arbitrator the_led_pio_s1
    (
      .clk                                                    (pll_c2_out),
      .d1_led_pio_s1_end_xfer                                 (d1_led_pio_s1_end_xfer),
      .led_pio_s1_address                                     (led_pio_s1_address),
      .led_pio_s1_chipselect                                  (led_pio_s1_chipselect),
      .led_pio_s1_reset_n                                     (led_pio_s1_reset_n),
      .led_pio_s1_write_n                                     (led_pio_s1_write_n),
      .led_pio_s1_writedata                                   (led_pio_s1_writedata),
      .reset_n                                                (pll_c2_out_reset_n),
      .slow_peripheral_bridge_m1_address_to_slave             (slow_peripheral_bridge_m1_address_to_slave),
      .slow_peripheral_bridge_m1_granted_led_pio_s1           (slow_peripheral_bridge_m1_granted_led_pio_s1),
      .slow_peripheral_bridge_m1_latency_counter              (slow_peripheral_bridge_m1_latency_counter),
      .slow_peripheral_bridge_m1_nativeaddress                (slow_peripheral_bridge_m1_nativeaddress),
      .slow_peripheral_bridge_m1_qualified_request_led_pio_s1 (slow_peripheral_bridge_m1_qualified_request_led_pio_s1),
      .slow_peripheral_bridge_m1_read                         (slow_peripheral_bridge_m1_read),
      .slow_peripheral_bridge_m1_read_data_valid_led_pio_s1   (slow_peripheral_bridge_m1_read_data_valid_led_pio_s1),
      .slow_peripheral_bridge_m1_requests_led_pio_s1          (slow_peripheral_bridge_m1_requests_led_pio_s1),
      .slow_peripheral_bridge_m1_write                        (slow_peripheral_bridge_m1_write),
      .slow_peripheral_bridge_m1_writedata                    (slow_peripheral_bridge_m1_writedata)
    );

  led_pio the_led_pio
    (
      .address    (led_pio_s1_address),
      .chipselect (led_pio_s1_chipselect),
      .clk        (pll_c2_out),
      .out_port   (out_port_from_the_led_pio),
      .reset_n    (led_pio_s1_reset_n),
      .write_n    (led_pio_s1_write_n),
      .writedata  (led_pio_s1_writedata)
    );

  pipeline_bridge_before_tristate_bridge_s1_arbitrator the_pipeline_bridge_before_tristate_bridge_s1
    (
      .clk                                                                                                     (pll_c0_out),
      .d1_pipeline_bridge_before_tristate_bridge_s1_end_xfer                                                   (d1_pipeline_bridge_before_tristate_bridge_s1_end_xfer),
      .flash_ssram_pipeline_bridge_m1_address_to_slave                                                         (flash_ssram_pipeline_bridge_m1_address_to_slave),
      .flash_ssram_pipeline_bridge_m1_burstcount                                                               (flash_ssram_pipeline_bridge_m1_burstcount),
      .flash_ssram_pipeline_bridge_m1_byteenable                                                               (flash_ssram_pipeline_bridge_m1_byteenable),
      .flash_ssram_pipeline_bridge_m1_chipselect                                                               (flash_ssram_pipeline_bridge_m1_chipselect),
      .flash_ssram_pipeline_bridge_m1_debugaccess                                                              (flash_ssram_pipeline_bridge_m1_debugaccess),
      .flash_ssram_pipeline_bridge_m1_granted_pipeline_bridge_before_tristate_bridge_s1                        (flash_ssram_pipeline_bridge_m1_granted_pipeline_bridge_before_tristate_bridge_s1),
      .flash_ssram_pipeline_bridge_m1_latency_counter                                                          (flash_ssram_pipeline_bridge_m1_latency_counter),
      .flash_ssram_pipeline_bridge_m1_qualified_request_pipeline_bridge_before_tristate_bridge_s1              (flash_ssram_pipeline_bridge_m1_qualified_request_pipeline_bridge_before_tristate_bridge_s1),
      .flash_ssram_pipeline_bridge_m1_read                                                                     (flash_ssram_pipeline_bridge_m1_read),
      .flash_ssram_pipeline_bridge_m1_read_data_valid_pipeline_bridge_before_tristate_bridge_s1                (flash_ssram_pipeline_bridge_m1_read_data_valid_pipeline_bridge_before_tristate_bridge_s1),
      .flash_ssram_pipeline_bridge_m1_read_data_valid_pipeline_bridge_before_tristate_bridge_s1_shift_register (flash_ssram_pipeline_bridge_m1_read_data_valid_pipeline_bridge_before_tristate_bridge_s1_shift_register),
      .flash_ssram_pipeline_bridge_m1_requests_pipeline_bridge_before_tristate_bridge_s1                       (flash_ssram_pipeline_bridge_m1_requests_pipeline_bridge_before_tristate_bridge_s1),
      .flash_ssram_pipeline_bridge_m1_write                                                                    (flash_ssram_pipeline_bridge_m1_write),
      .flash_ssram_pipeline_bridge_m1_writedata                                                                (flash_ssram_pipeline_bridge_m1_writedata),
      .pipeline_bridge_before_tristate_bridge_s1_address                                                       (pipeline_bridge_before_tristate_bridge_s1_address),
      .pipeline_bridge_before_tristate_bridge_s1_arbiterlock                                                   (pipeline_bridge_before_tristate_bridge_s1_arbiterlock),
      .pipeline_bridge_before_tristate_bridge_s1_arbiterlock2                                                  (pipeline_bridge_before_tristate_bridge_s1_arbiterlock2),
      .pipeline_bridge_before_tristate_bridge_s1_burstcount                                                    (pipeline_bridge_before_tristate_bridge_s1_burstcount),
      .pipeline_bridge_before_tristate_bridge_s1_byteenable                                                    (pipeline_bridge_before_tristate_bridge_s1_byteenable),
      .pipeline_bridge_before_tristate_bridge_s1_chipselect                                                    (pipeline_bridge_before_tristate_bridge_s1_chipselect),
      .pipeline_bridge_before_tristate_bridge_s1_debugaccess                                                   (pipeline_bridge_before_tristate_bridge_s1_debugaccess),
      .pipeline_bridge_before_tristate_bridge_s1_endofpacket                                                   (pipeline_bridge_before_tristate_bridge_s1_endofpacket),
      .pipeline_bridge_before_tristate_bridge_s1_endofpacket_from_sa                                           (pipeline_bridge_before_tristate_bridge_s1_endofpacket_from_sa),
      .pipeline_bridge_before_tristate_bridge_s1_nativeaddress                                                 (pipeline_bridge_before_tristate_bridge_s1_nativeaddress),
      .pipeline_bridge_before_tristate_bridge_s1_read                                                          (pipeline_bridge_before_tristate_bridge_s1_read),
      .pipeline_bridge_before_tristate_bridge_s1_readdata                                                      (pipeline_bridge_before_tristate_bridge_s1_readdata),
      .pipeline_bridge_before_tristate_bridge_s1_readdata_from_sa                                              (pipeline_bridge_before_tristate_bridge_s1_readdata_from_sa),
      .pipeline_bridge_before_tristate_bridge_s1_readdatavalid                                                 (pipeline_bridge_before_tristate_bridge_s1_readdatavalid),
      .pipeline_bridge_before_tristate_bridge_s1_reset_n                                                       (pipeline_bridge_before_tristate_bridge_s1_reset_n),
      .pipeline_bridge_before_tristate_bridge_s1_waitrequest                                                   (pipeline_bridge_before_tristate_bridge_s1_waitrequest),
      .pipeline_bridge_before_tristate_bridge_s1_waitrequest_from_sa                                           (pipeline_bridge_before_tristate_bridge_s1_waitrequest_from_sa),
      .pipeline_bridge_before_tristate_bridge_s1_write                                                         (pipeline_bridge_before_tristate_bridge_s1_write),
      .pipeline_bridge_before_tristate_bridge_s1_writedata                                                     (pipeline_bridge_before_tristate_bridge_s1_writedata),
      .reset_n                                                                                                 (pll_c0_out_reset_n)
    );

  pipeline_bridge_before_tristate_bridge_m1_arbitrator the_pipeline_bridge_before_tristate_bridge_m1
    (
      .clk                                                                      (pll_c0_out),
      .d1_flash_ssram_tristate_bridge_avalon_slave_end_xfer                     (d1_flash_ssram_tristate_bridge_avalon_slave_end_xfer),
      .ext_flash_s1_wait_counter_eq_0                                           (ext_flash_s1_wait_counter_eq_0),
      .incoming_flash_ssram_tristate_bridge_data                                (incoming_flash_ssram_tristate_bridge_data),
      .incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0         (incoming_flash_ssram_tristate_bridge_data_with_Xs_converted_to_0),
      .pipeline_bridge_before_tristate_bridge_m1_address                        (pipeline_bridge_before_tristate_bridge_m1_address),
      .pipeline_bridge_before_tristate_bridge_m1_address_to_slave               (pipeline_bridge_before_tristate_bridge_m1_address_to_slave),
      .pipeline_bridge_before_tristate_bridge_m1_burstcount                     (pipeline_bridge_before_tristate_bridge_m1_burstcount),
      .pipeline_bridge_before_tristate_bridge_m1_byteenable                     (pipeline_bridge_before_tristate_bridge_m1_byteenable),
      .pipeline_bridge_before_tristate_bridge_m1_byteenable_ext_flash_s1        (pipeline_bridge_before_tristate_bridge_m1_byteenable_ext_flash_s1),
      .pipeline_bridge_before_tristate_bridge_m1_chipselect                     (pipeline_bridge_before_tristate_bridge_m1_chipselect),
      .pipeline_bridge_before_tristate_bridge_m1_dbs_address                    (pipeline_bridge_before_tristate_bridge_m1_dbs_address),
      .pipeline_bridge_before_tristate_bridge_m1_dbs_write_16                   (pipeline_bridge_before_tristate_bridge_m1_dbs_write_16),
      .pipeline_bridge_before_tristate_bridge_m1_granted_ext_flash_s1           (pipeline_bridge_before_tristate_bridge_m1_granted_ext_flash_s1),
      .pipeline_bridge_before_tristate_bridge_m1_granted_ssram_s1               (pipeline_bridge_before_tristate_bridge_m1_granted_ssram_s1),
      .pipeline_bridge_before_tristate_bridge_m1_latency_counter                (pipeline_bridge_before_tristate_bridge_m1_latency_counter),
      .pipeline_bridge_before_tristate_bridge_m1_qualified_request_ext_flash_s1 (pipeline_bridge_before_tristate_bridge_m1_qualified_request_ext_flash_s1),
      .pipeline_bridge_before_tristate_bridge_m1_qualified_request_ssram_s1     (pipeline_bridge_before_tristate_bridge_m1_qualified_request_ssram_s1),
      .pipeline_bridge_before_tristate_bridge_m1_read                           (pipeline_bridge_before_tristate_bridge_m1_read),
      .pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ext_flash_s1   (pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ext_flash_s1),
      .pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ssram_s1       (pipeline_bridge_before_tristate_bridge_m1_read_data_valid_ssram_s1),
      .pipeline_bridge_before_tristate_bridge_m1_readdata                       (pipeline_bridge_before_tristate_bridge_m1_readdata),
      .pipeline_bridge_before_tristate_bridge_m1_readdatavalid                  (pipeline_bridge_before_tristate_bridge_m1_readdatavalid),
      .pipeline_bridge_before_tristate_bridge_m1_requests_ext_flash_s1          (pipeline_bridge_before_tristate_bridge_m1_requests_ext_flash_s1),
      .pipeline_bridge_before_tristate_bridge_m1_requests_ssram_s1              (pipeline_bridge_before_tristate_bridge_m1_requests_ssram_s1),
      .pipeline_bridge_before_tristate_bridge_m1_waitrequest                    (pipeline_bridge_before_tristate_bridge_m1_waitrequest),
      .pipeline_bridge_before_tristate_bridge_m1_write                          (pipeline_bridge_before_tristate_bridge_m1_write),
      .pipeline_bridge_before_tristate_bridge_m1_writedata                      (pipeline_bridge_before_tristate_bridge_m1_writedata),
      .reset_n                                                                  (pll_c0_out_reset_n)
    );

  pipeline_bridge_before_tristate_bridge the_pipeline_bridge_before_tristate_bridge
    (
      .clk              (pll_c0_out),
      .m1_address       (pipeline_bridge_before_tristate_bridge_m1_address),
      .m1_burstcount    (pipeline_bridge_before_tristate_bridge_m1_burstcount),
      .m1_byteenable    (pipeline_bridge_before_tristate_bridge_m1_byteenable),
      .m1_chipselect    (pipeline_bridge_before_tristate_bridge_m1_chipselect),
      .m1_debugaccess   (pipeline_bridge_before_tristate_bridge_m1_debugaccess),
      .m1_endofpacket   (pipeline_bridge_before_tristate_bridge_m1_endofpacket),
      .m1_read          (pipeline_bridge_before_tristate_bridge_m1_read),
      .m1_readdata      (pipeline_bridge_before_tristate_bridge_m1_readdata),
      .m1_readdatavalid (pipeline_bridge_before_tristate_bridge_m1_readdatavalid),
      .m1_waitrequest   (pipeline_bridge_before_tristate_bridge_m1_waitrequest),
      .m1_write         (pipeline_bridge_before_tristate_bridge_m1_write),
      .m1_writedata     (pipeline_bridge_before_tristate_bridge_m1_writedata),
      .reset_n          (pipeline_bridge_before_tristate_bridge_s1_reset_n),
      .s1_address       (pipeline_bridge_before_tristate_bridge_s1_address),
      .s1_arbiterlock   (pipeline_bridge_before_tristate_bridge_s1_arbiterlock),
      .s1_arbiterlock2  (pipeline_bridge_before_tristate_bridge_s1_arbiterlock2),
      .s1_burstcount    (pipeline_bridge_before_tristate_bridge_s1_burstcount),
      .s1_byteenable    (pipeline_bridge_before_tristate_bridge_s1_byteenable),
      .s1_chipselect    (pipeline_bridge_before_tristate_bridge_s1_chipselect),
      .s1_debugaccess   (pipeline_bridge_before_tristate_bridge_s1_debugaccess),
      .s1_endofpacket   (pipeline_bridge_before_tristate_bridge_s1_endofpacket),
      .s1_nativeaddress (pipeline_bridge_before_tristate_bridge_s1_nativeaddress),
      .s1_read          (pipeline_bridge_before_tristate_bridge_s1_read),
      .s1_readdata      (pipeline_bridge_before_tristate_bridge_s1_readdata),
      .s1_readdatavalid (pipeline_bridge_before_tristate_bridge_s1_readdatavalid),
      .s1_waitrequest   (pipeline_bridge_before_tristate_bridge_s1_waitrequest),
      .s1_write         (pipeline_bridge_before_tristate_bridge_s1_write),
      .s1_writedata     (pipeline_bridge_before_tristate_bridge_s1_writedata)
    );

  pll_s1_arbitrator the_pll_s1
    (
      .clk                                                                       (clk),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_out_address_to_slave         (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_address_to_slave),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_out_granted_pll_s1           (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_granted_pll_s1),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_out_nativeaddress            (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_nativeaddress),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_out_qualified_request_pll_s1 (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_qualified_request_pll_s1),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_out_read                     (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_read),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_out_read_data_valid_pll_s1   (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_read_data_valid_pll_s1),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_out_requests_pll_s1          (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_requests_pll_s1),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_out_write                    (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_write),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_out_writedata                (cycloneIII_3c25_niosII_standard_sopc_clock_0_out_writedata),
      .d1_pll_s1_end_xfer                                                        (d1_pll_s1_end_xfer),
      .pll_s1_address                                                            (pll_s1_address),
      .pll_s1_chipselect                                                         (pll_s1_chipselect),
      .pll_s1_read                                                               (pll_s1_read),
      .pll_s1_readdata                                                           (pll_s1_readdata),
      .pll_s1_readdata_from_sa                                                   (pll_s1_readdata_from_sa),
      .pll_s1_reset_n                                                            (pll_s1_reset_n),
      .pll_s1_resetrequest                                                       (pll_s1_resetrequest),
      .pll_s1_resetrequest_from_sa                                               (pll_s1_resetrequest_from_sa),
      .pll_s1_write                                                              (pll_s1_write),
      .pll_s1_writedata                                                          (pll_s1_writedata),
      .reset_n                                                                   (clk_reset_n)
    );

  //pll_c0_out out_clk assignment, which is an e_assign
  assign pll_c0_out = out_clk_pll_c0;

  //pll_c1_out out_clk assignment, which is an e_assign
  assign pll_c1_out = out_clk_pll_c1;

  //pll_c2_out out_clk assignment, which is an e_assign
  assign pll_c2_out = out_clk_pll_c2;

  //pll_c3_out out_clk assignment, which is an e_assign
  assign pll_c3_out = out_clk_pll_c3;

  pll the_pll
    (
      .address      (pll_s1_address),
      .c0           (out_clk_pll_c0),
      .c1           (out_clk_pll_c1),
      .c2           (out_clk_pll_c2),
      .c3           (out_clk_pll_c3),
      .chipselect   (pll_s1_chipselect),
      .clk          (clk),
      .read         (pll_s1_read),
      .readdata     (pll_s1_readdata),
      .reset_n      (pll_s1_reset_n),
      .resetrequest (pll_s1_resetrequest),
      .write        (pll_s1_write),
      .writedata    (pll_s1_writedata)
    );

  remote_update_s1_arbitrator the_remote_update_s1
    (
      .clk                                                                                 (pll_c3_out),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_out_address_to_slave                   (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_address_to_slave),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_out_granted_remote_update_s1           (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_granted_remote_update_s1),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_out_nativeaddress                      (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_nativeaddress),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_out_qualified_request_remote_update_s1 (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_qualified_request_remote_update_s1),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read                               (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read_data_valid_remote_update_s1   (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_read_data_valid_remote_update_s1),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_out_requests_remote_update_s1          (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_requests_remote_update_s1),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_out_write                              (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_write),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_out_writedata                          (cycloneIII_3c25_niosII_standard_sopc_clock_1_out_writedata),
      .d1_remote_update_s1_end_xfer                                                        (d1_remote_update_s1_end_xfer),
      .remote_update_s1_address                                                            (remote_update_s1_address),
      .remote_update_s1_chipselect                                                         (remote_update_s1_chipselect),
      .remote_update_s1_read                                                               (remote_update_s1_read),
      .remote_update_s1_readdata                                                           (remote_update_s1_readdata),
      .remote_update_s1_readdata_from_sa                                                   (remote_update_s1_readdata_from_sa),
      .remote_update_s1_reset                                                              (remote_update_s1_reset),
      .remote_update_s1_waitrequest                                                        (remote_update_s1_waitrequest),
      .remote_update_s1_waitrequest_from_sa                                                (remote_update_s1_waitrequest_from_sa),
      .remote_update_s1_write                                                              (remote_update_s1_write),
      .remote_update_s1_writedata                                                          (remote_update_s1_writedata),
      .reset_n                                                                             (pll_c3_out_reset_n)
    );

  remote_update the_remote_update
    (
      .address     (remote_update_s1_address),
      .chipselect  (remote_update_s1_chipselect),
      .clk         (pll_c3_out),
      .read        (remote_update_s1_read),
      .readdata    (remote_update_s1_readdata),
      .reset       (remote_update_s1_reset),
      .waitrequest (remote_update_s1_waitrequest),
      .write       (remote_update_s1_write),
      .writedata   (remote_update_s1_writedata)
    );

  slow_peripheral_bridge_s1_arbitrator the_slow_peripheral_bridge_s1
    (
      .clk                                                                           (pll_c0_out),
      .cpu_data_master_address_to_slave                                              (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                                    (cpu_data_master_byteenable),
      .cpu_data_master_granted_slow_peripheral_bridge_s1                             (cpu_data_master_granted_slow_peripheral_bridge_s1),
      .cpu_data_master_latency_counter                                               (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_slow_peripheral_bridge_s1                   (cpu_data_master_qualified_request_slow_peripheral_bridge_s1),
      .cpu_data_master_read                                                          (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register        (cpu_data_master_read_data_valid_cpu_ddr_clock_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register (cpu_data_master_read_data_valid_flash_ssram_pipeline_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_slow_peripheral_bridge_s1                     (cpu_data_master_read_data_valid_slow_peripheral_bridge_s1),
      .cpu_data_master_read_data_valid_slow_peripheral_bridge_s1_shift_register      (cpu_data_master_read_data_valid_slow_peripheral_bridge_s1_shift_register),
      .cpu_data_master_requests_slow_peripheral_bridge_s1                            (cpu_data_master_requests_slow_peripheral_bridge_s1),
      .cpu_data_master_write                                                         (cpu_data_master_write),
      .cpu_data_master_writedata                                                     (cpu_data_master_writedata),
      .d1_slow_peripheral_bridge_s1_end_xfer                                         (d1_slow_peripheral_bridge_s1_end_xfer),
      .reset_n                                                                       (pll_c0_out_reset_n),
      .slow_peripheral_bridge_s1_address                                             (slow_peripheral_bridge_s1_address),
      .slow_peripheral_bridge_s1_byteenable                                          (slow_peripheral_bridge_s1_byteenable),
      .slow_peripheral_bridge_s1_endofpacket                                         (slow_peripheral_bridge_s1_endofpacket),
      .slow_peripheral_bridge_s1_endofpacket_from_sa                                 (slow_peripheral_bridge_s1_endofpacket_from_sa),
      .slow_peripheral_bridge_s1_nativeaddress                                       (slow_peripheral_bridge_s1_nativeaddress),
      .slow_peripheral_bridge_s1_read                                                (slow_peripheral_bridge_s1_read),
      .slow_peripheral_bridge_s1_readdata                                            (slow_peripheral_bridge_s1_readdata),
      .slow_peripheral_bridge_s1_readdata_from_sa                                    (slow_peripheral_bridge_s1_readdata_from_sa),
      .slow_peripheral_bridge_s1_readdatavalid                                       (slow_peripheral_bridge_s1_readdatavalid),
      .slow_peripheral_bridge_s1_reset_n                                             (slow_peripheral_bridge_s1_reset_n),
      .slow_peripheral_bridge_s1_waitrequest                                         (slow_peripheral_bridge_s1_waitrequest),
      .slow_peripheral_bridge_s1_waitrequest_from_sa                                 (slow_peripheral_bridge_s1_waitrequest_from_sa),
      .slow_peripheral_bridge_s1_write                                               (slow_peripheral_bridge_s1_write),
      .slow_peripheral_bridge_s1_writedata                                           (slow_peripheral_bridge_s1_writedata)
    );

  slow_peripheral_bridge_m1_arbitrator the_slow_peripheral_bridge_m1
    (
      .button_pio_s1_readdata_from_sa                                                              (button_pio_s1_readdata_from_sa),
      .clk                                                                                         (pll_c2_out),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_in_endofpacket_from_sa                         (cycloneIII_3c25_niosII_standard_sopc_clock_0_in_endofpacket_from_sa),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_in_readdata_from_sa                            (cycloneIII_3c25_niosII_standard_sopc_clock_0_in_readdata_from_sa),
      .cycloneIII_3c25_niosII_standard_sopc_clock_0_in_waitrequest_from_sa                         (cycloneIII_3c25_niosII_standard_sopc_clock_0_in_waitrequest_from_sa),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_in_endofpacket_from_sa                         (cycloneIII_3c25_niosII_standard_sopc_clock_1_in_endofpacket_from_sa),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_in_readdata_from_sa                            (cycloneIII_3c25_niosII_standard_sopc_clock_1_in_readdata_from_sa),
      .cycloneIII_3c25_niosII_standard_sopc_clock_1_in_waitrequest_from_sa                         (cycloneIII_3c25_niosII_standard_sopc_clock_1_in_waitrequest_from_sa),
      .d1_button_pio_s1_end_xfer                                                                   (d1_button_pio_s1_end_xfer),
      .d1_cycloneIII_3c25_niosII_standard_sopc_clock_0_in_end_xfer                                 (d1_cycloneIII_3c25_niosII_standard_sopc_clock_0_in_end_xfer),
      .d1_cycloneIII_3c25_niosII_standard_sopc_clock_1_in_end_xfer                                 (d1_cycloneIII_3c25_niosII_standard_sopc_clock_1_in_end_xfer),
      .d1_high_res_timer_s1_end_xfer                                                               (d1_high_res_timer_s1_end_xfer),
      .d1_jtag_uart_avalon_jtag_slave_end_xfer                                                     (d1_jtag_uart_avalon_jtag_slave_end_xfer),
      .d1_led_pio_s1_end_xfer                                                                      (d1_led_pio_s1_end_xfer),
      .d1_sys_clk_timer_s1_end_xfer                                                                (d1_sys_clk_timer_s1_end_xfer),
      .d1_sysid_control_slave_end_xfer                                                             (d1_sysid_control_slave_end_xfer),
      .high_res_timer_s1_readdata_from_sa                                                          (high_res_timer_s1_readdata_from_sa),
      .jtag_uart_avalon_jtag_slave_readdata_from_sa                                                (jtag_uart_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_avalon_jtag_slave_waitrequest_from_sa                                             (jtag_uart_avalon_jtag_slave_waitrequest_from_sa),
      .reset_n                                                                                     (pll_c2_out_reset_n),
      .slow_peripheral_bridge_m1_address                                                           (slow_peripheral_bridge_m1_address),
      .slow_peripheral_bridge_m1_address_to_slave                                                  (slow_peripheral_bridge_m1_address_to_slave),
      .slow_peripheral_bridge_m1_byteenable                                                        (slow_peripheral_bridge_m1_byteenable),
      .slow_peripheral_bridge_m1_endofpacket                                                       (slow_peripheral_bridge_m1_endofpacket),
      .slow_peripheral_bridge_m1_granted_button_pio_s1                                             (slow_peripheral_bridge_m1_granted_button_pio_s1),
      .slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_0_in           (slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_0_in),
      .slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_1_in           (slow_peripheral_bridge_m1_granted_cycloneIII_3c25_niosII_standard_sopc_clock_1_in),
      .slow_peripheral_bridge_m1_granted_high_res_timer_s1                                         (slow_peripheral_bridge_m1_granted_high_res_timer_s1),
      .slow_peripheral_bridge_m1_granted_jtag_uart_avalon_jtag_slave                               (slow_peripheral_bridge_m1_granted_jtag_uart_avalon_jtag_slave),
      .slow_peripheral_bridge_m1_granted_led_pio_s1                                                (slow_peripheral_bridge_m1_granted_led_pio_s1),
      .slow_peripheral_bridge_m1_granted_sys_clk_timer_s1                                          (slow_peripheral_bridge_m1_granted_sys_clk_timer_s1),
      .slow_peripheral_bridge_m1_granted_sysid_control_slave                                       (slow_peripheral_bridge_m1_granted_sysid_control_slave),
      .slow_peripheral_bridge_m1_latency_counter                                                   (slow_peripheral_bridge_m1_latency_counter),
      .slow_peripheral_bridge_m1_qualified_request_button_pio_s1                                   (slow_peripheral_bridge_m1_qualified_request_button_pio_s1),
      .slow_peripheral_bridge_m1_qualified_request_cycloneIII_3c25_niosII_standard_sopc_clock_0_in (slow_peripheral_bridge_m1_qualified_request_cycloneIII_3c25_niosII_standard_sopc_clock_0_in),
      .slow_peripheral_bridge_m1_qualified_request_cycloneIII_3c25_niosII_standard_sopc_clock_1_in (slow_peripheral_bridge_m1_qualified_request_cycloneIII_3c25_niosII_standard_sopc_clock_1_in),
      .slow_peripheral_bridge_m1_qualified_request_high_res_timer_s1                               (slow_peripheral_bridge_m1_qualified_request_high_res_timer_s1),
      .slow_peripheral_bridge_m1_qualified_request_jtag_uart_avalon_jtag_slave                     (slow_peripheral_bridge_m1_qualified_request_jtag_uart_avalon_jtag_slave),
      .slow_peripheral_bridge_m1_qualified_request_led_pio_s1                                      (slow_peripheral_bridge_m1_qualified_request_led_pio_s1),
      .slow_peripheral_bridge_m1_qualified_request_sys_clk_timer_s1                                (slow_peripheral_bridge_m1_qualified_request_sys_clk_timer_s1),
      .slow_peripheral_bridge_m1_qualified_request_sysid_control_slave                             (slow_peripheral_bridge_m1_qualified_request_sysid_control_slave),
      .slow_peripheral_bridge_m1_read                                                              (slow_peripheral_bridge_m1_read),
      .slow_peripheral_bridge_m1_read_data_valid_button_pio_s1                                     (slow_peripheral_bridge_m1_read_data_valid_button_pio_s1),
      .slow_peripheral_bridge_m1_read_data_valid_cycloneIII_3c25_niosII_standard_sopc_clock_0_in   (slow_peripheral_bridge_m1_read_data_valid_cycloneIII_3c25_niosII_standard_sopc_clock_0_in),
      .slow_peripheral_bridge_m1_read_data_valid_cycloneIII_3c25_niosII_standard_sopc_clock_1_in   (slow_peripheral_bridge_m1_read_data_valid_cycloneIII_3c25_niosII_standard_sopc_clock_1_in),
      .slow_peripheral_bridge_m1_read_data_valid_high_res_timer_s1                                 (slow_peripheral_bridge_m1_read_data_valid_high_res_timer_s1),
      .slow_peripheral_bridge_m1_read_data_valid_jtag_uart_avalon_jtag_slave                       (slow_peripheral_bridge_m1_read_data_valid_jtag_uart_avalon_jtag_slave),
      .slow_peripheral_bridge_m1_read_data_valid_led_pio_s1                                        (slow_peripheral_bridge_m1_read_data_valid_led_pio_s1),
      .slow_peripheral_bridge_m1_read_data_valid_sys_clk_timer_s1                                  (slow_peripheral_bridge_m1_read_data_valid_sys_clk_timer_s1),
      .slow_peripheral_bridge_m1_read_data_valid_sysid_control_slave                               (slow_peripheral_bridge_m1_read_data_valid_sysid_control_slave),
      .slow_peripheral_bridge_m1_readdata                                                          (slow_peripheral_bridge_m1_readdata),
      .slow_peripheral_bridge_m1_readdatavalid                                                     (slow_peripheral_bridge_m1_readdatavalid),
      .slow_peripheral_bridge_m1_requests_button_pio_s1                                            (slow_peripheral_bridge_m1_requests_button_pio_s1),
      .slow_peripheral_bridge_m1_requests_cycloneIII_3c25_niosII_standard_sopc_clock_0_in          (slow_peripheral_bridge_m1_requests_cycloneIII_3c25_niosII_standard_sopc_clock_0_in),
      .slow_peripheral_bridge_m1_requests_cycloneIII_3c25_niosII_standard_sopc_clock_1_in          (slow_peripheral_bridge_m1_requests_cycloneIII_3c25_niosII_standard_sopc_clock_1_in),
      .slow_peripheral_bridge_m1_requests_high_res_timer_s1                                        (slow_peripheral_bridge_m1_requests_high_res_timer_s1),
      .slow_peripheral_bridge_m1_requests_jtag_uart_avalon_jtag_slave                              (slow_peripheral_bridge_m1_requests_jtag_uart_avalon_jtag_slave),
      .slow_peripheral_bridge_m1_requests_led_pio_s1                                               (slow_peripheral_bridge_m1_requests_led_pio_s1),
      .slow_peripheral_bridge_m1_requests_sys_clk_timer_s1                                         (slow_peripheral_bridge_m1_requests_sys_clk_timer_s1),
      .slow_peripheral_bridge_m1_requests_sysid_control_slave                                      (slow_peripheral_bridge_m1_requests_sysid_control_slave),
      .slow_peripheral_bridge_m1_reset_n                                                           (slow_peripheral_bridge_m1_reset_n),
      .slow_peripheral_bridge_m1_waitrequest                                                       (slow_peripheral_bridge_m1_waitrequest),
      .slow_peripheral_bridge_m1_write                                                             (slow_peripheral_bridge_m1_write),
      .slow_peripheral_bridge_m1_writedata                                                         (slow_peripheral_bridge_m1_writedata),
      .sys_clk_timer_s1_readdata_from_sa                                                           (sys_clk_timer_s1_readdata_from_sa),
      .sysid_control_slave_readdata_from_sa                                                        (sysid_control_slave_readdata_from_sa)
    );

  slow_peripheral_bridge the_slow_peripheral_bridge
    (
      .master_address       (slow_peripheral_bridge_m1_address),
      .master_byteenable    (slow_peripheral_bridge_m1_byteenable),
      .master_clk           (pll_c2_out),
      .master_endofpacket   (slow_peripheral_bridge_m1_endofpacket),
      .master_nativeaddress (slow_peripheral_bridge_m1_nativeaddress),
      .master_read          (slow_peripheral_bridge_m1_read),
      .master_readdata      (slow_peripheral_bridge_m1_readdata),
      .master_readdatavalid (slow_peripheral_bridge_m1_readdatavalid),
      .master_reset_n       (slow_peripheral_bridge_m1_reset_n),
      .master_waitrequest   (slow_peripheral_bridge_m1_waitrequest),
      .master_write         (slow_peripheral_bridge_m1_write),
      .master_writedata     (slow_peripheral_bridge_m1_writedata),
      .slave_address        (slow_peripheral_bridge_s1_address),
      .slave_byteenable     (slow_peripheral_bridge_s1_byteenable),
      .slave_clk            (pll_c0_out),
      .slave_endofpacket    (slow_peripheral_bridge_s1_endofpacket),
      .slave_nativeaddress  (slow_peripheral_bridge_s1_nativeaddress),
      .slave_read           (slow_peripheral_bridge_s1_read),
      .slave_readdata       (slow_peripheral_bridge_s1_readdata),
      .slave_readdatavalid  (slow_peripheral_bridge_s1_readdatavalid),
      .slave_reset_n        (slow_peripheral_bridge_s1_reset_n),
      .slave_waitrequest    (slow_peripheral_bridge_s1_waitrequest),
      .slave_write          (slow_peripheral_bridge_s1_write),
      .slave_writedata      (slow_peripheral_bridge_s1_writedata)
    );

  sys_clk_timer_s1_arbitrator the_sys_clk_timer_s1
    (
      .clk                                                          (pll_c2_out),
      .d1_sys_clk_timer_s1_end_xfer                                 (d1_sys_clk_timer_s1_end_xfer),
      .reset_n                                                      (pll_c2_out_reset_n),
      .slow_peripheral_bridge_m1_address_to_slave                   (slow_peripheral_bridge_m1_address_to_slave),
      .slow_peripheral_bridge_m1_granted_sys_clk_timer_s1           (slow_peripheral_bridge_m1_granted_sys_clk_timer_s1),
      .slow_peripheral_bridge_m1_latency_counter                    (slow_peripheral_bridge_m1_latency_counter),
      .slow_peripheral_bridge_m1_nativeaddress                      (slow_peripheral_bridge_m1_nativeaddress),
      .slow_peripheral_bridge_m1_qualified_request_sys_clk_timer_s1 (slow_peripheral_bridge_m1_qualified_request_sys_clk_timer_s1),
      .slow_peripheral_bridge_m1_read                               (slow_peripheral_bridge_m1_read),
      .slow_peripheral_bridge_m1_read_data_valid_sys_clk_timer_s1   (slow_peripheral_bridge_m1_read_data_valid_sys_clk_timer_s1),
      .slow_peripheral_bridge_m1_requests_sys_clk_timer_s1          (slow_peripheral_bridge_m1_requests_sys_clk_timer_s1),
      .slow_peripheral_bridge_m1_write                              (slow_peripheral_bridge_m1_write),
      .slow_peripheral_bridge_m1_writedata                          (slow_peripheral_bridge_m1_writedata),
      .sys_clk_timer_s1_address                                     (sys_clk_timer_s1_address),
      .sys_clk_timer_s1_chipselect                                  (sys_clk_timer_s1_chipselect),
      .sys_clk_timer_s1_irq                                         (sys_clk_timer_s1_irq),
      .sys_clk_timer_s1_irq_from_sa                                 (sys_clk_timer_s1_irq_from_sa),
      .sys_clk_timer_s1_readdata                                    (sys_clk_timer_s1_readdata),
      .sys_clk_timer_s1_readdata_from_sa                            (sys_clk_timer_s1_readdata_from_sa),
      .sys_clk_timer_s1_reset_n                                     (sys_clk_timer_s1_reset_n),
      .sys_clk_timer_s1_write_n                                     (sys_clk_timer_s1_write_n),
      .sys_clk_timer_s1_writedata                                   (sys_clk_timer_s1_writedata)
    );

  sys_clk_timer the_sys_clk_timer
    (
      .address    (sys_clk_timer_s1_address),
      .chipselect (sys_clk_timer_s1_chipselect),
      .clk        (pll_c2_out),
      .irq        (sys_clk_timer_s1_irq),
      .readdata   (sys_clk_timer_s1_readdata),
      .reset_n    (sys_clk_timer_s1_reset_n),
      .write_n    (sys_clk_timer_s1_write_n),
      .writedata  (sys_clk_timer_s1_writedata)
    );

  sysid_control_slave_arbitrator the_sysid_control_slave
    (
      .clk                                                             (pll_c2_out),
      .d1_sysid_control_slave_end_xfer                                 (d1_sysid_control_slave_end_xfer),
      .reset_n                                                         (pll_c2_out_reset_n),
      .slow_peripheral_bridge_m1_address_to_slave                      (slow_peripheral_bridge_m1_address_to_slave),
      .slow_peripheral_bridge_m1_granted_sysid_control_slave           (slow_peripheral_bridge_m1_granted_sysid_control_slave),
      .slow_peripheral_bridge_m1_latency_counter                       (slow_peripheral_bridge_m1_latency_counter),
      .slow_peripheral_bridge_m1_nativeaddress                         (slow_peripheral_bridge_m1_nativeaddress),
      .slow_peripheral_bridge_m1_qualified_request_sysid_control_slave (slow_peripheral_bridge_m1_qualified_request_sysid_control_slave),
      .slow_peripheral_bridge_m1_read                                  (slow_peripheral_bridge_m1_read),
      .slow_peripheral_bridge_m1_read_data_valid_sysid_control_slave   (slow_peripheral_bridge_m1_read_data_valid_sysid_control_slave),
      .slow_peripheral_bridge_m1_requests_sysid_control_slave          (slow_peripheral_bridge_m1_requests_sysid_control_slave),
      .slow_peripheral_bridge_m1_write                                 (slow_peripheral_bridge_m1_write),
      .sysid_control_slave_address                                     (sysid_control_slave_address),
      .sysid_control_slave_readdata                                    (sysid_control_slave_readdata),
      .sysid_control_slave_readdata_from_sa                            (sysid_control_slave_readdata_from_sa)
    );

  sysid the_sysid
    (
      .address  (sysid_control_slave_address),
      .readdata (sysid_control_slave_readdata)
    );

  //reset is asserted asynchronously and deasserted synchronously
  cycloneIII_3c25_niosII_standard_sopc_reset_pll_c2_out_domain_synch_module cycloneIII_3c25_niosII_standard_sopc_reset_pll_c2_out_domain_synch
    (
      .clk      (pll_c2_out),
      .data_in  (1'b1),
      .data_out (pll_c2_out_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset is asserted asynchronously and deasserted synchronously
  cycloneIII_3c25_niosII_standard_sopc_reset_pll_c0_out_domain_synch_module cycloneIII_3c25_niosII_standard_sopc_reset_pll_c0_out_domain_synch
    (
      .clk      (pll_c0_out),
      .data_in  (1'b1),
      .data_out (pll_c0_out_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset is asserted asynchronously and deasserted synchronously
  cycloneIII_3c25_niosII_standard_sopc_reset_ddr_sdram_phy_clk_out_domain_synch_module cycloneIII_3c25_niosII_standard_sopc_reset_ddr_sdram_phy_clk_out_domain_synch
    (
      .clk      (ddr_sdram_phy_clk_out),
      .data_in  (1'b1),
      .data_out (ddr_sdram_phy_clk_out_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset is asserted asynchronously and deasserted synchronously
  cycloneIII_3c25_niosII_standard_sopc_reset_pll_c3_out_domain_synch_module cycloneIII_3c25_niosII_standard_sopc_reset_pll_c3_out_domain_synch
    (
      .clk      (pll_c3_out),
      .data_in  (1'b1),
      .data_out (pll_c3_out_reset_n),
      .reset_n  (reset_n_sources)
    );

  //cpu_ddr_clock_bridge_m1_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign cpu_ddr_clock_bridge_m1_endofpacket = 0;

  //cycloneIII_3c25_niosII_standard_sopc_clock_0_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign cycloneIII_3c25_niosII_standard_sopc_clock_0_out_endofpacket = 0;

  //cycloneIII_3c25_niosII_standard_sopc_clock_1_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign cycloneIII_3c25_niosII_standard_sopc_clock_1_out_endofpacket = 0;

  //pipeline_bridge_before_tristate_bridge_m1_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign pipeline_bridge_before_tristate_bridge_m1_endofpacket = 0;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module ext_flash_lane0_module (
                                // inputs:
                                 data,
                                 rdaddress,
                                 rdclken,
                                 wraddress,
                                 wrclock,
                                 wren,

                                // outputs:
                                 q
                              )
;

  output  [  7: 0] q;
  input   [  7: 0] data;
  input   [ 22: 0] rdaddress;
  input            rdclken;
  input   [ 22: 0] wraddress;
  input            wrclock;
  input            wren;

  reg     [  7: 0] mem_array [8388607: 0];
  wire    [  7: 0] q;
  reg     [ 22: 0] read_address;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  always @(rdaddress)
    begin
      if (1)
          read_address <= rdaddress;
    end


  // Data read is asynchronous.
  assign q = mem_array[read_address];

initial
    $readmemh("ext_flash_lane0.dat", mem_array);
  always @(posedge wrclock)
    begin
      // Write data
      if (wren)
          mem_array[wraddress] <= data;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  always @(rdaddress)
//    begin
//      if (1)
//          read_address <= rdaddress;
//    end
//
//
//  lpm_ram_dp lpm_ram_dp_component
//    (
//      .data (data),
//      .q (q),
//      .rdaddress (read_address),
//      .rdclken (rdclken),
//      .wraddress (wraddress),
//      .wrclock (wrclock),
//      .wren (wren)
//    );
//
//  defparam lpm_ram_dp_component.lpm_file = "ext_flash_lane0.mif",
//           lpm_ram_dp_component.lpm_hint = "USE_EAB=ON",
//           lpm_ram_dp_component.lpm_indata = "REGISTERED",
//           lpm_ram_dp_component.lpm_outdata = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_rdaddress_control = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_width = 8,
//           lpm_ram_dp_component.lpm_widthad = 23,
//           lpm_ram_dp_component.lpm_wraddress_control = "REGISTERED",
//           lpm_ram_dp_component.suppress_memory_conversion_warnings = "ON";
//
//synthesis read_comments_as_HDL off

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module ext_flash_lane1_module (
                                // inputs:
                                 data,
                                 rdaddress,
                                 rdclken,
                                 wraddress,
                                 wrclock,
                                 wren,

                                // outputs:
                                 q
                              )
;

  output  [  7: 0] q;
  input   [  7: 0] data;
  input   [ 22: 0] rdaddress;
  input            rdclken;
  input   [ 22: 0] wraddress;
  input            wrclock;
  input            wren;

  reg     [  7: 0] mem_array [8388607: 0];
  wire    [  7: 0] q;
  reg     [ 22: 0] read_address;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  always @(rdaddress)
    begin
      if (1)
          read_address <= rdaddress;
    end


  // Data read is asynchronous.
  assign q = mem_array[read_address];

initial
    $readmemh("ext_flash_lane1.dat", mem_array);
  always @(posedge wrclock)
    begin
      // Write data
      if (wren)
          mem_array[wraddress] <= data;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  always @(rdaddress)
//    begin
//      if (1)
//          read_address <= rdaddress;
//    end
//
//
//  lpm_ram_dp lpm_ram_dp_component
//    (
//      .data (data),
//      .q (q),
//      .rdaddress (read_address),
//      .rdclken (rdclken),
//      .wraddress (wraddress),
//      .wrclock (wrclock),
//      .wren (wren)
//    );
//
//  defparam lpm_ram_dp_component.lpm_file = "ext_flash_lane1.mif",
//           lpm_ram_dp_component.lpm_hint = "USE_EAB=ON",
//           lpm_ram_dp_component.lpm_indata = "REGISTERED",
//           lpm_ram_dp_component.lpm_outdata = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_rdaddress_control = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_width = 8,
//           lpm_ram_dp_component.lpm_widthad = 23,
//           lpm_ram_dp_component.lpm_wraddress_control = "REGISTERED",
//           lpm_ram_dp_component.suppress_memory_conversion_warnings = "ON";
//
//synthesis read_comments_as_HDL off

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module ext_flash (
                   // inputs:
                    address,
                    read_n,
                    select_n,
                    write_n,

                   // outputs:
                    data
                 )
;

  inout   [ 15: 0] data;
  input   [ 22: 0] address;
  input            read_n;
  input            select_n;
  input            write_n;

  wire    [ 15: 0] data;
  wire    [  7: 0] data_0;
  wire    [  7: 0] data_1;
  wire    [ 15: 0] logic_vector_gasket;
  wire    [  7: 0] q_0;
  wire    [  7: 0] q_1;
  //s1, which is an e_ptf_slave

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  assign logic_vector_gasket = data;
  assign data_0 = logic_vector_gasket[7 : 0];
  //ext_flash_lane0, which is an e_ram
  ext_flash_lane0_module ext_flash_lane0
    (
      .data      (data_0),
      .q         (q_0),
      .rdaddress (address),
      .rdclken   (1'b1),
      .wraddress (address),
      .wrclock   (write_n),
      .wren      (~select_n)
    );

  assign data_1 = logic_vector_gasket[15 : 8];
  //ext_flash_lane1, which is an e_ram
  ext_flash_lane1_module ext_flash_lane1
    (
      .data      (data_1),
      .q         (q_1),
      .rdaddress (address),
      .rdclken   (1'b1),
      .wraddress (address),
      .wrclock   (write_n),
      .wren      (~select_n)
    );

  assign data = (~select_n & ~read_n)? {q_1,
    q_0}: {16{1'bz}};


//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module ssram_lane0_module (
                            // inputs:
                             clk,
                             data,
                             rdaddress,
                             rdclken,
                             reset_n,
                             wraddress,
                             wrclock,
                             wren,

                            // outputs:
                             q
                          )
;

  output  [  7: 0] q;
  input            clk;
  input   [  7: 0] data;
  input   [ 17: 0] rdaddress;
  input            rdclken;
  input            reset_n;
  input   [ 17: 0] wraddress;
  input            wrclock;
  input            wren;

  reg     [ 17: 0] d1_rdaddress;
  reg     [  7: 0] mem_array [262143: 0];
  wire    [  7: 0] q;
  reg     [ 17: 0] read_address;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
        begin
          d1_rdaddress <= 0;
          read_address <= 0;
        end
      else if (rdclken)
        begin
          d1_rdaddress <= rdaddress;
          read_address <= d1_rdaddress;
        end
    end


  // Data read is synchronized through latent_rdaddress.
  assign q = mem_array[read_address];

initial
    $readmemh("ssram_lane0.dat", mem_array);
  always @(posedge wrclock)
    begin
      // Write data
      if (wren)
          mem_array[wraddress] <= data;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  always @(rdaddress)
//    begin
//      if (1)
//          read_address <= rdaddress;
//    end
//
//
//  lpm_ram_dp lpm_ram_dp_component
//    (
//      .data (data),
//      .q (q),
//      .rdaddress (read_address),
//      .rdclken (rdclken),
//      .rdclock (clk),
//      .wraddress (wraddress),
//      .wrclock (wrclock),
//      .wren (wren)
//    );
//
//  defparam lpm_ram_dp_component.lpm_file = "ssram_lane0.mif",
//           lpm_ram_dp_component.lpm_hint = "USE_EAB=ON",
//           lpm_ram_dp_component.lpm_indata = "REGISTERED",
//           lpm_ram_dp_component.lpm_outdata = "REGISTERED",
//           lpm_ram_dp_component.lpm_rdaddress_control = "REGISTERED",
//           lpm_ram_dp_component.lpm_width = 8,
//           lpm_ram_dp_component.lpm_widthad = 18,
//           lpm_ram_dp_component.lpm_wraddress_control = "REGISTERED",
//           lpm_ram_dp_component.suppress_memory_conversion_warnings = "ON";
//
//synthesis read_comments_as_HDL off

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module ssram_lane1_module (
                            // inputs:
                             clk,
                             data,
                             rdaddress,
                             rdclken,
                             reset_n,
                             wraddress,
                             wrclock,
                             wren,

                            // outputs:
                             q
                          )
;

  output  [  7: 0] q;
  input            clk;
  input   [  7: 0] data;
  input   [ 17: 0] rdaddress;
  input            rdclken;
  input            reset_n;
  input   [ 17: 0] wraddress;
  input            wrclock;
  input            wren;

  reg     [ 17: 0] d1_rdaddress;
  reg     [  7: 0] mem_array [262143: 0];
  wire    [  7: 0] q;
  reg     [ 17: 0] read_address;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
        begin
          d1_rdaddress <= 0;
          read_address <= 0;
        end
      else if (rdclken)
        begin
          d1_rdaddress <= rdaddress;
          read_address <= d1_rdaddress;
        end
    end


  // Data read is synchronized through latent_rdaddress.
  assign q = mem_array[read_address];

initial
    $readmemh("ssram_lane1.dat", mem_array);
  always @(posedge wrclock)
    begin
      // Write data
      if (wren)
          mem_array[wraddress] <= data;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  always @(rdaddress)
//    begin
//      if (1)
//          read_address <= rdaddress;
//    end
//
//
//  lpm_ram_dp lpm_ram_dp_component
//    (
//      .data (data),
//      .q (q),
//      .rdaddress (read_address),
//      .rdclken (rdclken),
//      .rdclock (clk),
//      .wraddress (wraddress),
//      .wrclock (wrclock),
//      .wren (wren)
//    );
//
//  defparam lpm_ram_dp_component.lpm_file = "ssram_lane1.mif",
//           lpm_ram_dp_component.lpm_hint = "USE_EAB=ON",
//           lpm_ram_dp_component.lpm_indata = "REGISTERED",
//           lpm_ram_dp_component.lpm_outdata = "REGISTERED",
//           lpm_ram_dp_component.lpm_rdaddress_control = "REGISTERED",
//           lpm_ram_dp_component.lpm_width = 8,
//           lpm_ram_dp_component.lpm_widthad = 18,
//           lpm_ram_dp_component.lpm_wraddress_control = "REGISTERED",
//           lpm_ram_dp_component.suppress_memory_conversion_warnings = "ON";
//
//synthesis read_comments_as_HDL off

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module ssram_lane2_module (
                            // inputs:
                             clk,
                             data,
                             rdaddress,
                             rdclken,
                             reset_n,
                             wraddress,
                             wrclock,
                             wren,

                            // outputs:
                             q
                          )
;

  output  [  7: 0] q;
  input            clk;
  input   [  7: 0] data;
  input   [ 17: 0] rdaddress;
  input            rdclken;
  input            reset_n;
  input   [ 17: 0] wraddress;
  input            wrclock;
  input            wren;

  reg     [ 17: 0] d1_rdaddress;
  reg     [  7: 0] mem_array [262143: 0];
  wire    [  7: 0] q;
  reg     [ 17: 0] read_address;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
        begin
          d1_rdaddress <= 0;
          read_address <= 0;
        end
      else if (rdclken)
        begin
          d1_rdaddress <= rdaddress;
          read_address <= d1_rdaddress;
        end
    end


  // Data read is synchronized through latent_rdaddress.
  assign q = mem_array[read_address];

initial
    $readmemh("ssram_lane2.dat", mem_array);
  always @(posedge wrclock)
    begin
      // Write data
      if (wren)
          mem_array[wraddress] <= data;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  always @(rdaddress)
//    begin
//      if (1)
//          read_address <= rdaddress;
//    end
//
//
//  lpm_ram_dp lpm_ram_dp_component
//    (
//      .data (data),
//      .q (q),
//      .rdaddress (read_address),
//      .rdclken (rdclken),
//      .rdclock (clk),
//      .wraddress (wraddress),
//      .wrclock (wrclock),
//      .wren (wren)
//    );
//
//  defparam lpm_ram_dp_component.lpm_file = "ssram_lane2.mif",
//           lpm_ram_dp_component.lpm_hint = "USE_EAB=ON",
//           lpm_ram_dp_component.lpm_indata = "REGISTERED",
//           lpm_ram_dp_component.lpm_outdata = "REGISTERED",
//           lpm_ram_dp_component.lpm_rdaddress_control = "REGISTERED",
//           lpm_ram_dp_component.lpm_width = 8,
//           lpm_ram_dp_component.lpm_widthad = 18,
//           lpm_ram_dp_component.lpm_wraddress_control = "REGISTERED",
//           lpm_ram_dp_component.suppress_memory_conversion_warnings = "ON";
//
//synthesis read_comments_as_HDL off

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module ssram_lane3_module (
                            // inputs:
                             clk,
                             data,
                             rdaddress,
                             rdclken,
                             reset_n,
                             wraddress,
                             wrclock,
                             wren,

                            // outputs:
                             q
                          )
;

  output  [  7: 0] q;
  input            clk;
  input   [  7: 0] data;
  input   [ 17: 0] rdaddress;
  input            rdclken;
  input            reset_n;
  input   [ 17: 0] wraddress;
  input            wrclock;
  input            wren;

  reg     [ 17: 0] d1_rdaddress;
  reg     [  7: 0] mem_array [262143: 0];
  wire    [  7: 0] q;
  reg     [ 17: 0] read_address;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
        begin
          d1_rdaddress <= 0;
          read_address <= 0;
        end
      else if (rdclken)
        begin
          d1_rdaddress <= rdaddress;
          read_address <= d1_rdaddress;
        end
    end


  // Data read is synchronized through latent_rdaddress.
  assign q = mem_array[read_address];

initial
    $readmemh("ssram_lane3.dat", mem_array);
  always @(posedge wrclock)
    begin
      // Write data
      if (wren)
          mem_array[wraddress] <= data;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  always @(rdaddress)
//    begin
//      if (1)
//          read_address <= rdaddress;
//    end
//
//
//  lpm_ram_dp lpm_ram_dp_component
//    (
//      .data (data),
//      .q (q),
//      .rdaddress (read_address),
//      .rdclken (rdclken),
//      .rdclock (clk),
//      .wraddress (wraddress),
//      .wrclock (wrclock),
//      .wren (wren)
//    );
//
//  defparam lpm_ram_dp_component.lpm_file = "ssram_lane3.mif",
//           lpm_ram_dp_component.lpm_hint = "USE_EAB=ON",
//           lpm_ram_dp_component.lpm_indata = "REGISTERED",
//           lpm_ram_dp_component.lpm_outdata = "REGISTERED",
//           lpm_ram_dp_component.lpm_rdaddress_control = "REGISTERED",
//           lpm_ram_dp_component.lpm_width = 8,
//           lpm_ram_dp_component.lpm_widthad = 18,
//           lpm_ram_dp_component.lpm_wraddress_control = "REGISTERED",
//           lpm_ram_dp_component.suppress_memory_conversion_warnings = "ON";
//
//synthesis read_comments_as_HDL off

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module ssram (
               // inputs:
                address,
                adsc_n,
                bw_n,
                bwe_n,
                chipenable1_n,
                clk,
                outputenable_n,
                reset_n,

               // outputs:
                data
             )
;

  inout   [ 31: 0] data;
  input   [ 17: 0] address;
  input            adsc_n;
  input   [  3: 0] bw_n;
  input            bwe_n;
  input            chipenable1_n;
  input            clk;
  input            outputenable_n;
  input            reset_n;

  wire    [ 31: 0] data;
  wire    [  7: 0] data_0;
  wire    [  7: 0] data_1;
  wire    [  7: 0] data_2;
  wire    [  7: 0] data_3;
  wire    [ 31: 0] logic_vector_gasket;
  wire    [  7: 0] q_0;
  wire    [  7: 0] q_1;
  wire    [  7: 0] q_2;
  wire    [  7: 0] q_3;
  //s1, which is an e_ptf_slave

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  assign logic_vector_gasket = data;
  assign data_0 = logic_vector_gasket[7 : 0];
  //ssram_lane0, which is an e_ram
  ssram_lane0_module ssram_lane0
    (
      .clk       (clk),
      .data      (data_0),
      .q         (q_0),
      .rdaddress (address),
      .rdclken   (1'b1),
      .reset_n   (reset_n),
      .wraddress (address),
      .wrclock   (clk),
      .wren      (~chipenable1_n & ~bwe_n & ~bw_n[0])
    );

  assign data_1 = logic_vector_gasket[15 : 8];
  //ssram_lane1, which is an e_ram
  ssram_lane1_module ssram_lane1
    (
      .clk       (clk),
      .data      (data_1),
      .q         (q_1),
      .rdaddress (address),
      .rdclken   (1'b1),
      .reset_n   (reset_n),
      .wraddress (address),
      .wrclock   (clk),
      .wren      (~chipenable1_n & ~bwe_n & ~bw_n[1])
    );

  assign data_2 = logic_vector_gasket[23 : 16];
  //ssram_lane2, which is an e_ram
  ssram_lane2_module ssram_lane2
    (
      .clk       (clk),
      .data      (data_2),
      .q         (q_2),
      .rdaddress (address),
      .rdclken   (1'b1),
      .reset_n   (reset_n),
      .wraddress (address),
      .wrclock   (clk),
      .wren      (~chipenable1_n & ~bwe_n & ~bw_n[2])
    );

  assign data_3 = logic_vector_gasket[31 : 24];
  //ssram_lane3, which is an e_ram
  ssram_lane3_module ssram_lane3
    (
      .clk       (clk),
      .data      (data_3),
      .q         (q_3),
      .rdaddress (address),
      .rdclken   (1'b1),
      .reset_n   (reset_n),
      .wraddress (address),
      .wrclock   (clk),
      .wren      (~chipenable1_n & ~bwe_n & ~bw_n[3])
    );

  assign data = (~chipenable1_n & ~outputenable_n)? {q_3,
    q_2,
    q_1,
    q_0}: {32{1'bz}};


//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


//synthesis translate_off



// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE

// AND HERE WILL BE PRESERVED </ALTERA_NOTE>


// If user logic components use Altsync_Ram with convert_hex2ver.dll,
// set USE_convert_hex2ver in the user comments section above

// `ifdef USE_convert_hex2ver
// `else
// `define NO_PLI 1
// `endif

`include "/usr/local/stow/altera8.0/altera8.0/quartus/eda/sim_lib/altera_mf.v"
`include "/usr/local/stow/altera8.0/altera8.0/quartus/eda/sim_lib/220model.v"
`include "/usr/local/stow/altera8.0/altera8.0/quartus/eda/sim_lib/sgate.v"
`include "remote_update.v"
`include "remote_update.vo"
`include "pll.v"
`include "altpllpll.v"
`include "sysid.v"
`include "pipeline_bridge_before_tristate_bridge.v"
`include "button_pio.v"
`include "high_res_timer.v"
`include "led_pio.v"
`include "jtag_uart.v"
`include "sys_clk_timer.v"
`include "cpu_test_bench.v"
`include "cpu_mult_cell.v"
`include "cpu_jtag_debug_module_tck.v"
`include "cpu_jtag_debug_module_sysclk.v"
`include "cpu_jtag_debug_module_wrapper.v"
`include "cpu.v"
`include "slow_peripheral_bridge.v"
`include "cycloneIII_3c25_niosII_standard_sopc_clock_1.v"
`include "cpu_ddr_clock_bridge.v"
`include "flash_ssram_pipeline_bridge.v"
`include "cycloneIII_3c25_niosII_standard_sopc_clock_0.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire             adsc_n_to_the_ssram;
  wire    [  3: 0] bw_n_to_the_ssram;
  wire             bwe_n_to_the_ssram;
  wire             chipenable1_n_to_the_ssram;
  reg              clk;
  wire             cpu_ddr_clock_bridge_m1_endofpacket;
  wire    [ 22: 0] cpu_ddr_clock_bridge_m1_nativeaddress;
  wire             cpu_ddr_clock_bridge_s1_endofpacket_from_sa;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_0_out_endofpacket;
  wire             cycloneIII_3c25_niosII_standard_sopc_clock_1_out_endofpacket;
  wire             ddr_sdram_aux_full_rate_clk_out;
  wire             ddr_sdram_aux_half_rate_clk_out;
  wire             ddr_sdram_phy_clk_out;
  wire             flash_ssram_pipeline_bridge_s1_endofpacket_from_sa;
  wire    [ 23: 0] flash_ssram_tristate_bridge_address;
  wire    [ 31: 0] flash_ssram_tristate_bridge_data;
  wire             global_reset_n_to_the_ddr_sdram;
  wire    [  3: 0] in_port_to_the_button_pio;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  wire             local_init_done_from_the_ddr_sdram;
  wire             local_refresh_ack_from_the_ddr_sdram;
  wire             local_wdata_req_from_the_ddr_sdram;
  wire    [ 12: 0] mem_addr_from_the_ddr_sdram;
  wire    [  1: 0] mem_ba_from_the_ddr_sdram;
  wire             mem_cas_n_from_the_ddr_sdram;
  wire             mem_cke_from_the_ddr_sdram;
  wire             mem_clk_n_to_and_from_the_ddr_sdram;
  wire             mem_clk_to_and_from_the_ddr_sdram;
  wire             mem_cs_n_from_the_ddr_sdram;
  wire    [  1: 0] mem_dm_from_the_ddr_sdram;
  wire    [ 15: 0] mem_dq_to_and_from_the_ddr_sdram;
  wire    [  1: 0] mem_dqs_to_and_from_the_ddr_sdram;
  wire             mem_ras_n_from_the_ddr_sdram;
  wire             mem_we_n_from_the_ddr_sdram;
  wire    [  1: 0] out_port_from_the_led_pio;
  wire             outputenable_n_to_the_ssram;
  wire             pipeline_bridge_before_tristate_bridge_m1_debugaccess;
  wire             pipeline_bridge_before_tristate_bridge_m1_endofpacket;
  wire             pll_c0_out;
  wire             pll_c1_out;
  wire             pll_c2_out;
  wire             pll_c3_out;
  wire             read_n_to_the_ext_flash;
  reg              reset_n;
  wire             reset_phy_clk_n_from_the_ddr_sdram;
  wire             select_n_to_the_ext_flash;
  wire             slow_peripheral_bridge_s1_endofpacket_from_sa;
  wire             write_n_to_the_ext_flash;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  cycloneIII_3c25_niosII_standard_sopc DUT
    (
      .adsc_n_to_the_ssram                  (adsc_n_to_the_ssram),
      .bw_n_to_the_ssram                    (bw_n_to_the_ssram),
      .bwe_n_to_the_ssram                   (bwe_n_to_the_ssram),
      .chipenable1_n_to_the_ssram           (chipenable1_n_to_the_ssram),
      .clk                                  (clk),
      .ddr_sdram_aux_full_rate_clk_out      (ddr_sdram_aux_full_rate_clk_out),
      .ddr_sdram_aux_half_rate_clk_out      (ddr_sdram_aux_half_rate_clk_out),
      .ddr_sdram_phy_clk_out                (ddr_sdram_phy_clk_out),
      .flash_ssram_tristate_bridge_address  (flash_ssram_tristate_bridge_address),
      .flash_ssram_tristate_bridge_data     (flash_ssram_tristate_bridge_data),
      .global_reset_n_to_the_ddr_sdram      (global_reset_n_to_the_ddr_sdram),
      .in_port_to_the_button_pio            (in_port_to_the_button_pio),
      .local_init_done_from_the_ddr_sdram   (local_init_done_from_the_ddr_sdram),
      .local_refresh_ack_from_the_ddr_sdram (local_refresh_ack_from_the_ddr_sdram),
      .local_wdata_req_from_the_ddr_sdram   (local_wdata_req_from_the_ddr_sdram),
      .mem_addr_from_the_ddr_sdram          (mem_addr_from_the_ddr_sdram),
      .mem_ba_from_the_ddr_sdram            (mem_ba_from_the_ddr_sdram),
      .mem_cas_n_from_the_ddr_sdram         (mem_cas_n_from_the_ddr_sdram),
      .mem_cke_from_the_ddr_sdram           (mem_cke_from_the_ddr_sdram),
      .mem_clk_n_to_and_from_the_ddr_sdram  (mem_clk_n_to_and_from_the_ddr_sdram),
      .mem_clk_to_and_from_the_ddr_sdram    (mem_clk_to_and_from_the_ddr_sdram),
      .mem_cs_n_from_the_ddr_sdram          (mem_cs_n_from_the_ddr_sdram),
      .mem_dm_from_the_ddr_sdram            (mem_dm_from_the_ddr_sdram),
      .mem_dq_to_and_from_the_ddr_sdram     (mem_dq_to_and_from_the_ddr_sdram),
      .mem_dqs_to_and_from_the_ddr_sdram    (mem_dqs_to_and_from_the_ddr_sdram),
      .mem_ras_n_from_the_ddr_sdram         (mem_ras_n_from_the_ddr_sdram),
      .mem_we_n_from_the_ddr_sdram          (mem_we_n_from_the_ddr_sdram),
      .out_port_from_the_led_pio            (out_port_from_the_led_pio),
      .outputenable_n_to_the_ssram          (outputenable_n_to_the_ssram),
      .pll_c0_out                           (pll_c0_out),
      .pll_c1_out                           (pll_c1_out),
      .pll_c2_out                           (pll_c2_out),
      .pll_c3_out                           (pll_c3_out),
      .read_n_to_the_ext_flash              (read_n_to_the_ext_flash),
      .reset_n                              (reset_n),
      .reset_phy_clk_n_from_the_ddr_sdram   (reset_phy_clk_n_from_the_ddr_sdram),
      .select_n_to_the_ext_flash            (select_n_to_the_ext_flash),
      .write_n_to_the_ext_flash             (write_n_to_the_ext_flash)
    );

  //default value specified in MODULE button_pio ptf port section
  assign in_port_to_the_button_pio = 15;

  ext_flash the_ext_flash
    (
      .address  (flash_ssram_tristate_bridge_address[23 : 1]),
      .data     (flash_ssram_tristate_bridge_data),
      .read_n   (read_n_to_the_ext_flash),
      .select_n (select_n_to_the_ext_flash),
      .write_n  (write_n_to_the_ext_flash)
    );

  ssram the_ssram
    (
      .address        (flash_ssram_tristate_bridge_address[19 : 2]),
      .adsc_n         (adsc_n_to_the_ssram),
      .bw_n           (bw_n_to_the_ssram),
      .bwe_n          (bwe_n_to_the_ssram),
      .chipenable1_n  (chipenable1_n_to_the_ssram),
      .clk            (pll_c0_out),
      .data           (flash_ssram_tristate_bridge_data),
      .outputenable_n (outputenable_n_to_the_ssram),
      .reset_n        (reset_n)
    );

  initial
    clk = 1'b0;
  always
    #10 clk <= ~clk;
  
  initial 
    begin
      reset_n <= 0;
      #200 reset_n <= 1;
    end

endmodule


//synthesis translate_on