LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY dmux4way_tb IS
END ENTITY dmux4way_tb;
ARCHITECTURE dmux4way_tb_arch OF dmux4way_tb IS
    SIGNAL input : STD_LOGIC := '0';
    SIGNAL sel : STD_LOGIC_VECTOR(1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL out0 : STD_LOGIC;
    SIGNAL out1 : STD_LOGIC;
    SIGNAL out2 : STD_LOGIC;
    SIGNAL out3 : STD_LOGIC;
BEGIN
    dmux4way_comp : ENTITY work.dmux4way(dmux4way_arch)
        PORT MAP(input => input, sel => sel, out0 => out0, out1 => out1, out2 => out2, out3 => out3);

    test_process : PROCESS
    BEGIN

        input <= '1';
        sel <= "00";
        WAIT FOR 100 ns;

        input <= '1';
        sel <= "01";
        WAIT FOR 100 ns;

        input <= '1';
        sel <= "10";
        WAIT FOR 100 ns;

        input <= '1';
        sel <= "11";
        WAIT FOR 100 ns;

        WAIT;

    END PROCESS;
END ARCHITECTURE dmux4way_tb_arch;