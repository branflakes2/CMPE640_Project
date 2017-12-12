library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity tx_test is

end tx_test;

architecture test of tx_test is

    component tx
    port(
        sel     :   in  std_logic;
        selnot  :   in  std_logic;
        input   :   in  std_logic;
        output  :   out std_logic
    );
    end component;

    signal input, sel, selnot, output   :   std_logic;

    for asdf    :   tx use entity work.tx(structural);

begin

    asdf    :   tx  port map(sel, selnot, input, output);

    p   :   process
    begin
        sel <= 'U';
        selnot <= 'U';
        input <= 'U';
        wait for 10 ns;
        sel <= '0';
        selnot <= '1';
        wait for 10 ns;
        wait;
    end process;

end test;
