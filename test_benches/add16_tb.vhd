LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY add16_tb IS
END ENTITY add16_tb;

ARCHITECTURE add16_tb_arch OF add16_tb IS
    SIGNAL a: STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL b: STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL output: STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN

    add16_comp: ENTITY work.add16(add16_arch)
        PORT MAP(a => a, b => b, output => output);

    test_process: PROCESS
    BEGIN

        a <= (OTHERS => '0');
        b <= (OTHERS => '0');
        WAIT FOR 100 ns;

        a <= (OTHERS => '1');
        b <= (OTHERS => '1');
        WAIT FOR 100 ns;

        a <= (OTHERS => '1');
        b <= (OTHERS => '0');
        WAIT FOR 100 ns;

        a <= "1010101010101010";
        b <= "0101010101010101";
        WAIT FOR 100 ns;

        a <= "0000000000001001";
        b <= "0000000000001000";
        WAIT FOR 100 ns;


        a <= "0000000000000110";
        b <= "0000000000000100";
        WAIT FOR 100 ns;

        WAIT;

    END PROCESS;
END ARCHITECTURE add16_tb_arch;