-------------------------------------------------------------------------------
-- Title      : PWM for robot servos
-- Project    : 
-------------------------------------------------------------------------------
-- File       : my_pwm.vhd
-- Author     :   <ngunton@ptolome.cems.uwe.ac.uk>
-- Company    : EDM, UWE
-- Last update: 2013-09-13
-- Platform   : Altera Quartus with std_arith library and DE0 board
-------------------------------------------------------------------------------
-- Description: A simple PWM with a 32 bit clock divide register and a 16 bit
-- duty cycle register. Both registers are readable as well as writable. This
-- implementation is designed to integrate easily with the Altera Avalon bus,
-- hence the 32 bit data connections
-------------------------------------------------------------------------------
-- Revisions  : 2
-- Date        Version  Author  Description
-- 2007/02/07  1.0      ngunton Created
-- 2013/09/09  2.00     ngunton Added output enable
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity my_pwm is
  
  port (
    clk        : in  std_logic;
    data_in    : in  std_logic_vector(31 downto 0);
    address    : in  std_logic_vector(1 downto 0);
    wr_n       : in  std_logic;  -- read = 1, wr = 0
    cs_n       : in  std_logic;  -- chip select
    resetn     : in  std_logic;
    data_out   : out std_logic_vector(31 downto 0);  -- internal
    pwm_out    : out std_logic);

end my_pwm;


architecture behavioural of my_pwm is
  signal clock_div_sig             : unsigned(31 downto 0);
  signal period_sig : unsigned(15 downto 0);
  signal pwm_out_sig, slow_clk_sig : std_logic;
  signal duty_cycle_reg            : unsigned(15 downto 0);
  signal clock_div_reg             : unsigned(31 downto 0);
  signal control_reg               : std_logic;
  signal period_reg                : unsigned(15 downto 0);
begin  -- behavioural


  -- purpose: manage the duty cycle register
  -- type   : sequential
  -- inputs : clk, resetn, 
  -- outputs: duty_out_sig
  control : process (clk, resetn,cs_n)
  begin  -- process control
    if resetn = '0' then  -- asynchronous reset (active low)
      duty_cycle_reg <= to_unsigned(32768, 16); -- 50:50
      period_reg <= to_unsigned(65535,16);
      clock_div_reg <= to_unsigned(0,32); -- no clock div
    else
      if clk'event and clk = '1' and cs_n = '0' then   -- rising clock edge
        if wr_n = '0' then              -- write cycle
          case address is
            when "00" => duty_cycle_reg <= unsigned(data_in(15 downto 0));
            when "01" => clock_div_reg <= unsigned(data_in);
            when "10" => period_reg <= unsigned(data_in(15 downto 0));
            when "11" => control_reg <= (data_in(0));
            when others => null;
          end case;
        end if;
        case address is
          when "00" => data_out <= std_logic_vector(X"0000"&duty_cycle_reg);
          when "01" => data_out <= std_logic_vector(clock_div_reg);
          when "10" => data_out <= std_logic_vector(X"0000"&period_reg);
          when "11" => data_out <= X"0000000"&"000"&control_reg;
          when others => data_out <= X"DEAD4EAD";
        end case;
      end if;
    end if;
  end process control;

  -- purpose: divide I/O clock down from 10Mhz to (2 x (10Mhz/divisor))hz
  -- type   : sequential
  -- inputs : clk, resetn
  -- outputs: slow_clk
  clockdiv : process (clk, resetn)
  begin  -- process clockdiv
    if resetn = '0' then                -- asynchronous reset (active low)
      slow_clk_sig  <= '0';
    elsif clk'event and clk = '1' then  -- rising clock edge
      if clock_div_sig = clock_div_reg then
        clock_div_sig <= to_unsigned(0, 32);
        slow_clk_sig  <= not slow_clk_sig;
      else
        clock_div_sig <= clock_div_sig +1;
      end if;
    end if;
  end process clockdiv;

-- purpose: control the pwm_out 
-- type   : sequential
-- inputs : slow_clk, resetn, pwm_enable
-- outputs: pwm_out_sig

  pulse : process (slow_clk_sig, resetn)
  begin  -- process pulse
    if resetn = '0' then                -- asynchronous reset (active low)
      pwm_out_sig <= '0';
      period_sig <= to_unsigned(0,16);
    else
      if slow_clk_sig'event and slow_clk_sig = '1' then  -- rising clock edge
        period_sig <= period_sig + 1;
        if period_sig = period_reg then
          period_sig <= to_unsigned(0,16);
        end if;
        if control_reg = '1' and (period_sig < duty_cycle_reg) then
          pwm_out_sig <= '1';
        else
          pwm_out_sig <= '0';
        end if;
      end if;
    end if;
  end process pulse;

  pwm_out <= pwm_out_sig;

  

end behavioural;
