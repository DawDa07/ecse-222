library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_tb is
-- Testbench entities do not have ports
end full_adder_tb;

architecture behavior of full_adder_tb is
    -- Component Declaration for the Unit Under Test (UUT)
    component full_adder
    port(
         a : in std_logic;
         b : in std_logic;
         c_in : in std_logic;
         s : out std_logic;
         c_out : out std_logic
        );
    end component;

    -- Signals to connect to UUT inputs
    signal tb_a : std_logic := '0';
    signal tb_b : std_logic := '0';
    signal tb_c_in : std_logic := '0';

    -- Signals to connect to UUT outputs
    signal tb_s : std_logic;
    signal tb_c_out : std_logic;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: full_adder port map (
          a => tb_a,
          b => tb_b,
          c_in => tb_c_in,
          s => tb_s,
          c_out => tb_c_out
        );

    -- Stimulus process for exhaustive testing (all 8 combinations)
    stim_proc: process
    begin
        -- 000 (Expected: s=0, c_out=0)
        tb_a <= '0'; tb_b <= '0'; tb_c_in <= '0'; wait for 10 ns;
        -- 001 (Expected: s=1, c_out=0)
        tb_a <= '0'; tb_b <= '0'; tb_c_in <= '1'; wait for 10 ns;
        -- 010 (Expected: s=1, c_out=0)
        tb_a <= '0'; tb_b <= '1'; tb_c_in <= '0'; wait for 10 ns;
        -- 011 (Expected: s=0, c_out=1)
        tb_a <= '0'; tb_b <= '1'; tb_c_in <= '1'; wait for 10 ns;
        -- 100 (Expected: s=1, c_out=0)
        tb_a <= '1'; tb_b <= '0'; tb_c_in <= '0'; wait for 10 ns;
        -- 101 (Expected: s=0, c_out=1)
        tb_a <= '1'; tb_b <= '0'; tb_c_in <= '1'; wait for 10 ns;
        -- 110 (Expected: s=0, c_out=1)
        tb_a <= '1'; tb_b <= '1'; tb_c_in <= '0'; wait for 10 ns;
        -- 111 (Expected: s=1, c_out=1)
        tb_a <= '1'; tb_b <= '1'; tb_c_in <= '1'; wait for 10 ns;
        
        -- Terminate simulation
        wait;
    end process;
end behavior;