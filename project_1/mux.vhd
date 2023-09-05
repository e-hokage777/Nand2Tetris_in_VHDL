LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY mux IS
	PORT(
		a: IN STD_LOGIC;
		b: IN STD_LOGIC;
		sel: IN STD_LOGIC;
		output: OUT STD_LOGIC
	);
END ENTITY mux;


ARCHITECTURE mux_arch OF mux IS
	SIGNAL not_sel: STD_LOGIC;
	SIGNAL a_and_not_sel: STD_LOGIC;
	SIGNAL b_and_sel: STD_LOGIC;
	BEGIN
		not_comp: ENTITY work.not_gate(not_gate_arch)
			PORT MAP(input => sel, output => not_sel);
		and_comp_1: ENTITY work.and_gate(and_gate_arch)
			PORT MAP(a => a, b => not_sel, output => a_and_not_sel);
		and_comp_2: ENTITY work.and_gate(and_gate_arch)
			PORT MAP(a => b, b => sel, output => b_and_sel);
		or_comp: ENTITY work.or_gate(or_gate_arch)
			PORT MAP(a => a_and_not_sel, b => b_and_sel, output => output);
	END ARCHITECTURE mux_arch;