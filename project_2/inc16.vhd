LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY inc16 IS
    PORT (
        input: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        output: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END ENTITY inc16;

ARCHITECTURE inc16_arch OF inc16 IS
BEGIN
    add16_comp: ENTITY work.add16(add16_arch)
        PORT MAP(a => input, b => "0000000000000001", output => output);
END ARCHITECTURE inc16_arch;