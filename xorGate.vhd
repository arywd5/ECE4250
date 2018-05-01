library IEEE;
use IEEE.std_logic_1164.all;

entity xorGate is 
	port( x, y: in std_logic;
			z: out std_logic);
 end xorGate;	
architecture behavior of xorGate is 
	begin 
	z <= x xor y;
end behavior;