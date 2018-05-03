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
signal start: std_logic;
begin 
		start <= '0';		--first bit should be 0 when shifting left 
	
mux0:	multiplexer port map(start, invec(0), '1', outvec(0));
mux1:	multiplexer port map(invec(0), invec(1), '1', outvec(1));	
mux2:	multiplexer port map(invec(1), invec(2), '1', outvec(2));
mux3:	multiplexer port map(invec(2), invec(3), '1', outvec(3));
mux4:	multiplexer port map(invec(3), invec(4), '1', outvec(4));
mux5:	multiplexer port map(invec(4), invec(5), '1', outvec(5));
mux6:	multiplexer port map(invec(5), invec(6), '1', outvec(6));
mux7:	multiplexer port map(invec(6), invec(7), '1', outvec(7));

end behavior;
