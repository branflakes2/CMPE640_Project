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
  
entity cache_cell_valid_test is
  
end cache_cell_valid_test;
  
architecture test of cache_cell_valid_test is

    component Cache_Cell_Valid is
    port(
        s       :   in  std_logic;
        r       :   in  std_logic;
        Rd_En   :   in  std_logic;
        Wr_En   :   in  std_logic;
        q       :   out std_logic
    );
    end component;

    shared variable done    :   boolean := false;

    signal Vdd, Gnd: std_logic;
    signal clk_count: integer:=0;
    signal s, r, Rd_En, Wr_En, q    :   std_logic;
    signal clk  :   std_logic;

procedure print_output is
    variable out_line: line;

    begin
        write (out_line, string' (" Clock: "));
        write (out_line, clk_count);
        write (out_line, string'(" S: "));
        write (out_line, s);
        write (out_line, string'(" R: "));
        write (out_line, r);
        write (out_line, string'(" Rd_En: "));
        write (out_line, Rd_En);
        write (out_line, string'(" Wr_En: "));
        write (out_line, Wr_En); 
        writeline(output, out_line);

        write (out_line, string' (" Q: "));
        write (out_line, q);
        writeline(output, out_line);   

        write (out_line, string'(" ----------------------------------------------"));
        writeline(output, out_line);

   
end print_output;

for asdf :  Cache_Cell_Valid use entity work.Cache_Cell_Valid(structural);


begin

  Vdd <= '1';
  Gnd <= '0';
    
    
    asdf    :   Cache_Cell_Valid port map(s, r, Rd_En, Wr_En, q);

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

    file infile  : text is "./cache_cell_valid_test.txt";
    variable buf: line;
    variable value: std_logic_vector(7 downto 0);
    variable value1: std_logic;
    
begin

    while not (endfile(infile)) loop
      
        wait until falling_edge(clk);
      
        readline(infile, buf);
         
        readline(infile, buf);
        read(buf, value1);
        s <= value1;

        readline(infile, buf);
        read(buf, value1);
        r <= value1;
    
        readline(infile, buf);
        read(buf, value1);
        Rd_En <= value1;

        readline(infile, buf);
        read(buf, value1);
        Wr_En <= value1;      

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
