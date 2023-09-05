LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY dmux8way_tb IS
END ENTITY dmux8way_tb;
ARCHITECTURE dmux8way_tb_arch OF dmux8way_tb IS
    SIGNAL input : STD_LOGIC := '0';
    SIGNAL sel : STD_LOGIC_VECTOR(2 DOWNTO 0) := (OTHERS => '0');
    SIGNAL out0 : STD_LOGIC;
    SIGNAL out1 : STD_LOGIC;
    SIGNAL out2 : STD_LOGIC;
    SIGNAL out3 : STD_LOGIC;
    SIGNAL out4 : STD_LOGIC;
    SIGNAL out5 : STD_LOGIC;
    SIGNAL out6 : STD_LOGIC;
    SIGNAL out7 : STD_LOGIC;
BEGIN
    dmux8way_comp : ENTITY work.dmux8way(dmux8way_arch)
        PORT MAP(
            input => input,
            sel => sel,
            out0 => out0,
            out1 => out1,
            out2 => out2,
            out3 => out3,
            out4 => out4,
            out5 => out5,
            out6 => out6,
            out7 => out7
            );

    test_process : PROCESS
    BEGIN

        input <= '1';
        sel <= "000";
        WAIT FOR 100 ns;

        input <= '1';
        sel <= "001";
        WAIT FOR 100 ns;

        input <= '1';
        sel <= "010";
        WAIT FOR 100 ns;

        input <= '1';
        sel <= "011";
        WAIT FOR 100 ns;

        input <= '1';
        sel <= "100";
        WAIT FOR 100 ns;

        input <= '1';
        sel <= "101";
        WAIT FOR 100 ns;

        input <= '1';
        sel <= "110";
        WAIT FOR 100 ns;

        input <= '1';
        sel <= "111";
        WAIT FOR 100 ns;

        WAIT;

    END PROCESS;
END ARCHITECTURE dmux8way_tb_arch;