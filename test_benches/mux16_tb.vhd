LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux16_tb IS
END ENTITY mux16_tb;


ARCHITECTURE mux16_tb_arch OF mux16_tb IS
    SIGNAL a : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL b : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL sel : STD_LOGIC;
    SIGNAL output : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
    mux16_comp : ENTITY work.mux16(mux16_arch)
        PORT MAP(a => a, b => b, sel => sel, output => output);

    test_process: PROCESS
    BEGIN

    a <= "1111111100000000";
    b <= "0000000011111111";
    sel <= '0';
    WAIT FOR 100 ns;

    a <= "0000000000000000";
    b <= "1111111111100000";
    sel <= '1';
    WAIT FOR 100 ns;

    a <= "1010101010101010";
    b <= "1110001110001110";
    sel <= '0';
    WAIT FOR 100 ns;

    a <= "1111111100011111";
    b <= "0000000011100000";
    sel <= '1';
    WAIT FOR 100 ns;

    WAIT;

    END PROCESS;
    END ARCHITECTURE mux16_tb_arch;