library IEEE;
use IEEE.std_logic_1164.all;

ENTITY reg is
  
      PORT (    Din :   IN      STD_LOGIC_VECTOR(3 downto 0);
                Dout:   OUT     STD_LOGIC_VECTOR(3 downto 0);
                clk :   IN      STD_LOGIC
            );
            
END reg;

ARCHITECTURE beh of reg is
    
    BEGIN      
      
    PROCESS (clk, Din)
      
        BEGIN
            
            IF (clk='1' and clk'event) THEN
                  Dout <= Din;
                  
            END IF;
          
    END PROCESS;
    
END beh;            
