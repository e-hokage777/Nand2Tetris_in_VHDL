LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY or_gate_tb IS
END ENTITY;

ARCHITECTURE or_gate_tb_arch OF or_gate_tb IS
	SIGNAL a: STD_LOGIC := '0';
	SIGNAL b: STD_LOGIC := '0';
	SIGNAL output: STD_LOGIC;
BEGIN
	-- instantiating or_gate
	uut: ENTITY work.or_gate(or_gate_arch)
		PORT MAP(a=>a, b=>b, output=>output);
		
		
	sim_process: PROCESS
	BEGIN
		-- a: 0, b: 0
		 a <= '0';
		 b <= '0';
		 WAIT FOR 100 ns;
		 
		-- a: 0, b: 1
		 a <= '0';
		 b <= '1';
		 WAIT FOR 100 ns;
		 
		-- a: 1, b: 0
		 a <= '1';
		 b <= '0';
		 WAIT FOR 100 ns;
		 
		-- a: 1, b: 1
		 a <= '1';
		 b <= '1';
		 WAIT FOR 100 ns;
		 
		 -- to prevent infinite loop
		 WAIT;
		 
	END PROCESS;
	
END ARCHITECTURE or_gate_tb_arch;