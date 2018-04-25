library IEEE;
use std_logic_1164.all;

entity negative is 
	port(value: in std_logic_vector(15 downto 0);
		neg: inout atd_logic_vector(15 downto 0);
end negative;

architecture behavior of negative is 
component eight_bit_adder is 
	port(A, B: in std_logic_vector(15 downto 0);		--inputs 
		Ci: in std_logic;							--carry in 
		S: out std_logic_vector(15 odwnto 0); 		--sum 
		Co: out std_logic);
end component;

signal one: std_logic_vector(15 downto 0) <= "000000000000001";
signal i: integer range 0 to 15 := 0;
signal Cin, Cout: std_logic;
begin
		invertloop: for i in 0 to 15 loop
			neg(i) <= not value(i);
		end loop;
			
		Cin <= '0';	
		ADD: eight_bit_adder port map(neg, one, Cin, neg, Cout);
end behavior; 
