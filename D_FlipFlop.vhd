library IEEE;
use IEEE.STD_LOGIC_1164.all;

ENTITY D_FlipFlop is
        PORT  ( Din : IN  STD_LOGIC;
                clk : IN  STD_LOGIC;
                Dout: OUT STD_LOGIC
                
              );
              
END ENTITY;


ARCHITECTURE D_FF OF D_FlipFlop is

BEGIN
    PROCESS(clk, Din)
          BEGIN
          --IF (clk='1' and clk'event) then 
          IF (clk='1' and RISING_EDGE(clk)) then
              Dout <= Din;
          END IF;
    END PROCESS;

END D_FF;