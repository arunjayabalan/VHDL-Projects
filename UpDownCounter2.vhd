LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;

ENTITY updownV2 is
  
      PORT (  UP    :   IN    STD_LOGIC;
              CLK   :   IN    STD_LOGIC;
              RST   :   IN    STD_LOGIC;
              OUT1  :   OUT   STD_LOGIC;
              OUT2  :   OUT   STD_LOGIC_VECTOR(3 DOWNTO 0)        
            );
          
END updownV2;

ARCHITECTURE Arch_counter_sig2 of updownV2 is

    SIGNAL COUNT : STD_LOGIC_VECTOR(3 downto 0) ;
    
    BEGIN
      
        PROCESS(CLK,RST)
          
                BEGIN
                  
                      IF RST = '0' THEN
                        
                              COUNT <=    (others => '0');
                              OUT1  <=    '1';
                              OUT2  <=    (OTHERS => '0');
                              
                      ELSIF  CLK='1' and clk'EVENT THEN
                        
                              CASE up IS
                                      WHEN '1'      => COUNT <= COUNT + 1;
                                      WHEN  others  => COUNT <= COUNT - 1;
                                        
                              END  CASE;
                              
                              IF (up = '1' and COUNT = 15) or  (up = '0' and COUNT = "0") THEN
                                
                                      OUT1 <= '1';
                                      
                              ELSE    OUT1 <= '0';
                              
                            END IF;
                            
                            OUT2 <= COUNT;
                            
                      END IF;
                      
              END PROCESS;
              
              
END Arch_counter_sig2;              
                      
                     
  
                    