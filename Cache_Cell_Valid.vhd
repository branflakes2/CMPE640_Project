library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity Cache_Cell_Valid is
    port(
        s       :   in  std_logic;
        r       :   in  std_logic;
        Rd_En   :   in  std_logic;
        Wr_En   :   in  std_logic;
        q       :   out std_logic
    );
end Cache_Cell_Valid;

architecture structural of Cache_Cell_Valid is

    component SRlatch
    port(
        s   :   in  std_logic;
        r   :   in  std_logic;
        q   :   out std_logic
    );
    end component;

    component tx
    port(
        sel     :   in  std_logic;
        selnot  :   in  std_logic;
        input   :   in  std_logic;
        output  :   out std_logic
    );
    end component;

    component nor2
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

    signal  q1      :   std_logic;
    signal  nRd_En  :   std_logic;
    signal  out_en  :   std_logic;

    for or1 :   nor2 use entity work.nor2(structural);
    for inv :   invX1 use entity work.invX1(structural);
    for sr  :   SRlatch use entity work.SRlatch(structural);
    for t   :   tx  use entity work.tx(structural);

begin
    
    or1 :   nor2     port map(Rd_En, Wr_En, nRd_En);
    inv :   invX1   port map(nRd_En, out_en);
    sr  :   SRlatch port map(s, r, q1);
    t   :   tx      port map(out_en, nRd_En, q1, q);

end structural;
