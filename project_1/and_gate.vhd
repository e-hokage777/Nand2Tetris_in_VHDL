LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY and_gate IS
	PORT (
		a : IN STD_LOGIC;
		b : IN STD_LOGIC;
		output : OUT STD_LOGIC
	);
END ENTITY and_gate;


ARCHITECTURE and_gate_arch OF and_gate IS
	SIGNAL nand_signal : STD_LOGIC;
BEGIN
	nand_signal <= a NAND b;
	not_component : ENTITY work.not_gate(not_gate_arch)
		PORT MAP(input => nand_signal, output => output);
END ARCHITECTURE and_gate_arch;