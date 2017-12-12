library STD;
library IEEE;                      
use IEEE.std_logic_1164.all;       

entity Cache_Cell_Data_Block is                      
    port(
        Data    :   in  std_logic_vector(7 downto 0);
        W_En_r  :   in  std_logic; --row wr enable
        W_En_c  :   in  std_logic; --column wr enable
        reset   :   in  std_logic;
        Gnd     :   in  std_logic;
        Output  :   out std_logic_vector(7 downto 0);
        Rd_En_r :   in  std_logic; --row rd enable
        Rd_En_c :   in  std_logic  --column rd enable
    ); 
end Cache_Cell_Data_Block;                          

architecture structural of Cache_Cell_Data_Block is 

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

    component nand2
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

    signal Rd_En    :   std_logic;
    signal Wr_En    :   std_logic;
    signal nRd_En   :   std_logic;

    for and_1   :   nand2 use entity work.nand2(structural);
    for and_2   :   and2 use entity work.and2(structural);
    for nrd     :   invX1 use entity work.invX1(structural);
    for cell0, cell1, cell2, cell3, cell4, cell5, cell6, cell7  :   Cache_Cell use entity work.Cache_Cell(structural);

begin

    and_1   :   nand2       port map(Rd_En_c, Rd_En_r, nRd_En);
    and_2   :   and2        port map(W_En_c, W_En_r, Wr_En);
    nrd     :   invX1       port map(nRd_En, Rd_En);

    cell0   :   Cache_Cell  port map(Data(0), Wr_En, reset, Gnd, Output(0), Rd_En, nRd_En);
    cell1   :   Cache_Cell  port map(Data(1), Wr_En, reset, Gnd, Output(1), Rd_En, nRd_En);
    cell2   :   Cache_Cell  port map(Data(2), Wr_En, reset, Gnd, Output(2), Rd_En, nRd_En);
    cell3   :   Cache_Cell  port map(Data(3), Wr_En, reset, Gnd, Output(3), Rd_En, nRd_En);
    cell4   :   Cache_Cell  port map(Data(4), Wr_En, reset, Gnd, Output(4), Rd_En, nRd_En);
    cell5   :   Cache_Cell  port map(Data(5), Wr_En, reset, Gnd, Output(5), Rd_En, nRd_En);
    cell6   :   Cache_Cell  port map(Data(6), Wr_En, reset, Gnd, Output(6), Rd_En, nRd_En);
    cell7   :   Cache_Cell  port map(Data(7), Wr_En, reset, Gnd, Output(7), Rd_En, nRd_En);
    
end structural;
