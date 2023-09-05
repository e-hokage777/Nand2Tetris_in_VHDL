LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY not16 IS
	PORT(
		input: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		output: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END ENTITY not16;

ARCHITECTURE not16_arch OF not16 IS
	BEGIN
		output <= input NAND input;
	END ARCHITECTURE not16_arch;