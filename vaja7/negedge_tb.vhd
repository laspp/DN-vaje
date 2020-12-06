LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY negedge_tb IS
END negedge_tb;
 
ARCHITECTURE behavior OF negedge_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT negedge
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         input : IN  std_logic;
         output : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal input : std_logic := '0';

 	--Outputs
   signal output : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: negedge PORT MAP (
          clk => clk,
          reset => reset,
          input => input,
          output => output
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		reset <= '1';
		
    wait for 100 ns;	
		reset <= '0';
		
		
		wait for 40 ns;	
		
		input <= '1';
		
		wait for 100 ns;	
		input <= '0';
		
		wait for 100 ns;	
		input <= '1';
		
		wait for 100 ns;	
		input <= '0';
		
		wait for 100 ns;	
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;