library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

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
	
	component prescaler is
	 Generic ( width : integer := 8); 
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           enable : out  STD_LOGIC;
           limit : in  STD_LOGIC_VECTOR (width-1 downto 0));
	end component;
	
	signal enable: STD_LOGIC;
begin

	cnt : counter
	generic map ( width => 4 )
   port map ( 
			clock => clock,
			reset => reset,
			enable => enable,
			data => data
		);
	
	ps : prescaler
	generic map ( width => 28 )
   port map ( 
			clock => clock,
			reset => reset,
			enable => enable,
			limit => X"5F5E0FF"
		);

end Behavioral;

