LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY mux4way16 IS
    PORT (
        a : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        c : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        d : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        output : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END ENTITY mux4way16;

ARCHITECTURE mux4way16_arch OF mux4way16 IS
    SIGNAL a_mux_b : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL c_mux_d : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
    mux16_comp_1: ENTITY work.mux16(mux16_arch)
        PORT MAP(a => a, b => b, sel => sel(0), output => a_mux_b);
    mux16_comp_2: ENTITY work.mux16(mux16_arch)
        PORT MAP(a => c, b => d, sel => sel(0), output => c_mux_d);
    mux16_comp_3: ENTITY work.mux16(mux16_arch)
        PORT MAP(a => a_mux_b, b => c_mux_d, sel => sel(1), output => output);
END ARCHITECTURE mux4way16_arch;