LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY regist IS
    PORT (
        input : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        load : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        output : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END ENTITY regist;

ARCHITECTURE regist_arch OF regist IS
BEGIN
    bit0 : ENTITY work.BIT(bit_arch)
        PORT MAP(input => input(0), load => load, clk => clk, output => output(0));
    bit1 : ENTITY work.BIT(bit_arch)
        PORT MAP(input => input(1), load => load, clk => clk, output => output(1));
    bit2 : ENTITY work.BIT(bit_arch)
        PORT MAP(input => input(2), load => load, clk => clk, output => output(2));
    bit3 : ENTITY work.BIT(bit_arch)
        PORT MAP(input => input(3), load => load, clk => clk, output => output(3));
    bit4 : ENTITY work.BIT(bit_arch)
        PORT MAP(input => input(4), load => load, clk => clk, output => output(4));
    bit5 : ENTITY work.BIT(bit_arch)
        PORT MAP(input => input(5), load => load, clk => clk, output => output(5));
    bit6 : ENTITY work.BIT(bit_arch)
        PORT MAP(input => input(6), load => load, clk => clk, output => output(6));
    bit7 : ENTITY work.BIT(bit_arch)
        PORT MAP(input => input(7), load => load, clk => clk, output => output(7));
    bit8 : ENTITY work.BIT(bit_arch)
        PORT MAP(input => input(8), load => load, clk => clk, output => output(8));
    bit9 : ENTITY work.BIT(bit_arch)
        PORT MAP(input => input(9), load => load, clk => clk, output => output(9));
    bit10 : ENTITY work.BIT(bit_arch)
        PORT MAP(input => input(10), load => load, clk => clk, output => output(10));
    bit11 : ENTITY work.BIT(bit_arch)
        PORT MAP(input => input(11), load => load, clk => clk, output => output(11));
    bit12 : ENTITY work.BIT(bit_arch)
        PORT MAP(input => input(12), load => load, clk => clk, output => output(12));
    bit13 : ENTITY work.BIT(bit_arch)
        PORT MAP(input => input(13), load => load, clk => clk, output => output(13));
    bit14 : ENTITY work.BIT(bit_arch)
        PORT MAP(input => input(14), load => load, clk => clk, output => output(14));
    bit15 : ENTITY work.BIT(bit_arch)
        PORT MAP(input => input(15), load => load, clk => clk, output => output(15));
END ARCHITECTURE regist_arch;