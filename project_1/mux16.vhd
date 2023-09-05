LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux16 IS
    PORT (
        a : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        sel : IN STD_LOGIC;
        output : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END ENTITY mux16;

ARCHITECTURE mux16_arch OF mux16 IS
BEGIN
    mux0 : ENTITY work.mux(mux_arch)
        PORT MAP(a => a(0), b => b(0), sel => sel, output => output(0));
    mux1 : ENTITY work.mux(mux_arch)
        PORT MAP(a => a(1), b => b(1), sel => sel, output => output(1));
    mux2 : ENTITY work.mux(mux_arch)
        PORT MAP(a => a(2), b => b(2), sel => sel, output => output(2));
    mux3 : ENTITY work.mux(mux_arch)
        PORT MAP(a => a(3), b => b(3), sel => sel, output => output(3));
    mux4 : ENTITY work.mux(mux_arch)
        PORT MAP(a => a(4), b => b(4), sel => sel, output => output(4));
    mux5 : ENTITY work.mux(mux_arch)
        PORT MAP(a => a(5), b => b(5), sel => sel, output => output(5));
    mux6 : ENTITY work.mux(mux_arch)
        PORT MAP(a => a(6), b => b(6), sel => sel, output => output(6));
    mux7 : ENTITY work.mux(mux_arch)
        PORT MAP(a => a(7), b => b(7), sel => sel, output => output(7));
    mux8 : ENTITY work.mux(mux_arch)
        PORT MAP(a => a(8), b => b(8), sel => sel, output => output(8));
    mux9 : ENTITY work.mux(mux_arch)
        PORT MAP(a => a(9), b => b(9), sel => sel, output => output(9));
    mux10 : ENTITY work.mux(mux_arch)
        PORT MAP(a => a(10), b => b(10), sel => sel, output => output(10));
    mux11 : ENTITY work.mux(mux_arch)
        PORT MAP(a => a(11), b => b(11), sel => sel, output => output(11));
    mux12 : ENTITY work.mux(mux_arch)
        PORT MAP(a => a(12), b => b(12), sel => sel, output => output(12));
    mux13 : ENTITY work.mux(mux_arch)
        PORT MAP(a => a(13), b => b(13), sel => sel, output => output(13));
    mux14 : ENTITY work.mux(mux_arch)
        PORT MAP(a => a(14), b => b(14), sel => sel, output => output(14));
    mux15 : ENTITY work.mux(mux_arch)
        PORT MAP(a => a(15), b => b(15), sel => sel, output => output(15));
END ARCHITECTURE mux16_arch;