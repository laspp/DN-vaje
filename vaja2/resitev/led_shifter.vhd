library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity led_shifter is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           direction : in  STD_LOGIC;
           turbo : in  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (15 downto 0));
end led_shifter;

architecture Behavioral of led_shifter is
	signal led_state : STD_LOGIC_VECTOR (15 downto 0);
	signal count_ps : STD_LOGIC_VECTOR(27 downto 0);	
	signal ps_limit : STD_LOGIC_VECTOR(27 downto 0);
	signal enable : std_logic;
begin
	led <= led_state;
	
	ps_limit <= X"5F5E0FF" when turbo = '0' else X"2FAF07F";
	
	process(clock)
	begin
		if (clock'event and clock='1') then
			if (reset='1') then
				led_state <= "0000000000001111";
			else
				if enable = '1' then
					if direction = '0' then
						led_state(15 downto 1) <= led_state(14 downto 0);
						led_state(0) <= led_state(15);
					else
						led_state(14 downto 0) <= led_state(15 downto 1);
						led_state(15) <= led_state(0);
					end if;
				else
					led_state <= led_state;
				end if;
			end if ;
		end if ;
	end process;

	process(clock)
	begin
		if (clock'event and clock='1') then
			if (reset='1') then
				count_ps <= (others => '0');
				enable <= '0';
			else
				if count_ps >= ps_limit then -- >= is used because if value is above 2FAF07F and we switch turbo on,
													  -- there is otherwise a slight delay (count_ps has to overflow)
					count_ps <= (others => '0');
					enable <= '1';
				else
					count_ps <= count_ps + 1;
					enable <= '0';
				end if;
			end if ;
		end if ;
	end process;

end Behavioral;

