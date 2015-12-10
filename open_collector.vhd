LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
LIBRARY WORK;
USE WORK.opc5.ALL;


ENTITY open_collector is
  
        PORT (  A     :   IN    opc5_logic;
                B     :   IN    opc5_logic;
                Y     :   OUT   opc5_logic;
                clk1  :   IN    STD_LOGIC;
                clk2  :   IN    STD_LOGIC
                
              );
      
END open_collector;

ARCHITECTURE beh of open_collector is

       SIGNAL bus_wire : resolved opc5r_logic;
    BEGIN    
    PROCESS(clk1, clk2)
      
        BEGIN
          IF (clk1='1' and clk1'event) then 
              bus_wire <= A;
          ELSIF (clk2='1' and clk2'event) then 
              bus_wire <= B;
          
          Y <= bus_wire;
          
      END IF;
        
    END PROCESS;

END beh;
           