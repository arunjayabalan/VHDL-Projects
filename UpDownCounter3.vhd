library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_SIGNED.ALL;

ENTITY updownV3 IS
  
      PORT (  UP    :   IN    STD_LOGIC;
              CLK   :   IN    STD_LOGIC;
              RST   :   IN    STD_LOGIC;
              OUT1  :   OUT   STD_LOGIC;
              OUT2  :   OUT   STD_LOGIC_VECTOR(3 DOWNTO 0)
              
            );
          
END updownV3;

        
ARCHITECTURE Arch_counter_sig3 of updownV3 is

        
        
        BEGIN
          
            PROCESS(CLK, RST)
                
                  VARIABLE COUNT : STD_LOGIC_VECTOR(3 downto 0);
              
                  BEGIN
                        
                        IF RST='0' THEN
                              
                              COUNT := (others => '0');
                              OUT1 <= '0';
                              OUT2 <= (others => '0');
                      
                        ELSIF clk='1' and CLK'EVENT THEN
                              
                              case UP is
                                
                                    WHEN '1'      =>  COUNT := COUNT + 1 ;
                                    WHEN OTHERS   =>  COUNT := COUNT - 1 ;
                                      
                               END CASE;
                               
                               IF ( UP = '1' and COUNT=15 ) or (UP = '0' and COUNT=0) THEN
                                 
                                    OUT1 <= '1';
                                    
                                ELSE
                                  
                                    OUT1 <= '0';
                                    
                                END IF;
                                
                                OUT2 <= COUNT ;
                                
                        END IF;
                        
                  END PROCESS;
                  
                  
END Arch_counter_sig3;                 