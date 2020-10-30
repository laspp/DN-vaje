----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:31:08 10/30/2020 
-- Design Name: 
-- Module Name:    top - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           data : out  STD_LOGIC_VECTOR (3 downto 0));
end top;

architecture Behavioral of top is
	component counter is
    Generic ( width : integer := 8); 
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           data : out  STD_LOGIC_VECTOR (width - 1 downto 0));
	end component;
	
	signal enable: STD_LOGIC;
begin

	cnt : counter
	generic map ( width => 16 )
   port map ( 
			clock => clock,
			reset => reset,
			enable => '1',
			data => data
		);


end Behavioral;

