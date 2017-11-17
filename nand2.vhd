library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity nand2 is
port(
    in1     :   in  std_logic;
    in2     :   in  std_logic;
    out1    :   out std_logic
);
end nand2;

architecture structural of nand2 is
begin
    out1 <= in1 nand in2 after 1 ns;
end structural;
