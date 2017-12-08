library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity nor3 is
port(
    in1     :   in  std_logic;
    in2     :   in  std_logic;
    in3     :   in  std_logic;
    out1    :   out std_logic
);
end nor3;

architecture structural of nor3 is

begin

    out1 <= (in1 or in2) nor in3;

end structural;
