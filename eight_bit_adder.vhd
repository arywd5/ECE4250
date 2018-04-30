library IEEE;
use IEEE.std_logic_1164.all;

entity eight_bit_adder is 					--entity of our 8bit adder 
	port(A, B: in std_logic_vector(15 downto 0);		--inputs 
		Ci: in std_logic;				--carry in 
		flag: in bit;		
		S: out std_logic_vector(15 downto 0); 		--sum 
		Co: out std_logic);				--Carry out 
end eight_bit_adder;						--end the entity 

architecture behavior of eight_bit_adder is			--architecture 
	
component fullAdder						--add fullAdder component 
	port(X, Y: in std_logic; 
		Cin, clk: in std_logic;
		flag: in bit;			
		Cout, Sum: out std_logic);
end component;
signal clk: std_logic;
signal C: std_logic_vector(15 downto 1);			--create signal for carry in and outs 
begin 								--begin the adding 
	
	FA1: fullAdder port map(A(0), B(0), Ci, clk, flag, C(1), S(0));
	FA2: fullAdder port map(A(1), B(1), C(1), clk, flag, C(2), S(1));
   	FA3: fullAdder port map(A(2), B(2), C(2), clk, flag, C(3), S(2));
	FA4: fullAdder port map(A(3), B(3), C(3), clk, flag, C(4), S(3));
	FA5: fullAdder port map(A(4), B(4), C(4), clk, flag, C(5), S(4));
	FA6: fullAdder port map(A(5), B(5), C(5), clk, flag, C(6), S(5));
	FA7: fullAdder port map(A(6), B(6), C(6), clk, flag, C(7), S(6));
	FA8: fullAdder port map(A(7), B(7), C(7), clk, flag, C(8), S(7));
	FA9: fullAdder port map(A(8), B(8), C(8), clk, flag, C(9), S(8));
	FA10: fullAdder port map(A(9), B(9), C(9), clk, flag, C(10), S(9));
	FA11: fullAdder port map(A(10), B(10), C(10), clk, flag, C(11), S(10));
	FA12: fullAdder port map(A(11), B(11), C(11), clk, flag, C(12), S(11));
	FA13: fullAdder port map(A(12), B(12), C(12), clk, flag, C(13), S(12));
	FA14: fullAdder port map(A(13), B(13), C(13), clk, flag, C(14), S(13));
	FA15: fullAdder port map(A(14), B(14), C(14), clk, flag, C(15), S(14));
	FA16: fullAdder port map(A(15), B(15), C(15), clk, flag, Co, S(15));
		
end behavior;
