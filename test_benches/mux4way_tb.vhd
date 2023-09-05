LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux4way_tb IS
END ENTITY mux4way_tb;

ARCHITECTURE mux4way_tb_arch OF mux4way_tb IS
    SIGNAL a : STD_LOGIC := '0';
    SIGNAL b : STD_LOGIC := '0';
    SIGNAL c : STD_LOGIC := '0';
    SIGNAL d : STD_LOGIC := '0';
    SIGNAL sel : STD_LOGIC_VECTOR(1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL output : STD_LOGIC;
BEGIN
    mux4way_comp : ENTITY work.mux4way(mux4way_arch)
        PORT MAP(a => a, b => b, c => c, d => d, sel => sel, output => output);
    
    test_process: PROCESS
    BEGIN

    -- a:1, b:0, c:0, d:0 sel:00
    a <= '1';
    b <= '0';
    c <= '0';
    d <= '0';
    sel <= "00";
    WAIT FOR 100 ns;

    -- a:0, b:1, c:0, d:0 sel:01
    a <= '0';
    b <= '1';
    c <= '0';
    d <= '0';
    sel <= "01";
    WAIT FOR 100 ns;

    -- a:0, b:0, c:1, d:0 sel:10
    a <= '0';
    b <= '0';
    c <= '1';
    d <= '0';
    sel <= "10";
    WAIT FOR 100 ns;

    -- a:0, b:0, c:0, d:1 sel:11
    a <= '1';
    b <= '0';
    c <= '0';
    d <= '1';
    sel <= "11";
    WAIT FOR 100 ns;

    WAIT;

    END PROCESS;
END ARCHITECTURE mux4way_tb_arch;