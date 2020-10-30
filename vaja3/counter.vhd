----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:31:45 10/30/2020 
-- Design Name: 
-- Module Name:    counter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
    Generic ( width : integer := 8); 
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           data : out  STD_LOGIC_VECTOR (width - 1 downto 0));
end counter;

architecture Behavioral of counter is
	signal count : STD_LOGIC_VECTOR(width - 1 downto 0);
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

end Behavioral;

