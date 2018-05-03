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
	clk, clear, load: in std_logic;	
	Product: out std_logic_vector(15 downto 0)
	done: out std_logic);
end BoothMultiplier;

architecture Behavior of BoothMultiplier is
--D flip flop for 8 bit
component dff8bit is 
	port(set, rst, clk: std_logic;
			d: in std_logic_vector(7 downto 0)
			q: out std_logic_vector(7 downto 0));
end component;
--D flip flop for 16 bit 
component dff16bit is 
	port(set, rst, clk: in std_logic
			d: in std_logic_vector(15 downto 0);
			q: out std_logic_vector(15 downto 0));
end component;
--raddix numbers component 
component raddixNumbers is 
	port(input: in std_logic_vector(2 downto 0);
	         num: in std_logic_vector(7 downto 0);
	         Sumin: in std_logic_vector(7 downto 0);
	         output: out std_logic_vector(7 downto 0)
	         product: out std_logic_vector(1 downto 0));
end component;

--signals to be used in the multiplier
signal j: integer range 0 to 15;
signal W, X, Y, Z, hold1, hold2: std_logic_vector(7 downto 0);
signal buff: std_logic_vector(15 downto 0);
signal h0, h1, e: std_logic;
signal suminit: std_logic_vector(2 downto 0);
type p is array(0 to 3)of std_logic_vector(7 downto 0);
signal s: p;


begin 

ff0:	dff8bit port map(load, clear, clk, A, h0);
ff1:	dff8bit port map(load, clear, clk, B, h1);
	
		suminit <= h0(1 downto 0) & '0';
		W <= "00000000";

sadd0:	raddixNumbers port map(suminit, h1, W, s(0), buff(1 downto 0));
sadd1:	raddixNumbers port map(h0(3 downto 1), h1, s(0), s(1), buff(3 downto 2));
sadd2:	raddixNumbers port map(h0(5 downto 3), h1, s(1), s(2), buff(5 downto 4));
sadd3:	raddixNumbers port map(h0(7 downto 5), h1, s(2), buff(15 downto 8), buff(7 downto 6));
		
ff2:	dff16bit port map(clk, clear, buff, product);

	process(load, clear, clk)
		begin 
			if load = '1' and clr = '0' and clk'event then 
				e <= '1';
			else 
				e <= '0'
			end if;
	end process;

	process 
		begin 
			wait for 60 ns;
			done <= e;
	end process;
end Behavior;
