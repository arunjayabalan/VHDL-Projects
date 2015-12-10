LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;

ENTITY TEST IS
  
END TEST;

ARCHITECTURE tb_ClockDivider of TEST is

    COMPONENT clkDivider PORT ( 
                              
                                  IN_CLK     :   IN      STD_LOGIC;
                                  RST        :   IN      STD_LOGIC;
                                  OUT_CLK    :   OUT     STD_LOGIC
                               );
    END COMPONENT;

    SIGNAL t_CLK, t_RST, t_out : STD_LOGIC :='0';
    
    CONSTANT clk_int : time := 15 ns;  -- (1/33ns)/2
    
    BEGIN
      
                -- t_RST <= '1' after 15 ns;
        
                -- t_CLK <= not(t_CLK) after 15 ns;
                
                Div1: clkDivider PORT MAP ( IN_CLK => t_CLK, RST => t_RST, OUT_CLK => t_out);
          
          -----------------------------------------------------          
          tb: process
              begin
          
		            t_clk <= '0';
		            
		            wait for clk_int ;
    
          		    t_clk <= '1';

              		wait for clk_int ;
    
          
          end process; --tb
          
          stimuli: process
	             begin
                  t_RST <= '0';
                		wait for 100 ns;
		              t_RST <= '1'; 
                wait;
	end process;
          
-----------------------------------------------------
end tb_ClockDivider;

