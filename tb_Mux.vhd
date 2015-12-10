library ieee;
use ieee.std_logic_1164.all;

entity tb_mux is
end tb_mux;


architecture test_mux of tb_mux is

component Mux port(  A  :  in bit;
                B  :  in bit;
                S0 :  in bit;
                Y  :  out bit
              );
end component;
 
SIGNAL testvector: BIT_VECTOR(2 downto 0);
SIGNAL Sel : BIT;
SIGNAL Yout : BIT;
           
begin
  
  M1: Mux port map (     A  => testvector(2), B => testvector(1),
                         S0 => testvector(0), Y => Yout);
  
  
testvector <="000",
"001" AFTER 10 ns,
"010" AFTER 20 ns,
"011" AFTER 30 ns,
"100" AFTER 40 ns,
"101" AFTER 50 ns,
"110" AFTER 60 ns,
"111" AFTER 70 ns;
  
end test_mux;