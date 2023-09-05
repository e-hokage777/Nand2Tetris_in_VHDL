LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY or16 IS
	PORT(
		a: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		b: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		output: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
	
END ENTITY or16;


ARCHITECTURE or16_arch OF or16 IS
	SIGNAL not_a: STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL not_b: STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL nota_and_notb: STD_LOGIC_VECTOR(15 DOWNTO 0);
	BEGIN
		not16_comp_1: ENTITY work.not16(not16_arch)
			PORT MAP(input => a, output => not_a);
		not16_comp_2: ENTITY work.not16(not16_arch)
			PORT MAP(input => b, output => not_b);
		and16_comp: ENTITY work.and16(and16_arch)
			PORT MAP(a => not_a, b => not_b, output => nota_and_notb);
		not16_comp_3: ENTITY work.not16(not16_arch)
			PORT MAP (input => nota_and_notb, output => output);
	END ARCHITECTURE or16_arch;