library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Data_Bus is
  
      PORT (  Inp1  :   IN          STD_LOGIC_VECTOR(3 downto 0);
              Inp2  :   IN          STD_LOGIC_VECTOR(3 downto 0);
              clk   :   IN          STD_LOGIC;
				  EN1   :	IN				STD_LOGIC;
				  EN2	  :	IN				STD_LOGIC;
              outp  :   OUT         STD_LOGIC_VECTOR(3 downto 0)
           );
           
END Data_Bus;

ARCHITECTURE beh_DB of Data_Bus is

    COMPONENT reg port     (    Din :   IN      STD_LOGIC_VECTOR(3 downto 0);
                                Dout:   OUT     STD_LOGIC_VECTOR(3 downto 0);
                                clk :   IN      STD_LOGIC
                            );
  END COMPONENT;                          
             

    --SIGNAL DataBus  : wired_and STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL Data1    : STD_LOGIC_VECTOR(3 downto 0):="0000";
    SIGNAL Data2    : STD_LOGIC_VECTOR(3 downto 0):="0000";    
    SIGNAL clock    : STD_LOGIC := '0';
    BEGIN
        U1: reg port map ( Din => Inp1, Dout => Data1, clk => clk );
        U2: reg port map ( Din => Inp2, Dout => Data2, clk => clk );

       --outp <= Inp1;
       --outp <= Inp2;
		 --BEGIN
		
		 PROCESS(EN1, Data1)
			BEGIN
			if EN1='1' then
				outp <= Data1;
			else
				outp <= "ZZZZ";
			END IF;
		 END PROCESS;
		 
		 PROCESS(EN2, Data2)
		 BEGIN
			if EN2= '1' then
				outp <= Data2;  
			else
				outp <= "ZZZZ";
			END IF;
				
    END PROCESS;     
END beh_DB;



--END beh_DB;
          
