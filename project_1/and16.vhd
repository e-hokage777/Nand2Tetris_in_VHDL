LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY and16 IS
	PORT(
		a: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		b: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		output: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END ENTITY and16;


ARCHITECTURE and16_arch OF and16 IS
	SIGNAL a_nand_b: STD_LOGIC_VECTOR(15 DOWNTO 0);
	BEGIN
		not16_comp: ENTITY work.not16(not16_arch)
			PORT MAP (input => a_nand_b, output => output);
		a_nand_b <= a NAND b;
	END ARCHITECTURE and16_arch;