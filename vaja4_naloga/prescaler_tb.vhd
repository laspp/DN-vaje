LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY prescaler_tb IS
END prescaler_tb;
 
ARCHITECTURE behavior OF prescaler_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT prescaler
	 Generic (  width : integer := 8;
					max_val : integer := 255
				);
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         enable : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal enable : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: prescaler 
		GENERIC MAP (
			width => 2,
			max_val => 4
		)
		PORT MAP (
          clock => clock,
          reset => reset,
          enable => enable
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		reset <= '1';
      -- hold reset state for 100 ns.
      wait for 40 ns;	
		reset <= '0';
		wait for 40 ns;
      wait for 250 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
