library ieee;
use ieee.std_logic_1164.all;

entity addsub is
    port (  in1     : in     std_logic_vector(3 downto 0);
            in2     : in     std_logic_vector(3 downto 0);
            AddSub  : in     std_logic;
            SumBrr  : out    std_logic_vector(3 downto 0);
            carry   : out    std_logic
          );
end addsub;

architecture behaviour of addsub is

component Full_Adder port(  a    : in   std_logic;
                            b    : in   std_logic;
                            cin  : in   std_logic;
                            sum  : out  std_logic;
                            cout : out  std_logic
                          );
end component;                        

signal Sint,Cint: std_logic_vector(3 downto 0);

begin
  
    A0: Full_Adder port map (   a => in1(0), b => in2(0), cin => AddSub,  sum => Sint(0), cout => Cint(0) );
    A1: Full_Adder port map (   a => in1(1), b => in2(1), cin => Cint(0), sum => Sint(1), cout => Cint(1) );
    A2: Full_Adder port map (   a => in1(2), b => in2(2), cin => Cint(1), sum => Sint(2), cout => Cint(2) );
    A3: Full_Adder port map (   a => in1(3), b => in2(3), cin => Cint(2), sum => Sint(3), cout => Cint(3) );

end behaviour;