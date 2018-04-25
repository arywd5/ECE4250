library IEEE;
use IEEE.std_logic_1164.all;

entity raddixNumbers is 
	port(input: in std_logic_vector(2 downto 0);
			output: out std_logic_vector(2 downto 0));
end raddixNumbers;

architecture behavior of raddixNumbers is 
begin 
	case input is
		when "000" => 
			output <= "000";
		when "001" =>
			output <= "001";
		when "010" =>
			output <= "001";
		when "011" => 
			output <= "010";
		when "100" =>
			output <= "110";
		when "101" => 
			output <= "111";
		when "110" => 
			output <= "111";
		when "111" =>
			output <= "000";
		when others =>
			output <= "000";
	end case 
end behavior;
