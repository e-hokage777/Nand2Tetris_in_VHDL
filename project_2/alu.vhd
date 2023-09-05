LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- // Implementation: the ALU logic manipulates the x and y inputs
-- // and operates on the resulting values, as follows:
-- // if (zx == 1) set x = 0        // 16-bit constant
-- // if (nx == 1) set x = !x       // bitwise not
-- // if (zy == 1) set y = 0        // 16-bit constant
-- // if (ny == 1) set y = !y       // bitwise not
-- // if (f == 1)  set out = x + y  // integer 2's complement addition
-- // if (f == 0)  set out = x & y  // bitwise and
-- // if (no == 1) set out = !out   // bitwise not
-- // if (out == 0) set zr = 1
-- // if (out < 0) set ng = 1
ENTITY alu IS
    PORT (
        x : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        y : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        zx : IN STD_LOGIC;
        nx : IN STD_LOGIC;
        zy : IN STD_LOGIC;
        ny : IN STD_LOGIC;
        f : IN STD_LOGIC;
        no : IN STD_LOGIC;
        output : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        zr : OUT STD_LOGIC;
        ng : OUT STD_LOGIC
    );
END ENTITY alu;

ARCHITECTURE alu_arch OF alu IS
    -- all x signals
    SIGNAL zx_signal : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL nx_signal : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL zy_signal : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL ny_signal: STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL final_x : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL final_y : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL x_plus_y : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL x_and_y : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL temp_out : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL temp_out_not : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL out_final : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL pre_zr: STD_LOGIC;
BEGIN
    -- processing 'x' signal
    zx_mux : ENTITY work.mux16(mux16_arch)
        PORT MAP(a => x, b => (OTHERS => '0'), sel => zx, output => zx_signal);
    not_x : ENTITY work.not16(not16_arch)
        PORT MAP(input => zx_signal, output => nx_signal);
    nx_mux : ENTITY work.mux16(mux16_arch)
        PORT MAP(a => zx_signal, b => nx_signal, sel => nx, output => final_x);

    -- processing 'y' signal
    zy_mux : ENTITY work.mux16(mux16_arch)
        PORT MAP(a => y, b => (OTHERS => '0'), sel => zy, output => zy_signal);
    not_y : ENTITY work.not16(not16_arch)
        PORT MAP(input => zy_signal, output => ny_signal);
    ny_mux : ENTITY work.mux16(mux16_arch)
        PORT MAP(a => zy_signal, b => ny_signal, sel => ny, output => final_y);

    -- processing function
    add_comp : ENTITY work.add16(add16_arch)
        PORT MAP(a => final_x, b => final_y, output => x_plus_y);
    and_comp : ENTITY work.and16(and16_arch)
        PORT MAP(a => final_x, b => final_y, output => x_and_y);
    out_mux : ENTITY work.mux16(mux16_arch)
        PORT MAP(a => x_and_y, b => x_plus_y, sel => f, output => temp_out);

    -- computing negative output
    not16_out_comp: ENTITY work.not16(not16_arch)
        PORT MAP(input => temp_out, output => temp_out_not);

    -- choosing between output and !output
    mux16_out_comp: ENTITY work.mux16(mux16_arch)
        PORT MAP(a => temp_out, b => temp_out_not, sel => no, output => out_final);


    -- resolving all outputs
    output <= out_final; -- getting the final output
    or16way_comp: ENTITY work.or16way(or16way_arch)
        PORT MAP(input => out_final, output => pre_zr);
    not_comp: ENTITY work.not_gate(not_gate_arch)
        PORT MAP(input => pre_zr, output => zr); -- zero output indicator
    ng <= out_final(15); -- negative output indicator

END ARCHITECTURE alu_arch;