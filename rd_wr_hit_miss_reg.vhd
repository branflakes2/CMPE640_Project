library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity rd_wr_hit_miss_reg is
    port(
        rd_wr       :   in  std_logic;
        hit_miss    :   in  std_logic;
        clk         :   in  std_logic;
        reset       :   in  std_logic;
        rd_hit      :   out std_logic;
        wr_hit      :   out std_logic;  
        rd_miss     :   out std_logic;
        wr_miss     :   out std_logic
    );
end rd_wr_hit_miss_reg;

architecture structural of rd_wr_hit_miss_reg is

    component dff_reset
        port(
            d       :   in  std_logic;
            clk     :   in  std_logic;
            reset   :   in  std_logic;
            q       :   out std_logic;
            qbar    :   out std_logic
        );
    end component;

    component and2
        port(
            in1     :   in  std_logic;
            in2     :   in  std_logic;
            out1    :   out std_logic
        );
    end component;

    component invX1
        port(
            in1     :   in  std_logic;
            out1    :   out std_logic
        );
    end component;

    signal n_rd_wr      :   std_logic;
    signal n_hit_miss   :   std_logic;
    signal rhit         :   std_logic;
    signal rmiss        :   std_logic;
    signal whit         :   std_logic;
    signal wmiss        :   std_logic;

begin
    
    inv1    :   invX1       port map(rd_wr, n_rd_wr);
    inv2    :   invX1       port map(hit_miss, n_hit_miss);

    and_1   :   and2        port map(rd_wr, hit_miss, rhit);
    and_2   :   and2        port map(n_rd_wr, hit_miss, whit);
    and_3   :   and2        port map(rd_wr, n_hit_miss, rmiss);
    and_4   :   and2        port map(n_rd_wr, n_hit_miss, wmiss);

    reg1    :   dff_reset   port map(rhit, clk, reset, rd_hit, open);
    reg2    :   dff_reset   port map(whit, clk, reset, wr_hit, open);
    reg3    :   dff_reset   port map(rmiss, clk, reset, rd_miss, open);
    reg4    :   dff_reset   port map(wmiss, clk, reset, wr_miss, open);

end structural;
