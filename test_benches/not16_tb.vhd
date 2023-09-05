LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY not16_tb IS
END ENTITY not16_tb;

ARCHITECTURE not16_tb_arch OF not16_tb IS
	SIGNAL input : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
	SIGNAL output : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
	BEGIN
		not16_comp: ENTITY work.not16(not16_arch)
			PORT MAP(input => input, output => output);
			
		test_process : PROCESS
			BEGIN
				input <= "0000000000000000";
				WAIT FOR 100 ns;
				
				input <= "1111111111111111";
				WAIT FOR 100 ns;
				
				input <= "0101010101010101";
				WAIT FOR 100 ns;
				
				input <= "1010101010101010";
				WAIT FOR 100 ns;
				
				input <= "0011001011010110";
				WAIT FOR 100 ns;
				
				WAIT;
				
				
			END PROCESS;
			
			
	END ARCHITECTURE not16_tb_arch;