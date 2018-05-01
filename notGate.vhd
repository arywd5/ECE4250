library IEEE;
use IEEE.std_logic_1164.all;

entity notGate is 
	port(x: in std_logic;
			y: out std_logic);
end notGate;

architecture behavior of notGate is 
	begin
	y <= x;
end behavior;
