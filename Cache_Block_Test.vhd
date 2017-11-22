library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity Cache_Block_Test is

end Cache_Block_Test;

architecture test of Cache_Block_Test is

    component Cache_Block
    port(
        Data_In     :   in  std_logic_vector(7 downto 0);
        Tag_In      :   in  std_logic_vector(2 downto 0);
        Set_Valid   :   in  std_logic;
        Rd_Wr       :   in  std_logic;
        Cache_Write :   in  std_logic;
        Col_En      :   in  std_logic_vector(3 downto 0);
        Row_En      :   in  std_logic_vector(7 downto 0);
        Tag_Wr_En   :   in  std_logic;
        Gnd         :   in  std_logic;
        reset       :   in  std_logic;
        enable      :   in  std_logic;
        Data_Out    :   out std_logic_vector(7 downto 0);
        Tag_Out     :   out std_logic_vector(2 downto 0);
        Valid_Out   :   out std_logic
    );
    end component;

    signal Data_In, Row_En, Data_Out    :   std_logic_vector(7 downto 0);
    signal Tag_In, Tag_Out              :   std_logic_vector(2 downto 0);
    signal Col_En                       :   std_logic_vector(3 downto 0);
    signal Set_Valid, Rd_Wr, Cache_Write, Tag_Wr_En, reset, enable, Valid_Out   :   std_logic;

begin

    asdf    :   Cache_Block port map(Data_In, Tag_In, Set_Valid, Rd_Wr, Cache_Write, Col_En, Row_En, Tag_Wr_En, '0', reset, enable, Data_Out, Tag_Out, Valid_Out);

    p  :   process
    begin
        Data_In <= "00000000";
        Tag_In  <= "000";
        Set_Valid   <= '0';
        Rd_Wr   <= '0';
        Cache_Write <= '0';
        Col_En  <= "0000";
        Row_En  <= "00000000";
        Tag_Wr_En   <=  '0';
        reset <= '1';
        wait for 5 ns;
        reset <= '0';
        wait for 5 ns;
        Row_En  <= "00100000";
        Col_En  <= "1000";
        Data_In <= "11111111";
        rd_wr   <= '1';
        Tag_In <= "010";
        wait for 5 ns;
        Cache_Write <= '1';
        Set_Valid <= '1';
        Tag_Wr_En <= '1';
        wait for 5 ns;
        Cache_Write <= '0';
        Set_Valid <= '0';
        Tag_Wr_En <= '0';
        rd_wr <= '0';
        wait for 5 ns;
        Row_En <= "10000000";
        Col_En <= "0100";
        Data_In <= "11110000";
        Tag_In <= "001";
        wait for 5 ns;
        Cache_Write <= '1';
        Set_Valid <= '1';
        Tag_Wr_En <= '1';
        wait for 5 ns;
        Cache_Write <= '0';
        Set_Valid <= '0';
        Tag_Wr_En <= '0';
        wait for 5 ns;
        rd_wr   <= '1';
        Row_En  <= "00100000";
        Col_En  <= "1000";
        wait for 5 ns;
        Row_En <= "10000000";
        Col_En <= "0100";
        wait for 5 ns;
        wait;
    end process;
end test;
