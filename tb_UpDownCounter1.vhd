LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_signed.ALL;

ENTITY TEST IS 

END TEST;

ARCHITECTURE TB_UpDownCounter1 of TEST is

    SIGNAL t_UP         : STD_LOGIC := '1';
    SIGNAL t_CLK, T_RST : STD_LOGIC := '0';
    SIGNAL T_OUT1       : STD_LOGIC := '0';
    SIGNAL T_OUT2       : STD_LOGIC_VECTOR(3 DOWNTO 0) := (others => '0');
    
    component updownV1 PORT  (
                                     UP    :   IN    STD_LOGIC;
                                     CLK   :   IN    STD_LOGIC;
                                     RST   :   IN    STD_LOGIC;
                                     OUT1  :   OUT   STD_LOGIC;
                                     OUT2  :   OUT   STD_LOGIC_VECTOR(3 DOWNTO 0)
              
                                );
                                
    END COMPONENT;                                
    BEGIN
        
          Counter1: updownV1 port  map (UP => t_UP, CLK => t_clk, RST => t_RST, OUT1 => t_OUT1, OUT2 => t_OUT2);
          
          t_RST <= '1' after 125 ns;
        
          t_CLK <= not(t_CLK) after 50 ns;
-----------------------------------------------------          
          tb: process
              begin
              t_UP <= transport '0' after 945 ns;
              t_UP <= transport '1' after 1825 ns;
              t_UP <= transport '0' after 2025 ns;
              wait;
          end process; --tb
-----------------------------------------------------
end;


          
          
        