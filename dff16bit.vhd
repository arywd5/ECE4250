library IEEE;
use IEEE.std_logic_1164.all;

entity dff16bit is 
	port(set, rst, clk: in std_logic
			d: in std_logic_vector(15 downto 0);
			q: out std_logic_vector(15 downto 0));
end dff16bit;

architecture behavior of dff16bit is 
--ADD D FLIP FLOP COMP
component dff is 
	port(d, set, rst, clk: in std_logic;
			q: out std_logic);
end component;

begin 
	
dff0:	dff port map(d(0), set, rst, clk, q(0));
dff1:	dff port map(d(1), set, rst, clk, q(1));
dff2:	dff port map(d(2), set, rst, clk, q(2));
dff3:   dff port map(d(3), set, rst, clk, q(3));
dff4:   dff port map(d(4), set, rst, clk, q(4));
dff5:   dff port map(d(5), set, rst, clk, q(5));
dff6:   dff port map(d(6), set, rst, clk, q(6));
dff7:   dff port map(d(7), set, rst, clk, q(7));
dff8:   dff port map(d(8), set, rst, clk, q(8));
dff9:   dff port map(d(9), set, rst, clk, q(9));
dff10:  dff port map(d(10), set, rst, clk, q(10));
dff11:  dff port map(d(11), set, rst, clk, q(11));
dff12:	dff port map(d(12), set, rst, clk, q(12));
dff13:  dff port map(d(13), set, rst, clk, q(13));
dff14:  dff port map(d(14), set, rst, clk, q(14));
dff15:  dff port map(d(15), set, rst, clk, q(15));

end behavior;
