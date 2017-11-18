library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity nor2 is
port(
    in1     :   in  std_logic;
    in2     :   in  std_logic;
    out1    :   out std_logic
);
end nor2;

architecture structural of nor2 is
begin
    out1 <= in1 nor in2;
end structural;
