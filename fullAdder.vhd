library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_bit.all;

entity fullAdder is 
	port(X, Y: in std_logic;
		Cin: in std_logic; --inputs 	
		Cout: out std_logic;
		Sum: out std_logic); --outputs 
end fullAdder;

architecture behavior of fullAdder is 
--OR component 
component orGate is 
	port(x, y: in std_logic;
			z: out std_logic);
end component;
--Half Adder Component 
component halfAdder is 
	port(X, Y: in std_logic;
		Sum, Cout: out std_logic);
end component;

signal hold1, hold2, hold3, hold4: std_logic;
begin

HA1:	halfAdder port map(X, Y, hold1, hold2);
HA2:	halfAdder port map(hold1, Cin, Sum, hold3);
OR1:	orGate port map(hold2, hold3, Cout);

end behavior;
