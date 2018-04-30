library IEEE;
use IEEE.std_logic_1164.all;

entity negative is 
	port(value: inout std_logic_vector(15 downto 0);
		flag: in bit);
end negative;

architecture behavior of negative is 
component eight_bit_adder is 
	port(A, B: in std_logic_vector(15 downto 0);		--inputs 
		Ci: in std_logic;				--carry in 
		flag: in bit;
		S: out std_logic_vector(15 downto 0); 		--sum 
		Co: out std_logic);
end component;

signal one: std_logic_vector(15 downto 0); 
signal i: integer range 0 to 15 := 0;
signal Cin, Cout: std_logic;
begin
process(value)
	begin
		if flag = '1' then 
		one <= "0000000000000001";
loop1:		for i in 0 to 15 loop
			value(i) <= not value(i);
		end loop;		
		Cin <= '0';	
		end if;
	end process;
	ADD: eight_bit_adder port map(value, one, Cin, flag, value, Cout);
end behavior; 
