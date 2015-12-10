library ieee;
use ieee.std_logic_1164.all;

entity tb_AddSub is

end entity;

architecture behaviour of tb_AddSub is

component addsub port  (  in1     : in     std_logic_vector(3 downto 0);
                          in2     : in     std_logic_vector(3 downto 0);
                          AddSub  : in     std_logic;
                          SumBrr  : out    std_logic_vector(3 downto 0);
                          carry   : out    std_logic
                        );
                  
end component;

signal test1,test2,Res : std_logic_vector(3 downto 0);
signal sel, Cout : std_logic;

-- sel = 0  -> add
-- sel = 1  -> sub

begin
  
  A: addsub port map ( in1 => test1, in2 => test2, AddSub => sel, SumBrr => Res, carry => Cout );
  
  test1 <="0000"; test2 <= "1111"; sel <= '0';
  
 -- wait for (10 ns);

  
end behaviour;
    