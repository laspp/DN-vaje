library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_register is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           data_out : out  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (7 downto 0);
           write_data : in  STD_LOGIC;
           enable : in  STD_LOGIC);
end shift_register;

architecture Behavioral of shift_register is
	signal data : STD_LOGIC_VECTOR(9 downto 0);
begin

	process(clock)
	begin
		if (clock'event and clock='1') then
			if (reset='1') then
				data <= (others => '0');
			else
				if write_data = '1' then
					data(8 downto 1) <= data_in;
					data(0) <= '0';
					data(9) <= '1';
				elsif enable = '1' then
					data(8 downto 0) <= data(9 downto 1);
					data(9) <= '0';
					data_out <= data(0);
				else
					data <= data;
				end if;
			end if ;
		end if ;
	end process;

end Behavioral;

