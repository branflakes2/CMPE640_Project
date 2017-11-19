library STD;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity Cache_Cell_Test is

end Cache_Cell_Test;

architecture test of Cache_Cell_Test is

    component Cache_Cell 
    port(
        Data    :   in  std_logic;
        W_En    :   in  std_logic;
        reset   :   in  std_logic;
        Gnd     :   in  std_logic;
        Output  :   out std_logic;
        Rd_En   :   in  std_logic;
        nRd_En  :   in  std_logic
    );
    end component;

    component invX1
    port(
        in1     :   in  std_logic;
        out1    :   out std_logic
    );
    end component;

    signal s_Data   :   std_logic;
    signal s_W_En   :   std_logic;
    signal s_reset  :   std_logic;
    signal s_Output :   std_logic;
    signal s_Rd_En  :   std_logic;
    signal s_nRd_En :   std_logic;

begin

    inv     :   invX1       port map(s_Rd_En, s_nRd_En);
    
    cache   :   Cache_Cell  port map(s_Data, s_W_En, s_reset, '0', s_Output, s_Rd_En, s_nRd_En);  

    t   :   process    

    begin
        
        s_reset <=  '1', '0' after 10 ns;
        s_Data  <= '0';
        s_W_En  <= '0';
        s_Rd_En <=  '1' after 2 ns;
        wait for 20 ns;
        s_Data  <=  '1' after 1 ns;
        s_W_En  <=  '1';
        wait for 5 ns;
        s_Rd_en <=  '0' after 4 ns;
        s_W_En  <=  '0';
        s_Data  <=  '0' after 1 ns;       
        wait for 5 ns;
        s_reset <= '1', '0' after 5 ns;
        wait for 10 ns;
        wait;

    end process;

end test;
