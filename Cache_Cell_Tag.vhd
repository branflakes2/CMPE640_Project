library STD;
library IEEE;                      
use IEEE.std_logic_1164.all;       

entity Cache_Cell_Tag is                      
    port(
        Data    :   in  std_logic_vector(2 downto 0);
        W_En_r  :   in  std_logic; --row wr enable
        Tag_Wr  :   in  std_logic; --tag wr enable
        reset   :   in  std_logic;
        Gnd     :   in  std_logic;
        Output  :   out std_logic_vector(2 downto 0);
        Rd_En   :   in  std_logic  --row rd enable
    ); 
end Cache_Cell_Tag;                          

architecture structural of Cache_Cell_Tag is 

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

    component and2
    port(
        in1     :   in  std_logic;
        in2     :   in  std_logic;
        out1    :   out std_logic
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

    signal Wr_En    :   std_logic;
    signal nRd_En   :   std_logic;
    signal out_en   :   std_logic;

begin

    and_1   :   and2        port map(Tag_Wr, W_En_r, Wr_En);
    or_1    :   or2         port map(W_En_r, Rd_En, out_en);
    nrd     :   invX1       port map(out_en, nRd_En);

    cell0   :   Cache_Cell  port map(Data(0), Wr_En, reset, Gnd, Output(0), out_en, nRd_En);
    cell1   :   Cache_Cell  port map(Data(1), Wr_En, reset, Gnd, Output(1), out_en, nRd_En);
    cell2   :   Cache_Cell  port map(Data(2), Wr_En, reset, Gnd, Output(2), out_en, nRd_En);
    
end structural;
