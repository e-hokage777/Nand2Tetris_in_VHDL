LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux4way16_tb IS
END ENTITY mux4way16_tb;

ARCHITECTURE mux4way16_tb_arch OF mux4way16_tb IS
    SIGNAL a : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL b : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL c : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL d : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL sel : STD_LOGIC_VECTOR(1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL output : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
    mux4way16_comp : ENTITY work.mux4way16(mux4way16_arch)
        PORT MAP(a => a, b => b, c => c, d => d, sel => sel, output => output);

    test_process : PROCESS
    BEGIN

        a <= "0000111000000000";
        b <= "0000000000000000";
        c <= "0000000000000000";
        d <= "0000000000000000";
        sel <= "00";
        WAIT FOR 100 ns;

        a <= "0000000000000000";
        b <= "1110000000000011";
        c <= "0000000000000000";
        d <= "0000000000000000";
        sel <= "01";

        WAIT FOR 100 ns;
        a <= "0000000000000000";
        b <= "0000000000000000";
        c <= "0001100000011000";
        d <= "0000000000000000";
        sel <= "10";
        WAIT FOR 100 ns;

        a <= "0000111000000000";
        b <= "0000000000000000";
        c <= "0000000000000000";
        d <= "1111111011111111";
        sel <= "11";
        WAIT FOR 100 ns;

        WAIT;

    END PROCESS;
END ARCHITECTURE mux4way16_tb_arch;