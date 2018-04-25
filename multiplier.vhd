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
	clk: in std_logic;
	Product: out std_logic_vector(15 downto 0));
end BoothMultiplier;

architecture Behavior of BoothMultiplier is
--add our 16 bit adder so we can implement it 
component eight_bit_adder is 
	port(A, B: in std_logic_vector(15 downto 0);		--inputs 
		Ci: in std_logic;							--carry in 
		S: out std_logic_vector(15 odwnto 0); 		--sum 
		Co: out std_logic);
end component;
--raddix numbers component 
component raddixNumbers is 
	port(input: in std_logic_vector(2 downto 0);
		output: out integer range -2 to 2);
end component;
--negative component to take two's compliment of a number 
component negative is 
	port(value: in std_logic_vector(15 downto 0);
		neg: inout atd_logic_vector(15 downto 0));
end compnent;

signal shifted: std_logic_vector(8 downto 0);
signal hold: integer range -2 to 2 := 0;

begin
		
	
	

end Behavior;
