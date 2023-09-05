LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY xor_gate IS
	PORT(
		a: IN STD_LOGIC;
		b: IN STD_LOGIC;
		output: OUT STD_LOGIC
	);
END ENTITY xor_gate;


ARCHITECTURE xor_gate_arch OF xor_gate IS
	SIGNAL not_a : STD_LOGIC;
	SIGNAL not_b : STD_LOGIC;
	SIGNAL a_and_not_b: STD_LOGIC;
	SIGNAL not_a_and_b: STD_LOGIC;
	BEGIN
		not_comp_1 : ENTITY work.not_gate(not_gate_arch)
			PORT MAP (input => a, output => not_a);
		not_comp_2 : ENTITY work.not_gate(not_gate_arch)
			PORT MAP (input => b, output => not_b);
		and_comp_1 : ENTITY work.and_gate(and_gate_arch)
			PORT MAP (a => a, b => not_b, output => a_and_not_b);
		and_comp_2 : ENTITY work.and_gate(and_gate_arch)
			PORT MAP (a => not_a, b => b, output => not_a_and_b);
		or_comp : ENTITY work.or_gate(or_gate_arch)
			PORT MAP (a => a_and_not_b, b => not_a_and_b, output => output);
		
	END ARCHITECTURE xor_gate_arch;