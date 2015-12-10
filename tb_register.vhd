library IEEE;
use IEEE.std_logic_1164.ALL;

ENTITY TEST IS 

END TEST;


ARCHITECTURE tb_register of test is 

    COMPONENT reg port  (    Din :   IN      STD_LOGIC_VECTOR(3 downto 0);
                             Dout:   OUT     STD_LOGIC_VECTOR(3 downto 0);
                             clk :   IN      STD_LOGIC
                        );
                    
    END COMPONENT;

    SIGNAL Inp ,outp :STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL clock : STD_LOGIC := '0';
  
    BEGIN
          Inp <=  "0000", 
                  "1000" after 10 ns,
                  "1100" after 20 ns,
                  "0011" after 30 ns,
                  "1111" after 40 ns;
          clock <= not(clock) after 5 ns;
          
          D1 : reg port map ( Din => Inp, clk => clock, Dout => outp );
          
    END tb_register;

                  