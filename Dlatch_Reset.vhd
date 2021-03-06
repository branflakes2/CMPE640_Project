library STD;
library IEEE;                      
use IEEE.std_logic_1164.all;       

entity Dlatch_Reset is                      
    port(
        d       :   in  std_logic;
        clk     :   in  std_logic;
        reset   :   in  std_logic;
        Gnd     :   in  std_logic;
        q       :   out std_logic
    ); 
end Dlatch_Reset;                          

architecture structural of Dlatch_Reset is 

    component Dlatch 
    port(
        d       :   in  std_logic;
        clk     :   in  std_logic;
        q       :   out std_logic;
        qbar    :   out std_logic
    );
    end component;

    component mux2_1
    port(
        in1     :   in  std_logic;
        in2     :   in  std_logic;
        sel     :   in  std_logic;
        out1    :   out std_logic
    );
    end component;

    signal mux_out  :   std_logic;
  
    for mux : mux2_1 use entity work.mux2_1(structural);
    for dl  : Dlatch use entity work.Dlatch(structural);

begin
  
    mux     :   mux2_1  port map(d,         Gnd,    reset,  mux_out);
    dl      :   Dlatch  port map(mux_out,   clk,    q, open);
 
end structural;
