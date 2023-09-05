LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux_tb IS
END ENTITY mux_tb;

ARCHITECTURE mux_tb_arch OF mux_tb IS
	SIGNAL a: STD_LOGIC := '0';
	SIGNAL b: STD_LOGIC := '0';
	SIGNAL sel: STD_LOGIC := '0';
	SIGNAL output: STD_LOGIC;
BEGIN
	-- instantiating or_gate
	mux_comp: ENTITY work.mux(mux_arch)
		PORT MAP(a=>a, b=>b, sel => sel, output=>output);
		
		
	sim_process: PROCESS
	BEGIN
		-- a: 0, b: 0, sel: 0
		 a <= '0';
		 b <= '0';
		 sel <= '0';
		 WAIT FOR 100 ns;
		 
		-- a: 0, b: 1, sel: 0
		 a <= '0';
		 b <= '1';
		 sel <= '0';
		 WAIT FOR 100 ns;
		 
		-- a: 1, b: 0, sel: 0
		 a <= '1';
		 b <= '0';
		 sel <= '0';
		 WAIT FOR 100 ns;
		 
		-- a: 1, b: 1, sel: 0
		 a <= '1';
		 b <= '1';
		 sel <= '0';
		 WAIT FOR 100 ns;
		 
		 -- a: 0, b: 0, sel: 1
		 a <= '0';
		 b <= '0';
		 sel <= '1';
		 WAIT FOR 100 ns;
		 
		-- a: 0, b: 1, sel: 1
		 a <= '0';
		 b <= '1';
		 sel <= '1';
		 WAIT FOR 100 ns;
		 
		-- a: 1, b: 0, sel: 1
		 a <= '1';
		 b <= '0';
		 sel <= '1';
		 WAIT FOR 100 ns;
		 
		-- a: 1, b: 1, sel: 1
		 a <= '1';
		 b <= '1';
		 sel <= '1';
		 WAIT FOR 100 ns;
		 
		 -- to prevent infinite loop
		 WAIT;
		 
	END PROCESS;
	
END ARCHITECTURE mux_tb_arch;