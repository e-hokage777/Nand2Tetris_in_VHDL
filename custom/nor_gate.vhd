LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY nor_gate IS
    PORT (
        a : IN STD_LOGIC;
        b : IN STD_LOGIC;
        output : OUT STD_LOGIC
    );
END ENTITY nor_gate;

ARCHITECTURE nor_gate_arch OF nor_gate IS
    SIGNAL a_or_b : STD_LOGIC;
BEGIN
    or_comp : ENTITY work.or_gate(or_gate_arch)
        PORT MAP(a => a, b => b, output => a_or_b);
    not_comp : ENTITY work.not_gate(not_gate_arch)
        PORT MAP(input => a_or_b, output => output);
END ARCHITECTURE nor_gate_arch;