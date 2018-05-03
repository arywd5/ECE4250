library IEEE;
use IEEE.std_logic_1164.all;

entity eight_bit_adder is 					--entity of our 8bit adder 
	port(A, B: in std_logic_vector(7 downto 0);		--inputs 
		Ci: in std_logic;				--carry in 	
		S: out std_logic_vector(7 downto 0); 		--sum 
		Co: inout std_logic);				--Carry out 
end eight_bit_adder;						--end the entity 

architecture behavior of eight_bit_adder is			--architecture 
--Full Adder component 	
component fullAdder						--add fullAdder component 
	port(X, Y: in std_logic; 
		Cin: in std_logic;			
		Cout, Sum: out std_logic);
end component;
signal C: std_logic_vector(7 downto 1);			--create signal for carry in and outs 
begin 								--begin the adding 
	
	FA1: fullAdder port map(A(0), B(0), Ci, C(1), S(0));
	FA2: fullAdder port map(A(1), B(1), C(1), C(2), S(1));
   	FA3: fullAdder port map(A(2), B(2), C(2), C(3), S(2));
	FA4: fullAdder port map(A(3), B(3), C(3), C(4), S(3));
	FA5: fullAdder port map(A(4), B(4), C(4), C(5), S(4));
	FA6: fullAdder port map(A(5), B(5), C(5), C(6), S(5));
	FA7: fullAdder port map(A(6), B(6), C(6), C(7), S(6));
	FA8: fullAdder port map(A(7), B(7), C(7), Co, S(7));
		
end behavior;
