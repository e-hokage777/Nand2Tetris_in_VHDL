LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ram16k IS
    PORT (
        input : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        address : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
        load : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        output : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END ENTITY ram16k;

ARCHITECTURE ram16k_arch OF ram16k IS

    -- load signals for each register
    SIGNAL load_0 : STD_LOGIC;
    SIGNAL load_1 : STD_LOGIC;
    SIGNAL load_2 : STD_LOGIC;
    SIGNAL load_3 : STD_LOGIC;

    -- output signals for each register
    SIGNAL output_0 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL output_1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL output_2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL output_3 : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
    -- dmux for load signals
    load_dmux : ENTITY work.dmux4way(dmux4way_arch)
        PORT MAP(
            input => load,
            sel => address(13 DOWNTO 12),
            out0 => load_0,
            out1 => load_1,
            out2 => load_2,
            out3 => load_3
        );

    -- getting the outputs from the ram4k chips
    ram4k_0 : ENTITY work.ram4k(ram4k_arch)
        PORT MAP(input => input, address => address(11 DOWNTO 0), load => load_0, clk => clk, output => output_0);
    ram4k_1 : ENTITY work.ram4k(ram4k_arch)
        PORT MAP(input => input, address => address(11 DOWNTO 0), load => load_1, clk => clk, output => output_1);
    ram4k_2 : ENTITY work.ram4k(ram4k_arch)
        PORT MAP(input => input, address => address(11 DOWNTO 0), load => load_2, clk => clk, output => output_2);
    ram4k_3 : ENTITY work.ram4k(ram4k_arch)
        PORT MAP(input => input, address => address(11 DOWNTO 0), load => load_3, clk => clk, output => output_3);

    -- selecting the output
    mux4way16_comp : ENTITY work.mux4way16(mux4way16_arch)
        PORT MAP(
            a => output_0,
            b => output_1,
            c => output_2,
            d => output_3,
            sel => address(13 DOWNTO 12),
            output => output
        );
END ARCHITECTURE ram16k_arch;