---------------------------------------------------------------------------------
----  ECE 4250 Final Project 
----  8 bit signed multiplier  
---------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity BoothMultiplier is
  port ( A, B: in std_logic_vector(7 downto 0); --input numbers to be multiplied 
	clk, clear, load: in std_logic;		-- input bits 
	Product: out std_logic_vector(15 downto 0);	--output product 
	done: out std_logic);				--done flag goes to one when finished 
end BoothMultiplier;

architecture Behavior of BoothMultiplier is
--component that will get the final product 
component getProd is 
	port(multiplicand, multiplier: in std_logic_vector(7 downto 0);
		ld, clr, clk: in std_logic;
		prod: out std_logic_vector(15 downto 0));
end component;

signal e: std_logic;	--signal to use to set the cone bit

begin 
	--call function that will return the product into the appropriate vector 
GP1:	getProd port map(A, B, load, clear, clk, product);

	process(load, clear, clk)
		begin 
			if clk'event  and clk = '1' then  --check for rising edge of clock 
				if(load = '1' and clear = '0') then
					e <= '1';	--set e to one if we are loading 
				else 
					e <= '0';	--if we arent loading or are clearing set e to 0
				end if;
			end if;
	end process;

	process 
		begin 
			wait for 60 ns;			--wait and then set done to e 
			done <= e;
	end process;
end Behavior;
