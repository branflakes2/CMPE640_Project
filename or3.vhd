library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity or3 is
port(
    in1     :   in  std_logic;
    in2     :   in  std_logic;
    in3     :   in  std_logic;
    out1    :   out std_logic
);
end or3;

architecture structural of or3 is

    component or2
    port(
        in1     :   in  std_logic;
        in2     :   in  std_logic;
        out1    :   out std_logic
    );
    end component;

    signal o1   :   std_logic;

begin
    
    og1 :   or2 port map(in1, in2, o1);
    og2 :   or2 port map(in3, o1, out1);


end structural;
