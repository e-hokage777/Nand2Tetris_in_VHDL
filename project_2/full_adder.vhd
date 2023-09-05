LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY full_adder IS
    PORT (
        a : IN STD_LOGIC;
        b : IN STD_LOGIC;
        cin : IN STD_LOGIC;
        sum : OUT STD_LOGIC;
        cout : OUT STD_LOGIC
    );
END ENTITY full_adder;

ARCHITECTURE full_adder_arch OF full_adder IS
    SIGNAL a_and_b: STD_LOGIC;
    SIGNAL a_and_cin: STD_LOGIC;
    SIGNAL b_and_cin: STD_LOGIC;
BEGIN
    xor3_comp: ENTITY work.xor3(xor3_arch)
        PORT MAP(a => a, b => b, c => cin, output => sum);
    and_comp_1: ENTITY work.and_gate(and_gate_arch)
        PORT MAP(a => a, b => b, output => a_and_b);
    and_comp_2: ENTITY work.and_gate(and_gate_arch)
        PORT MAP(a => a, b => cin, output => a_and_cin);
    and_comp_3: ENTITY work.and_gate(and_gate_arch)
        PORT MAP(a => b, b => cin, output => b_and_cin);
    or3_comp: ENTITY work.or3(or3_arch)
        PORT MAP(a => a_and_b, b => a_and_cin, c => b_and_cin, output => cout);

END ARCHITECTURE full_adder_arch;