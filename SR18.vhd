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
        q       :   out std_logic;
        qbar    :   out std_logic
    );
    end component;
    
    signal out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, out15, out16, out17, out18   :   std_logic := '0';
 
begin
    
    r0  :   dff_reset_high  port map(Vdd,   clk,    reset,  Gnd,    out1,   open);
    r1  :   dff_reset_high  port map(out1,  clk,    reset,  Gnd,    out2,   open);
    r2  :   dff_reset_high  port map(out2,  clk,    reset,  Gnd,    out3,   open);
    r3  :   dff_reset_high  port map(out3,  clk,    reset,  Gnd,    out4,   open);
    r4  :   dff_reset_high  port map(out4,  clk,    reset,  Gnd,    out5,   open);
    r5  :   dff_reset_high  port map(out5,  clk,    reset,  Gnd,    out6,   open);
    r6  :   dff_reset_high  port map(out6,  clk,    reset,  Gnd,    out7,   open);
    r7  :   dff_reset_high  port map(out7,  clk,    reset,  Gnd,    out8,   open);
    r8  :   dff_reset_high  port map(out8,  clk,    reset,  Gnd,    out9,   open);
    r9  :   dff_reset_high  port map(out9,  clk,    reset,  Gnd,    out10,  open);
    r10 :   dff_reset_high  port map(out10, clk,    reset,  Gnd,    out11,  open);
    r11 :   dff_reset_high  port map(out11, clk,    reset,  Gnd,    out12,  open);
    r12 :   dff_reset_high  port map(out12, clk,    reset,  Gnd,    out13,  open);
    r13 :   dff_reset_high  port map(out13, clk,    reset,  Gnd,    out14,  open);
    r14 :   dff_reset_high  port map(out14, clk,    reset,  Gnd,    out15,  open);
    r15 :   dff_reset_high  port map(out15, clk,    reset,  Gnd,    out16,  open);
    r16 :   dff_reset_high  port map(out16, clk,    reset,  Gnd,    out17,  open);
    r17 :   dff_reset_high  port map(out17, clk,    reset,  Gnd,    out18,  open);

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
