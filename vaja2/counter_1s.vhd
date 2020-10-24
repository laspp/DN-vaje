library IEEE;
use IEEE. STD_LOGIC_1164. ALL;
use IEEE. STD_LOGIC_UNSIGNED. ALL;


entity counter_1s is
    Port ( clock : in  STD_LOGIC;
			     reset : in STD_LOGIC;
           data : out  STD_LOGIC_VECTOR(3 downto 0));
end counter;

architecture Behavioral of counter_1s is
	signal count : STD_LOGIC_VECTOR(3 downto 0);
	signal count_1s : STD_LOGIC_VECTOR(27 downto 0);
	signal enable : std_logic;
begin

	data <= count;
	
	process(clock)
	begin
		if (clock'event and clock='1') then
			if (reset='1') then
				count <= (others => '0');
			else
				if enable = '1' then
					count <= count + 1;
				else
					count <= count;
				end if;
			end if ;
		end if ;
	end process;

	process(clock)
	begin
		if (clock'event and clock='1') then
			if (reset='1') then
				count_1s <= (others => '0');
				enable <= '0';
			else
				if count_1s = X"5F5E0FF" then
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

