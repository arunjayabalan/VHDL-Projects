library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY SR_Latch is
  PORT    ( S      :   IN      STD_LOGIC;
            R      :   IN      STD_LOGIC;
            QPrim  :   OUT     STD_LOGIC;
            Q      :   OUT     STD_LOGIC
          );
          
END SR_Latch;

ARCHITECTURE beh of SR_Latch is

  SIGNAL  qPrimInt:STD_LOGIC := '0';
  SIGNAL  qInt:STD_LOGIC := '0';      

BEGIN
    qInt        <=  S nand qPrimInt;
    qPrimInt    <=  R nand qInt;
    q           <=  qInt;
    qPrim       <=  qPrimInt;

END beh;    
