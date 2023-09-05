LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY alu_inter IS
END ENTITY alu_inter;

ARCHITECTURE alu_inter_arch OF alu_inter IS
    SIGNAL x_b : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL y_b : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL command : STD_LOGIC_VECTOR(5 DOWNTO 0) := "000000";
    SIGNAL x_i : INTEGER := 0;
    SIGNAL y_i : INTEGER := 0;
    SIGNAL out_b : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL out_i : INTEGER;
    SIGNAL zr : STD_LOGIC;
    SIGNAL ng : STD_LOGIC;
BEGIN
    alu_comp : ENTITY work.alu(alu_arch)
        PORT MAP(
            x => x_b,
            y => y_b,
            zx => command(5),
            nx => command(4),
            zy => command(3),
            ny => command(2),
            f => command(1),
            no => command(0),
            output => out_b,
            zr => zr,
            ng => ng
        );

    x_b <= STD_LOGIC_VECTOR(to_signed(x_i, x_b'length));
    y_b <= STD_LOGIC_VECTOR(to_signed(y_i, y_b'length));
    out_i <= to_integer(signed(out_b));

END ARCHITECTURE alu_inter_arch;