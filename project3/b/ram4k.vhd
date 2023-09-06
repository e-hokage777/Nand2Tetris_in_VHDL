LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ram4k IS
    PORT (
        input : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        address : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
        load : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        output : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END ENTITY ram4k;

ARCHITECTURE ram4k_arch OF ram4k IS

    -- load signals for each register
    SIGNAL load_0 : STD_LOGIC;
    SIGNAL load_1 : STD_LOGIC;
    SIGNAL load_2 : STD_LOGIC;
    SIGNAL load_3 : STD_LOGIC;
    SIGNAL load_4 : STD_LOGIC;
    SIGNAL load_5 : STD_LOGIC;
    SIGNAL load_6 : STD_LOGIC;
    SIGNAL load_7 : STD_LOGIC;

    -- output signals for each register
    SIGNAL output_0 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL output_1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL output_2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL output_3 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL output_4 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL output_5 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL output_6 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL output_7 : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
    -- dmux for load signals
    load_dmux : ENTITY work.dmux8way(dmux8way_arch)
        PORT MAP(
            input => load,
            sel => address(11 DOWNTO 9),
            out0 => load_0,
            out1 => load_1,
            out2 => load_2,
            out3 => load_3,
            out4 => load_4,
            out5 => load_5,
            out6 => load_6,
            out7 => load_7
        );

    -- getting the outputs from the ram512 chips
    ram512_0 : ENTITY work.ram512(ram512_arch)
        PORT MAP(input => input, address => address(8 DOWNTO 0), load => load_0, clk => clk, output => output_0);
    ram512_1 : ENTITY work.ram512(ram512_arch)
        PORT MAP(input => input, address => address(8 DOWNTO 0), load => load_1, clk => clk, output => output_1);
    ram512_2 : ENTITY work.ram512(ram512_arch)
        PORT MAP(input => input, address => address(8 DOWNTO 0), load => load_2, clk => clk, output => output_2);
    ram512_3 : ENTITY work.ram512(ram512_arch)
        PORT MAP(input => input, address => address(8 DOWNTO 0), load => load_3, clk => clk, output => output_3);
    ram512_4 : ENTITY work.ram512(ram512_arch)
        PORT MAP(input => input, address => address(8 DOWNTO 0), load => load_4, clk => clk, output => output_4);
    ram512_5 : ENTITY work.ram512(ram512_arch)
        PORT MAP(input => input, address => address(8 DOWNTO 0), load => load_5, clk => clk, output => output_5);
    ram512_6 : ENTITY work.ram512(ram512_arch)
        PORT MAP(input => input, address => address(8 DOWNTO 0), load => load_6, clk => clk, output => output_6);
    ram512_7 : ENTITY work.ram512(ram512_arch)
        PORT MAP(input => input, address => address(8 DOWNTO 0), load => load_7, clk => clk, output => output_7);

    -- selecting the output
    mux8way16_comp : ENTITY work.mux8way16(mux8way16_arch)
        PORT MAP(
            a => output_0,
            b => output_1,
            c => output_2,
            d => output_3,
            e => output_4,
            f => output_5,
            g => output_6,
            h => output_7,
            sel => address(11 DOWNTO 9),
            output => output
        );
END ARCHITECTURE ram4k_arch;