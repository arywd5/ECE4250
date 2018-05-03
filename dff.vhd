library IEEE;
use IEEE.std_logic_1164.all;

entity dff is 
	port(d, set, rst, clk: in std_logic;
		q: out std_logic);
end dff;

architecture behavior of dff is 
begin 
	process(clk)
	begin
		if clk'event and clk = '1' then
			if  = '1' then 
				if d = '1' then q <= '1';
				elsif d = '0' then q <= '0';
				end if;
			elsif rst = '1' then q <= '0';
			end if;
		end if;
	end process;
end behavior;
