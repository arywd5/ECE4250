library IEEE;
use IEEE.std_logic_1164.all;

entity raddixNumbers is 
	port(input: in std_logic_vector(2 downto 0);
	     num: in std_logic_vector(7 downto 0);
		clk: in std_logic;
		output: inout std_logic_vector(15 downto 0));
end raddixNumbers;

architecture behavior of raddixNumbers is 
component negative is 	     
	port(value: inout std_logic_vector(15 downto 0);
		flag: in bit);     
end component; 	
signal nflag: bit; 
begin process(clk)
	begin
	nflag <= '1';
	 output <= "0000000000000000";		--initialize output to all zeros 
case1:	case input is
	     	--when our input is zero we dont need to add anything to the output 
		when "000" => 
			output <= "0000000000000000";
	     	--when our input is one our output stays the same as the input 
		when "001" =>
			output <= "00000000" & num(7 downto 0);
	     	--same case as above 
		when "010" =>
			output <= "00000000" & num(7 downto 0);
	     	--when 011 we need to multiple by two or shift left once
		when "011" => 
			output(8 downto 1) <= num(7 downto 0);
	     	--shift left then take twos compliment 
		when "100" =>
			output(8 downto 1) <= num(7 downto 0);
	     		nflag <= '0';
		--take twos compliment 
	     	when "101" => 
			output <= "00000000" & num(7 downto 0);
	     		nflag <= '0';
	     	--same as case above 
	     	when "110" => 
			output <= "00000000" & num(7 downto 0);
	     		nflag <= '0';
		--again output should be all zeros 
	     	when "111" =>
			output <= "0000000000000000";
		when others =>
			output <= "0000000000000000";
	end case;
	end process; 
		NEG1: negative port map(output, nflag);
	
end behavior;
