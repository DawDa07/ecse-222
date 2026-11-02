library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder_tb is
-- Testbench entities do not have ports
end half_adder_tb;

architecture behavior of half_adder_tb is
    -- Component Declaration for the Unit Under Test (UUT)
    component half_adder
    port(
         a : in  std_logic;
         b : in  std_logic;
         s : out std_logic;
         c : out std_logic
        );
    end component;

    -- Signals to connect to UUT inputs
    signal tb_a : std_logic := '0';
    signal tb_b : std_logic := '0';

    -- Signals to connect to UUT outputs
    signal tb_s : std_logic;
    signal tb_c : std_logic;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: half_adder port map (
          a => tb_a,
          b => tb_b,
          s => tb_s,
          c => tb_c
        );

    -- Stimulus process for exhaustive testing
    stim_proc: process
    begin
        -- Test Case 1: a=0, b=0 (Expected: s=0, c=0)
        tb_a <= '0'; tb_b <= '0';
        wait for 10 ns;
        
        -- Test Case 2: a=0, b=1 (Expected: s=1, c=0)
        tb_a <= '0'; tb_b <= '1';
        wait for 10 ns;
        
        -- Test Case 3: a=1, b=0 (Expected: s=1, c=0)
        tb_a <= '1'; tb_b <= '0';
        wait for 10 ns;
        
        -- Test Case 4: a=1, b=1 (Expected: s=0, c=1)
        tb_a <= '1'; tb_b <= '1';
        wait for 10 ns;

        -- Terminate simulation
        wait;
    end process;
end behavior;