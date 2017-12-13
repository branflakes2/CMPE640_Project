library std;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity hit_miss_test is

end hit_miss_test;

architecture test of hit_miss_test is

    component Hit_Miss
    port(
        tag1    :   in  std_logic_vector(2 downto 0);
        tag2    :   in  std_logic_vector(2 downto 0);
        Valid   :   in  std_logic;
        HitMiss :   out std_logic
    );
    end component;

    for d1  :   Hit_Miss use entity work.Hit_Miss(structural);
    
    signal tag1, tag2       :   std_logic_vector(2 downto 0);
    signal Valid, HitMiss   :   std_logic;

    begin

    d1  :   Hit_Miss port map(tag1, tag2, Valid, HitMiss);

    io_process  :   process
        
        file infile     :   text is "./hit_miss_test.txt";
        variable buf    :   line;
        variable outline:   line;
        variable value3 :   std_logic_vector(2 downto 0);
        variable value1 :   std_logic;

    begin
        
        while not (endfile(infile)) loop

            readline(infile, buf);
            read(buf, value3);
            tag1 <= value3;
            readline(infile, buf);
            read(buf, value3);
            tag2 <= value3;
            readline(infile, buf);
            read(buf, value1);
            Valid <= value1;
            wait for 1 ns;
            write(outline, string'("tag1: "));
            write(outline, tag1);
            write(outline, string'(" tag2: "));
            write(outline, tag2);
            write(outline, string'(" valid: "));
            write(outline, Valid);
            write(outline, string'(" hit_miss: "));
            write(outline, HitMiss);
            writeline(output, outline);
            
        end loop;
        wait;
    
    end process;

end test;
    

