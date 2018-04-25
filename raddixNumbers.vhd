library IEEE;
use IEEE.std_logic_1164.all;

entity raddixNumbers is 
	port(input: in std_logic_vector(2 downto 0);
			output: out integer range -2 to 2);
end raddixNumbers;

architecture behavior of raddixNumbers is 
begin 
	case input is
		when "000" => 
			output := 0;
		when "001" =>
			output := 1;
		when "010" =>
			output := 1;
		when "011" => 
			output := 2;
		when "100" =>
			output := -2;
		when "101" => 
			output := -1;
		when "110" => 
			output := -1;
		when "111" =>
			output := 0;
		when others =>
			output := 0;
	end case 
end behavior;
