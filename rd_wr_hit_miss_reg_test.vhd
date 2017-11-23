library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity rd_wr_hit_miss_reg_test is

end rd_wr_hit_miss_reg_test;

architecture test of rd_wr_hit_miss_reg_test is

    component rd_wr_hit_miss_reg 
    port(
        rd_wr       :   in  std_logic;
        rd_wr_set_en:   in  std_logic;
        hit_miss    :   in  std_logic;
        hit_miss_en :   in  std_logic; --signal for latching hit miss
        clk         :   in  std_logic;
        reset       :   in  std_logic;
        Gnd         :   in  std_logic;
        rd_wr_o     :   out std_logic;
        rd_hit      :   out std_logic;
        wr_hit      :   out std_logic;
        rd_miss     :   out std_logic;
        wr_miss     :   out std_logic
    );
    end component;

    signal rd_wr, rd_wr_set_en, hit_miss, hit_miss_en, clk, reset, rd_hit, wr_hit, rd_miss, wr_miss :   std_logic;
    shared variable done    :   boolean := false;
begin

    pm  :   rd_wr_hit_miss_reg port map(rd_wr, rd_wr_set_en, hit_miss, hit_miss_en, clk, reset, '0', open, rd_hit, wr_hit, rd_miss, wr_miss);

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
        rd_wr_set_en <= '0';
        hit_miss_en <= '0';
        wait for 10 ns;
        reset <= '0';
        wait for 10 ns;
        rd_wr <= '1';
        hit_miss <= '1';
        wait for 10 ns;
        rd_wr_set_en <= '1';
        wait for 10 ns;
        rd_wr_set_en <= '0';
        rd_wr <= '0';
        hit_miss_en <= '1';
        wait for 10 ns;
        hit_miss_en <= '0'; 
        wait for 5 ns;
        hit_miss <= '0';
        wait for 5 ns;
        done := true;
        wait;
    end process;
end test;
