library IEEE;
use IEEE.std_logic_1164.all;

entity multiplexer8 is 
	port(x0, x1, x2, x3, x4, x5, x6, x7: in std_logic;
			sel: in std_logic_vector(2 downto 0);
			out0: out std_logic);
end multiplexer8;

architecture behavior of multiplexer8 is 
--2 by 1 mux component 
component multiplexer is 
	port(X, Y: in std_logic;
			sel: in std_logic;
		   Z: out std_logic);
end component;

signal h1, h2, h3, h4, h5, h6: std_logic;

begin
		--implement the 2:1 multiplexer seven times to get the 8:1
m0:		multiplexer port map(x0, x1, sel(2), h1);	--use sel(2) for the 
m1:		multiplexer port map(x2, x3, sel(2), h2);	--top level 
m2:		multiplexer port map(x4, x5, sel(2), h3);
m3:		multiplexer port map(x6, x7, sel(2), h4);
m4:		multiplexer port map(h1, h2, sel(1), h5);	--then using sel(1) with 
m5:		multiplexer port map(h3, h4, sel(1), h6);	--the hold variables 
m6:		multiplexer port map(h5, h6, sel(0), out0);	--finally use sel(0) for the last 2 holds 


end behavior;
