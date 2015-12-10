LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;

ENTITY alarm is
  
        PORT (  REF_CLK     :   IN        STD_LOGIC;
                RST         :   IN        STD_LOGIC;
                GLB_UD      :   IN        STD_LOGIC;
                ADIGIT0     :   OUT       STD_LOGIC_VECTOR(6 downto 0);
                ADIGIT1     :   OUT       STD_LOGIC_VECTOR(6 downto 0)
                
              );
              
END alarm;


ARCHITECTURE beh_alarm of alarm is      
      
      COMPONENT clkDivider PORT (   IN_CLK     :   IN      STD_LOGIC;
                                    RST        :   IN      STD_LOGIC;
                                    OUT_CLK    :   OUT     STD_LOGIC
                                );
                                
      END COMPONENT;                                 
                                
      COMPONENT updownV1 PORT  (  UP    :   IN    STD_LOGIC;
                                  CLK   :   IN    STD_LOGIC;
                                  RST   :   IN    STD_LOGIC;
                                  EN    :   IN    STD_LOGIC;
                                  OUT1  :   OUT   STD_LOGIC;
                                  OUT2  :   OUT   STD_LOGIC_VECTOR(3 DOWNTO 0)
                                );                                       
      END COMPONENT;              
      
      COMPONENT clk_Controller PORT ( DIGIT0   : IN   STD_LOGIC_VECTOR(3 downto 0);
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
                                    
      END COMPONENT;      
      
      COMPONENT SevenSegment PORT (  INP  : IN    STD_LOGIC_VECTOR(3 DOWNTO 0);
                                     OUP  : OUT   STD_LOGIC_VECTOR(6 downto 0)
                                  );                               
      END COMPONENT;
      
      SIGNAL   Ref_clk_out : STD_LOGIC:='0';
      SIGNAL   DIGIT0_T, DIGIT1_T : STD_LOGIC_VECTOR(3 downto 0):="0000";  
      SIGNAL   RST1_T,  EN1_T, UPD0_T, UPD1_T : STD_LOGIC;    
      SIGNAL   EN0_T,RST0_T :STD_LOGIC:= '0'; 
      SIGNAL   OUT0_T, OUT1_T : STD_LOGIC; 
      
      BEGIN             
        
      --UPD0_T <=   GLB_UD;
      
      --RST0_T <=   RST;
      
      --ADIGIT0 <= DIGIT0_T;
   
      --ADIGIT1 <= DIGIT1_T;
      
                    
      Ref1 : clkDivider PORT MAP ( IN_CLK => REF_CLK, RST => RST, OUT_CLK => Ref_clk_out );
      

      CNTR : clk_Controller PORT MAP ( DIGIT0  => DIGIT0_T ,   DIGIT1 => DIGIT1_T  , GLB_UP  => GLB_UD ,
                                       RESET0  => RST0_T   ,   RESET1 => RST1_T    , UpDown0 => UPD0_T, 
                                       UpDown1 => UPD1_T   ,   EN0    => EN0_T     , EN1     => EN1_T,
                                       RST => RST          ,   CLK    => Ref_clk_out
                                      );                   


      CNT1 : updownV1   PORT MAP ( UP => UPD0_T , CLK => Ref_clk_out , RST => RST0_T, EN => EN0_T , 
                                   OUT1=> OUT0_T, OUT2 => DIGIT0_T );
                                   
      CNT2 : updownV1   PORT MAP ( UP => UPD1_T , CLK => Ref_clk_out , RST => RST1_T, EN => EN1_T , 
                                   OUT1=> OUT1_T, OUT2 => DIGIT1_T );					
						
                                   
      DISP1: SevenSegment PORT MAP ( INP => DIGIT0_T, OUP => ADIGIT0);  
      
      DISP2: SevenSegment PORT MAP ( INP => DIGIT1_T, OUP => ADIGIT1);  
		

END beh_alarm;