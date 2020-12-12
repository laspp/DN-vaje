library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
   Port (
		clock : in  STD_LOGIC;
		reset : in  STD_LOGIC;
		start : in  STD_LOGIC;
      tx : out  STD_LOGIC
	);
end top;

architecture Behavioral of top is
	component uart_automata is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           start : in  STD_LOGIC;
           tx_clock : in  STD_LOGIC;
			  psc_reset : out  STD_LOGIC;
			  shr_enable : out  STD_LOGIC;
           write_data : out  STD_LOGIC);
	end component;
	
	component shift_register is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           data_out : out  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (7 downto 0);
           write_data : in  STD_LOGIC;
           enable : in  STD_LOGIC);
	end component;
	
	component prescaler is
	 Generic (
		width : integer := 8;
		max_val : integer := 255
	 );
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           enable : out  STD_LOGIC
	 );
	end component;
	
	signal tx_clock: STD_LOGIC;
	signal psc_reset: STD_LOGIC;
	signal shr_enable: STD_LOGIC;
	signal write_data: STD_LOGIC;
begin
	u: uart_automata 
	port map ( 
		clock => clock, 
		reset => reset,
		start => start,
		tx_clock => tx_clock,
		psc_reset => psc_reset,
		shr_enable => shr_enable,
		write_data => write_data
	);

	sh : shift_register
   port map ( 
		clock => clock,
		reset => reset,
		enable => shr_enable,
		data_out => tx,
		write_data => write_data,
		data_in => "01100001"
	);

	ps : prescaler
	generic map ( 
		width => 14,
		max_val => 10416 -- 100 000 000 / 9600 = 10416
	)
   port map ( 
		clock => clock,
		reset => psc_reset,
		enable => tx_clock
	);
end Behavioral;

