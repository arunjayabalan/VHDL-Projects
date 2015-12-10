library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY CarrySelectAdder is
  
  PORT( A   : IN STD_LOGIC_VECTOR(7 downto 0);
        B   : IN STD_LOGIC_VECTOR(7 downto 0);
        c   : IN STD_LOGIC;
        Sum : OUT STD_LOGIC_VECTOR(7 downto 0);
        Co  : OUT STD_LOGIC);
    
END CarrySelectAdder;


ARCHITECTURE behave of  CarrySelectAdder is

SIGNAL SUM3TO0, SUM4to7_C0, SUM4to7_C1 : STD_LOGIC_VECTOR(3 downto 0);
SIGNAL A3TO0, A4to7, B4to7, B3to0 : STD_LOGIC_VECTOR(3 downto 0);
SIGNAL Carry_Select, Cout_0, Cout_1 : STD_LOGIC;

COMPONENT CarryLookAhead
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           c_in : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (3 downto 0);
           c_out : out  STD_LOGIC);
end COMPONENT;

BEGIN
    A3TO0 <= A(3 downto 0);
    B3TO0 <= B(3 downto 0);
 
    C1: CarryLookAhead port map (a=>A3TO0 ,b=>B3TO0 , c_in=>C , sum=>SUM3TO0, c_out=>CARRY_SELECT); 
    C2: CarryLookAhead port map ( A(7 downto 4), B(7 downto 4),'0', SUM4TO7_C0, Cout_0);
    C3: CarryLookAhead port map ( A(7 downto 4), B(7 downto 4),'1', SUM4TO7_C1, Cout_1);
    
    
    SUM <= (SUM4TO7_C0&SUM3TO0) WHEN CARRY_SELECT='0' ELSE (SUM4TO7_C1&SUM3TO0);
    CO <= Cout_1 WHEN CARRY_SELECT='1' ELSE COUT_0;
    
END BEHAVE;    
  
    
  
      
