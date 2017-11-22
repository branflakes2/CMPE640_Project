library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity Hit_Miss is
    port(
        tag1    :   in  std_logic_vector(2 downto 0);
        tag2    :   in  std_logic_vector(2 downto 0);
        Valid   :   in  std_logic;
        HitMiss :   out std_logic
    );
end Hit_Miss;

architecture structural of Hit_Miss is

    component Compare
    port(
        in1     :   in  std_logic_vector(2 downto 0);
        in2     :   in  std_logic_vector(2 downto 0);
        out1    :   out std_logic
    );
    end component;

    component and2
    port(
        in1     :   in  std_logic;
        in2     :   in  std_logic;
        out1    :   out std_logic
    );
    end component;

    signal comp_out  :   std_logic;
    
begin

    comp    :   Compare port map(tag1, tag2, comp_out);
    v       :   and2    port map(comp_out, valid, HitMiss);

end structural;
