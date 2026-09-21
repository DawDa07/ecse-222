library IEEE;
use IEEE.std_logic_1164.all;

entity testbench2 is
-- empty
end testbench2;

architecture tb of testbench2 is

--DUT component
component xnor_gate is
port(
	a: in std_logic;
	b: in std_logic;
	f: out std_logic);
end component;

signal a_in, b_in, f_out: std_logic;

begin

	-- connect DUT
	
	DUT: xnor_gate port map(a_in, b_in, f_out);
	
	process
	begin
		a_in <= '0';
		b_in <= '0';
		wait for 1 ns;
		assert(f_out='1') report "Fail 0/0" severity error;
		
		a_in <= '0';
		b_in <= '1';
		wait for 1 ns;
		assert(f_out='0') report "Fail 0/1" severity error;
		
		a_in <= '1';
		b_in <= '0';
		wait for 1 ns;
		assert(f_out='1') report "Fail 1/0" severity error;
		
		a_in <= '1';
		b_in <= '1';
		wait for 1 ns;
		assert(f_out='1') report "Fail 1/1" severity error;
		
		-- clear inputs
		a_in <= '0';
		b_in <= '0';
		
		assert false report "Test done." severity note;
		wait;
		
	end process;
end tb;