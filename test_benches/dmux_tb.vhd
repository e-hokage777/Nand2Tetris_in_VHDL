LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY dmux_tb IS
END ENTITY dmux_tb;
ARCHITECTURE dmux_tb_arch OF dmux_tb IS
    SIGNAL input : STD_LOGIC := '0';
    SIGNAL sel : STD_LOGIC := '0';
    SIGNAL out0 : STD_LOGIC;
    SIGNAL out1 : STD_LOGIC;
BEGIN
    dmux_comp : ENTITY work.dmux(dmux_arch)
        PORT MAP(input => input, sel => sel, out0 => out0, out1 => out1);

    test_process : PROCESS
    BEGIN

        input <= '0';
        sel <= '0';
        WAIT FOR 100 ns;

        input <= '0';
        sel <= '1';
        WAIT FOR 100 ns;

        input <= '1';
        sel <= '0';
        WAIT FOR 100 ns;

        input <= '1';
        sel <= '1';
        WAIT FOR 100 ns;

        WAIT;

    END PROCESS;
END ARCHITECTURE dmux_tb_arch;