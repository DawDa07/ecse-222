library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bcd_adder_unified_tb is
-- Testbench entities do not have ports
end bcd_adder_unified_tb;

architecture behavior of bcd_adder_unified_tb is
    -- Component Declaration for Structural BCD Adder
    component bcd_adder_structural
    port(
         A : in  std_logic_vector(3 downto 0);
         B : in  std_logic_vector(3 downto 0);
         S : out std_logic_vector(3 downto 0);
         C : out std_logic
        );
    end component;

    -- Component Declaration for Behavioral BCD Adder
    component bcd_adder_behavioral
    port(
         A : in  std_logic_vector(3 downto 0);
         B : in  std_logic_vector(3 downto 0);
         S : out std_logic_vector(3 downto 0);
         C : out std_logic
        );
    end component;

    -- Shared input signals
    signal tb_A : std_logic_vector(3 downto 0) := (others => '0');
    signal tb_B : std_logic_vector(3 downto 0) := (others => '0');

    -- Separate output signals for comparison
    signal tb_S_struct : std_logic_vector(3 downto 0);
    signal tb_C_struct : std_logic;
    signal tb_S_behav  : std_logic_vector(3 downto 0);
    signal tb_C_behav  : std_logic;

begin
    -- Instantiate the Structural BCD Adder
    uut_struct: bcd_adder_structural port map (
          A => tb_A,
          B => tb_B,
          S => tb_S_struct,
          C => tb_C_struct
        );

    -- Instantiate the Behavioral BCD Adder
    uut_behav: bcd_adder_behavioral port map (
          A => tb_A,
          B => tb_B,
          S => tb_S_behav,
          C => tb_C_behav
        );

    -- Stimulus and verification process
    stim_proc: process
    begin
        -- Exhaustive testing for valid BCD inputs: 10x10 = 100 combinations
        for i in 0 to 9 loop
            tb_A <= std_logic_vector(to_unsigned(i, 4));
            
            for j in 0 to 9 loop
                tb_B <= std_logic_vector(to_unsigned(j, 4));
                
                -- Wait for combinational logic to settle
                wait for 10 ns;
                
                -- Verify that both architectures produce the exact same outputs
                assert (tb_S_struct = tb_S_behav and tb_C_struct = tb_C_behav) 
                report "Mismatch detected between structural and behavioral BCD adders for A=" & integer'image(i) & " and B=" & integer'image(j) 
                severity error;
                
            end loop;
        end loop;

        -- Terminate simulation
        wait;
    end process;
end behavior;