LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY dff IS
    PORT(
        input: IN STD_LOGIC;
        clk: IN STD_LOGIC;
        output: OUT STD_LOGIC
    );
END ENTITY dff;


ARCHITECTURE dff_arch OF dff IS
    SIGNAL not_input: STD_LOGIC;
    SIGNAL s: STD_LOGIC;
    SIGNAL r: STD_LOGIC;
    SIGNAL q: STD_LOGIC;
    SIGNAL q_bar: STD_LOGIC;
BEGIN
    not_comp: ENTITY work.not_gate(not_gate_arch)
        PORT MAP(input => input, output => not_input);
    s_and: ENTITY work.and_gate(and_gate_arch)
        PORT MAP(a => not_input, b => clk, output => s);
    r_and: ENTITY work.and_gate(and_gate_arch)
        PORT MAP(a => input, b => clk, output => r);
    s_nor: ENTITY work.nor_gate(nor_gate_arch)
        PORT MAP(a => s, b => q_bar, output => q);
    r_nor: ENTITY work.nor_gate(nor_gate_arch)
        PORT MAP(a => r, b => q, output => q_bar);

    output <= q;
END ARCHITECTURE dff_arch;
