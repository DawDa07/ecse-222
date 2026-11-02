library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bcd_adder_structural is
port ( A: in std_logic_vector (3 downto 0);
       B: in std_logic_vector (3 downto 0);
       S: out std_logic_vector (3 downto 0);
       C: out std_logic);
end bcd_adder_structural;

architecture behavioral of bcd_adder_structural is
    signal sum_temp : unsigned(4 downto 0);
    signal adjust   : std_logic;
    signal sum_final: unsigned(4 downto 0);
begin
    -- Initial binary addition (resized to 5 bits to capture initial carry)
    sum_temp <= resize(unsigned(A), 5) + resize(unsigned(B), 5);
    
    -- Determine if BCD adjustment is needed (sum > 9)
    adjust <= '1' when (sum_temp > 9) else '0';
    
    -- Add 6 (00110 in binary) if adjustment is required, otherwise add 0
    sum_final <= sum_temp + "00110" when (adjust = '1') else sum_temp;
    
    -- Map final adjusted sum to outputs
    S <= std_logic_vector(sum_final(3 downto 0));
    C <= adjust;
end behavioral;