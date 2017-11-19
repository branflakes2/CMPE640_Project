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

    component or2
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

begin
    
    or1 :   or2     port map(Rd_En, Wr_En, out_en);
    inv :   invX1   port map(out_en, nRd_En);
    sr  :   SRlatch port map(s, r, q1);
    t   :   tx      port map(Rd_En, nRd_En, q1, q);

end structural;
