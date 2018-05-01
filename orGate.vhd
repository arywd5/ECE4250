library IEEE;
use std_logic_1164.all;

entity orGate is 
	port(x, y: in bit;
		z: out bit);
end orGate;

architecture behavior of orGate is 
	z <= x or y;
end orGate;
