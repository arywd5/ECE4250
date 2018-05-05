library IEEE;
use IEEE.std_logic_1164.all;

entity multiplexerV is 
	port(y0, y1, y2, y3, y4, y5, y6, y7: in std_logic_vector(7 downto 0);
			sel: in std_logic_vector(2 downto 0);
			output: out std_logic_vector(7 downto 0));
end multiplexerV;

architecture behavior of multiplexerV is 
--declare component of the 8:1 multiplexer 
component multiplexer8 is 
	port(x0, x1, x2, x3, x4, x5, x6, x7: in std_logic;
			sel: in std_logic_vector(2 downto 0);
			out0: out std_logic);
end component;

begin 
	--call the 8:1 multiplexer 8 times for each index of the vectors 
m80:	multiplexer8 port map(y0(0), y1(0), y2(0), y3(0), y4(0), y5(0), y6(0), y7(0), sel, output(0));
m81:	multiplexer8 port map(y0(1), y1(1), y2(1), y3(1), y4(1), y5(1), y6(1), y7(1), sel, output(1));
m82:	multiplexer8 port map(y0(2), y1(2), y2(2), y3(2), y4(2), y5(2), y6(2), y7(2), sel, output(2));
m83:	multiplexer8 port map(y0(3), y1(3), y2(3), y3(3), y4(3), y5(3), y6(3), y7(3), sel, output(3));
m84:	multiplexer8 port map(y0(4), y1(4), y2(4), y3(4), y4(4), y5(4), y6(4), y7(4), sel, output(4));
m85:	multiplexer8 port map(y0(5), y1(5), y2(5), y3(5), y4(5), y5(5), y6(5), y7(5), sel, output(5));
m86:	multiplexer8 port map(y0(6), y1(6), y2(6), y3(6), y4(6), y5(6), y6(6), y7(6), sel, output(6));
m87:	multiplexer8 port map(y0(7), y1(7), y2(7), y3(7), y4(7), y5(7), y6(7), y7(7), sel, output(7));

end behavior;
