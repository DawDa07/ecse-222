-- 2-1 mux using STD_LOGIC --> needs ieee lib
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY example 2 is
    PORT (x1, x2, s : IN STD_LOGIC;
          f  : OUT STD_LOGIC);
END example 2;

ARCHITECTURE LoficFunc OF example2 is
BEGIN 
    f <= (NOT s AND x1)OR(s AND x2);
END LogicFunc;