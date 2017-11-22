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

    component and3
    port(
        in1     :   in  std_logic;
        in2     :   in  std_logic;
        in3     :   in  std_logic;
        out1    :   out  std_logic
    );
    end component;

    component and2
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
    
begin

    inv0    :   invX1   port map(Mem_Add(0), nMem_Add(0));
    inv1    :   invX1   port map(Mem_Add(1), nMem_Add(1));
    inv2    :   invX1   port map(Mem_Add(2), nMem_Add(2));
    inv3    :   invX1   port map(Mem_Add(3), nMem_Add(3));
    inv4    :   invX1   port map(Mem_Add(4), nMem_Add(4));

    bl_off0 :   and3    port map(nMem_Add(4), nMem_Add(3), nMem_Add(2), Row_En(0));
    bl_off1 :   and3    port map(nMem_Add(4), nMem_Add(3), Mem_Add(2), Row_En(1));
    bl_off2 :   and3    port map(nMem_Add(4), Mem_Add(3), nMem_Add(2), Row_En(2));
    bl_off3 :   and3    port map(nMem_Add(4), Mem_Add(3), Mem_Add(2), Row_En(3));
    bl_off4 :   and3    port map(Mem_Add(4), nMem_Add(3), nMem_Add(2), Row_En(4));
    bl_off5 :   and3    port map(Mem_Add(4), nMem_Add(3), Mem_Add(2), Row_En(5));
    bl_off6 :   and3    port map(Mem_Add(4), Mem_Add(3), nMem_Add(2), Row_En(6));
    bl_off7 :   and3    port map(Mem_Add(4), Mem_Add(3), Mem_Add(2), Row_En(7));

    by_off0 :   and2    port map(nMem_Add(1), nMem_Add(0), Col_En(0));
    by_off1 :   and2    port map(nMem_Add(1), Mem_Add(0), Col_En(1));
    by_off2 :   and2    port map(Mem_Add(1), nMem_Add(0), Col_En(2));
    by_off3 :   and2    port map(Mem_Add(1), Mem_Add(0), Col_En(3));

end structural;
