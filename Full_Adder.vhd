library ieee;
use ieee.std_logic_1164.all;

ENTITY Full_Adder is
  port( a    : in std_logic;
        b    : in std_logic;
        cin  : in std_logic;
        sum  : out std_logic;
        cout : out std_logic);
END Full_Adder;

ARCHITECTURE dataflow of Full_Adder is
BEGIN
  sum  <= a xor b xor cin;
  cout <= (a and b) or (b and cin) or (cin and a);
END dataflow;
 