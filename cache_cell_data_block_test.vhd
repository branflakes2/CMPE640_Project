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
  
entity cache_cell_data_block_test is
  
end cache_cell_data_block_test;
  
architecture test of cache_cell_data_block_test is

    component Cache_Cell_Data_Block
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
    end component;

    shared variable done    :   boolean := false;

    signal Vdd, Gnd: std_logic;
    signal clk_count: integer:=0;
    signal Data, out1   :   std_logic_vector(7 downto 0);
    signal W_En_r, W_En_c, reset, Rd_En_r, Rd_En_c  :   std_logic;
    signal clk  :   std_logic;

procedure print_output is
    variable out_line: line;

    begin
        write (out_line, string' (" Clock: "));
        write (out_line, clk_count);
        write (out_line, string'(" Data: "));
        write (out_line, Data);
        write (out_line, string'(" W_En_r: "));
        write (out_line, W_En_r);
        write (out_line, string'(" W_En_c: "));
        write (out_line, W_En_c);
        write (out_line, string'(" Rd_En_r: "));
        write (out_line, Rd_En_r); 
        write (out_line, string'(" Rd_En_c: "));
        write (out_line, Rd_En_c);
        write (out_line, string'(" Reset: "));
        write (out_line, Rd_En_c);
        writeline(output, out_line);

        write (out_line, string' (" Output: "));
        write (out_line, out1);
        writeline(output, out_line);   

        write (out_line, string'(" ----------------------------------------------"));
        writeline(output, out_line);

   
end print_output;

for asdf :  Cache_Cell_Data_Block use entity work.Cache_Cell_Data_Block(structural);


begin

  Vdd <= '1';
  Gnd <= '0';
    
    
    asdf    :   Cache_Cell_Data_Block port map(Data, W_En_r, W_En_c, reset, Gnd, out1, Rd_En_r, Rd_En_c);

  clking : process
  begin
    if  done = true then
        wait;
    else
        clk<= '1', '0' after 5 ns;
        wait for 10 ns;
    end if;
  end process clking;
  
  io_process: process

    file infile  : text is "./cache_cell_data_block_test.txt";
    variable buf: line;
    variable value: std_logic_vector(7 downto 0);
    variable value1: std_logic;
    
begin

    while not (endfile(infile)) loop
      
        wait until falling_edge(clk);
      
        readline(infile, buf);
         
        readline(infile, buf);
        read(buf, value);
        Data <= value;

        readline(infile, buf);
        read(buf, value1);
        W_En_r <= value1;
    
        readline(infile, buf);
        read(buf, value1);
        W_En_c <= value1;

        readline(infile, buf);
        read(buf, value1);
        reset <= value1;      

        readline(infile, buf);
        read(buf, value1);
        Rd_En_r <= value1;      

        readline(infile, buf);
        read(buf, value1);
        Rd_En_c <= value1;      

        clk_count <= clk_count+1;
    end loop;
    done := true;
    wait;
      
end process io_process;

print_process: process

  variable out_line: line;

begin

  wait until falling_edge(clk); 
  wait for 1 ns;
  print_output;

end process print_process;

end test;
