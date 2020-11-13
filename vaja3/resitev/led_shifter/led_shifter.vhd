library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity led_shifter is
	Generic ( width : integer := 16;
				  leds_on : integer := 4); 
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  enable : in  STD_LOGIC;
           direction : in  STD_LOGIC;		  
           led : out  STD_LOGIC_VECTOR (width - 1 downto 0));
end led_shifter;

architecture Behavioral of led_shifter is
	signal led_state : STD_LOGIC_VECTOR (width - 1 downto 0);
begin

	led <= led_state;
	
	process(clock)
	begin
		if (clock'event and clock='1') then
			if (reset='1') then
				led_state(width - 1 downto leds_on) <= (others => '0');
				led_state(leds_on - 1 downto 0) <= (others => '1');
			else
				if enable = '1' then
					if direction = '0' then
						led_state(width - 1 downto 1) <= led_state(width - 2 downto 0);
						led_state(0) <= led_state(width-1);
					else
						led_state(width - 2 downto 0) <= led_state(width - 1 downto 1);
						led_state(width - 1) <= led_state(0);
					end if;
				else
					led_state <= led_state;
				end if;
			end if ;
		end if ;
	end process;
	
end Behavioral;

