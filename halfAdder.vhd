library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_bit.all;

entity halfAdder is 
	port(X, Y: in std_logic;
		Sum, Cout: out std_logic);
end halfAdder;

architecture behavior of halfAdder is 
begin 
	Sum <= X xor Y;
	Cout <= X and Y;
end behavior;