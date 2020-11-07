library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity value_to_digit is
    Port ( value : in  STD_LOGIC_VECTOR (15 downto 0);
           anode : in  STD_LOGIC_VECTOR (3 downto 0);
           digit : out  STD_LOGIC_VECTOR (3 downto 0));
end value_to_digit;

architecture Behavioral of value_to_digit is

begin

end Behavioral;

