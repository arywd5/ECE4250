library IEEE;
use IEEE.std_logic_1164.all;

entity raddixNumbers is 
port(input: in std_logic_vector(2 downto 0);
		num: in std_logic_vector(7 downto 0);
		--Sumin: in std_logic_vector(7 downto 0);
		output: out std_logic_vector(7 downto 0);
		c0, c1: out std_logic);
--		product: out std_logic_vector(1 downto 0));
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
--FULL ADDER COMPONENT 
--component fullAdder is 
--	port(X, Y: in std_logic;
--			Cin: in std_logic; --inputs 	
--			Cout: out std_logic;
--			Sum: out std_logic); --outputs 
--end component;
--EIGHT BIT ADDER COMPONENT 
--component eight_bit_adder is 
---	port(A, B: in std_logic_vector(7 downto 0);		--inputs 
--			Ci: in std_logic;				--carry in 	
--			S: out std_logic_vector(7 downto 0); 		--sum
--			Co: inout std_logic);	--carry out 
--end component;
--MULTIPELXER EIGHT BIT COMPONENT 
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
signal numZero: std_logic_vector(7 downto 0);-- := x"00";
--signal c0, c1, c2, c3,c4: std_logic;

	begin 
		numZero <= "00000000";
step0:		bsl port map(num, shiftedNum);
step1:  	not_eight_bit port map(num, notNum);
step2:		not_eight_bit port map(shiftedNum, nsn);

step3:		multiplexerV port map(numZero, nsn, num, notNum, num, notNum, shiftedNum, numZero, input, output);
step4:		multiplexer8 port map('0', '1', '0', '1', '0', '1', '0', '0', input, c0);
step5:		multiplexer8 port map('0', notNum(7), num(7), notNum(7), num(7), notNum(7), num(7), '0', input, c1);

--step6:  	eight_bit_adder port map(Sumin, out0, c0, sum1, c2);
--step7:  	fullAdder port map(Sumin(7), c1, c2, c3, c4);

--		output(5 downto 0) <= sum1(7 downto 2);
--		output(7) <= c4;
--		output(6) <= c4;
--		product <= sum1(1 downto 0);

end behavior;
