-- my_pwm_2.vhd

-- This file was auto-generated as part of a generation operation.
-- If you edit it your changes will probably be lost.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity my_pwm_2 is
	port (
		clk      : in  std_logic                     := '0';             --          clock.clk
		data_in  : in  std_logic_vector(31 downto 0) := (others => '0'); -- avalon_slave_0.writedata
		address  : in  std_logic_vector(1 downto 0)  := (others => '0'); --               .address
		cs_n     : in  std_logic                     := '0';             --               .chipselect_n
		wr_n     : in  std_logic                     := '0';             --               .write_n
		data_out : out std_logic_vector(31 downto 0);                    --               .readdata
		pwm_out  : out std_logic;                                        --        pwm_out.export
		resetn   : in  std_logic                     := '0'              --     reset_sink.reset_n
	);
end entity my_pwm_2;

architecture rtl of my_pwm_2 is
	component my_pwm is
		port (
			clk      : in  std_logic                     := 'X';             -- clk
			data_in  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			address  : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- address
			cs_n     : in  std_logic                     := 'X';             -- chipselect_n
			wr_n     : in  std_logic                     := 'X';             -- write_n
			data_out : out std_logic_vector(31 downto 0);                    -- readdata
			pwm_out  : out std_logic;                                        -- export
			resetn   : in  std_logic                     := 'X'              -- reset_n
		);
	end component my_pwm;

begin

	my_pwm_2 : component my_pwm
		port map (
			clk      => clk,      --          clock.clk
			data_in  => data_in,  -- avalon_slave_0.writedata
			address  => address,  --               .address
			cs_n     => cs_n,     --               .chipselect_n
			wr_n     => wr_n,     --               .write_n
			data_out => data_out, --               .readdata
			pwm_out  => pwm_out,  --        pwm_out.export
			resetn   => resetn    --     reset_sink.reset_n
		);

end architecture rtl; -- of my_pwm_2
