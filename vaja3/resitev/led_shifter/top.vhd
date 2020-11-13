library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity top is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           direction : in  STD_LOGIC;
           turbo : in  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (15 downto 0));
end top;

architecture Behavioral of top is
	
	component led_shifter is
    Generic ( width : integer := 16;
				  leds_on : integer := 4); 
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  enable : in  STD_LOGIC;
           direction : in  STD_LOGIC;		  
           led : out  STD_LOGIC_VECTOR (width - 1 downto 0));
	end component;
	
	component prescaler is
	 Generic ( width : integer := 8); 
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           enable : out  STD_LOGIC;
           limit : in  STD_LOGIC_VECTOR (width-1 downto 0));
	end component;
	
	signal ps_limit : STD_LOGIC_VECTOR(27 downto 0);
	signal enable : std_logic;
begin
	
	ps_limit <= X"5F5E0FF" when turbo = '0' else X"2FAF07F";
		
	ls: led_shifter
	generic map ( width => 16 )
   port map ( 
			clock => clock,
			reset => reset,
			enable => enable,
			direction => direction,
			led => led
		);
	
	ps : prescaler
	generic map ( width => 28 )
   port map ( 
			clock => clock,
			reset => reset,
			enable => enable,
			limit => ps_limit
		);


end Behavioral;

