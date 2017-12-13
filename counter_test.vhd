-- Entity: chip_full_test 
-- Architecture : test 
-- Author: cpatel2
-- Created On: 11/01/05
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use IEEE.std_logic_arith.all;
use STD.textio.all;
  
entity counter_test is
  
end counter_test;
  
architecture test of counter_test is

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
    end component;
  
    shared variable done    :   boolean := false;

  signal Vdd, Gnd: std_logic;
    signal clk, clock, hit_miss, rd_wr, start, reset, busy, rd_wr_o, cache_write, rm_wr_en, wr_hit, cpu_dout_en, mem_enable, write_0, write_1, write_2, write_3  : std_logic;
  signal clk_count: integer:=0;

procedure print_output is
   variable out_line: line;

   begin
   write (out_line, string' (" Clock: "));
   write (out_line, clk_count);
   write (out_line, string'(" CPU Hit/Miss: "));
   write (out_line, hit_miss);
   write (out_line, string'(" Cpu Read/Write: "));
   write (out_line, rd_wr);
   write (out_line, string'(" Reset: "));
   write (out_line, reset);
   writeline(output, out_line);

   write (out_line, string' (" Busy: "));
   write (out_line, busy);
   write (out_line, string'(" Rd_Wr_o: "));
   write (out_line, rd_wr_o);
    write (out_line, string'(" Cache_Write: "));
    write (out_line, cache_write);
    write (out_line, string'(" rm_wr_en: "));
    write (out_line, rm_wr_en);
    write (out_line, string'(" wr_hit: "));
    write (out_line, wr_hit);
    write (out_line, string'(" cpu_dout_en: "));
    write (out_line, cpu_dout_en);
    write (out_line, string'(" mem_enable: "));
    write (out_line, mem_enable);
    write (out_line, string'(" write_0: "));
    write (out_line, write_0);
    write (out_line, string'(" write_1: "));
    write (out_line, write_1);
    write (out_line, string'(" write_2: "));
    write (out_line, write_2);
    write (out_line, string'(" write_3: "));
    write (out_line, write_3);
    writeline(output, out_line); 

   write (out_line, string'(" ----------------------------------------------"));
   writeline(output, out_line);

   
end print_output;

for c1 : Counter use entity work.Counter(structural);

begin

  Vdd <= '1';
  Gnd <= '0';
  clk <= clock;
  
    c1  :   Counter port map(clock, hit_miss, rd_wr, start, Vdd, Gnd, reset, busy, rd_wr_o, cache_write, rm_wr_en, wr_hit, cpu_dout_en, mem_enable, write_0, write_1, write_2, write_3); 

  clking : process
  begin
    if  done = true then
        wait;
    else
        clock<= '1', '0' after 5 ns;
        wait for 10 ns;
    end if;
  end process clking;
  
  io_process: process

    file infile  : text is "./counter_test.txt";
    variable buf: line;
    variable value: std_logic_vector(7 downto 0);
    variable value1: std_logic;
    
  begin

    while not (endfile(infile)) loop
      
      wait until rising_edge(clock);
      
      readline(infile, buf);
      
      readline(infile, buf);
      read(buf, value1);
      hit_miss <= value1;      

      readline(infile, buf);
      read(buf, value1);
      rd_wr <= value1;      

      readline(infile, buf);
      read(buf, value1);
      start <= value1;      

      readline(infile, buf);
      read(buf, value1);
      reset <= value1;      

      clk_count <= clk_count+1;

      

    end loop;
    done := true;
    wait;
      
  end process io_process;

print_process: process

  variable out_line: line;

begin

  wait until ((falling_edge(clk) and start = '1') or busy'EVENT or write_0'EVENT or write_1'EVENT or write_2'EVENT or write_3'EVENT or cache_write'EVENT);
  wait for 1 ns;
  print_output;

end process print_process;

end test;
