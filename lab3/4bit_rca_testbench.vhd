library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity rca_unified_tb is
-- Testbench entities do not have ports
end rca_unified_tb;

architecture behavior of rca_unified_tb is
    -- Component Declaration for Structural RCA
    component rca_structural
    port(
         A : in  std_logic_vector(3 downto 0);
         B : in  std_logic_vector(3 downto 0);
         S : out std_logic_vector(4 downto 0)
        );
    end component;

    -- Component Declaration for Behavioral RCA
    component rca_behavioral
    port(
         A : in  std_logic_vector(3 downto 0);
         B : in  std_logic_vector(3 downto 0);
         S : out std_logic_vector(4 downto 0)
        );
    end component;

    -- Shared input signals
    signal tb_A : std_logic_vector(3 downto 0) := (others => '0');
    signal tb_B : std_logic_vector(3 downto 0) := (others => '0');

    -- Separate output signals for comparison
    signal tb_S_struct : std_logic_vector(4 downto 0);
    signal tb_S_behav  : std_logic_vector(4 downto 0);

begin
    -- Instantiate the Structural RCA
    uut_struct: rca_structural port map (
          A => tb_A,
          B => tb_B,
          S => tb_S_struct
        );

    -- Instantiate the Behavioral RCA
    uut_behav: rca_behavioral port map (
          A => tb_A,
          B => tb_B,
          S => tb_S_behav
        );

    -- Stimulus and verification process
    stim_proc: process
    begin
        -- Exhaustive testing: 16x16 = 256 combinations
        for i in 0 to 15 loop
            tb_A <= std_logic_vector(to_unsigned(i, 4));
            
            for j in 0 to 15 loop
                tb_B <= std_logic_vector(to_unsigned(j, 4));
                
                -- Wait for combinational logic to settle
                wait for 10 ns;
                
                -- Verify that both architectures produce the exact same output
                assert (tb_S_struct = tb_S_behav) 
                report "Mismatch detected between structural and behavioral outputs for A=" & integer'image(i) & " and B=" & integer'image(j) 
                severity error;
                
            end loop;
        end loop;

        -- Terminate simulation
        wait;
    end process;
end behavior;