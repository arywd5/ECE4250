library IEEE;
use IEEE.std_logic_1164.all;

entity configSum is 
	port(invec, cSum: in std_logic_vector(7 downto 0);	--input and current Sum 
		x0, x1: in std_logic;				--carry in bits 
		nSum: out std_logic_vector(7 downto 0);		--new sum output 
		product: out std_logic_vector(1 downto 0));	--product output 
end configSum;

architecture behavior of configSum is 
--FULL ADDER COMPONENT 
component fullAdder is 
	port(X, Y: in std_logic;
			Cin: in std_logic; --inputs 	
			Cout: out std_logic;
			Sum: out std_logic); --outputs 
end component;
--EIGHT BIT ADDER COMPONENT 
component eight_bit_adder is 
	port(A, B: in std_logic_vector(7 downto 0);		--inputs 
			Ci: in std_logic;			--carry in 	
			S: out std_logic_vector(7 downto 0); 	--sum
			Co: inout std_logic);	--carry out 
end component;

signal hold: std_logic_vector(7 downto 0);
signal Cout1, Cout2, msb: std_logic;

begin
		--first add our current sum and input vector 
nSum1:  	eight_bit_adder port map(cSum, invec, x0, hold, Cout1);
		--then use the full adder to to get the most significant bit of our vector 
ncarry1:  	fullAdder port map(cSum(7), x1, Cout1, Cout2, msb);
		--configure the new sum 
		nSum(5 downto 0) <= hold(7 downto 2);
		nSum(7) <= msb;		--store msb
		nSum(6) <= msb;
		product <= hold(1 downto 0);	--store the product 


end behavior;