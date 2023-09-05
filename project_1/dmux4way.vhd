LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY dmux4way IS
    PORT (
        input : IN STD_LOGIC;
        sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        out0 : OUT STD_LOGIC;
        out1 : OUT STD_LOGIC;
        out2 : OUT STD_LOGIC;
        out3 : OUT STD_LOGIC
    );
END ENTITY dmux4way;

ARCHITECTURE dmux4way_arch OF dmux4way IS
    SIGNAL dmux_1_in: STD_LOGIC; 
    SIGNAL dmux_2_in: STD_LOGIC; 
BEGIN
    dmux_0: ENTITY work.dmux(dmux_arch)
        PORT MAP(input => input, sel => sel(1), out0 => dmux_1_in, out1 => dmux_2_in);
    dmux_1: ENTITY work.dmux(dmux_arch)
        PORT MAP(input => dmux_1_in, sel => sel(0), out0 => out0, out1 => out1);
    dmux_2: ENTITY work.dmux(dmux_arch)
        PORT MAP(input => dmux_2_in, sel => sel(0), out0 => out2, out1 => out3);
END ARCHITECTURE dmux4way_arch;