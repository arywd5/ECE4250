library IEEE;
use std_logic_1164.all;

entity notGate is 
	port(x: in bit;
			y: out bit);
end notGate;

architecture behavior of notGate is 
	y <= x;
end behavior;
