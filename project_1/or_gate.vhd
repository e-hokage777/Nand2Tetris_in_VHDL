LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY or_gate IS
	PORT(
		a: IN STD_LOGIC;
		b: IN STD_LOGIC;
		output: OUT STD_LOGIC
	);
END ENTITY or_gate;

--Structurally implemented OR_GATE architecture
ARCHITECTURE or_gate_arch OF or_gate IS
 SIGNAL not_a: STD_LOGIC;
 SIGNAL not_b: STD_LOGIC;
BEGIN
	not_component1: ENTITY work.not_gate(not_gate_arch)
		PORT MAP(input=>a, output=>not_a);
	not_component2: ENTITY work.not_gate(not_gate_arch)
		PORT MAP(input=>b, output=>not_b);

	output <= not_a NAND not_b;
END ARCHITECTURE or_gate_arch;