library IEEE;
use IEEE.std_logic_1164.all;


entity  xnor_gate is

	port (
		a :  IN std_logic;
		b :  IN std_logic;
		f :  OUT std_logic);

END xnor_gate;


ARCHITECTURE rtl of xnor_gate is
	BEGIN
		PROCESS (a, b) IS
			BEGIN 
				f <= a XNOR b;
		END process;
end rtl;

