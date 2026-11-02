library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity rca_structural is
port ( A: in std_logic_vector (3 downto 0);
       B: in std_logic_vector (3 downto 0);
       S: out std_logic_vector (4 downto 0));
end rca_structural;

architecture structural of rca_structural is
    -- Component declaration for Half-Adder
    component half_adder
        port (
            a: in std_logic;
            b: in std_logic;
            s: out std_logic;
            c: out std_logic
        );
    end component;

    -- Component declaration for Full-Adder
    component full_adder
        port (
            a: in std_logic;
            b: in std_logic;
            c_in: in std_logic;
            s: out std_logic;
            c_out: out std_logic
        );
    end component;

    -- Internal carry signals between adder stages
    signal c0, c1, c2 : std_logic;

begin
    -- Bit 0: Half Adder (no initial carry-in)
    HA0: half_adder port map (
        a => A(0),
        b => B(0),
        s => S(0),
        c => c0
    );

    -- Bit 1: Full Adder
    FA1: full_adder port map (
        a => A(1),
        b => B(1),
        c_in => c0,
        s => S(1),
        c_out => c1
    );

    -- Bit 2: Full Adder
    FA2: full_adder port map (
        a => A(2),
        b => B(2),
        c_in => c1,
        s => S(2),
        c_out => c2
    );

    -- Bit 3: Full Adder
    FA3: full_adder port map (
        a => A(3),
        b => B(3),
        c_in => c2,
        s => S(3),
        c_out => S(4) -- Final carry-out maps to S(4)
    );

end structural;