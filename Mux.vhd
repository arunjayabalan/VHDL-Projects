LIBRARY ieee;
use ieee.std_logic_1164.all;

ENTITY Mux is
  port( A  : IN BIT;
        B  : IN BIT;
        S0 : IN BIT;
        Y  : OUT BIT
        );
END Mux;

--ARCHITECTURE dataflow of Mux is
--begin
--    process(A,B,S0)
--        begin
          --  case S0 is
          --    when '1' => Y <= B;
          --    when '0' => Y <= A;
          --  end case; 
--          if S0 = '1' then
--              Y <= A;
--          else
--              Y <= B;
--         end if;

--    end process;


--END dataflow;

ARCHITECTURE behavioural of Mux is
component nandgate port(A: IN bit;
                        B: IN bit;
                        Q: OUT bit);
                        
end component; 
     
signal Z_prim_2: bit;
signal Z_prim_1,S_inv: bit;

begin
    N1: nandgate port map ( A => A,        B => S0,      Q => Z_prim_2 );
    N2: nandgate port map ( A => S0,       B => S0,      Q => S_inv    );
    N3: nandgate port map ( A => S_inv,    B => B,       Q => Z_prim_1 );
    N4: nandgate port map ( A => Z_prim_2, B => Z_prim_1,Q => Y        ); 
    

end behavioural;
  
