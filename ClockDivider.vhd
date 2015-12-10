LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;

ENTITY clkDivider is
  
        PORT ( IN_CLK     :   IN      STD_LOGIC;
               RST        :   IN      STD_LOGIC;
               OUT_CLK    :   OUT     STD_LOGIC
              );
              
END clkDivider;

ARCHITECTURE beh_clkDivider of  clkDivider is

        --CONSTANT MAX_COUNT : INTEGER := 33000000;
        SIGNAL TEMP : STD_LOGIC := '0';
        SIGNAL COUNT : INTEGER range 0 to 16500000;
        
        BEGIN
        
            PROCESS(RST, IN_CLK)
              
              --    VARIABLE COUNT : INTEGER range 0 to 16500000;
            
                  BEGIN
                  
                      IF RST = '0' THEN
                        
                            COUNT <= 0;
                            TEMP <= '0';
                            
                      ELSIF IN_CLK='1' and IN_CLK'EVENT THEN
                        
                            IF (COUNT = 16499999) THEN
                            --IF (COUNT = 16) THEN
                              
                                  TEMP <= not(TEMP);
                                  COUNT <= 0;
                                  
                            ELSE 
                                  COUNT <= COUNT + 1 ;  
                                                                    
                          END IF;
                          
                    END IF;
                    
          END PROCESS;
          
          OUT_CLK <= TEMP;
          
END;                        
