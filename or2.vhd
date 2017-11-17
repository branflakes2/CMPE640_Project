library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity or2 is
port(
    in1     :   in  std_logic;
    in2     :   in  std_logic;
    out1    :   out std_logic
);
end or2;

architecture structural of or2 is
begin
    out1 <= in1 or in2 after 1 ns;
end structural;
