library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity Decoder_Test is

end Decoder_Test;

architecture test of Decoder_Test is

    component Decoder
    port(
        Mem_Add :   in  std_logic_vector(4 downto 0);
        Col_En  :   out std_logic_vector(3 downto 0);
        Row_En  :   out std_logic_vector(7 downto 0)
    );
    end component;

    signal Mem_Add  :   std_logic_vector(4 downto 0);
    signal Col_En   :   std_logic_vector(3 downto 0);
    signal Row_En   :   std_logic_vector(7 downto 0);

begin
    
    pm  :   Decoder port map(Mem_Add, Col_En, Row_En);
    
    p   :   process
    begin
        Mem_Add <= "00000";
        wait for 5 ns;
        Mem_Add <= "00001";
        wait for 5 ns;
        Mem_Add <= "10011";
        wait for 5 ns;
        wait;
    end process;
end test;
