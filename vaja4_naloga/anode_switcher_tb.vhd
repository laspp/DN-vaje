LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY anode_switcher_tb IS
END anode_switcher_tb;
 
ARCHITECTURE behavior OF anode_switcher_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT anode_switcher
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         enable : IN  std_logic;
         anode : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal enable : std_logic := '0';

 	--Outputs
   signal anode : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: anode_switcher PORT MAP (
          clock => clock,
          reset => reset,
          enable => enable,
          anode => anode
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
		enable <= '0';
		-- hold reset state for 100 ns.
      wait for 40 ns;	
		reset <= '0';
		wait for 0 ns;	
		enable <= '1';
      wait for 200 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
