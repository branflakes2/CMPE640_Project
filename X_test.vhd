library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity X_Test is

end X_Test;

architecture test of X_Test is

    component and2
    port(
        in1     :   in  std_logic;  
        in2     :   in  std_logic;
        out1    :   out std_logic
    );
    end component;

    signal s_in1, s_in2, s_out  :   std_logic;
    
begin

    asdf    :   and2    port map(s_in1, s_in2, s_out);

    p   :   process

    begin
    
        s_in1   <= 'Z';
        s_in2   <= 'Z';
        wait for 5 ns;
        s_in1   <= '1';
        wait for 5 ns;
        s_in2   <= '1';
        wait for 5 ns;
        s_in2   <= '0';
        wait for 5 ns;
        s_in1   <= 'Z';
        wait for 5 ns;
        s_in2   <= '1';
        wait for 5 ns;
        wait;

    end process;

end test;
