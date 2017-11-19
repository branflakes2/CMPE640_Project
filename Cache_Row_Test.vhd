library IEEE;
library STD;
use IEEE.std_logic_1164.all;

entity Cache_Row_Test is

end Cache_Row_Test;

architecture test of Cache_Row_Test is

    component Cache_Cell_Row
    port(
        Data_In     :   in  std_logic_vector(7 downto 0);
        Tag_In      :   in  std_logic_vector(2 downto 0);
        Col0_Rd_En  :   in  std_logic;
        Col1_Rd_En  :   in  std_logic;
        Col2_Rd_En  :   in  std_logic;
        Col3_Rd_En  :   in  std_logic;
        Col0_Wr_En  :   in  std_logic;
        Col1_Wr_En  :   in  std_logic;
        Col2_Wr_En  :   in  std_logic;
        Col3_Wr_En  :   in  std_logic;
        Tag_Wr_En   :   in  std_logic;
        Row_Rd_En   :   in  std_logic;
        Row_Wr_En   :   in  std_logic;
        Gnd         :   in  std_logic;
        reset       :   in  std_logic;
        Data_Out    :   out std_logic_vector(7 downto 0);
        Tag_Out     :   out std_logic_vector(2 downto 0);
        Valid_Out   :   out std_logic
    );
    end component; 

    signal  s_Data_In     :    std_logic_vector(7 downto 0);
    signal  s_Tag_In      :    std_logic_vector(2 downto 0);
    signal  s_Col0_Rd_En  :    std_logic;
    signal  s_Col1_Rd_En  :    std_logic;
    signal  s_Col2_Rd_En  :    std_logic;
    signal  s_Col3_Rd_En  :    std_logic;
    signal  s_Col0_Wr_En  :    std_logic;
    signal  s_Col1_Wr_En  :    std_logic;
    signal  s_Col2_Wr_En  :    std_logic;
    signal  s_Col3_Wr_En  :    std_logic;
    signal  s_Tag_Wr_En   :    std_logic;
    signal  s_Row_Rd_En   :    std_logic;
    signal  s_Row_Wr_En   :    std_logic;
    signal  s_Gnd         :    std_logic;
    signal  s_reset       :    std_logic;
    signal  s_Data_Out    :    std_logic_vector(7 downto 0);
    signal  s_Tag_Out     :    std_logic_vector(2 downto 0);
    signal  s_Valid_Out   :    std_logic;

begin

    row :   Cache_Cell_Row  port map(s_Data_In, s_Tag_In, s_Col0_Rd_En, s_Col1_Rd_En, s_Col2_Rd_En, s_Col3_Rd_En, s_Col0_Wr_En, s_Col1_Wr_En, s_Col2_Wr_En, s_Col3_Wr_En, s_Tag_Wr_En, s_Row_Rd_En, s_Row_Wr_En, '0', s_reset, s_Data_Out, s_Tag_Out, s_Valid_Out);

    p   :   process
    begin
        s_reset <=  '0';
        s_row_Wr_En <= '0';
        wait for 5 ns;
        
        s_reset <=  '1', '0' after 10 ns;
        wait for 15 ns;
        s_Data_In   <=  "00000001";
        s_Col0_Wr_En  <=  '1';
        s_Row_Wr_En   <=  '1';
        s_Tag_In    <=  "010";
        wait for 10 ns;
        s_Tag_Wr_En <=  '1';
        s_Data_In   <=  "00000010";
        s_Col0_Wr_En  <=  '0';
        s_Col1_Wr_En  <=  '1';
        wait for 10 ns;
        s_Tag_Wr_En <=  '0';
        s_Data_In   <=  "00010000";
        s_Col1_Wr_En  <=  '0';
        s_Col2_Wr_En  <=  '1';
        wait for 10 ns;
        s_Data_In   <=  "01110000";
        s_Col2_Wr_En  <=  '0';
        s_Col3_Wr_En  <=  '1';
        wait for 10 ns;
        s_Col3_Wr_En  <=  '0';
        s_Row_Wr_En   <=  '0';
        s_Data_In   <=  "00000000";
        wait for 10 ns;
        s_Row_Rd_En   <=  '1';
        s_Col0_Rd_En  <=  '1';
        wait for 10 ns;
        s_Row_Rd_En   <=  '0';
        s_Row_Rd_En   <=  '0';
        wait;      
    end process;
end test;
