library IEEE;
use IEEE.std_logic_1164.all;

entity dff8bit is 
	port(set, rst, clk: std_logic;
			d: in std_logic_vector(7 downto 0);
			q: out std_logic_vector(7 downto 0));	
end dff8bit;

architecture behavior of dff8bit is 
--ADD REGULAR FLIP FLOP COMPONENT 
component dff is
	port(d, set, rst, clk: std_logic;
			q: out std_logic);
end component;

begin 
		--use the one bit flip flop 8 times to implement the 8 bit flip flop 
d0:		dff port map(d(0), set, rst, clk, q(0));
d1:		dff port map(d(1), set, rst, clk, q(1));
d2:		dff port map(d(2), set, rst, clk, q(2));
d3:		dff port map(d(3), set, rst, clk, q(3));
d4:		dff port map(d(4), set, rst, clk, q(4));
d5:		dff port map(d(5), set, rst, clk, q(5));
d6:		dff port map(d(6), set, rst, clk, q(6));
d7:		dff port map(d(7), set, rst, clk, q(7));

end behavior;
