LIBRARY IEEE;
USE IEEE.STD_LOGIC_SIGNED.ALL;
USE IEEE.STD_LOGIC_1164.ALL;


ENTITY clk_Controller is
  
        PORT ( 
        
               DIGIT0   : IN   STD_LOGIC_VECTOR(3 downto 0);
               DIGIT1   : IN   STD_LOGIC_VECTOR(3 downto 0);
               GLB_UP   : IN   STD_LOGIC;
               RST      : IN   STD_LOGIC;
               CLK      : IN   STD_LOGIC;
               RESET0   : OUT  STD_LOGIC;
               RESET1   : OUT  STD_LOGIC;
               UpDown0  : OUT  STD_LOGIC;
               UpDown1  : OUT  STD_LOGIC;
               EN0      : OUT  STD_LOGIC;
               EN1      : OUT  STD_LOGIC
               
              );
              
END clk_controller;


ARCHITECTURE beh_clk_controller of clk_controller is

BEGIN
      
          PROCESS(RST, CLK)
            
                  BEGIN
                        
                              IF RST = '0' THEN
                                
                                  RESET0  <= '0';
                                  RESET1  <= '0';
                                  --EN0     <= '0';
                                  --EN1     <= '0';
										
                              ELSIF (CLK = '1' and CLK'EVENT) THEN
                                    
                                    IF GLB_UP = '1' THEN
                             
                                          UpDown0  <= '1';
                                          UpDown1  <= '1';
                                          RESET1   <= '1';
                                          RESET0   <= '1';
                                          EN0      <= '1';
                                    
                                          IF DIGIT0 = 8 THEN
                                      
                                              RESET0  <= '0';
                                              EN1     <= '1';
															
                                                                       
                                          ELSE
                                      
															 RESET0    <= '1';
															 EN1       <= '0';													  
                                        
                                          END IF;
                                          
                                          IF DIGIT0 = 8 and ( DIGIT1 = 5) THEN
                                     
                                                -- RESET0  <= '0';
                                                -- RESET1  <= '0';
                                                -- EN0     <= '0';
                                                -- EN1     <= '0';
																--D_OUT0 	<= "0000";
																--D_OUT1	<= "0000";
                                                
                                        END IF;
                                    
                                      ELSIF GLB_UP = '0' THEN

                                          UpDown0  <=   '0';
                                          UpDown1  <=   '0';                              
                                          RESET1   <= '1';
                                          RESET0   <= '1';
                                          EN0      <= '1';
											--			EN1		<= '1';
														
														IF DIGIT0 = 0 and ( DIGIT1 = 0) THEN
														
                                    
																
                                          END IF;
                                    
                                          IF DIGIT0 = 1 THEN
                                      
                                              --RESET0 <= '0';
                                              EN1    <= '1';
                                      
                                          ELSE
                                      
                                              --RESET0 <= '1';
                                              EN1    <= '0'; 
                                    
                                          END IF;
                                          
														
                                         
                                          
                                   
                                  
                                    
                              END IF;     -- GLOBAL UP DOWN
                              
                    END IF;     -- DIGIT 0 CHANGES
                    
              END PROCESS;
              
END   beh_clk_controller;           