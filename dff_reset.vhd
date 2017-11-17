library STD;
library IEEE;                      
use IEEE.std_logic_1164.all;       

entity dff_reset is                      
    port(
        d       :   in  std_logic;
        clk     :   in  std_logic;
        reset   :   in  std_logic;
        q       :   out std_logic;
        qbar    :   out std_logic
    ); 
end dff_reset;                          

architecture structural of dff_reset is 

    component dff 
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
  
begin
  
    mux     :   mux2_1  port map(d,         '0',    reset,  mux_out);
    dl      :   dff     port map(mux_out,   clk,    q,      qbar);
 
end structural;
