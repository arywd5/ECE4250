library IEEE;
use IEEE.std_logic_1164.all;

entity bsl is 
	port(invec: in std_logic_vector(7 downto 0);
			outvec:out std_logic_vector(7 downto 0));
end bsl;

architecture behavior of bsl is 
--use multiplexer to shift bits 
component multiplexer is 
	port(X, Y: in std_logic;
			sel: in std_logic;
			Z: out std_logic);
end component;
begin 
	
	--use the 2:1 multiplexer to shift left by sending 0 as the select and the bit we want 
		--in the X option then storing in the output one to the left 
mux0:	multiplexer port map('0', invec(0), '0', outvec(0));
mux1:	multiplexer port map(invec(0), invec(1), '0', outvec(1));	
mux2:	multiplexer port map(invec(1), invec(2), '0', outvec(2));
mux3:	multiplexer port map(invec(2), invec(3), '0', outvec(3));
mux4:	multiplexer port map(invec(3), invec(4), '0', outvec(4));
mux5:	multiplexer port map(invec(4), invec(5), '0', outvec(5));
mux6:	multiplexer port map(invec(5), invec(6), '0', outvec(6));
mux7:	multiplexer port map(invec(6), invec(7), '0', outvec(7));

end behavior;
