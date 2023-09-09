LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY pc IS
    PORT(
        input: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        reset: IN STD_LOGIC;
        inc: IN STD_LOGIC;
        load: IN STD_LOGIC;
        clk: IN STD_LOGIC;
        output: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END ENTITY pc;

ARCHITECTURE pc_arch OF pc IS
    SIGNAL inc_data: STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL inc_res: STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL load_res: STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL final_res: STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL regist_load_signal: STD_LOGIC;
    SIGNAL temp_out: STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
    -- incrementing the temporary output
    inc_comp: ENTITY work.inc16(inc16_arch)
        PORT MAP(input => temp_out, output => inc_data);

    -- increase, load or reset
    -- mux_comp_1: ENTITY work.mux16(mux16_arch)
    --     PORT MAP(a => final_res, b => inc_data, sel => inc, output => inc_res);
    mux_comp_2: ENTITY work.mux16(mux16_arch)
        PORT MAP(a => inc_data, b => input, sel => load, output => load_res);
    mux_comp_3: ENTITY work.mux16(mux16_arch)
        PORT MAP(a => load_res, b => (OTHERS => '0'), sel => reset, output => final_res);

    -- deciding whether to load new signal or maintin current register contents
    or3_comp: ENTITY work.or3(or3_arch)
        PORT MAP(a => inc, b => load, c => reset, output => regist_load_signal);

    -- passing in the input to the register
    register_comp: ENTITY work.regist(regist_arch)
        PORT MAP(input => final_res, load => regist_load_signal, clk => clk, output => temp_out);

    output <= temp_out;
END ARCHITECTURE pc_arch;