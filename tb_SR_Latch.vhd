LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY test IS END test;

ARCHITECTURE test_SRLatch_1 of test IS
    COMPONENT SR_Latch
                      PORT (
                                s     :   IN STD_LOGIC;
                                r     :   IN STD_LOGIC;
                                qPrim :   OUT STD_LOGIC;
                                q     :   OUT STD_LOGIC
                                
                            );

  END COMPONENT;

      SIGNAL q,qPrim: STD_LOGIC := '0';
      SIGNAL testvector:std_logic_vector(1 downto 0):="10";

  BEGIN
      testvector <= "10",
      "11" AFTER 5  ns,
      "01" AFTER 10 ns,
      "11" AFTER 15 ns,
      "10" AFTER 20 ns,
      "11" AFTER 25 ns,
      "00" AFTER 30 ns; 
      T1:SR_Latch PORT MAP(testvector(1), testvector(0),qPrim,q);


END test_SRLatch_1;

