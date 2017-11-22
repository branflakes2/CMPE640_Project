library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity Counter is
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
        cache_write :   out std_logic; --pulses for one clock to write to cache
        rm_wr_en    :   out std_logic; --disables decoder output while writing from memory   
        wr_hit      :   out std_logic;
        cpu_dout_en :   out std_logic; --enables output to data bus
        mem_enable  :   out std_logic; --signals memory to start sending data
        write_0     :   out std_logic;  --write word0 to cache
        write_1     :   out std_logic;  --write word1 to cache
        write_2     :   out std_logic;  --write word2 to cache
        write_3     :   out std_logic  --write word3 to cache
    );
end Counter;

architecture structural of Counter is

    component rd_wr_hit_miss_reg is
        port(
            rd_wr       :   in  std_logic;
            rd_wr_set_en:   in  std_logic;
            hit_miss    :   in  std_logic;
            hit_miss_en :   in  std_logic;
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

    component SR18
    port(
        clk     :   in  std_logic;
        reset   :   in  std_logic;
        Vdd     :   in  std_logic;
        Gnd     :   in  std_logic;
        output  :   out std_logic_vector(0 to 17)
    );
    end component;

    component dff_reset_high
    port(
        d       :   in  std_logic;
        clk     :   in  std_logic;
        reset   :   in  std_logic;
        Gnd     :   in  std_logic;
        q       :   out std_logic;
        qbar    :   out std_logic
    );
    end component;

    component dff_reset
    port(
        d       :   in  std_logic;
        clk     :   in  std_logic;
        reset   :   in  std_logic;
        Gnd     :   in  std_logic;
        q       :   out std_logic;
        qbar    :   out std_logic
    );
    end component;

    component or2
    port(
        in1     :   in  std_logic;
        in2     :   in  std_logic;  
        out1    :   out std_logic
    );
    end component;    

    component or3
    port(
        in1     :   in  std_logic;
        in2     :   in  std_logic;
        in3     :   in  std_logic;
        out1    :   out std_logic
    );
    end component;

    component or5
    port(
        in1     :   in  std_logic;
        in2     :   in  std_logic;
        in3     :   in  std_logic;
        in4     :   in  std_logic;
        in5     :   in  std_logic;
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

    component xor2
    port(
        in1     :   in  std_logic;
        in2     :   in  std_logic;
        out1    :   out std_logic
    );
    end component;

    component and3
    port(
        in1     :   in  std_logic;
        in2     :   in  std_logic;
        in3     :   in  std_logic;
        out1    :   out std_logic
    );
    end component;

    component invX1
    port(
        in1     :   in  std_logic;
        out1    :   out std_logic
    );
    end component;

    component srff
    port(
        s   :   in  std_logic;
        r   :   in  std_logic;
        clk :   in  std_logic;
        q   :   out std_logic;
        qbar:   out std_logic
    );
    end component;

    --rd_wr_hit_miss_reg output signals
    signal r_rd_hit     :   std_logic;
    signal r_wr_hit     :   std_logic;
    signal r_rd_miss    :   std_logic;
    signal r_wr_miss    :   std_logic;


    --hit miss latch signals
    signal hm_latch     :   std_logic;
    signal ncount1      :   std_logic;

    --busy SR latch signal
    signal busy_in      :   std_logic;

    --reset signals
    signal busy_reset   :   std_logic := '0';
    signal busy_reg_rst :   std_logic;
    signal sr_reset     :   std_logic;

    --logic signals to set busy_reset
    signal wr_miss_or_rd_hit    :   std_logic;
    signal wr_and_clk2          :   std_logic;
    signal rm_and_clk18         :   std_logic;
    signal rh_and_clk1          :   std_logic;    

    --sr signals
    signal n_busy               :   std_logic;
    signal enable_clk           :   std_logic;
    signal enabled_clk          :   std_logic;
    signal nbusy_reg_reset      :   std_logic;
    signal sr_input             :   std_logic;
    
    signal count        :   std_logic_vector(0 to 17);

    --write signals
    signal n_1          :   std_logic;
    signal n_10         :   std_logic;
    signal n_12         :   std_logic;
    signal n_14         :   std_logic;
    signal n_16         :   std_logic;
    signal n_17         :   std_logic;
    signal w0           :   std_logic;
    signal w1           :   std_logic;
    signal w2           :   std_logic;
    signal w3           :   std_logic;

    --internal busy
    signal busy_internal:   std_logic := '0'; 

    signal done_counting:   std_logic;

    signal rd_operation :   std_logic;
    signal cdout_en     :   std_logic;    
    signal s_mem_enable :   std_logic;

    signal r_rd_wr      :   std_logic;
    signal read_miss_wr :   std_logic;

    signal cache_wr0    :   std_logic;
    signal cache_wr1    :   std_logic;
    signal cache_wr2    :   std_logic;
    signal cache_wr_hit :   std_logic;

begin

    busy <= busy_internal;

    --cache write logic
    rm_write0   :   or2     port map(w0, w1, cache_wr0);
    rm_write1   :   or2     port map(w2, w3, cache_wr1);
    wh_write    :   and3    port map(r_wr_hit, count(0), n_1, cache_wr_hit);
    cache_wr    :   or3     port map(cache_wr0, cache_wr1, cache_wr_hit, cache_write);
    wr_rm       :   and2    port map(count(7), n_17, rm_wr_en);    

    SR          :   or2     port map(busy_internal, start, busy_in);

    rwrhm_reg   :   rd_wr_hit_miss_reg  port map(rd_wr, start, hit_miss, hm_latch, clk, reset, Gnd, rd_wr_o, r_rd_hit, r_wr_hit, r_rd_miss, r_wr_miss);
    not_busy    :   invX1   port map(busy_internal, n_busy);

    --logic for resetting busy
    wrh_or_wrm  :   or2     port map(r_wr_hit, r_wr_miss, wr_miss_or_rd_hit);
    reset_and1  :   and2    port map(wr_miss_or_rd_hit, count(1), wr_and_clk2);
    reset_and2  :   and2    port map(count(17), r_rd_miss, rm_and_clk18);
    reset_and3  :   and2    port map(count(0), r_rd_hit, rh_and_clk1);
    busy_rst    :   or3     port map(wr_and_clk2, rm_and_clk18, rh_and_clk1, busy_reset);

    --enables counting
    en          :   or3     port map(busy_internal, reset, busy_reset, enable_clk);
    enable      :   and2    port map(clk, enable_clk, enabled_clk);

    --holds busy state
    busy_reg    :   srff    port map(sr_input, busy_reg_rst, clk, busy_internal, open);

    --counts clocks
    counter     :   SR18    port map(enabled_clk, n_busy, Vdd, Gnd, count(0 to 17));

    --reset_signals
    rst_busy    :   or2     port map(busy_reset, reset, busy_reg_rst);
    rst_sr      :   or2     port map(n_busy, reset, sr_reset);

    nbusy_rst   :   invX1   port map(busy_reg_rst, nbusy_reg_reset);
    srin        :   and2    port map(nbusy_reg_reset, busy_in, sr_input);

    --write signals
    n10         :   invX1   port map(count(10), n_10);
    n12         :   invX1   port map(count(12), n_12);
    n14         :   invX1   port map(count(14), n_14);
    n16         :   invX1   port map(count(16), n_16);
    n17         :   invX1   port map(count(17), n_17);

    w0out       :   and2    port map(count(9), n_10, w0);
    w1out       :   and2    port map(count(11), n_12, w1);
    w2out       :   and2    port map(count(13), n_14, w2);
    w3out       :   and2    port map(count(15), n_16, w3);

    write_0 <=  w0;
    write_1 <=  w1;
    write_2 <=  w2;
    write_3 <=  w3;

    rd_op       :   or2     port map(r_rd_miss, r_rd_hit, rd_operation);
    dout_set_en :   and2    port map(busy_reset, rd_operation, cdout_en);
    dout_en     :   dff_reset   port map(cdout_en, clk, reset, Gnd, cpu_dout_en, open);

    nc1         :   invX1   port map(count(1), n_1);
    mem_en      :   and3    port map(count(0), r_rd_miss, n_1, s_mem_enable);
    mem_en_reg  :   dff_reset   port map(s_mem_enable, clk, reset, Gnd, mem_enable, open);

    write_wh    :   and3    port map(r_wr_hit, count(0), n_1, wr_hit);

    --hit_miss_latch signals
    hml         :   and2    port map(count(0), n_1, hm_latch);
end structural;
