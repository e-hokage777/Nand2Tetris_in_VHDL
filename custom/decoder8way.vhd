LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY decoder8way IS
    PORT (
        sel: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        out_0: OUT STD_LOGIC;
        out_1: OUT STD_LOGIC;
        out_2: OUT STD_LOGIC;
        out_3: OUT STD_LOGIC;
        out_4: OUT STD_LOGIC;
        out_5: OUT STD_LOGIC;
        out_6: OUT STD_LOGIC;
        out_7: OUT STD_LOGIC
    );
END ENTITY decoder8way;

ARCHITECTURE decoder8way_arch OF decoder8way IS
BEGIN
    dmux8way_comp: ENTITY work.dmux8way(dmux8way_arch)
        PORT MAP (
            input => '1',
            sel => sel,
            out0 => out_0,
            out1 => out_1,
            out2 => out_2,
            out3 => out_3,
            out4 => out_4,
            out5 => out_5,
            out6 => out_6,
            out7 => out_7
        );
END ARCHITECTURE decoder8way_arch;