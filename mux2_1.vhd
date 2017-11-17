library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity mux2_1 is
port(
    in1     :   in  std_logic;
    in2     :   in  std_logic;
    sel     :   in  std_logic;
    out1    :   out std_logic
);
end mux2_1;

architecture structural of mux2_1 is
    
    component and2
    port(
        in1     :   in  std_logic;
        in2     :   in  std_logic;
        out1    :   out std_logic
    );
    end component;

    component or2
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

    signal n_sel        :   std_logic;
    signal and1_out     :   std_logic;
    signal and2_out     :   std_logic;

begin
    
    inv     :   invX1   port map(sel,       n_sel);   
    and_1   :   and2    port map(in1,       n_sel,        and1_out);
    and_2   :   and2    port map(in2,       sel,      and2_out);
    o       :   or2     port map(and1_out,  and2_out,  out1); 
 
end structural;
