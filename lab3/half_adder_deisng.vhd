library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity half_adder is
    port (
        a: in std_logic;
        b: in std_logic;
        s: out std_logic;
        c: out std_logic
    );
end half_adder;

architecture structural of half_adder is
begin
    -- Sum is the XOR of a and b
    s <= a xor b;
    -- Carry is the AND of a and b
    c <= a and b;
end structural;