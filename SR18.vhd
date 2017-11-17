library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity SR8 is
    port(
        clk     :   in  std_logic;
        reset   :   in  std_logic;  
        Vdd     :   in  std_logic;
        output  :   out std_logic_vector(0 to 17)
    );
end SR8;

architecture structural of SR8 is

    component Dlatch_Reset
    port(
        d       :   in  std_logic;
        clk     :   in  std_logic;
        reset   :   in  std_logic;
        q       :   out std_logic;
        qbar    :   out std_logic
    );
    end component;
    
    signal out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, out15, out16, out17, out18   :   std_logic := '0';
 
begin
    
    r0  :   Dlatch_Reset    port map(Vdd,   clk,    reset,  out1,   open);
    r1  :   Dlatch_Reset    port map(out1,  clk,    reset,  out2,   open);
    r2  :   Dlatch_Reset    port map(out2,  clk,    reset,  out3,   open);
    r3  :   Dlatch_Reset    port map(out3,  clk,    reset,  out4,   open);
    r4  :   Dlatch_Reset    port map(out4,  clk,    reset,  out5,   open);
    r5  :   Dlatch_Reset    port map(out5,  clk,    reset,  out6,   open);
    r6  :   Dlatch_Reset    port map(out6,  clk,    reset,  out7,   open);
    r7  :   Dlatch_Reset    port map(out7,  clk,    reset,  out8,   open);
    r8  :   Dlatch_Reset    port map(out8,  clk,    reset,  out9,   open);
    r9  :   Dlatch_Reset    port map(out9,  clk,    reset,  out10,   open);
    r10 :   Dlatch_Reset    port map(out10, clk,    reset,  out11,   open);
    r11 :   Dlatch_Reset    port map(out11, clk,    reset,  out12,   open);
    r12 :   Dlatch_Reset    port map(out12, clk,    reset,  out13,   open);
    r13 :   Dlatch_Reset    port map(out13, clk,    reset,  out14,   open);
    r14 :   Dlatch_Reset    port map(out14, clk,    reset,  out15,   open);
    r15 :   Dlatch_Reset    port map(out15, clk,    reset,  out16,   open);
    r16 :   Dlatch_Reset    port map(out16, clk,    reset,  out17,   open);
    r17 :   Dlatch_Reset    port map(out17, clk,    reset,  out18,  open);

    output(0)  <= out1;
    output(1)  <= out2;
    output(2)  <= out3;
    output(3)  <= out4;
    output(4)  <= out5;
    output(5)  <= out6;
    output(6)  <= out7;
    output(7)  <= out8;
    output(8)  <= out9;
    output(9)  <= out10;
    output(10) <= out11;
    output(11) <= out12;
    output(12) <= out13;
    output(13) <= out14;
    output(14) <= out15;
    output(15) <= out16;
    output(16) <= out17;
    output(17) <= out18;

end structural;
