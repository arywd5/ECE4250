library IEEE;
use IEEE.std_logic_1164.all;

entity raddixNumbers is 
	port(input: in std_logic_vector(7 downto 0);
			out1, out2, out3, out4: out std_logic_vector(2 downto 0));
end raddixNumbers;

architecture behavior of raddixNumbers is 
signal shifted: std_logic_vector(8 downto 0);
signal hold: std_logic_vector(2 downto 0);
signal output: std_logic_vecctor(2 downto 0);
variable i: integer range 0 to 3 := 0;

shifted <= input(7 downto 0) & "0";			--create a shifted version to get the booth numbers 
num_loop: for i in 0 to 3 loop: 

	if i = '0' then hold <= shifted(2 downto 0); 
	elsif i = '1' then hold <= shifted(4 downto 2); 
	elsif i = '2' then hold <= shifted(6 downto 4);
	elsif i = '3' then hold <= shifted(8 downto 6);
	end if;

	case hold is 
		when "000"					--check for 3

	--check for 2

	--check for 1 

	--check for 0

	--check for -1

	--check for -2
		
	--check for -3

end loop;

end behavior;
