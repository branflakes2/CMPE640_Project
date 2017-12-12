library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity Compare is
    port(
        in1     :   in  std_logic_vector(2 downto 0);
        in2     :   in  std_logic_vector(2 downto 0);
        out1    :   out std_logic
    );
end Compare;

architecture structural of Compare is

    component invX1
    port(
        in1     :   in  std_logic;
        out1    :   out std_logic
    );
    end component;

    component nand2
    port(
        in1     :   in  std_logic;
        in2     :   in  std_logic;
        out1    :   out std_logic
    );
    end component;

    component nor2
    port(
        in1     :   in  std_logic;
        in2     :   in  std_logic;
        out1    :   out std_logic
    );
    end component;

    component xnor2
    port(
        in1     :   in  std_logic;
        in2     :   in  std_logic;
        out1    :   out std_logic
    );
    end component;

    signal xor_out  :   std_logic_vector(2 downto 0);
    signal nor_out  :   std_logic;
    signal inv      :   std_logic;    

    for xor_0, xor_1, xor_2 :   xnor2 use entity work.xnor2(structural);
    for nor_0 : nand2 use entity work.nand2(structural);
    for nor_1 :  nor2 use entity work.nor2(structural);
    for i   :   invX1 use entity work.invX1(structural);

begin

    xor_0   :   xnor2    port map(in1(0), in2(0), xor_out(0));
    xor_1   :   xnor2    port map(in1(1), in2(1), xor_out(1));
    xor_2   :   xnor2    port map(in1(2), in2(2), xor_out(2));
    nor_0   :   nand2    port map(xor_out(0), xor_out(1), nor_out);
    i       :   invX1   port map(xor_out(2), inv);
    nor_1   :   nor2    port map(inv, nor_out, out1);

end structural;
