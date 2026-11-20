library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Daw_Da_wrapper is
    Port ( A, B           : in std_logic_vector (3 downto 0);
           decoded_A      : out std_logic_vector (6 downto 0);
           decoded_B      : out std_logic_vector (6 downto 0);
           decoded_AplusB : out std_logic_vector (13 downto 0));
end Daw_Da_wrapper;

architecture structural of Daw_Da_wrapper is

    component bcd_adder_structural is
        port ( A : in std_logic_vector (3 downto 0);
               B : in std_logic_vector (3 downto 0);
               S : out std_logic_vector (3 downto 0);
               C : out std_logic );
    end component;

    component seven_segment_decoder is
        port ( code         : in std_logic_vector (3 downto 0);
               segments_out : out std_logic_vector (6 downto 0) );
    end component;

    signal sum_ones  : std_logic_vector (3 downto 0);
    signal carry_out : std_logic;
    signal tens_bcd  : std_logic_vector (3 downto 0);

begin

    -- 1. BCD Adder instance
    ADDER_INST : bcd_adder_structural
        port map (
            A => A,
            B => B,
            S => sum_ones,
            C => carry_out
        );

    -- Pad the 1-bit carry out into a 4-bit BCD digit for the tens display
    tens_bcd <= "000" & carry_out;

    -- 2. Decoder for input A
    DEC_A : seven_segment_decoder
        port map (
            code         => A,
            segments_out => decoded_A
        );

    -- 3. Decoder for input B
    DEC_B : seven_segment_decoder
        port map (
            code         => B,
            segments_out => decoded_B
        );

    -- 4. Decoder for ones digit of A + B
    DEC_ONES : seven_segment_decoder
        port map (
            code         => sum_ones,
            segments_out => decoded_AplusB(6 downto 0)
        );

    -- 5. Decoder for tens digit of A + B
    DEC_TENS : seven_segment_decoder
        port map (
            code         => tens_bcd,
            segments_out => decoded_AplusB(13 downto 7)
        );

end structural;