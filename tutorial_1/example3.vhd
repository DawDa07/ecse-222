-- still 2-1 mux but using process --> more readable

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY example 3 is
    PORT (x1, x2, s : IN STD_LOGIC;
          f  : OUT STD_LOGIC);
END example 3;

ARCHITECTURE Behavior OF example3 IS 
BEGIN 
    PROCESS (x1, x2, s)
    BEGIN 
        IF s = '0' THEN
            f <= x1;
        ELSE
            f <= x2;
        END IF;
    END PROCESS;
END Behavior;