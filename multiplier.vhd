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



begin
	process(clk)
	variable Z: std_logic_vector(15 downto 0);
	variable s: std_logic;
	begin
		if clk'event and clk = '1'
			m := "00000000" & B;
			s := '0';




		end if;
	end process;

end Behavior;
