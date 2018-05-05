library IEEE;
use IEEE.std_logic_1164.all;

entity dff16bit is 
	port(set, rst, clk: in std_logic;
			d: in std_logic_vector(15 downto 0);
			q: out std_logic_vector(15 downto 0));
end dff16bit;

architecture behavior of dff16bit is 
--ADD D 8 BIT FLIP FLOP COMP
component dff8bit is 
port(set, rst, clk: std_logic;
			d: in std_logic_vector(7 downto 0);
			q: out std_logic_vector(7 downto 0));	
end component;

begin 
	--implement the 8 bit flip flop twice for the 16 bit
dff0: dff8bit port map(set, rst, clk, d(7 downto 0), q(7 downto 0));
dff1: dff8bit port map(set, rst, clk, d(15 downto 8), q(15 downto 8));

end behavior;
