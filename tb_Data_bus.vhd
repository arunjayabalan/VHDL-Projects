library IEEE;
use IEEE.std_logic_1164.ALL;

ENTITY TEST IS 

END TEST;


ARCHITECTURE tb_Data_Bus of test is 

    COMPONENT Data_Bus port  (    Inp1  :   IN          STD_LOGIC_VECTOR(3 downto 0);
                                  Inp2  :   IN          STD_LOGIC_VECTOR(3 downto 0);
                                  clk   :   IN          STD_LOGIC;
                                  outp  :   OUT         STD_LOGIC_VECTOR(3 downto 0)
                      
                              );
                    
    END COMPONENT;

    SIGNAL Inpt1,Inpt2 ,outpt :STD_LOGIC_VECTOR(3 downto 0):="0000";
    SIGNAL clock : STD_LOGIC  := '0';
  
    BEGIN
          Inpt1 <= "0000", 
                   "1000" after 10 ns,
                   "1100" after 20 ns,
                   "0011" after 30 ns,
                   "1111" after 40 ns;
                  
          Inpt2 <=  "0000", 
                    "0011" after 10 ns,
                    "1100" after 20 ns,
                    "1000" after 30 ns,
                    "1111" after 40 ns;                  

          clock <= not(clock) after 5 ns;
          
          D1 : Data_Bus port map ( Inp1 => Inpt1, Inp2 => Inpt2, clk => clock, outp => outpt );
          
    END tb_Data_Bus;

                  
