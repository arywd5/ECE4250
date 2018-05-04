library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity getProd is 
	port(multiplicand, multiplier: in std_logic_vector(7 downto 0);
		ld, clr, clk: in std_logic;
		prod: out std_logic_vector(15 downto 0));
end getProd;

architecture behavior of getProd is 
--D flip flop for 8 bit
component dff8bit is 
	port(set, rst, clk: std_logic;
			d: in std_logic_vector(7 downto 0);
			q: out std_logic_vector(7 downto 0));
end component;
--D flip flop for 16 bit 
component dff16bit is 
	port(set, rst, clk: in std_logic;
			d: in std_logic_vector(15 downto 0);
			q: out std_logic_vector(15 downto 0));
end component;
--raddix numbers component 
component raddixNumbers is 
	port(input: in std_logic_vector(2 downto 0);
		num: in std_logic_vector(7 downto 0);
	--	Sumin: in std_logic_vector(7 downto 0);
		output: out std_logic_vector(7 downto 0);
		c0, c1: out std_logic);
--		product: out std_logic_vector(1 downto 0));
end component;
--function to add new number to current sum and get product numbers 
component configSum is 
	port(invec, cSum: in std_logic_vector(7 downto 0);
		x0, x1: in std_logic;
		nSum: out std_logic_vector(7 downto 0);
		product: out std_logic_vector(1 downto 0));
end component;

--declare signals to use 
signal zero, W, X, Y, hold1, hold2, hold3, hold4: std_logic_vector(7 downto 0);
signal buff: std_logic_vector(15 downto 0);
signal h0, h1: std_logic_vector(7 downto 0);
signal suminit: std_logic_vector(2 downto 0);
signal carries: std_logic_vector(7 downto 0);

	begin 
	
ff0:	dff8bit port map(ld, clr, clk, multiplicand, h0);
ff1:	dff8bit port map(ld, clr, clk, multiplier, h1);
	
		suminit <= h0(1 downto 0) & '0';
		zero <= "00000000";

sadd0:	raddixNumbers port map(suminit, h1, hold1, carries(0), carries(1));
cs0:	configSum port map( hold1, zero, carries(0), carries(1), W, buff(1 downto 0));

sadd1:	raddixNumbers port map(h0(3 downto 1), h1, hold2, carries(2), carries(3));
cs1:	configSum port map (hold2, W, carries(2), carries(3), X, buff(3 downto 2));

sadd2:	raddixNumbers port map(h0(5 downto 3), h1, hold3, carries(4), carries(5));
cs2:	configSum port map( hold3, X, carries(4), carries(5), Y, buff(5 downto 4));

sadd3:	raddixNumbers port map(h0(7 downto 5), h1, hold4, carries(6), carries(7)); 
cs3:	configSum port map( hold4, Y, carries(6), carries(7), buff(15 downto 8), buff(7 downto 6));
		
ff2:	dff16bit port map('1', clr, clk, buff, prod);

end behavior;