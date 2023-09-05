LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux4way IS
    PORT (
        a : IN STD_LOGIC;
        b : IN STD_LOGIC;
        c : IN STD_LOGIC;
        d : IN STD_LOGIC;
        sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        output : OUT STD_LOGIC
    );
END ENTITY mux4way;


ARCHITECTURE mux4way_arch OF mux4way IS
    SIGNAL a_mux_b : STD_LOGIC;
    SIGNAL c_mux_d : STD_LOGIC;
BEGIN
    mux_ab : ENTITY work.mux(mux_arch)
        PORT MAP(a => a, b => b, sel => sel(0), output => a_mux_b);
    mux_cd : ENTITY work.mux(mux_arch)
        PORT MAP(a => c, b => d, sel => sel(0), output => c_mux_d);
    mux_final : ENTITY work.mux(mux_arch)
        PORT MAP(a => a_mux_b, b => c_mux_d, sel => sel(1), output => output);
END ARCHITECTURE mux4way_arch;