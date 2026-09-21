library IEEE;
use IEEE.std_logic_1164.all;


entity  or_gate is

	port (
		a :  IN std_logic;
		b :  IN std_logic;
		o :  OUT std_logic);

END or_gate;


ARCHITECTURE rtl of or_gate is
	BEGIN
		PROCESS (a, b) IS
			BEGIN 
				o <= a OR b;
		END process;
end rtl;
