LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ram64 IS
    PORT (
        input : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        address : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
        load : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        output : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END ENTITY ram64;

ARCHITECTURE ram64_arch OF ram64 IS

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
            sel => address(5 DOWNTO 3),
            out0 => load_0,
            out1 => load_1,
            out2 => load_2,
            out3 => load_3,
            out4 => load_4,
            out5 => load_5,
            out6 => load_6,
            out7 => load_7
        );

    -- getting the outputs from the ram8 chips
    ram8_0 : ENTITY work.ram8(ram8_arch)
        PORT MAP(input => input, address => address(2 DOWNTO 0), load => load_0, clk => clk, output => output_0);
    ram8_1 : ENTITY work.ram8(ram8_arch)
        PORT MAP(input => input, address => address(2 DOWNTO 0), load => load_1, clk => clk, output => output_1);
    ram8_2 : ENTITY work.ram8(ram8_arch)
        PORT MAP(input => input, address => address(2 DOWNTO 0), load => load_2, clk => clk, output => output_2);
    ram8_3 : ENTITY work.ram8(ram8_arch)
        PORT MAP(input => input, address => address(2 DOWNTO 0), load => load_3, clk => clk, output => output_3);
    ram8_4 : ENTITY work.ram8(ram8_arch)
        PORT MAP(input => input, address => address(2 DOWNTO 0), load => load_4, clk => clk, output => output_4);
    ram8_5 : ENTITY work.ram8(ram8_arch)
        PORT MAP(input => input, address => address(2 DOWNTO 0), load => load_5, clk => clk, output => output_5);
    ram8_6 : ENTITY work.ram8(ram8_arch)
        PORT MAP(input => input, address => address(2 DOWNTO 0), load => load_6, clk => clk, output => output_6);
    ram8_7 : ENTITY work.ram8(ram8_arch)
        PORT MAP(input => input, address => address(2 DOWNTO 0), load => load_7, clk => clk, output => output_7);

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
            sel => address(5 DOWNTO 3),
            output => output
        );
END ARCHITECTURE ram64_arch;