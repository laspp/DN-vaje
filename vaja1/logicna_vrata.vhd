library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity logicna_vrata is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : out  STD_LOGIC;
           d : out  STD_LOGIC;
           e : out  STD_LOGIC);
end logicna_vrata;

architecture Behavioral of logicna_vrata is
begin
	c <= a and b;
	d <= a nand b;
	e <= a or b;
end Behavioral;

