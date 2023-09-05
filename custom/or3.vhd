LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY or3 IS
	PORT(
		a: IN STD_LOGIC;
		b: IN STD_LOGIC;
        c: IN STD_LOGIC;
		output: OUT STD_LOGIC
	);
END ENTITY or3;


ARCHITECTURE or3_arch OF or3 IS
    SIGNAL or_1_sig: STD_LOGIC;
	BEGIN
		or_comp_1: ENTITY work.or_gate(or_gate_arch)
            PORT MAP(a => a, b => b, output => or_1_sig);
		or_comp_2: ENTITY work.or_gate(or_gate_arch)
            PORT MAP(a => or_1_sig, b => c, output => output);
	END ARCHITECTURE or3_arch;