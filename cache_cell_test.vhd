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
  
entity cache_cell_test is
  
end cache_cell_test;
  
architecture test of cache_cell_test is

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

    shared variable done    :   boolean := false;

    signal Vdd, Gnd: std_logic;
    signal clk_count: integer:=0;
    signal Data, W_En, reset, Out1, Rd_En, nRd_En    :   std_logic;
    signal clk  :   std_logic;

procedure print_output is
    variable out_line: line;

    begin
        write (out_line, string' (" Clock: "));
        write (out_line, clk_count);
        write (out_line, string'(" Data: "));
        write (out_line, Data);
        write (out_line, string'(" W_En: "));
        write (out_line, W_En);
        write (out_line, string'(" Reset: "));
        write (out_line, reset);
        write (out_line, string'(" Rd_En: "));
        write (out_line, Rd_En); 
        write (out_line, string'(" nRd_En: "));
        write (out_line, nRd_En);
        writeline(output, out_line);

        write (out_line, string' (" Output: "));
        write (out_line, Out1);
        writeline(output, out_line);   

        write (out_line, string'(" ----------------------------------------------"));
        writeline(output, out_line);

   
end print_output;

for asdf :  Cache_Cell use entity work.Cache_Cell(structural);


begin

  Vdd <= '1';
  Gnd <= '0';
    
    
    asdf    :   Cache_Cell port map(Data, W_En, reset, Gnd, Out1, Rd_En, nRd_En);

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

    file infile  : text is "./cache_test.txt";
    variable buf: line;
    variable value: std_logic_vector(7 downto 0);
    variable value1: std_logic;
    
begin

    while not (endfile(infile)) loop
      
        wait until falling_edge(clk);
      
        readline(infile, buf);
         
        readline(infile, buf);
        read(buf, value1);
        Data <= value1;

        readline(infile, buf);
        read(buf, value1);
        W_En <= value1;
    
        readline(infile, buf);
        read(buf, value1);
        reset <= value1;

        readline(infile, buf);
        read(buf, value1);
        Rd_En <= value1;      

        readline(infile, buf);
        read(buf, value1);
        nRd_En <= value1;      

        wait until rising_edge(clk);

        readline(infile, buf);
        read(buf, value1);
        W_En <= value1;

        clk_count <= clk_count+1;
    end loop;
    done := true;
    wait;
      
end process io_process;

print_process: process

  variable out_line: line;

begin

  wait until clk'EVENT; 
  wait for 1 ns;
  print_output;

end process print_process;

end test;
