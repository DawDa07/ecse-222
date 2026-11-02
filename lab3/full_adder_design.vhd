library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity full_adder is
    port (
        a: in std_logic;
        b: in std_logic;
        c_in: in std_logic;
        s: out std_logic;
        c_out: out std_logic
    );
end full_adder;

architecture structural of full_adder is
    -- Component declaration for the half-adder from the previous section
    component half_adder
        port (
            a: in std_logic;
            b: in std_logic;
            s: out std_logic;
            c: out std_logic
        );
    end component;

    -- Internal signals to connect the components
    signal s1, c1, c2 : std_logic;
begin
    -- First half-adder instance (adds a and b)
    HA1: half_adder port map (
        a => a,
        b => b,
        s => s1,
        c => c1
    );

    -- Second half-adder instance (adds sum of a+b to c_in)
    HA2: half_adder port map (
        a => s1,
        b => c_in,
        s => s,
        c => c2
    );

    -- Final carry out logic (OR gate for the two half-adder carries)
    c_out <= c1 or c2;
end structural;