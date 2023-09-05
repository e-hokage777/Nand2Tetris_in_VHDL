LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY or8way IS
    PORT(
        input: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        output: OUT STD_LOGIC
    );
END ENTITY or8way;

ARCHITECTURE or8way_arch OF or8way IS
    SIGNAL or1_out: STD_LOGIC;
    SIGNAL or2_out: STD_LOGIC;
    SIGNAL or3_out: STD_LOGIC;
    SIGNAL or4_out: STD_LOGIC;
    SIGNAL or5_out: STD_LOGIC;
    SIGNAL or6_out: STD_LOGIC;
BEGIN
    or1: ENTITY work.or_gate(or_gate_arch)
        PORT MAP(a => input(0), b => input(1), output => or1_out);
    or2: ENTITY work.or_gate(or_gate_arch)
        PORT MAP(a => input(2), b => input(3), output => or2_out);
    or3: ENTITY work.or_gate(or_gate_arch)
        PORT MAP(a => input(4), b => input(5), output => or3_out);
    or4: ENTITY work.or_gate(or_gate_arch)
        PORT MAP(a => input(6), b => input(7), output => or4_out);
    or5: ENTITY work.or_gate(or_gate_arch)
        PORT MAP(a => or1_out, b => or2_out, output => or5_out);
    or6: ENTITY work.or_gate(or_gate_arch)
        PORT MAP(a => or3_out, b => or4_out, output => or6_out);
    or7: ENTITY work.or_gate(or_gate_arch)
        PORT MAP(a => or5_out, b => or6_out, output => output);
END ARCHITECTURE or8way_arch;