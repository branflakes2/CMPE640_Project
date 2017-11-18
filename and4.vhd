library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity and4 is
port(
    in1     :   in  std_logic;
    in2     :   in  std_logic;
    in3     :   in  std_logic;
    in4     :   in  std_logic;
    out1    :   out std_logic
);
end and4;

architecture structural of and4 is

    component and2
    port(
        in1     :   in  std_logic;
        in2     :   in  std_logic;
        out1    :   out std_logic
    );
    end component;

    signal o1   :   std_logic;
    signal o2   :   std_logic;

begin
    
    og1 :   and2 port map(in1, in2, o1);
    og2 :   and2 port map(in3, in4, o2);
    og3 :   and2 port map(o1, o2, out1);

end structural;
