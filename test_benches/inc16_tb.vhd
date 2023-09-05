LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY inc16_tb IS
END ENTITY inc16_tb;

ARCHITECTURE inc16_tb_arch OF inc16_tb IS
    SIGNAL input: STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL output: STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN

    add16_comp: ENTITY work.inc16(inc16_arch)
        PORT MAP(input => input, output => output);

    test_process: PROCESS
    BEGIN

        input <= (OTHERS => '0');
        WAIT FOR 100 ns;

        input <= (OTHERS => '1');
        WAIT FOR 100 ns;

        input <= "0000000000000001";
        WAIT FOR 100 ns;

        input <= "1010101010101010";
        WAIT FOR 100 ns;

        input <= "0000000000001001";
        WAIT FOR 100 ns;


        input <= "0000000000000110";
        WAIT FOR 100 ns;

        WAIT;

    END PROCESS;
END ARCHITECTURE inc16_tb_arch;