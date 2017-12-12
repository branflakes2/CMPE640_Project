library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity or5 is
port(
    in1     :   in  std_logic;
    in2     :   in  std_logic;
    in3     :   in  std_logic;
    in4     :   in  std_logic;
    in5     :   in  std_logic;
    out1    :   out std_logic
);
end or5;

architecture structural of or5 is

    component or2
    port(
        in1     :   in  std_logic;
        in2     :   in  std_logic;
        out1    :   out std_logic
    );
    end component;

    component or4
    port(
        in1     :   in  std_logic;
        in2     :   in  std_logic;
        in3     :   in  std_logic;
        in4     :   in  std_logic;
        out1    :   out std_logic
    );
    end component;

    signal o1   :   std_logic;

    for og1 : or4 use entity work.or4(structural);
    for og2 : or2 use entity work.or2(structural);

begin
    
    og1 :   or4 port map(in1, in2, in3, in4, o1);
    og2 :   or2 port map(o1,  in5, out1);

end structural;
