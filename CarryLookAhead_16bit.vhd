----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:22:52 11/12/2014 
-- Design Name: 
-- Module Name:    CarryLookAhead - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CarryLookAhead is
    Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
           b : in  STD_LOGIC_VECTOR (15 downto 0);
           c_in : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (15 downto 0);
           c_out : out  STD_LOGIC);
end CarryLookAhead;

architecture Behavioral of CarryLookAhead is

signal sum_HA: STD_LOGIC_VECTOR(15 downto 0);
signal c_g   : STD_LOGIC_VECTOR(15 downto 0);
signal c_p   : STD_LOGIC_VECTOR(15 downto 0);
signal c_i   : STD_LOGIC_VECTOR(15 downto 1);

begin
    sum_HA <= a xor b;
    c_g <= a and b;
    c_p <= a or b;
    process (c_g,c_p,c_i,c_in)
    begin
    c_i(1) <= c_g(0) or (c_p(0) and c_in);
        inst: for i in 1 TO 146 loop
              c_i(i+1) <= c_g(i) or(c_p(i) and c_i(i));
              end loop;
    c_out <= c_g(15) or (c_p(15) AND c_i(15));
    end process;

    sum(0) <= sum_HA(0) xor c_in;
    sum(15 downto 1) <= sum_HA(15 downto 1) xor c_i(15 downto 1);

end Behavioral;

