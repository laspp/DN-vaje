library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uart_automata is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           start : in  STD_LOGIC;
           tx_clock : in  STD_LOGIC;
			  psc_reset : out  STD_LOGIC;
			  shr_enable : out  STD_LOGIC;
           write_data : out  STD_LOGIC);
end uart_automata;

architecture Behavioral of uart_automata is
	type state_type is ( RESET_ST , START_ST, B0 , B1 , B2, B3, B4, B5, B6, B7, STOP );
	signal state , next_state : state_type;

begin
	SYNC_PROC: process ( clock ) -- delovanje registra stanj 
	begin
		if (clock'event and clock = '1') then
			if ( reset = '1') then
				state <= RESET_ST;
			else
				state <= next_state;
			end if;
		end if;
	end process;

	NEXT_STATE_DECODE: process (state , tx_clock, start )
	begin
	
	next_state <= state; 	
	case ( state ) is
		when RESET_ST =>	
			if start = '1' then	next_state <= START_ST;
			else			next_state <= RESET_ST;
			end if;
		when START_ST =>	
			if tx_clock = '1' then		next_state <= B0;
			else			next_state <= START_ST;
			end if;
		when B0 =>	
			if tx_clock = '1' then		next_state <= B1;
			else			next_state <= B0;
			end if;
		when B1 =>	
			if tx_clock = '1' then		next_state <= B2;
			else			next_state <= B1;
			end if;
		when B2 =>	
			if tx_clock = '1' then		next_state <= B3;
			else			next_state <= B2;
			end if;
		when B3 =>	
			if tx_clock = '1' then		next_state <= B4;
			else			next_state <= B3;
			end if;
		when B4 =>	
			if tx_clock = '1' then		next_state <= B5;
			else			next_state <= B4;
			end if;
		when B5 =>	
			if tx_clock = '1' then		next_state <= B6;
			else			next_state <= B5;
			end if;
		when B6 =>	
			if tx_clock = '1' then		next_state <= B7;
			else			next_state <= B6;
			end if;
		when B7 =>	
			if tx_clock = '1' then		next_state <= STOP;
			else			next_state <= B7;
			end if;
		when STOP =>	
			if tx_clock = '1' then		next_state <= RESET_ST;
			else			next_state <= STOP;
			end if;
		when others =>			next_state <= RESET_ST;
				  end case;
	end process;
	
	OUTPUT_DECODE: process ( clock )
	begin
	
		if (clock'event and clock = '1') then
			if state = RESET_ST then
				if start = '1' then
					write_data <= '1';
					psc_reset <= '1';
					shr_enable <= '0';
				else
					write_data <= '0';
					shr_enable <= '0';
					psc_reset <= '0';
				end if;
			else 
				if tx_clock = '1' then
					write_data <= '0';
					psc_reset <= '0';
					shr_enable <= '1';
				else
					write_data <= '0';
					shr_enable <= '0';
					psc_reset <= '0';
				end if;
			end if;
		end if;		
	end process;

end Behavioral;


