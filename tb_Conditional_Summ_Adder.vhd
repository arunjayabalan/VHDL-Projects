
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--this is how entity for your test bench code has to be declared.
entity tb_csa is
end tb_csa;

architecture behavior of testbench is
--signal declarations.
signal A,B, sum : std_logic_vector(7 downto 0) :=(others => '0');
signal cin, co :  std_logic:='0';


begin
--entity instantiation
UUT : entity work.ConditonalSumAdder8Bits port map(A,B,Cin,sum,co);
--definition of simulation process
tb : process

begin
A<="11110010";  --num1 =2
B<="11111001";  --num2 =9
wait for 2 ns;

A<="10001010";  --num1 =10
B<="01100011";   --num2 =3
wait for 2 ns;

--more input combinations can be given here.
wait;
end process tb;

end;
