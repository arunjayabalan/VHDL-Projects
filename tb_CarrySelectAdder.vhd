LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY CarrySelectAdder_tb IS
END CarrySelectAdder_tb;
 
ARCHITECTURE behavior OF CarrySelectAdder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CarrySelectAdder
       PORT( A   : IN STD_LOGIC_VECTOR(7 downto 0);
        B   : IN STD_LOGIC_VECTOR(7 downto 0);
        c   : IN STD_LOGIC;
        Sum : OUT STD_LOGIC_VECTOR(7 downto 0);
        Co  : OUT STD_LOGIC);
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(7 downto 0) := (others => '0');
   signal b : std_logic_vector(7 downto 0) := (others => '0');
   signal c_in : std_logic := '0';

 	--Outputs
   signal sum : std_logic_vector(7 downto 0);
   signal c_out : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CarrySelectAdder PORT MAP (
          a => a,
          b => b,
          c => c_in,
          sum => sum,
          co => c_out
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		a <= "11111111";
		b <= "10000001";
		c_in <= '1';
		
		wait for 100 ns;
		
		a <= "00000011";
		b <= "11111110";
		c_in <= '0';
      
		wait for 100 ns;
		
		a <= "00111100";
		b <= "00011001";
		c_in <= '0';

      -- insert stimulus here 

      wait;
   end process;

END;

