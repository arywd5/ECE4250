library IEEE;
use IEEE.std_logic_1164.all;

entity configSum is 
	port(invec, cSum: in std_logic_vector(7 downto 0);
		x0, x1: in std_logic;
		nSum: out std_logic_vector(7 downto 0);
		product: out std_logic_vector(1 downto 0));
end configSum;

architecture behavior of configSum is 
component fullAdder is 
	port(X, Y: in std_logic;
			Cin: in std_logic; --inputs 	
			Cout: out std_logic;
			Sum: out std_logic); --outputs 
end component;
--EIGHT BIT ADDER COMPONENT 
component eight_bit_adder is 
	port(A, B: in std_logic_vector(7 downto 0);		--inputs 
			Ci: in std_logic;				--carry in 	
			S: out std_logic_vector(7 downto 0); 		--sum
			Co: inout std_logic);	--carry out 
end component;

signal hold: std_logic_vector(7 downto 0);
signal Cout1, Cout2, msb: std_logic;

begin

nSum1:  	eight_bit_adder port map(cSum, invec, x0, hold, Cout1);
ncarry1:  	fullAdder port map(cSum(7), x1, Cout1, Cout2, msb);

		nSum(5 downto 0) <= hold(7 downto 2);
		nSum(7) <= msb;
		nSum(6) <= msb;
		product <= hold(1 downto 0);


end behavior;