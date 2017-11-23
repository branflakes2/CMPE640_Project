library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity Hit_Miss_Test is

end Hit_Miss_Test;

architecture test of Hit_Miss_Test is

    component Hit_Miss
     port(
        tag1    :   in  std_logic_vector(2 downto 0);
        tag2    :   in  std_logic_vector(2 downto 0);
        Valid   :   in  std_logic;
        HitMiss :   out std_logic
    );
    end component;

    signal tag1, tag2   :   std_logic_vector(2 downto 0);
    signal Valid, HitMiss   :   std_logic;

begin
    
    pm  :   Hit_Miss port map(tag1, tag2, Valid, HitMiss);

    p   :   process
    begin
        tag1 <= "000";
        tag2 <= "000";
        Valid <= '1';
        wait for 5 ns;
        tag2 <= "001";
        wait for 5 ns;
        tag1 <= "001";
        Valid <= '0';
        wait for 5 ns;
        Valid <= '1';
        wait for 5 ns;
        wait;
    end process;

end test;
