library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity Chache_Cell_Row_Test is

end Cache_Cell_Row_Test;

architecture structural of Cache_Cell_Row is

    component Cache_Cell_Row
    port(
        Data_In     :   in  std_logic_vector(7 downto 0);
        Tag_In      :   in  std_logic_vector(2 downto 0);
        Set_Valid   :   in  std_logic;
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
        Row_En      :   in  std_logic;
        Gnd         :   in  std_logic;
        reset       :   in  std_logic;
        Data_Out    :   out std_logic_vector(7 downto 0);
        Tag_Out     :   out std_logic_vector(2 downto 0);
        Valid_Out   :   out std_logic
    );
    end component;

    p   :   process

    
