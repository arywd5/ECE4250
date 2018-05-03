library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_bit.all;

entity fullAdder is 
	port(X, Y: in std_logic;
		Cin, clk: in std_logic; --inputs 	
		Sum: out std_logic;
		Cout: out std_logic); --outputs 
end fullAdder;

architecture behavior of fullAdder is 
--XOR component 
component xorGate is 
	port(x, y: in std_logic;
			z: out std_logic);
end component;
--AND component 
component andGate is 
	port(x, y: in std_logic;
			z: out std_logic);
end component;
--OR component 
component orGate is 
	port(x, y: in std_logic;
			z: out std_logic);
end component;
signal hold1, hold2, hold3, hold4: std_logic;
begin

A1:		xorGate port map(X, Y, hold1);
A2:		xorGate port map(hold1, Cin, Sum);
A3: 		andGate port map(X, Y, hold1);
A4:		andGate port map(X, Cin, hold2);
A5:		andGate port map(Y, Cin, hold3);
A6:		orGate  port map(hold1, hold2, hold4);
A7:		orGate  port map(hold3, hold4, Cout);

end behavior;
