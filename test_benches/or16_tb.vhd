LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY or16_tb IS
END ENTITY or16_tb;


ARCHITECTURE or16_tb_arch OF or16_tb IS
	SIGNAL a: STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
	SIGNAL b: STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
	SIGNAL output: STD_LOGIC_VECTOR(15 DOWNTO 0);
	BEGIN
	
		or16_comp: ENTITY work.or16(or16_arch)
			PORT MAP(a => a, b => b, output => output);
		test_process: PROCESS
			BEGIN
				a <= "0000000000000000";
				b <= "1111111111111111";
				WAIT FOR 100 ns;
				
				a <= "1010101010101010";
				b <= "0101010101010101";
				WAIT FOR 100 ns;
				
				a <= "1111111000000001";
				b <= "1111111111111111";
				WAIT FOR 100 ns;
				
				a <= "0000000000000000";
				b <= "1000101010000001";
				WAIT FOR 100 ns;
				
				a <= "0000000000000000";
				b <= "1111111100000000";
				WAIT FOR 100 ns;
				
				WAIT;
			
			
			END PROCESS;
	END ARCHITECTURE or16_tb_arch;