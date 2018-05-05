library IEEE;
use IEEE.std_logic_1164.all;

entity raddixNumbers is 
port(input: in std_logic_vector(2 downto 0);		--three numbers to encode from table 
		num: in std_logic_vector(7 downto 0);	--number that we want to add according to the table 
		output: out std_logic_vector(7 downto 0);--store output number here 
		c0, c1: out std_logic);			--output bits 
end raddixNumbers;

architecture behavior of raddixNumbers is 
--BSL COMPONENT 
component bsl is 
	port(invec: in std_logic_vector(7 downto 0);
			outvec:out std_logic_vector(7 downto 0));
end component;
--8 BIT INVERTER COMPONENT 
component not_eight_bit is 
	port(invec: in std_logic_vector(7 downto 0);
			outvec: out std_logic_vector(7 downto 0));
end component;
--8:1 multiplexer
component multiplexer8 is 
	port(x0, x1, x2, x3, x4, x5, x6, x7: in std_logic;
			sel: in std_logic_vector(2 downto 0);
			out0: out std_logic);
end component;
--MULTIPLEXER WITH VECTORS 
component multiplexerV is 
	port(y0, y1, y2, y3, y4, y5, y6, y7: in std_logic_vector(7 downto 0);
			sel: in std_logic_vector(2 downto 0);
			output: out std_logic_vector(7 downto 0));
end component;
--declare all signals we will need to use 
signal shiftedNum, notNum, nsn, out0, sum1: std_logic_vector(7 downto 0);
signal numZero: std_logic_vector(7 downto 0);

	begin 
		numZero <= "00000000";		--store all zeros in this number 
step0:		bsl port map(num, shiftedNum);	--shift num left to get 2*num 
step1:  	not_eight_bit port map(num, notNum);	--invert number for 2's compliment 
step2:		not_eight_bit port map(shiftedNum, nsn);--invert 2*num for 2's compliment 

		--use the multiplexer to select the proper options using the input vector as the selection bits 
step3:		multiplexerV port map(numZero, nsn, num, notNum, num, notNum, shiftedNum, numZero, input, output);
step4:		multiplexer8 port map('0', '1', '0', '1', '0', '1', '0', '0', input, c0);
step5:		multiplexer8 port map('0', notNum(7), num(7), notNum(7), num(7), notNum(7), num(7), '0', input, c1);

end behavior;
