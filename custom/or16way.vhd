LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY or16way IS
    PORT (
        input : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        output : OUT STD_LOGIC
    );
END ENTITY or16way;

ARCHITECTURE or16way_arch OF or16way IS
    SIGNAL or1_out : STD_LOGIC;
    SIGNAL or2_out : STD_LOGIC;
BEGIN
    or8way_comp_1 : ENTITY work.or8way(or8way_arch)
        PORT MAP(input => input(15 DOWNTO 8), output => or1_out);
    or8way_comp_2 : ENTITY work.or8way(or8way_arch)
        PORT MAP(input => input(7 DOWNTO 0), output => or2_out);
    or_comp: ENTITY work.or_gate(or_gate_arch)
        PORT MAP(a => or1_out, b => or2_out, output => output);
        END ARCHITECTURE or16way_arch;