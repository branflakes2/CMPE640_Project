library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity chip is
    port(
        cpu_add     :   in      std_logic_vector(7 downto 0);
        cpu_data    :   inout   std_logic_vector(7 downto 0);
        cpu_rd_wrn  :   in      std_logic;
        start       :   in      std_logic;
        clk         :   in      std_logic;
        reset       :   in      std_logic;
        mem_data    :   in      std_logic_vector(7 downto 0);
        Vdd         :   in      std_logic;
        Gnd         :   in      std_logic;
        busy        :   out     std_logic;
        mem_en      :   out     std_logic;
        mem_add     :   out     std_logic_vector(7 downto 0)
    );
end chip;

architecture structural of chip is

    component Counter
    port(
        clk         :   in  std_logic;
        hit_miss    :   in  std_logic;  --1 hit 0 miss
        rd_wr       :   in  std_logic;  --1 read 0 write
        start       :   in  std_logic;
        Vdd         :   in  std_logic;
        Gnd         :   in  std_logic;
        reset       :   in  std_logic;
        busy        :   out std_logic;
        rd_wr_o     :   out std_logic;
        cache_write :   out std_logic;
        rm_wr_en    :   out std_logic;
        wr_hit      :   out std_logic;
        cpu_dout_en :   out std_logic;
        mem_enable  :   out std_logic;
        write_0     :   out std_logic;  --write word0 to cache
        write_1     :   out std_logic;  --write word1 to cache
        write_2     :   out std_logic;  --write word2 to cache
        write_3     :   out std_logic  --write word3 to cache
    );
    end component;

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
        Data_Out    :   out std_logic_vector(7 downto 0);
        Tag_Out     :   out std_logic_vector(2 downto 0);
        Valid_Out   :   out std_logic
    );
    end component;

    component Decoder
    port(
        Mem_Add :   in  std_logic_vector(4 downto 0);
        Col_En  :   out std_logic_vector(3 downto 0);
        Row_En  :   out std_logic_vector(7 downto 0)
    );
    end component;
    
    component Hit_Miss
    port(
        tag1    :   in  std_logic_vector(2 downto 0);
        tag2    :   in  std_logic_vector(2 downto 0);
        Valid   :   in  std_logic;
        HitMiss :   out std_logic
    );
    end component;

    component Output_Enable
    port(
        in8     :   in  std_logic_vector(7 downto 0);
        enable  :   in  std_logic;
        out8    :   out std_logic_vector(7 downto 0)
    );
    end component;

    component register8
    port(
        d       :   in  std_logic_vector(7 downto 0);
        clk     :   in  std_logic;
        reset   :   in  std_logic;
        Gnd     :   in  std_logic;
        q       :   out std_logic_vector(7 downto 0)
    );
    end component;

    component or2
    port(
        in1     :   in  std_logic;
        in2     :   in  std_logic;
        out1    :   out std_logic
    );
    end component;

    component nor2
    port(
        in1     :   in  std_logic;
        in2     :   in  std_logic;
        out1    :   out std_logic
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
    
    --register signals
    signal addr_reg_out     :   std_logic_vector(7 downto 0);
    signal data_reg_out     :   std_logic_vector(7 downto 0);

    --cache enable signals
    signal col_dec_out      :   std_logic_vector(3 downto 0);
    signal col_en           :   std_logic_vector(3 downto 0);
    signal row_dec_out      :   std_logic_vector(7 downto 0);
    
    --cache block signals
    signal data_bus         :   std_logic_vector(7 downto 0);
    signal cache_data_out   :   std_logic_vector(7 downto 0);
    signal cache_tag_out    :   std_logic_vector(2 downto 0);
    signal cache_valid_out  :   std_logic;

    --hit detection    
    signal hitmiss          :   std_logic;

    --state machine signals
    signal w0               :   std_logic;
    signal w1               :   std_logic;
    signal w2               :   std_logic;
    signal w3               :   std_logic;
    signal dout_en          :   std_logic;
    signal aout_en          :   std_logic;
    signal rdwr             :   std_logic;    
    signal nrdwr            :   std_logic;

    --register write enable signals
    signal nstart           :   std_logic;
    signal reg_clk_en       :   std_logic;

    --signals for turning off regular block select during write from mem
    signal col_dec_en       :   std_logic_vector(3 downto 0);
    signal rd_miss          :   std_logic;    
    signal nrd_miss         :   std_logic;
    signal internal_busy    :   std_logic;
    signal nbusy            :   std_logic;
    signal e                :   std_logic;

    signal delayed_rm       :   std_logic;

    signal reset_nor_start  :   std_logic;
    
    signal wr_hit           :   std_logic;
    signal wr_on_wr_hit     :   std_logic_vector(3 downto 0);
    signal wr_on_rd_miss    :   std_logic_vector(3 downto 0);
    signal cache_write      :   std_logic;
    signal rm_wr_en         :   std_logic;

    for nreadwr, nrm, nb, not_start    :   invX1   use entity work.invX1(structural);
    for data_reg, addr_reg  :   register8 use entity work.register8(structural);
    for decode              :   Decoder use entity work.Decoder(structural);
    for cache               :   Cache_Block use entity work.Cache_Block(structural);
    for hm                  :   Hit_Miss use entity work.Hit_Miss(structural);
    for state               :   Counter use entity work.Counter(structural);
    for outen0, outen1, outen2      :   Output_Enable use entity work.Output_Enable(structural);
    for rnors               :   nor2 use entity work.nor2(structural);
    for reg_en, colen0, colen1, colen2, colen3 : or2 use entity work.or2(structural);
    for rm0, rm1, rm2, rm3, colen_wr0, colen_wr1, colen_wr2, colen_wr3  :   and2 use entity work.and2(structural);
    for oen                 :   nand2 use entity work.nand2(structural);
    

begin

    busy        <=  internal_busy;
    data_bus    <=  mem_data;
    nreadwr     :   invX1       port map(rdwr, nrdwr);
    data_reg    :   register8   port map(cpu_data, reg_clk_en, reset, Gnd, data_reg_out);
    addr_reg    :   register8   port map(cpu_add, reg_clk_en, reset, Gnd, addr_reg_out);   
    decode      :   Decoder     port map(addr_reg_out(4 downto 0), col_dec_out, row_dec_out);
    cache       :   Cache_Block port map(data_bus, addr_reg_out(7 downto 5), w0, rdwr, cache_write, col_en, row_dec_out, w0, Gnd, reset, cache_data_out, cache_tag_out, cache_valid_out);
    hm          :   Hit_Miss    port map(addr_reg_out(7 downto 5), cache_tag_out, cache_valid_out, hitmiss);
    state       :   Counter     port map(clk, hitmiss, cpu_rd_wrn, start, Vdd, Gnd, reset, internal_busy, rdwr, cache_write, rm_wr_en, wr_hit, dout_en, aout_en, w0, w1, w2, w3);
    outen0      : Output_Enable port map(cache_data_out, dout_en, cpu_data);
    outen1      : Output_Enable port map(addr_reg_out, aout_en, mem_add); 

    --register clock enable
    not_start   :   invX1       port map(start, nstart);
    rnors       :   nor2         port map(reset, start, reset_nor_start);
    reg_en      :   or2         port map(reset_nor_start, clk, reg_clk_en);

    mem_en      <=  aout_en;

    --column enable signals for cache
    nrm         :   invX1       port map(rd_miss, nrd_miss);
    nb          :   invX1       port map(internal_busy, nbusy);
    oen         :   nand2       port map(rm_wr_en, internal_busy, e);
    rm0         :   and2        port map(e, col_dec_out(0), col_dec_en(0));
    rm1         :   and2        port map(e, col_dec_out(1), col_dec_en(1));
    rm2         :   and2        port map(e, col_dec_out(2), col_dec_en(2));
    rm3         :   and2        port map(e, col_dec_out(3), col_dec_en(3));
    colen0      :   or2         port map(w0, col_dec_en(0), col_en(0));
    colen1      :   or2         port map(w1, col_dec_en(1), col_en(1));
    colen2      :   or2         port map(w2, col_dec_en(2), col_en(2));
    colen3      :   or2         port map(w3, col_dec_en(3), col_en(3));
    colen_wr0   :   and2        port map(wr_hit,  col_dec_out(0), wr_on_wr_hit(0));
    colen_wr1   :   and2        port map(wr_hit,  col_dec_out(1), wr_on_wr_hit(1));
    colen_wr2   :   and2        port map(wr_hit,  col_dec_out(2), wr_on_wr_hit(2));
    colen_wr3   :   and2        port map(wr_hit,  col_dec_out(3), wr_on_wr_hit(3));

    outen2      :   Output_Enable   port map(data_reg_out, nrdwr, data_bus);

end structural;
