library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity comparator is
    Port ( first : in  STD_LOGIC_VECTOR (3 downto 0); -- connect to four swithces
           second : in  STD_LOGIC_VECTOR (3 downto 0); -- connect to four switches
           output : out  STD_LOGIC_VECTOR (1 downto 0)); -- connect to LEDs
end comparator;

architecture Behavioral of comparator is

begin

	output <= "10" when first > second else
				 "01" when first < second else
				 "00";

end Behavioral;

