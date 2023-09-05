LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY dmux IS
    PORT (
        input : IN STD_LOGIC;
        sel : IN STD_LOGIC;
        out0 : OUT STD_LOGIC;
        out1 : OUT STD_LOGIC
    );
END ENTITY dmux;
ARCHITECTURE dmux_arch OF dmux IS
    SIGNAL not_sel : STD_LOGIC;
BEGIN
    not_comp_1 : ENTITY work.not_gate(not_gate_arch)
        PORT MAP(input => sel, output => not_sel);
    and_comp_1 : ENTITY work.and_gate(and_gate_arch)
        PORT MAP(a => input, b => not_sel, output => out0);
    and_comp_2 : ENTITY work.and_gate(and_gate_arch)
        PORT MAP(a => input, b => sel, output => out1);
END ARCHITECTURE dmux_arch;