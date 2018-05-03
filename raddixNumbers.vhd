library IEEE;
use IEEE.std_logic_1164.all;

entity raddixNumbers is 
port(input: in std_logic_vector(2 downto 0);
		num: in std_logic_vector(7 downto 0);
		Sumin: in std_logic_vector(7 downto 0);
		output: out std_logic_vector(7 downto 0)
		prod: out std_logic_vector(1 downto 0));
end raddixNumbers;

architecture behavior of raddixNumbers is 
--BSL COMPONENT 
component bsl is 
	port(invec: in std_logic_vector(7 downto 0);
			outvec:out std_logic_vector(7 downto 0));
end component;
--FULL ADDER COMPONENT 
component fullAdder is 
	port(X, Y: in std_logic;
			Cin, clk: in std_logic; --inputs 	
			Sum: out std_logic;
			Cout: out std_logic); --outputs 
end component;
--EIGHT BIT ADDER COMPONENT 
component eight_bit_adder is 
	port(A, B: in std_logic_vector(7 downto 0);		--inputs 
			Ci: in std_logic;				--carry in 	
			S: out std_logic_vector(7 downto 0); 		--sum
			Co: inout std_logic);	--carry out 
end component;


begin 

end behavior;
