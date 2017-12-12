library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity and3 is
port(
    in1     :   in  std_logic;
    in2     :   in  std_logic;
    in3     :   in  std_logic;
    out1    :   out std_logic
);
end and3;

architecture structural of and3 is

    component and2
    port(
        in1     :   in  std_logic;
        in2     :   in  std_logic;  
        out1    :   out std_logic
    );
    end component;

    signal o1   :   std_logic;
    for a1  :   and2 use entity work.and2(structural);
    for a2  :   and2 use entity work.and2(structural);


begin

    a1  :   and2    port map(in1,   in2,    o1);
    a2  :   and2    port map(o1,    in3,    out1);

end structural;
