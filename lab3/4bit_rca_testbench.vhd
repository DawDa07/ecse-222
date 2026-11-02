library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity rca_structural_tb is
-- Testbench entities do not have ports
end rca_structural_tb;

architecture behavior of rca_structural_tb is
    -- Component Declaration for the Unit Under Test (UUT)
    component rca_structural
    port(
         A : in  std_logic_vector(3 downto 0);
         B : in  std_logic_vector(3 downto 0);
         S : out std_logic_vector(4 downto 0)
        );
    end component;

    -- Signals to connect to UUT inputs
    signal tb_A : std_logic_vector(3 downto 0) := (others => '0');
    signal tb_B : std_logic_vector(3 downto 0) := (others => '0');

    -- Signals to connect to UUT outputs
    signal tb_S : std_logic_vector(4 downto 0);

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: rca_structural port map (
          A => tb_A,
          B => tb_B,
          S => tb_S
        );

    -- Stimulus process for exhaustive testing
    stim_proc: process
    begin
        -- Loop through all 16 values for A
        for i in 0 to 15 loop
            tb_A <= std_logic_vector(to_unsigned(i, 4));
            
            -- Loop through all 16 values for B
            for j in 0 to 15 loop
                tb_B <= std_logic_vector(to_unsigned(j, 4));
                wait for 10 ns;
            end loop;
        end loop;

        -- Terminate simulation
        wait;
    end process;

end behavior;