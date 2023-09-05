LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux8way16_tb IS
END ENTITY mux8way16_tb;

ARCHITECTURE mux8way16_tb_arch OF mux8way16_tb IS
    SIGNAL a : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL b : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL c : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL d : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL e : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL f : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL g : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL h : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL sel : STD_LOGIC_VECTOR(2 DOWNTO 0) := (OTHERS => '0');
    SIGNAL output : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
    mux8way16_comp : ENTITY work.mux8way16(mux8way16_arch)
        PORT MAP(
            a => a, b => b, c => c, d => d, e => e, f => f, g => g, h => h, sel => sel, output => output
            );

    test_process : PROCESS
    BEGIN

        a <= "0000111000000000";
        b <= (OTHERS => '0');
        c <= (OTHERS => '0');
        d <= (OTHERS => '0');
        e <= (OTHERS => '0');
        f <= (OTHERS => '0');
        g <= (OTHERS => '0');
        h <= (OTHERS => '0');
        sel <= "000";
        WAIT FOR 100 ns;

        a <= (OTHERS => '0');
        b <= "1110000000000011";
        c <= (OTHERS => '0');
        d <= (OTHERS => '0');
        e <= (OTHERS => '0');
        f <= (OTHERS => '0');
        g <= (OTHERS => '0');
        h <= (OTHERS => '0');
        sel <= "001";

        WAIT FOR 100 ns;
        a <= (OTHERS => '0');
        b <= (OTHERS => '0');
        c <= "0001100000011000";
        d <= (OTHERS => '0');
        e <= (OTHERS => '0');
        f <= (OTHERS => '0');
        g <= (OTHERS => '0');
        h <= (OTHERS => '0');
        sel <= "010";
        WAIT FOR 100 ns;

        a <= "0000111000000000";
        b <= (OTHERS => '0');
        c <= (OTHERS => '0');
        d <= "1111111011111111";
        e <= (OTHERS => '0');
        f <= (OTHERS => '0');
        g <= (OTHERS => '0');
        h <= (OTHERS => '0');
        sel <= "011";
        WAIT FOR 100 ns;

        a <= "0000111000000000";
        b <= (OTHERS => '0');
        c <= (OTHERS => '0');
        d <= (OTHERS => '0');
        e <= "0000001110000000";
        f <= (OTHERS => '0');
        g <= (OTHERS => '0');
        h <= (OTHERS => '0');
        sel <= "100";
        WAIT FOR 100 ns;

        a <= "0000111000000000";
        b <= (OTHERS => '0');
        c <= (OTHERS => '0');
        d <= (OTHERS => '0');
        e <= (OTHERS => '0');
        f <= "1000000100000001";
        g <= (OTHERS => '0');
        h <= (OTHERS => '0');
        sel <= "101";
        WAIT FOR 100 ns;

        a <= "0000111000000000";
        b <= (OTHERS => '0');
        c <= (OTHERS => '0');
        d <= (OTHERS => '0');
        e <= (OTHERS => '0');
        f <= (OTHERS => '0');
        g <= "1111111111111111";
        h <= (OTHERS => '0');
        sel <= "110";
        WAIT FOR 100 ns;
        a <= "0000111000000000";
        b <= (OTHERS => '0');
        c <= (OTHERS => '0');
        d <= (OTHERS => '0');
        e <= (OTHERS => '0');
        f <= (OTHERS => '0');
        g <= (OTHERS => '0');
        h <= "1111111000000000";
        sel <= "111";
        WAIT FOR 100 ns;

        WAIT;

    END PROCESS;
END ARCHITECTURE mux8way16_tb_arch;