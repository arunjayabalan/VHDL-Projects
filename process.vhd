library IEEE;
use IEEE.STD_LOGIC_1164.all;

ENtity HA is
  port ( A, B : IN bit;
         S, C : OUT bit);
         
End HA;


architecture beh of HA is

  begin
    process
      begin
        S <= A;
        C <= B;        
  End Process;
end beh;