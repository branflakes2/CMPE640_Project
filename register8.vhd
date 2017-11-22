library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity register8 is
    port(
        d       :   in  std_logic_vector(7 downto 0);
        clk     :   in  std_logic;
        reset   :   in  std_logic;
        Gnd     :   in  std_logic;
        q       :   out std_logic_vector(7 downto 0)
    );
end register8;

architecture structural of register8 is

    component dff_reset
    port(
        d       :   in  std_logic;
        clk     :   in  std_logic;
        reset   :   in  std_logic;
        Gnd     :   in  std_logic;
        q       :   out std_logic;
        qbar    :   out std_logic
    );
    end component;

begin

    register0   :   dff_reset port map(d(0), clk, reset, Gnd, q(0), open);
    register1   :   dff_reset port map(d(1), clk, reset, Gnd, q(1), open);
    register2   :   dff_reset port map(d(2), clk, reset, Gnd, q(2), open);
    register3   :   dff_reset port map(d(3), clk, reset, Gnd, q(3), open);
    register4   :   dff_reset port map(d(4), clk, reset, Gnd, q(4), open);
    register5   :   dff_reset port map(d(5), clk, reset, Gnd, q(5), open);
    register6   :   dff_reset port map(d(6), clk, reset, Gnd, q(6), open);
    register7   :   dff_reset port map(d(7), clk, reset, Gnd, q(7), open);

end structural;
