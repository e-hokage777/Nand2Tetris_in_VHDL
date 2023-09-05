LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY dmux8way IS
    PORT (
        input : IN STD_LOGIC;
        sel : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        out0 : OUT STD_LOGIC;
        out1 : OUT STD_LOGIC;
        out2 : OUT STD_LOGIC;
        out3 : OUT STD_LOGIC;
        out4 : OUT STD_LOGIC;
        out5 : OUT STD_LOGIC;
        out6 : OUT STD_LOGIC;
        out7 : OUT STD_LOGIC
    );
END ENTITY dmux8way;

ARCHITECTURE dmux8way_arch OF dmux8way IS
    SIGNAL dmux_1_in : STD_LOGIC;
    SIGNAL dmux_2_in : STD_LOGIC;
    SIGNAL dmux_3_in : STD_LOGIC;
    SIGNAL dmux_4_in : STD_LOGIC;
BEGIN
    dmux_0 : ENTITY work.dmux4way(dmux4way_arch)
        PORT MAP(
            input => input,
            sel => sel(2 DOWNTO 1),
            out0 => dmux_1_in,
            out1 => dmux_2_in,
            out2 => dmux_3_in,
            out3 => dmux_4_in
        );
    dmux_1 : ENTITY work.dmux(dmux_arch)
        PORT MAP(input => dmux_1_in, sel => sel(0), out0 => out0, out1 => out1);
    dmux_2 : ENTITY work.dmux(dmux_arch)
        PORT MAP(input => dmux_2_in, sel => sel(0), out0 => out2, out1 => out3);
    dmux_3 : ENTITY work.dmux(dmux_arch)
        PORT MAP(input => dmux_3_in, sel => sel(0), out0 => out4, out1 => out5);
    dmux_4 : ENTITY work.dmux(dmux_arch)
        PORT MAP(input => dmux_4_in, sel => sel(0), out0 => out6, out1 => out7);
END ARCHITECTURE dmux8way_arch;