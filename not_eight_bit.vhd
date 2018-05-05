library IEEE;
use IEEE.std_logic_1164.all;

entity not_eight_bit is 
	port(invec: in std_logic_vector(7 downto 0);	--input vector to be inverted 
			outvec: out std_logic_vector(7 downto 0)); -- inversion of the input 
end not_eight_bit;

architecture behavior of not_eight_bit is 
--NOT GATE COMPONENT TO CALL
component notGate is 
	port( x: in std_logic;
			y: out std_logic);
end component;

	begin 
		--Call Not gate for each bit and store in the output 
n0:		notGate port map(invec(0), outvec(0));
n1:		notGate port map(invec(1), outvec(1));
n2:		notGate port map(invec(2), outvec(2));
n3:		notGate port map(invec(3), outvec(3));
n4:		notGate port map(invec(4), outvec(4));
n5:		notGate port map(invec(5), outvec(5));
n6:		notGate port map(invec(6), outvec(6));
n7:		notGate port map(invec(7), outvec(7));

end behavior;
