library std;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity decoder_test is

end decoder_test;

architecture test of decoder_test is

    component Decoder
    port(
        Mem_Add :   in  std_logic_vector(4 downto 0);
        Col_En  :   out std_logic_vector(3 downto 0);
        Row_en  :   out std_logic_vector(7 downto 0)
    );
    end component;

    for d1  :   Decoder use entity work.Decoder(structural);
    
    signal Mem_Add  :   std_logic_vector(4 downto 0);
    signal Col_En   :   std_logic_vector(3 downto 0);
    signal Row_En   :   std_logic_vector(7 downto 0);

    begin

    d1  :   Decoder port map(Mem_Add, Col_En, Row_En);

    io_process  :   process
        
        file infile     :   text is "./decoder_test.txt";
        variable buf    :   line;
        variable outline:   line;
        variable value4 :   std_logic_vector(3 downto 0);
        variable value5 :   std_logic_vector(4 downto 0);
        variable value8 :   std_logic_vector(7 downto 0);    

    begin
        
        while not (endfile(infile)) loop

            readline(infile, buf);
            read(buf, value5);
            Mem_Add <= value5;
            wait for 1 ns;
            write(outline, string'("Mem_Add: "));
            write(outline, Mem_Add);
            write(outline, string'(" Col_En: "));
            write(outline, Col_En);
            write(outline, string'(" Row_En: "));
            write(outline, Row_En);
            writeline(output, outline);
            
        end loop;
        wait;
    
    end process;

end test;
    

