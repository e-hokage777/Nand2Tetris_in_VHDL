LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY mux8way16 IS
    PORT (
        a : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        c : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        d : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        e : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        f : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        g : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        h : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        sel : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        output : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END ENTITY mux8way16;

ARCHITECTURE mux8way16_arch OF mux8way16 IS
    SIGNAL first_4 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL last_4 : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
    mux4way16_comp_1: ENTITY work.mux4way16(mux4way16_arch)
        PORT MAP(a => a, b => b, c => c, d => d, sel => sel(1 DOWNTO 0), output => first_4);
    mux16_comp_2: ENTITY work.mux4way16(mux4way16_arch)
        PORT MAP(a => e, b => f, c => g, d => h, sel => sel(1 DOWNTO 0), output => last_4);
    mux16_comp_3: ENTITY work.mux16(mux16_arch)
        PORT MAP(a => first_4, b => last_4, sel => sel(2), output => output);
END ARCHITECTURE mux8way16_arch;