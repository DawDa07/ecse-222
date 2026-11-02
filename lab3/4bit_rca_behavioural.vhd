library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity rca_behavioral is
port ( A: in std_logic_vector (3 downto 0);
       B: in std_logic_vector (3 downto 0);
       S: out std_logic_vector (4 downto 0));
end rca_behavioral;

architecture behavioral of rca_behavioral is
begin
    S <= std_logic_vector(resize(unsigned(A), 5) + resize(unsigned(B), 5));
end behavioral;