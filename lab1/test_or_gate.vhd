library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
-- empty
end testbench;

architecture tb of testbench is

--DUT component
component or_gate is
port(
	a: in std_logic;
	b: in std_logic;
	o: out std_logic);
end component;

signal a_in, b_in, o_out: std_logic;

begin

	-- connect DUT
	
	DUT: or_gate port map(a_in, b_in, o_out);
	
	process
	begin
		a_in <= '0';
		b_in <= '0';
		wait for 1 ns;
		assert(o_out='0') report "Fail 0/0" severity error;
		
		a_in <= '0';
		b_in <= '1';
		wait for 1 ns;
		assert(o_out='1') report "Fail 0/1" severity error;
		
		a_in <= '1';
		b_in <= 'X';
		wait for 1 ns;
		assert(o_out='1') report "Fail 1/X" severity error;
		
		a_in <= '1';
		b_in <= '1';
		wait for 1 ns;
		assert(o_out='1') report "Fail 1/1" severity error;
		
		-- clear inputs
		a_in <= '0';
		b_in <= '0';
		
		assert false report "Test done." severity note;
		wait;
		
	end process;
end tb;
