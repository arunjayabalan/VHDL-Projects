library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

PACKAGE opc5 is
  
    TYPE opc5_logic IS (  'X', -- Forcing Unknown, (Ri=10 Ohm, VOL<Vi<VOH)
                          '0', -- Forcing 0, (Ri=10 Ohm, Vi<VOL )
                          '1', -- Forcing 1, (Ri=10 Ohm, VOH<Vi )
                          'Z', -- High Impedance, (Ri=10 MOhm, Vi )
                          'H' -- Weak 1, (Ri=10 kOhm, VOH<Vi )
                        );
    
    TYPE opc5_logic_vector is ARRAY (NATURAL range <> ) of opc5_logic;                      

    FUNCTION resolved_opc5  ( s : opc5_logic_vector ) RETURN opc5_logic;

    FUNCTION "xor" ( l : opc5_logic; r: opc5_logic ) RETURN opc5_logic;
    
    FUNCTION "xnor" ( l : opc5_logic; r: opc5_logic ) RETURN opc5_logic;
--    FUNCTION "xor" ( l : opc5_logic; r : opc5_logic ) RETURN opc5_logic IS
    
    
    SUBTYPE opc5r_logic is resolved_opc5 opc5_logic;
    
    --TYPE opc5r_logic_vector is ARRAY (NATURAL range <> ) of opc5r_logic;
    
    
END opc5;
 
    
PACKAGE body opc5 is


TYPE opc5_table IS ARRAY (opc5_logic, opc5_logic ) of opc5_logic;

  CONSTANT resolution_table : opc5_table := (
    
    --    --------------------------------------------------------
    --    |   'X'     '0'     '1'     'Z'     'H'          |     |
    --    --------------------------------------------------------
          (   'X',    '0',    'X',    'X',    'X'     ), --| 'X' |
          (   '0',    '0',    '0',    '0',    '0'     ), --| '0' |                
          (   'X',    '0',    '1',    '1',    '1'     ), --| '1' |
          (   'X',    '0',    '1',    'Z',    'H'     ), --| 'Z' |
          (   'X',    '0',    '1',    'H',    'H'     ) -- | 'H' |
      );
  CONSTANT xor_table : opc5_table := (
    
    --    --------------------------------------------------------
    --    |   'X'     '0'     '1'     'Z'     'H'          |     |
    --    --------------------------------------------------------
          (   'X',    'X',    'X',    'X',    'X'     ), --| 'X' |
          (   'X',    '0',    '1',    'X',    '1'     ), --| '0' |                
          (   'X',    '1',    '0',    'X',    '0'     ), --| '1' |
          (   'X',    'X',    'X',    'X',    'X'     ), --| 'Z' |
          (   'X',    '1',    '0',    'X',    '0'     ) -- | 'H' |
      );
      
  CONSTANT xnor_table : opc5_table := (
     
    --    --------------------------------------------------------
    --    |   'X'     '0'     '1'     'Z'     'H'          |     |
    --    --------------------------------------------------------
          (   'X',    'X',    'X',    'X',    'X'     ), --| 'X' |
          (   'X',    '1',    '0',    'X',    '0'     ), --| '0' |                
          (   'X',    '0',    '1',    'X',    '1'     ), --| '1' |
          (   'X',    'X',    'X',    'X',    'X'     ), --| 'Z' |
          (   'X',    '0',    '1',    'X',    '1'     ) -- | 'H' |
      );
      
    FUNCTION resolved_opc5 ( s: opc5_logic_vector )RETURN opc5_logic is
    
              VARIABLE result :opc5_logic;
         BEGIN     
              IF (s'LENGTH = 1 ) THEN RETURN s(s'LOW);
              --IF (s'LENGTH = 1) THEN    RETURN s(s'LOW);
              
              ELSE   
                  result := 'Z';
                  FOR i IN  s'RANGE LOOP
                      result := resolution_table(result, s(i));
                END LOOP;
            END IF;
        RETURN result;
            
    END resolved_opc5 ;
    
    
    FUNCTION "xor" ( l : opc5_logic; r : opc5_logic ) RETURN opc5_logic IS
    
    BEGIN
      
        RETURN (xor_table(l, r));

    END "xor";
    
    FUNCTION "xnor" ( l : opc5_logic; r : opc5_logic ) RETURN opc5_logic IS
    
    BEGIN
      
       -- RETURN (not(xor_table(l, r)));
        RETURN (xnor_table(l, r));

    END "xnor";
    
END opc5;