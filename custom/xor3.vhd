LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY xor3 IS
	PORT(
		a: IN STD_LOGIC;
		b: IN STD_LOGIC;
        c: IN STD_LOGIC;
		output: OUT STD_LOGIC
	);
END ENTITY xor3;


ARCHITECTURE xor3_arch OF xor3 IS
    SIGNAL xor_1_sig: STD_LOGIC;
	BEGIN
		xor_comp_1: ENTITY work.xor_gate(xor_gate_arch)
            PORT MAP(a => a, b => b, output => xor_1_sig);
		xor_comp_2: ENTITY work.xor_gate(xor_gate_arch)
            PORT MAP(a => xor_1_sig, b => c, output => output);
	END ARCHITECTURE xor3_arch;