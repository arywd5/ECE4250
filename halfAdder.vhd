library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_bit.all;

entity halfAdder is 
	port(X, Y: in std_logic;
		Sum, Cout: out std_logic);
end halfAdder;

architecture behavior of halfAdder is
--Xor gate component 
component xorGate is 
	port(X, Y: in std_logic;
			Z: out std_logic);
end component;
--and gate component 
component andGate is 
	port(X, Y: in std_logic;
			Z: out std_logic);
end component;

begin 
xor1:	xorGate port map(X, Y, Sum);
and1: 	andGate port map(X, Y, Cout);

end behavior;
