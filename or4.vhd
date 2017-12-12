library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity or4 is
port(
    in1     :   in  std_logic;
    in2     :   in  std_logic;
    in3     :   in  std_logic;
    in4     :   in  std_logic;
    out1    :   out std_logic
);
end or4;

architecture structural of or4 is

    component or2
    port(
        in1     :   in  std_logic;
        in2     :   in  std_logic;
        out1    :   out std_logic
    );
    end component;

    signal o1   :   std_logic;
    signal o2   :   std_logic;

    for og1, og2, og3   :   or2 use entity work.or2(structural);

begin
    
    og1 :   or2 port map(in1, in2, o1);
    og2 :   or2 port map(in3, in4, o2);
    og3 :   or2 port map(o1, o2, out1);

end structural;
