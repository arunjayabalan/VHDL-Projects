library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_SIGNED.ALL;

ENTITY updownV1 IS
  
      PORT (  UP    :   IN    STD_LOGIC;
              CLK   :   IN    STD_LOGIC;
              RST   :   IN    STD_LOGIC;
              EN    :   IN    STD_LOGIC;
              OUT1  :   OUT   STD_LOGIC;
              OUT2  :   OUT   STD_LOGIC_VECTOR(3 DOWNTO 0)
            );
          
END updownV1;

        
ARCHITECTURE Arch_counter_sig of updownV1 is

      SIGNAL  COUNT   : STD_LOGIC_VECTOR(3 downto 0);
      BEGIN
      PROCESS(CLK, RST)
          BEGIN
        
          IF RST='0' and (CLK='1' and CLK'EVENT) THEN
              COUNT <= (OTHERS => '0');
				  
				  
              
          ELSIF CLK = '1' and CLK'EVENT THEN
            
              IF  EN='1' THEN
              
                  case UP is
                      when '1'      =>     COUNT <= COUNT + 1;
                      when  others  =>     COUNT <= COUNT - 1;
							 IF COUNT > 9 THEN
								 COUNT <= "0000";
							 END IF;
                        
                  END CASE;
						
						--IF UP = '0' and COUNT = 0 THEN
						--	COUNT <= "00111100";
						--END IF;
              
              END IF;  --EN=1
              
        END IF; -- RST and ELSE IF
            
    END PROCESS;
        
    OUT1 <= '1' when ( UP='1' and COUNT=15) or (UP='0' and COUNT=0)  else  '0';
    
    OUT2 <= COUNT;
    
                
    --END IF;
        
    
    
    
END   Arch_counter_sig;

