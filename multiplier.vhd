---------------------------------------------------------------------------------
----  ECE 4250 Final Project 
----  8 bit signed multiplier  
---------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity BoothMultiplier is
  port ( A, B: in std_logic_vector(7 downto 0);
	clk: in std_logic;	
	Product: out std_logic_vector(15 downto 0));
end BoothMultiplier;

architecture Behavior of BoothMultiplier is
--add our 16 bit adder so we can implement it 
--component eight_bit_adder is 
--	port(A, B: in std_logic_vector(15 downto 0);		--inputs 
--		Ci: in std_logic;							--carry in 
--		--flag: in bit;		
--		S: out std_logic_vector(15 downto 0); 		--sum 
--		Co: out std_logic);
--end component;
component fullAdder is 
	port(X, Y: in std_logic;
		Cin, clk: in std_logic; --inputs 
	--	flag: in bit;			
		Sum: out std_logic;
		Cout: out std_logic); --outputs 
end component;
--raddix numbers component 
component raddixNumbers is 
	port(input: in std_logic_vector(2 downto 0);
	     	num: in std_logic_vector(7 downto 0);
		clk: in std_logic;
		output: inout std_logic_vector(15 downto 0));
end component;

--signals to be used in the multiplier
signal shifted: std_logic_vector(8 downto 0);
signal hold: integer range -2 to 2 := 0;
signal j: integer range 0 to 15;
signal W, X, Y, Z, hold1, hold2: std_logic_vector(15 downto 0);
signal C: std_logic_vector(15 downto 1);
signal Cout, Cin: std_logic;	   

begin
	shifted <= B(7 downto 0) & "0";     
	RN1: raddixNumbers port map(shifted(2 downto 0), A, clk, W);
	RN2: raddixNumbers port map(shifted(4 downto 2), A, clk, X);
	RN3: raddixNumbers port map(shifted(6 downto 4), A, clk, Y);
	RN4: raddixNumbers port map(shifted(8 downto 6), A, clk, Z);
	   
	X <= X(13 downto 0) & "00";
	Y <= Y(11 downto 0) & "0000";
	Z <= Z(9 downto 0) & "000000";
	Cin <= '0';

--	Add1: eight_bit_adder port map(W, X, Cin, hold1, Cout);
--	Add2: eight_bit_adder port map(Y, Z, Cin, hold2, Cout);
--	Add3: eight_bit_adder port map(hold1, hold2, Cin, product, Cout);

	FA1: fullAdder port map(w(0), X(0), Cin, C(1), hold1(0));
	FA2: fullAdder port map(W(1), X(1), C(1), C(2), hold1(1));
   	FA3: fullAdder port map(W(2), X(2), C(2), C(3), hold1(2));
	FA4: fullAdder port map(W(3), X(3), C(3), C(4), hold1(3));
	FA5: fullAdder port map(W(4), X(4), C(4), C(5), hold1(4));
	FA6: fullAdder port map(W(5), X(5), C(5), C(6), hold1(5));
	FA7: fullAdder port map(W(6), X(6), C(6), C(7), hold1(6));
	FA8: fullAdder port map(W(7), X(7), C(7), C(8), hold1(7));
	FA9: fullAdder port map(W(8), X(8), C(8), C(9), hold1(8));
	FA10: fullAdder port map(W(9), X(9), C(9), C(10), hold1(9));
	FA11: fullAdder port map(W(10), X(10), C(10), C(11), hold1(10));
	FA12: fullAdder port map(W(11), X(11), C(11), C(12), hold1(11));
	FA13: fullAdder port map(W(12), X(12), C(12), C(13), hold1(12));
	FA14: fullAdder port map(W(13), X(13), C(13), C(14), hold1(13));
	FA15: fullAdder port map(W(14), X(14), C(14), C(15), hold1(14));
	FA16: fullAdder port map(W(15), X(15), C(15), Cout, hold1(15));
	
	C <= "000000000000000";
	Cin <= '0';

	FA111: fullAdder port map(Y(0), Z(0), Cin, C(1), hold2(0));
	FA21: fullAdder port map(Y(1), Z(1), C(1), C(2), hold2(1));
   	FA31: fullAdder port map(Y(2), Z(2), C(2), C(3), hold2(2));
	FA41: fullAdder port map(y(3), Z(3), C(3), C(4), hold2(3));
	FA51: fullAdder port map(Y(4), Z(4), C(4), C(5), hold2(4));
	FA61: fullAdder port map(Y(5), Z(5), C(5), C(6), hold2(5));
	FA71: fullAdder port map(Y(6), Z(6), C(6), C(7), hold2(6));
	FA81: fullAdder port map(Y(7), Z(7), C(7), C(8), hold2(7));
	FA91: fullAdder port map(Y(8), Z(8), C(8), C(9), hold2(8));
	FA101: fullAdder port map(Y(9), Z(9), C(9), C(10), hold2(9));
	FA1119: fullAdder port map(Y(10), Z(10), C(10), C(11), hold2(10));
	FA121: fullAdder port map(Y(11), Z(11), C(11), C(12), hold2(11));
	FA131: fullAdder port map(Y(12), Z(12), C(12), C(13), hold2(12));
	FA141: fullAdder port map(Y(13), Z(13), C(13), C(14), hold2(13));
	FA151: fullAdder port map(Y(14), Z(14), C(14), C(15), hold2(14));
	FA161: fullAdder port map(Y(15), Z(15), C(15), Cout, hold2(15));

	C <="000000000000000";
	Cin <= '0';

	FA129: fullAdder port map(hold1(0), hold2(0), Cin, C(1), product(0));
	FA22: fullAdder port map(hold1(1), hold2(1), C(1), C(2), product(1));
   	FA32: fullAdder port map(hold1(2), hold2(2), C(2), C(3), product(2));
	FA42: fullAdder port map(hold1(3), hold2(3), C(3), C(4), product(3));
	FA52: fullAdder port map(hold1(4), hold2(4), C(4), C(5), product(4));
	FA62: fullAdder port map(hold1(5), hold2(5), C(5), C(6), product(5));
	FA72: fullAdder port map(hold1(6), hold2(6), C(6), C(7), product(6));
	FA82: fullAdder port map(hold1(7), hold2(7), C(7), C(8), product(7));
	FA92: fullAdder port map(hold1(8), hold2(8), C(8), C(9), product(8));
	FA120: fullAdder port map(hold1(9), hold2(9), C(9), C(10), product(9));
	FA1211: fullAdder port map(hold1(10), hold2(10), C(10), C(11), product(10));
	FA122: fullAdder port map(hold1(11), hold2(11), C(11), C(12), product(11));
	FA123: fullAdder port map(hold1(12), hold2(12), C(12), C(13), product(12));
	FA124: fullAdder port map(hold1(13), hold2(13), C(13), C(14), product(13));
	FA125: fullAdder port map(hold1(14), hold2(14), C(14), C(15), product(14));
	FA126: fullAdder port map(hold1(15), hold2(15), C(15), Cout, product(15));




		
end Behavior;
