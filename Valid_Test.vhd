library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity valid_test is

end valid_test;

architecture test of valid_test is

    component Cache_Cell_Valid
    port(
        s       :   in  std_logic;
        r       :   in  std_logic;
        Rd_En   :   in  std_logic;
        Wr_En   :   in  std_logic;
        q       :   out std_logic
    );
    end component;

    signal s_s, s_r, s_Rd_En, s_Wr_En, s_q  :   std_logic   := '0';

begin

    asdf    :   Cache_Cell_Valid    port map(s_s, s_r, s_Rd_En, s_Wr_En, s_q);

p   :   process
begin

    s_s   <=  'U';
    s_Wr_En <= 'U';
    s_r     <= '1';
    wait for 5 ns;
    s_r <= '0';
    wait for 5 ns;
    s_s   <=  '0';
    s_Rd_En <= '1';
    s_Wr_En <= '0';
    wait for 5 ns;
    s_s <=  '1';
    wait for 5 ns;
    s_s <= '0';
    wait for 5 ns;
    s_r <= '1';
    wait for 5 ns;
    s_r <= '0';
    wait for 5 ns;
    s_q <= '1';
    s_Rd_En <= '1';
    wait for 5 ns;
    s_q <= '0';
    s_Rd_En <= '0';
    wait for 5 ns;
    wait;
end process;
end test;
