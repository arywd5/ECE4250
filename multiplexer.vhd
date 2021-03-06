library IEEE;
use IEEE.std_logic_1164.all;

entity multiplexer is 
	port(X, Y: in std_logic;
			sel: in std_logic;
			Z: out std_logic);
end multiplexer;

architecture behavior of multiplexer is 
--AND GATE
component andGate is 
	port(X, Y:in std_logic;
			Z: out std_logic);
end component;
--OR GATE
component orGate is 
	port(X, Y: in std_logic;
			Z: out std_logic);
end component;
--NOT GATE
component notGate is 
	port(X: in std_logic;
			Y: out std_logic);
end component;

signal snot, hold1, hold2: std_logic;
begin

invert1: 	notGate port map(sel, snot);		--get select not 
and1:		andGate port map(snot, X, hold1);	--and this and X our first bit 
and2:		andGate port map(sel, Y, hold2);	--and sel and Y our second bit
or1:		orGate port map(hold1, hold2, Z);	--or both of these and store in Z

end behavior;
