LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY half_adder IS
    PORT (
        a : IN STD_LOGIC;
        b : IN STD_LOGIC;
        sum : OUT STD_LOGIC;
        carry : OUT STD_LOGIC
    );
END ENTITY half_adder;

ARCHITECTURE half_adder_arch OF half_adder IS
BEGIN
    xor_comp: ENTITY work.xor_gate(xor_gate_arch)
        PORT MAP(a => a, b => b, output => sum);
    and_comp: ENTITY work.and_gate(and_gate_arch)
        PORT MAP(a => a, b => b, output => carry);
END ARCHITECTURE half_adder_arch;