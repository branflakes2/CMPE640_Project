library STD;
library IEEE;                      
use IEEE.std_logic_1164.all;       

entity dff_reset_high is                      
    port(
        d       :   in  std_logic;
        clk     :   in  std_logic;
        reset   :   in  std_logic;
        Gnd     :   in  std_logic;
        q       :   out std_logic;
        qbar    :   out std_logic
    ); 
end dff_reset_high;                          

architecture structural of dff_reset_high is 

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

    component invX1
    port(
        in1     :   in  std_logic;
        out1    :   out std_logic
    );  
    end component;

    signal mux_out  :   std_logic;
    signal n_clk    :   std_logic;  

begin
    
    asdf    :   invX1   port map(clk, n_clk);
    mux     :   mux2_1  port map(d, Gnd, reset,  mux_out);
    dl      :   dff     port map(mux_out, n_clk, q, qbar);
 
end structural;
