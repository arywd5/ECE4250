library IEEE;
use IEEE.std_logic_1164.all;

entity andGate is 
	port(x, y: in std_logic;
			z: out std_logic);
end andGate;

architecture behavior of andGate is 
	begin
	z <= x and y;
end behavior;
