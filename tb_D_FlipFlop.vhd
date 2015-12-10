library IEEE;
use IEEE.STD_LOGIC_1164.all;

ENTITY test is 

END;

ARCHITECTURE test_D_FlipFlop of test is

COMPONENT D_FlipFlop port (  Din : IN STD_LOGIC;
                             clk : IN STD_LOGIC;
                             Dout: OUT STD_LOGIC
                          );
END COMPONENT;

SIGNAL Datain, Dataout, clock : STD_LOGIC:='0';

BEGIN 
    
    
              
    D1: D_FlipFlop port map( Din => Datain,   clk => clock, Dout => Dataout);
    
    clock <= not(clock) after 20 ns; 
    --Datain <= not(Datain) after 10 ns;
    Datain <= '0',
              '1' after 15  ns,
              '0' after 65  ns,
              '1' after 70  ns,
              '0' after 75  ns,
              '1' after 125 ns;
              
      
END  test_D_FlipFlop;