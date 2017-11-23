library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity SR18_Test is
end SR18_Test;

architecture test of SR18_Test is

    component SR18 
    port(
        clk     :   in  std_logic;
        reset   :   in  std_logic;
        Vdd     :   in  std_logic;
        Gnd     :   in  std_logic;
        output  :   out std_logic_vector(0 to 17)
    );
    end component;

    signal clk, reset   :   std_logic;
    signal output   :   std_logic_vector(0 to 17);
    shared variable done    :   boolean := false;
begin
    
    pm  :   SR18    port map(clk, reset, '1', '0', output);

    c   :   process
    begin
        if done = true then
            wait;
        else
            clk <= '1', '0' after 5 ns;
            wait for 10 ns;
        end if;
    end process;

    p   :   process
    begin
        reset <= '1';
        wait for 10 ns;
        reset <= '0';
        wait for 150 ns;
        done := true;
        wait;
    end process;
end test;
