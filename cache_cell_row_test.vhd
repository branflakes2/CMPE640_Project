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
  
entity cache_cell_row_test is
  
end cache_cell_row_test;
  
architecture test of cache_cell_row_test is

    component Cache_Cell_Row is
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

    shared variable done    :   boolean := false;

    signal Vdd, Gnd: std_logic;
    signal clk_count: integer:=0;
    signal Data_In, Data_Out   :   std_logic_vector(7 downto 0);
    signal Tag_In, Tag_Out      :   std_logic_vector(2 downto 0);
    signal Set_Valid, Col0_Rd_En, Col1_Rd_En, Col2_Rd_En, Col3_Rd_En, Col0_Wr_En, Col1_Wr_En, Col2_Wr_En, Col3_Wr_En, Tag_Wr_En, Row_Rd_En, Row_Wr_En, Row_En, reset, Valid_Out  :   std_logic;
    signal clk  :   std_logic;

procedure print_output is
    variable out_line: line;

    begin
        write (out_line, string' (" Clock: "));
        write (out_line, clk_count);
        write (out_line, string'(" Data_In: "));
        write (out_line, Data_In);
        write (out_line, string'(" Tag_In: "));
        write (out_line, Tag_In);
        write (out_line, string'(" Set_Valid: "));
        write (out_line, Set_Valid);
        writeline(output, out_line);
        write (out_line, string'(" Col0_Rd_En: "));
        write (out_line, Col0_Rd_En); 
        write (out_line, string'(" Col1_Rd_En: "));
        write (out_line, Col1_Rd_En); 
        write (out_line, string'(" Col2_Rd_En: "));
        write (out_line, Col2_Rd_En); 
        write (out_line, string'(" Col3_Rd_En: "));
        write (out_line, Col3_Rd_En); 
        write (out_line, string'(" Col0_Wr_En: "));
        write (out_line, Col0_Wr_En); 
        write (out_line, string'(" Col1_Wr_En: "));
        write (out_line, Col1_Wr_En); 
        write (out_line, string'(" Col2_Wr_En: "));
        write (out_line, Col2_Wr_En); 
        write (out_line, string'(" Col3_Wr_En: "));
        write (out_line, Col3_Wr_En); 
        writeline(output, out_line);
        write (out_line, string'(" Tag_Wr_En: "));
        write (out_line, Tag_Wr_En);
        write (out_line, string'(" Row_Rd_En: "));
        write (out_line, Row_Rd_En);
        write (out_line, string'(" Row_Wr_En: "));
        write (out_line, Row_Wr_En);
        write (out_line, string'(" Row_En: "));
        write (out_line, Row_En);
        write (out_line, string'(" reset: "));
        write (out_line, reset);
        writeline(output, out_line);
        write (out_line, string'(" Data_Out: "));
        write (out_line, Data_Out);
        write (out_line, string'(" Tag_Out: "));
        write (out_line, Tag_Out);
        write (out_line, string'(" Valid_Out: "));
        write (out_line, Valid_Out);
        writeline(output, out_line);
        write (out_line, string'(" ----------------------------------------------"));
        writeline(output, out_line);

   
end print_output;

for asdf :  Cache_Cell_Row use entity work.Cache_Cell_Row(structural);


begin

  Vdd <= '1';
  Gnd <= '0';
    
    
    asdf    :   Cache_Cell_Row port map(Data_In, Tag_In, Set_Valid, Col0_Rd_En,Col1_Rd_En, Col2_Rd_En, Col3_Rd_En, Col0_Wr_En, Col1_Wr_En, Col2_Wr_En, Col3_Wr_En, Tag_Wr_En, Row_Rd_En, Row_Wr_En, Row_En, Gnd, reset, Data_Out, Tag_Out, Valid_Out);

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

    file infile  : text is "./cache_cell_row_test.txt";
    variable buf: line;
    variable value: std_logic_vector(7 downto 0);
    variable value3:    std_logic_vector(2 downto 0);
    variable value1: std_logic;
    
begin

    while not (endfile(infile)) loop
      
        wait until falling_edge(clk);
      
        readline(infile, buf);
         
        readline(infile, buf);
        read(buf, value);
        Data_In <= value;

        readline(infile, buf);
        read(buf, value3);
        Tag_In <= value3;
    
        readline(infile, buf);
        read(buf, value1);
        Set_Valid <= value1;        

        readline(infile, buf);
        read(buf, value1);
        Col0_Rd_En <= value1;      

        readline(infile, buf);
        read(buf, value1);
        Col1_Rd_En <= value1;      

        readline(infile, buf);
        read(buf, value1);
        Col2_Rd_En <= value1;      

        readline(infile, buf);
        read(buf, value1);
        Col3_Rd_En <= value1;      

        readline(infile, buf);
        read(buf, value1);
        Col0_Wr_En <= value1;      

        readline(infile, buf);
        read(buf, value1);
        Col1_Wr_En <= value1;      

        readline(infile, buf);
        read(buf, value1);
        Col2_Wr_En <= value1;      

        readline(infile, buf);
        read(buf, value1);
        Col3_Wr_En <= value1;      

        readline(infile, buf);
        read(buf, value1);
        Tag_Wr_En <= value1;

        readline(infile, buf);
        read(buf, value1);
        Row_Rd_En <= value1;

        readline(infile, buf);
        read(buf, value1);
        Row_Wr_En <= value1;

        readline(infile, buf);
        read(buf, value1);
        Row_En <= value1;

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

  wait until falling_edge(clk); 
  wait for 1 ns;
  print_output;

end process print_process;

end test;
