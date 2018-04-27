---------------------------------------------------------------------------------
----  ECE 4250 Final Project 
----  8 bit signed multiplier  
---------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity BoothMultiplier is
  port ( A, B: in std_logic_vector(7 downto 0);
	Product: out std_logic_vector(15 downto 0));
end BoothMultiplier;

architecture Behavior of BoothMultiplier is
--add our 16 bit adder so we can implement it 
component eight_bit_adder is 
	port(A, B: in std_logic_vector(15 downto 0);		--inputs 
		Ci: in std_logic;							--carry in 
		S: out std_logic_vector(15 downto 0); 		--sum 
		Co: out std_logic);
end component;
--raddix numbers component 
component raddixNumbers is 
	port(input: in std_logic_vector(2 downto 0);
	     	num: in std_logic_vector(7 downto 0);
		output: inout std_logic_vector(15 downto 0));
end component;
--negative component to take two's compliment of a number 
component negative is 
	port(value: inout std_logic_vector(15 downto 0));
end component;
--signals to be used in the multiplier
signal shifted: std_logic_vector(8 downto 0);
signal hold: integer range -2 to 2 := 0;
signal j: integer range 0 to 15;
signal W, X, Y, Z, hold1, hold2: std_logic_vector(15 downto 0);
signal Cout, Cin: std_logic;	   

begin
	shifted <= B(7 downto 0) & "0";     
	RN1: raddixNumbers port map(shifted(2 downto 0), A, W);
	RN2: raddixNumbers port map(shifted(4 downto 2), A, X);
	RN3: raddixNumbers port map(shifted(6 downto 4), A, Y);
	RN4: raddixNumbers port map(shifted(8 downto 6), A, Z);
	   
	X <= X(13 downto 0) & "00";
	Y <= Y(11 downto 0) & "0000";
	Z <= Z(9 downto 0) & "000000";

	A1: eight_bit_adder port map(W, X, Cin, hold1, Cout);
	A2: eight_bit_adder port map(Y, Z, Cin, hold2, Cout);
	A3: eight_bit_adder port map(hold1, hold2, Cin, product, Cout);
		
end Behavior;
