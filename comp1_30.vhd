library IEEE;
use IEEE.std_logic_1164.all;

entity exam1 is
		port(
				clk,reset:IN std_logic;
				A:IN std_logic_vector(3 downto 0);
				B:IN std_logic;
				product:OUT std_logic);

end exam1;

architecture behave of exam1 is

procedure full_adder(a,b,cin:IN std_logic;signal sum,cout:OUT std_logic) is
begin
sum<=a xor b xor cin;
cout<=(a and b) or (a and cin) or (b and cin);
end full_adder;

signal sum,carry:std_logic_vector(3 downto 0);

begin
process(clk)
begin
if rising_edge(clk) then
if (reset='1') then
carry<=(others=>'0');
sum<=(others=>'0');
else
full_adder('0',a(3) and b,carry(3),sum(3),carry(3));
for i in 2 downto 0 loop
full_adder(sum(i+1),a(i) and b,carry(i),sum(i),carry(i));
end loop;
end if;
end if;
end process;
product<=sum(0);
end behave;