library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity xnor2 is
port(
    in1     :   in  std_logic;
    in2     :   in  std_logic;
    out1    :   out std_logic
);
end xnor2;

architecture structural of xnor2 is
begin
    out1 <= not (in1 xor in2);
end structural;
