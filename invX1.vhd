library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity invX1 is
port(
    in1     :   in  std_logic;
    out1    :   out std_logic
);
end invX1;

architecture structural of invX1 is
begin
    out1 <= not in1;
end structural;
