library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_arith.all;

entity comp1_30 is
  port (
          D     : IN STD_LOGIC_VECTOR(7 downto 0);
          Q     : OUT STD_LOGIC_VECTOR(7 downto 0);
          clk   : IN std_logic;
          reset : IN std_logic
        );
        
end comp1_30;

architecture behave of comp1_30 is

    subtype byte is signed(7 downto 0);
    type mem_type is array (integer range <>) of byte;
    signal fifo:mem_type(7 downto 0);  

    begin
      
    process(clk,reset)
      begin 
          if (reset='1') then
              fifo  <=    (others=>(others=>'0'));
              q     <=    (others=>'0');
          elsif clk='1' and clk'event then
              fifo  <=    fifo(6 downto 0)&d;
              q     <=    fifo;
          end if;
    end process;
    
  end behave;
      
