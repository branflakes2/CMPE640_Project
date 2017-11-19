library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity SRlatch is
    port(
        s   :   in  std_logic;
        r   :   in  std_logic;
        q   :   out std_logic
    );
end SRlatch;

architecture structural of SRlatch is

begin

    p   :   process(s, r)
    begin
        if s = '1' and r = '0' then
            q   <= '1';
        elsif s = '0' and r = '1' then
            q   <= '0';
        elsif s = '1' and r = '1' then
            q   <= 'U';
        end if;
    end process;
end structural;

