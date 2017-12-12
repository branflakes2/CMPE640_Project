library std;
library ieee;
use ieee.std_logic_1164.all;

entity Output_Enable is
port (
    in8     :   in  std_logic_vector(7 downto 0);
    enable  :   in  std_logic;
    out8    :   out std_logic_vector(7 downto 0)
);
end Output_Enable;

architecture structural of Output_Enable is

    component tx
    port(
        sel     :   in  std_logic;
        selnot  :   in  std_logic;
        input   :   in  std_logic;
        output  :   out std_logic
    );
    end component;

    component invX1
    port(
        in1     :   in  std_logic;
        out1    :   out std_logic
    );
    end component;

    signal  n_enable    :   std_logic;

    for n_en    :   invX1 use entity work.invX1(structural);
    for tx0, tx1, tx2, tx3, tx4, tx5, tx6, tx7  : tx use entity work.tx(structural);

begin

    n_en    :   invX1   port map(enable, n_enable);
    tx0     :   tx      port map(enable, n_enable, in8(0), out8(0));
    tx1     :   tx      port map(enable, n_enable, in8(1), out8(1));
    tx2     :   tx      port map(enable, n_enable, in8(2), out8(2));
    tx3     :   tx      port map(enable, n_enable, in8(3), out8(3));
    tx4     :   tx      port map(enable, n_enable, in8(4), out8(4));
    tx5     :   tx      port map(enable, n_enable, in8(5), out8(5));
    tx6     :   tx      port map(enable, n_enable, in8(6), out8(6));
    tx7     :   tx      port map(enable, n_enable, in8(7), out8(7));

end structural;
