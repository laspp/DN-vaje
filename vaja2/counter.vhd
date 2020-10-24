library IEEE;
use IEEE. STD_LOGIC_1164. ALL;
use IEEE. STD_LOGIC_UNSIGNED. ALL;

entity counter is
    Port ( clock : in  STD_LOGIC;
           reset : in STD_LOGIC;
           data : out  STD_LOGIC_VECTOR(3 downto 0));
end counter;

architecture Behavioral of counter is
	signal count : STD_LOGIC_VECTOR(3 downto 0);
	signal enable : std_logic;
begin

	data <= count;
	
	process(clock)
	begin
		if (clock'event and clock='1') then
			if (reset='1') then
				count <= (others => '0');
			else
				count <= count + 1;
			end if ;
		end if ;
	end process;

end Behavioral;

