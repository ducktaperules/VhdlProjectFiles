-- i2c_master_top_0.vhd

-- This file was auto-generated as part of a SOPC Builder generate operation.
-- If you edit it your changes will probably be lost.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity i2c_master_top_0 is
	port (
		wb_stb_i     : in  std_logic                    := '0';             --              i2c.write
		wb_adr_i     : in  std_logic_vector(2 downto 0) := (others => '0'); --                 .address
		wb_dat_i     : in  std_logic_vector(7 downto 0) := (others => '0'); --                 .writedata
		wb_dat_o     : out std_logic_vector(7 downto 0);                    --                 .readdata
		wb_we_i      : in  std_logic                    := '0';             --                 .chipselect
		wb_ack_o     : out std_logic;                                       --                 .readyfordata
		wb_clk_i     : in  std_logic                    := '0';             --            clock.clk
		wb_rst_i     : in  std_logic                    := '0';             --       reset_sink.reset
		arst_i       : in  std_logic                    := '0';             --     reset_sink_1.reset_n
		wb_inta_o    : out std_logic;                                       -- interrupt_sender.irq
		scl_pad_i    : in  std_logic                    := '0';             --            scl_i.export
		scl_pad_o    : out std_logic;                                       --            scl_o.export
		scl_padoen_o : out std_logic;                                       --          scl_oen.export
		sda_pad_i    : in  std_logic                    := '0';             --            sda_i.export
		sda_pad_o    : out std_logic;                                       --            sda_o.export
		sda_padoen_o : out std_logic                                        --          sda_oen.export
	);
end entity i2c_master_top_0;

architecture rtl of i2c_master_top_0 is
	component i2c_master_top is
		generic (
			ARST_LVL : std_logic := '0'
		);
		port (
			wb_stb_i     : in  std_logic                    := 'X';             -- write
			wb_adr_i     : in  std_logic_vector(2 downto 0) := (others => 'X'); -- address
			wb_dat_i     : in  std_logic_vector(7 downto 0) := (others => 'X'); -- writedata
			wb_dat_o     : out std_logic_vector(7 downto 0);                    -- readdata
			wb_we_i      : in  std_logic                    := 'X';             -- chipselect
			wb_ack_o     : out std_logic;                                       -- readyfordata
			wb_clk_i     : in  std_logic                    := 'X';             -- clk
			wb_rst_i     : in  std_logic                    := 'X';             -- reset
			arst_i       : in  std_logic                    := 'X';             -- reset_n
			wb_inta_o    : out std_logic;                                       -- irq
			scl_pad_i    : in  std_logic                    := 'X';             -- export
			scl_pad_o    : out std_logic;                                       -- export
			scl_padoen_o : out std_logic;                                       -- export
			sda_pad_i    : in  std_logic                    := 'X';             -- export
			sda_pad_o    : out std_logic;                                       -- export
			sda_padoen_o : out std_logic                                        -- export
		);
	end component i2c_master_top;

begin

	i2c_master_top_0 : component i2c_master_top
		generic map (
			ARST_LVL => '0'
		)
		port map (
			wb_stb_i     => wb_stb_i,     --              i2c.write
			wb_adr_i     => wb_adr_i,     --                 .address
			wb_dat_i     => wb_dat_i,     --                 .writedata
			wb_dat_o     => wb_dat_o,     --                 .readdata
			wb_we_i      => wb_we_i,      --                 .chipselect
			wb_ack_o     => wb_ack_o,     --                 .readyfordata
			wb_clk_i     => wb_clk_i,     --            clock.clk
			wb_rst_i     => wb_rst_i,     --       reset_sink.reset
			arst_i       => arst_i,       --     reset_sink_1.reset_n
			wb_inta_o    => wb_inta_o,    -- interrupt_sender.irq
			scl_pad_i    => scl_pad_i,    --            scl_i.export
			scl_pad_o    => scl_pad_o,    --            scl_o.export
			scl_padoen_o => scl_padoen_o, --          scl_oen.export
			sda_pad_i    => sda_pad_i,    --            sda_i.export
			sda_pad_o    => sda_pad_o,    --            sda_o.export
			sda_padoen_o => sda_padoen_o  --          sda_oen.export
		);

end architecture rtl; -- of i2c_master_top_0
