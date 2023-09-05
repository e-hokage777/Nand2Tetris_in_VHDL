LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY or8way_tb IS
END ENTITY or8way_tb;

ARCHITECTURE or8way_tb_arch OF or8way_tb IS
    SIGNAL input : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL outpuT : STD_LOGIC;
BEGIN
    or8way_comp: ENTITY work.or8way(or8way_arch)
        PORT MAP(input => input, output => output);
    test_process : PROCESS
    BEGIN

        input <= "00000000";
        WAIT FOR 100 ns;

        input <= "11111111";
        WAIT FOR 100 ns;

        input <= "10101010";
        WAIT FOR 100 ns;

        input <= "01010101";
        WAIT FOR 100 ns;

        input <= "10000000";
        WAIT FOR 100 ns;

        input <= "00010000";
        WAIT FOR 100 ns;

        input <= "00011100";
        WAIT FOR 100 ns;

        input <= "11000000";
        WAIT FOR 100 ns;

        input <= "00110111";
        WAIT FOR 100 ns;

        input <= "01000100";
        WAIT FOR 100 ns;

        input <= "01110000";
        WAIT FOR 100 ns;

        WAIT;

    END PROCESS;
END ARCHITECTURE or8way_tb_arch;