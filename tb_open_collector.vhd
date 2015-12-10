LIBRARY IEEE;
LIBRARY WORK;
USE IEEE.STD_LOGIC_1164.ALL;
USE WORK.opc5.ALL;

ENTITY test is
END test;

ARCHITECTURE test_opc5 of test is

      SIGNAL clk1, clk2 :STD_LOGIC := '0';
      SIGNAL a, b : opc5_logic;
      SIGNAL bus_wire : opc5r_logic; 
    
      BEGIN
          PROCESS
              BEGIN
                  FOR i IN opc5_logic LOOP
                      a<=i;
                      bus_wire<=i;
                      WAIT ON clk1 UNTIL clk1='1';
                  END LOOP;
          END PROCESS;


          PROCESS
              BEGIN
                  FOR j IN opc5_logic LOOP
                      b<=j;
                      bus_wire<=j;
                      WAIT ON clk2 UNTIL clk2='1';
                  END LOOP;
          END PROCESS;
      
      clk1<=NOT(clk1) AFTER  10 ns;
      
      clk2<=NOT(clk2) AFTER 50 ns;

END test_opc5;