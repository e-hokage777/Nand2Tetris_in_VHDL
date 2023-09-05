LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY bit IS
    PORT(
        input: IN STD_LOGIC;
        load: IN STD_LOGIC;
        clk: IN STD_LOGIC;
        output: OUT STD_LOGIC
    );
END ENTITY bit;

ARCHITECTURE bit_arch OF bit IS
    SIGNAL final_input: STD_LOGIC;
    SIGNAL state: STD_LOGIC;
    SIGNAL not_clk: STD_LOGIC;
BEGIN
    mux_comp: ENTITY work.mux(mux_arch)
        PORT MAP(a => state, b => input, sel => load, output => final_input);
    dff_comp: ENTITY work.dff(dff_arch)
        PORT MAP(input => final_input, clk => clk, output => state);
    not_comp: ENTITY work.not_gate(not_gate_arch)
        PORT MAP(input => clk, output => not_clk);
    out_dff: ENTITY work.dff(dff_arch)
        PORT MAP(input => state, clk => not_clk, output => output);
END ARCHITECTURE bit_arch;