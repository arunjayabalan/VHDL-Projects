library IEEE;
use IEEE.std_logic_1164.all;

ENTITY N_Register is
--    GENERIC(N:natural:= 4);
    
    PORT (  Din : IN STD_LOGIC_VECTOR(3 downto 0);
            clk : IN STD_LOGIC;
            RST : IN STD_LOGIC;
            Dout: OUT STD_LOGIC_VECTOR(3 downto 0)
          );
          
END N_Register;

ARCHITECTURE N_Reg of N_Register is
    BEGIN
        PROCESS (clk, Din, RST)
        BEGIN
            if RST = '1' THEN
                Dout <= (others => '0');
                
            elsif clk='1' and clk'event THEN
                Dout <= Din;
                
            END IF;
        END PROCESS;
END N_Reg;      
