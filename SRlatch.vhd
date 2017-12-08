library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SRlatch is
    Port ( s : in    STD_LOGIC;
           r : in    STD_LOGIC;
           q : out STD_LOGIC); -- changed out to inout
end SRlatch;

architecture structural of SRlatch is
begin
    p   :   process(s, r)
    begin
        if r = '1' then 
            q <= '0';
        elsif s = '1' then
            q <= '1';
        end if;
    end process;

end structural;
