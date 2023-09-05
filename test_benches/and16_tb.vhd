LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY and16_tb IS
END ENTITY and16_tb;

ARCHITECTURE and16_tb_arch OF and16_tb IS
	SIGNAL a: STD_LOGIC_VECTOR(15 DOWNTO 0):= (OTHERS => '0');
	SIGNAL b: STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
	SIGNAL output: STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
	
	BEGIN
		and16_comp: ENTITY work.and16(and16_arch)
			PORT MAP(a => a, b => b, output => output);
			
		test_process: PROCESS
			BEGIN
			
				a <= "0000000000000000";
				b <= "0000000000000000";
				WAIT FOR 100 ns;
				
				a <= "1111111111111111";
				b <= "1111111111111111";
				WAIT FOR 100 ns;
				
				a <= "1111111111111111";
				b <= "0000000000000000";
				WAIT FOR 100 ns;
				
				a <= "1111111111111111";
				b <= "0000000000000000";
				WAIT FOR 100 ns;
				
				a <= "1010101010101010";
				b <= "0101010101010101";
				WAIT FOR 100 ns;
				
				a <= "1111111111111111";
				b <= "1001001001001111";
				WAIT FOR 100 ns;
				
				a <= "1111110000011111";
				b <= "0111111000111111";
				WAIT FOR 100 ns;
				
				a <= "1111111111111111";
				b <= "1000100100000010";
				WAIT FOR 100 ns;
				
				
				WAIT;
				
			END PROCESS;
	END ARCHITECTURE and16_tb_arch;