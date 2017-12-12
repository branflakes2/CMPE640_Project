library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity Decoder is
    port(
        Mem_Add :   in  std_logic_vector(4 downto 0);
        Col_En  :   out std_logic_vector(3 downto 0);
        Row_En  :   out std_logic_vector(7 downto 0)
    );
end Decoder;

architecture structural of Decoder is

    component nor3
    port(
        in1     :   in  std_logic;
        in2     :   in  std_logic;
        in3     :   in  std_logic;
        out1    :   out  std_logic
    );
    end component;

    component nor2
    port(
        in1     :   in  std_logic;
        in2     :   in  std_logic;
        out1    :   out std_logic
    );
    end component;
    
    component invX1
    port(
        in1     :   in  std_logic;
        out1    :   out std_logic
    );
    end component;

    signal nMem_Add :   std_logic_vector(4 downto 0);
    
    for inv0, inv1, inv2, inv3, inv4    :   invX1   use entity work.invX1(structural);
    for r_off0, r_off1, r_off2, r_off3, r_off4, r_off5, r_off6, r_off7  :   nor3    use entity work.nor3(structural);
    for by_off0, by_off1, by_off2, by_off3  :   nor2    use entity work.nor2(structural);

begin

    inv0    :   invX1   port map(Mem_Add(0), nMem_Add(0));
    inv1    :   invX1   port map(Mem_Add(1), nMem_Add(1));
    inv2    :   invX1   port map(Mem_Add(2), nMem_Add(2));
    inv3    :   invX1   port map(Mem_Add(3), nMem_Add(3));
    inv4    :   invX1   port map(Mem_Add(4), nMem_Add(4));

    r_off0  :   nor3    port map(Mem_Add(4), Mem_Add(3), Mem_Add(2), Row_En(0));
    r_off1  :   nor3    port map(Mem_Add(4), Mem_Add(3), nMem_Add(2), Row_En(1));
    r_off2  :   nor3    port map(Mem_Add(4), nMem_Add(3), Mem_Add(2), Row_En(2));
    r_off3  :   nor3    port map(Mem_Add(4), nMem_Add(3), nMem_Add(2), Row_En(3));
    r_off4  :   nor3    port map(nMem_Add(4), Mem_Add(3), Mem_Add(2), Row_En(4));
    r_off5  :   nor3    port map(nMem_Add(4), Mem_Add(3), nMem_Add(2), Row_En(5));
    r_off6  :   nor3    port map(nMem_Add(4), nMem_Add(3), Mem_Add(2), Row_En(6));
    r_off7  :   nor3    port map(nMem_Add(4), nMem_Add(3), nMem_Add(2), Row_En(7));

    by_off0 :   nor2    port map(Mem_Add(1), Mem_Add(0), Col_En(0));
    by_off1 :   nor2    port map(Mem_Add(1), nMem_Add(0), Col_En(1));
    by_off2 :   nor2    port map(nMem_Add(1), Mem_Add(0), Col_En(2));
    by_off3 :   nor2    port map(nMem_Add(1), nMem_Add(0), Col_En(3));

end structural;
