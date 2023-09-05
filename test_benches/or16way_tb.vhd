LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY or16way_tb IS
END ENTITY or16way_tb;

ARCHITECTURE or16way_tb_arch OF or16way_tb IS
    SIGNAL input : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL output : STD_LOGIC;
BEGIN

    or16way_comp : ENTITY work.or16way(or16way_arch)
        PORT MAP(input => input, output => output);

    test_process : PROCESS
    BEGIN

        input <= (OTHERS => '0');
        WAIT FOR 100 ns;

        input <= (OTHERS => '1');
        WAIT FOR 100 ns;

        input <= "0000000000000001";
        WAIT FOR 100 ns;

        input <= "1000000000000000";
        WAIT FOR 100 ns;

        input <= "1000000111000000";
        WAIT FOR 100 ns;

        WAIT;
    END PROCESS;
END ARCHITECTURE or16way_tb_arch;