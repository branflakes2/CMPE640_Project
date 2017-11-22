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

    component nor2
    port(
        in1     :   in  std_logic;
        in2     :   in  std_logic;
        out1    :   out std_logic
    );
    end component;

    component xor2
    port(
        in1     :   in  std_logic;
        in2     :   in  std_logic;
        out1    :   out std_logic
    );
    end component;

    signal xor_out  :   std_logic_vector(2 downto 0);
    signal nor_out  :   std_logic;
    signal inv      :   std_logic;    


begin

    xor_0   :   xor2    port map(in1(0), in2(0), xor_out(0));
    xor_1   :   xor2    port map(in1(1), in2(1), xor_out(1));
    xor_2   :   xor2    port map(in1(2), in2(2), xor_out(2));
    nor_0   :   nor2    port map(xor_out(0), xor_out(1), nor_out);
    i       :   invX1   port map(nor_out, inv);
    nor_1   :   nor2    port map(xor_out(2), inv, out1);

end structural;
