library ieee;
use ieee.std_logic_1164.all;

ARCHITECTURE testFullAdder OF test IS
COMPONENT Full_Adder
PORT (
A: IN BIT;
B: IN BIT;
Cin: IN BIT;
Sum: OUT BIT;
Cout: OUT BIT);
 END COMPONENT;
 
SIGNAL testvector: BIT_VECTOR(2 downto 0);
SIGNAL Sresult : BIT;
SIGNAL Cresult : BIT;
BEGIN
C1:Full_Adder PORT MAP(A => testvector(2), B => testvector(1), Cin => testvector(0)
, Sum => Sresult, Cout => Cresult);
testvector <="000",
"001" AFTER 10 ns,
"010" AFTER 20 ns,
"011" AFTER 30 ns,
"100" AFTER 40 ns,
"101" AFTER 50 ns,
"110" AFTER 60 ns,
"111" AFTER 70 ns;

END testFullAdder;