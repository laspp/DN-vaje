LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY value_to_digit_tb IS
END value_to_digit_tb;
 
ARCHITECTURE behavior OF value_to_digit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT value_to_digit
    PORT(
         value : IN  std_logic_vector(15 downto 0);
         anode : IN  std_logic_vector(3 downto 0);
         digit : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal value : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal anode : std_logic_vector(3 downto 0);
   signal digit : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: value_to_digit PORT MAP (
          value => value,
          anode => anode,
          digit => digit
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      value <= X"FA72";
		anode <= "1110";
      wait for 50 ns;	
		anode <= "1110";
      wait for 50 ns;	
		anode <= "1101";
      wait for 50 ns;	
		anode <= "1011";
      wait for 50 ns;	
		anode <= "0111";
      wait for 50 ns;
		anode <= "1111";
      wait for 50 ns;	
		anode <= "1110";
      wait for 50 ns;	
		anode <= "1101";
      wait for 50 ns;	
		anode <= "1011";
      wait for 50 ns;	
		anode <= "0111";
      wait for 50 ns;	


      -- insert stimulus here 

      wait;
   end process;

END;
