-- pwm_1.vhd

-- This file was auto-generated as part of a SOPC Builder generate operation.
-- If you edit it your changes will probably be lost.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pwm_1 is
	port (
		clk      : in  std_logic                     := '0';             --   clock.clk
		data_in  : in  std_logic_vector(31 downto 0) := (others => '0'); --  pwm_16.writedata
		address  : in  std_logic_vector(1 downto 0)  := (others => '0'); --        .address
		wr_n     : in  std_logic                     := '0';             --        .write_n
		cs_n     : in  std_logic                     := '0';             --        .chipselect_n
		data_out : out std_logic_vector(31 downto 0);                    --        .readdata
		resetn   : in  std_logic                     := '0';             --   reset.reset_n
		pwm_out  : out std_logic                                         -- pwm_out.export
	);
end entity pwm_1;

architecture rtl of pwm_1 is
	component my_pwm is
		port (
			clk      : in  std_logic                     := 'X';             -- clk
			data_in  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			address  : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- address
			wr_n     : in  std_logic                     := 'X';             -- write_n
			cs_n     : in  std_logic                     := 'X';             -- chipselect_n
			data_out : out std_logic_vector(31 downto 0);                    -- readdata
			resetn   : in  std_logic                     := 'X';             -- reset_n
			pwm_out  : out std_logic                                         -- export
		);
	end component my_pwm;

begin

	pwm_1 : component my_pwm
		port map (
			clk      => clk,      --   clock.clk
			data_in  => data_in,  --  pwm_16.writedata
			address  => address,  --        .address
			wr_n     => wr_n,     --        .write_n
			cs_n     => cs_n,     --        .chipselect_n
			data_out => data_out, --        .readdata
			resetn   => resetn,   --   reset.reset_n
			pwm_out  => pwm_out   -- pwm_out.export
		);

end architecture rtl; -- of pwm_1
