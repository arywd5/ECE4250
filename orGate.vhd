library IEEE;
use IEEE.std_logic_1164.all;

entity orGate is 
	port(x, y: in std_logic;
		z: out std_logic);
end orGate;

architecture behavior of orGate is 
	begin
	z <= x or y;
end behavior;
