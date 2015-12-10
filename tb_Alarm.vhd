LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;

ENTITY TEST IS
  
END TEST;

ARCHITECTURE tb_alarm of TEST is

    COMPONENT alarm PORT       (  REF_CLK   : IN        STD_LOGIC;
                                  RST       : IN        STD_LOGIC;
                                  GlB_UD    : IN        STD_LOGIC;
                                  ADIGIT0    : OUT       STD_LOGIC_VECTOR(3 downto 0);
                                  ADIGIT1    : OUT       STD_LOGIC_VECTOR(3 downto 0)
                
                                );
    END COMPONENT;

    
    SIGNAL t_CLK, t_RST, t_GLB_UD : STD_LOGIC :='0';
    SIGNAL t_ADIGIT0, t_ADIGIT1   : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    
    CONSTANT clk_int : time := 15 ns;  -- (1/33ns)/2
    
    BEGIN
      
                -- t_RST <= '1' after 15 ns;
        
                -- t_CLK <= not(t_CLK) after 15 ns;
                
                ALRM: alarm PORT MAP ( REF_CLK => t_CLK, RST => t_RST, GlB_UD => t_GlB_UD,  ADIGIT0 => t_ADIGIT0, ADIGIT1 => t_ADIGIT1);
                
                
          
          -----------------------------------------------------  
          t_GLB_UD <= '1';
                 
          tb: process
              begin
          
		            t_clk <= '0';
		            
		            wait for clk_int ;
    
          		    t_clk <= '1';

              		wait for clk_int ;
    
          
          end process; --tb
          
          stimuli: process
	             begin
                  t_RST <= '0';
                		wait for 100 ns;
		              t_RST <= '1'; 
                wait;
	end process;
          
-----------------------------------------------------
end tb_alarm;


