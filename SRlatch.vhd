library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SRlatch is
    Port ( s : in    STD_LOGIC;
           r : in    STD_LOGIC;
           q : out STD_LOGIC); -- changed out to inout
end SRlatch;

architecture structural of SRlatch is
signal notQ : STD_LOGIC;
signal q2   :   std_logic;
begin

q <= q2;
q2    <= r nor notQ;
notQ <= s nor q2;

end structural;
