library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bcd_adder_structural is
port ( A: in std_logic_vector (3 downto 0);
       B: in std_logic_vector (3 downto 0);
       S: out std_logic_vector (3 downto 0);
       C: out std_logic);
end bcd_adder_structural;

architecture structural of bcd_adder_structural is
    signal sum_temp : unsigned(4 downto 0);
    signal adjust   : std_logic;
    signal sum_final: unsigned(4 downto 0);
begin
    -- Initial binary addition
    sum_temp <= resize(unsigned(A), 5) + resize(unsigned(B), 5);
    
    -- Boolean logic for BCD carry-out (Sum > 9)
    adjust <= sum_temp(4) or (sum_temp(3) and sum_temp(2)) or (sum_temp(3) and sum_temp(1));
    
    -- Add 6 if adjustment is required
    sum_final <= sum_temp + "00110" when (adjust = '1') else sum_temp;
    
    S <= std_logic_vector(sum_final(3 downto 0));
    C <= adjust;
end structural;