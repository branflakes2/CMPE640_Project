library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity SR18 is
    port(
        clk     :   in  std_logic;
        reset   :   in  std_logic;  
        Vdd     :   in  std_logic;
        Gnd     :   in  std_logic;
        output  :   out std_logic_vector(0 to 17)
    );
end SR18;

architecture structural of SR18 is

    component dff_reset_high
    port(
        d       :   in  std_logic;
        clk     :   in  std_logic;
        reset   :   in  std_logic;
        Gnd     :   in  std_logic;
        q       :   out std_logic
    );
    end component;
    
    signal out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, out15, out16, out17, out18   :   std_logic := '0';
 
    for r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17  :   dff_reset_high use entity work.dff_reset_high(structural);

begin
    
    r0  :   dff_reset_high  port map(Vdd,   clk,    reset,  Gnd,    out1);
    r1  :   dff_reset_high  port map(out1,  clk,    reset,  Gnd,    out2);
    r2  :   dff_reset_high  port map(out2,  clk,    reset,  Gnd,    out3);
    r3  :   dff_reset_high  port map(out3,  clk,    reset,  Gnd,    out4);
    r4  :   dff_reset_high  port map(out4,  clk,    reset,  Gnd,    out5);
    r5  :   dff_reset_high  port map(out5,  clk,    reset,  Gnd,    out6);
    r6  :   dff_reset_high  port map(out6,  clk,    reset,  Gnd,    out7);
    r7  :   dff_reset_high  port map(out7,  clk,    reset,  Gnd,    out8);
    r8  :   dff_reset_high  port map(out8,  clk,    reset,  Gnd,    out9);
    r9  :   dff_reset_high  port map(out9,  clk,    reset,  Gnd,    out10);
    r10 :   dff_reset_high  port map(out10, clk,    reset,  Gnd,    out11);
    r11 :   dff_reset_high  port map(out11, clk,    reset,  Gnd,    out12);
    r12 :   dff_reset_high  port map(out12, clk,    reset,  Gnd,    out13);
    r13 :   dff_reset_high  port map(out13, clk,    reset,  Gnd,    out14);
    r14 :   dff_reset_high  port map(out14, clk,    reset,  Gnd,    out15);
    r15 :   dff_reset_high  port map(out15, clk,    reset,  Gnd,    out16);
    r16 :   dff_reset_high  port map(out16, clk,    reset,  Gnd,    out17);
    r17 :   dff_reset_high  port map(out17, clk,    reset,  Gnd,    out18);

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
