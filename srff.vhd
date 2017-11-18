--
-- Entity: dff
-- Architecture : structural
-- Author: cpatel2
--
--
library STD;
library IEEE;                      
use IEEE.std_logic_1164.all;       

entity srff is                      
port ( 
    s   :   in  std_logic;
    r   :   in  std_logic;
    clk :   in  std_logic;
    q   :   out std_logic;
    qbar:   out std_logic
    ); 
end srff;                          

architecture structural of srff is 
    
begin
    output: process                 
    begin                           
        wait until ( clk'EVENT and clk = '0' ); 
        if s = '1' and r = '0' then
            q <= '1';
            qbar <= '0';
        elsif r = '1' and s = '0' then
            q <= '0';
            qbar <= '1';
        elsif r = '1' and s = '1' then
            q <= 'U';
            qbar <= 'U';
        end if;
    end process output;            
end structural;
