library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity prescaler is
	Generic (  
		width : integer := 8;
		max_val : integer := 255
	);
    Port ( 
		clock : in  STD_LOGIC;
        reset : in  STD_LOGIC;
        enable : out  STD_LOGIC
	);
end prescaler;

architecture Behavioral of prescaler is
	signal count_1s : STD_LOGIC_VECTOR(width-1 downto 0);	
begin
	
	process(clock)
	begin
		if (clock'event and clock='1') then
			if (reset='1') then
				count_1s <= (others => '0');
				enable <= '0';
			else
				if count_1s = max_val - 1 then
					count_1s <= (others => '0');
					enable <= '1';
				else
					count_1s <= count_1s + 1;
					enable <= '0';
				end if;
			end if ;
		end if ;
	end process;

end Behavioral;

