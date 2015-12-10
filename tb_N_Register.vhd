library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


ENTITY tb_N_Register is 

END tb_N_Register;

ARCHITECTURE beh of tb_N_Register is

COMPONENT N_Register port (  Din : IN STD_LOGIC_VECTOR(3 downto 0);
                             clk : IN STD_LOGIC;
                             RST : IN STD_LOGIC;
                             Dout: OUT STD_LOGIC_VECTOR(3 downto 0)
                             
                          );
END COMPONENT;

SIGNAL Datain, Dataout: STD_LOGIC_VECTOR(3 downto 0):= "0000";
SIGNAL Reset, clock: STD_LOGIC:='0';

BEGIN 
    
    
              
    D1: N_Register port map( Din => Datain, clk => clock, RST => Reset, Dout => Dataout);
    clock <= '1';
    Reset <= '0';
    clock <= not(clock) after 20 ns;
    Reset <= not(Reset) after 50 ns; 
    Datain <= "0000",
              "0010" after 15  ns,
              "0100" after 65  ns,
              "1000" after 70  ns,
              "1010" after 75  ns,
              "1111" after 125 ns;
  
  
  
END beh;
