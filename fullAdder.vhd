library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_bit.all;

entity fullAdder is 
	port(X, Y: in std_logic;
			Cin: in std_logic; --inputs 
			Sum: out std_logic;
			Cout: out std_logic); --outputs 
end fullAdder;

architecture behavior of fullAdder is 
begin
	Sum <= X xor Y xor Cin after 10ns;
	Cout <= (X and Y) or (X and Cin) or (Y and Cin) after 10 ns;
	
end behavior;
