library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity and2 is
port(
    in1     :   in  std_logic;
    in2     :   in  std_logic;
    out1    :   out std_logic
);
end and2;

architecture structural of and2 is
begin
    out1 <= in1 and in2;
end structural;
