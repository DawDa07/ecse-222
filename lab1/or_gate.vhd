library IEEE;
use IEEE.std_logic_1164.all;


entity  or_gate is

	port (
		a :  IN std_logic;
		b :  IN std_logic;
		f :  OUT std_logic);

END or_gate;


ARCHITECTURE rtl of or_gate is
	BEGIN
		PROCESS (a, b) IS
			BEGIN 
				f <= a OR b;
		END process;
end rtl;
