library STD;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity Dlatch_Test is

end Dlatch_Test;

architecture test of Dlatch_Test is

    component Dlatch
        port(
            d       :   in  std_logic;
            clk     :   in  std_logic;
            q       :   out std_logic;
            qbar    :   out std_logic
        );
    end component;

    signal s_d      :   std_logic;
    signal s_clk    :   std_logic;
    signal s_q      :   std_logic;
    signal s_qbar   :   std_logic;

    for a   :   Dlatch use entity work.Dlatch(structural);

begin

    a   :   Dlatch  port map(s_d, s_clk, s_q, s_qbar);

    t   :   process
    
    begin
        
        s_clk   <=  '1';
        s_d     <=  '0', '1' after 5 ns;
        wait for 10 ns;
        s_clk   <=  '0';
        wait for 1 ns;
        s_d     <=  '0';
        wait for 4 ns;
        s_clk   <=  '1';
        wait for 5 ns;
        wait;
    
    end process;

end test;
