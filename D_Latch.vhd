library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity D_Latch is 

    port(   Din   :   IN std_logic;
            clk   :   IN std_logic;
            Dout  :   OUT std_logic
        );
        
end D_Latch;

ARCHITECTURE behaviour of D_Latch is
    begin
    process(clk, Din)
        begin
            if clk = '1' then 
                Dout <= Din;       
            end if;
    end process;

END behaviour;

