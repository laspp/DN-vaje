library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity prescaler is
	 Generic (  
      width : integer := 8;
			max_val : integer := 255 -- za razliko od preteklih vaj je max_val tu generic
		);
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           enable : out  STD_LOGIC
    );
end prescaler;

architecture Behavioral of prescaler is
begin

end Behavioral;

