library ieee;
use ieee.std_logic_1164.all;

ENTITY nandgate IS
PORT(
A: IN BIT;
B: IN BIT;
Q: OUT BIT -- NB! No ; here!
);


END nandgate;
ARCHITECTURE dataflow OF nandgate IS
SIGNAL Q_prim: BIT;
BEGIN
Q_prim <= A AND B; -- The AND-operation.
Q <= NOT Q_prim; -- The inversion.
END dataflow;