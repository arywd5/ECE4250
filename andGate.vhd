library IEEE;
use std_logic_1164.all;

entity andGate is 
	port map(x, y: in bit;
			z: out bit);
end andGate;

architecture behavior of andGate is 
	z <= x and y;
end behavior;
