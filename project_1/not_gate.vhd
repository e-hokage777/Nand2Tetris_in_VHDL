LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY not_gate IS
	PORT(
		input: IN STD_LOGIC;
		output: OUT STD_LOGIC
	);
END ENTITY not_gate;

ARCHITECTURE not_gate_arch OF not_gate IS
BEGIN
	output <= input NAND input;
END ARCHITECTURE not_gate_arch;