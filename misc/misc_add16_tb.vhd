LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY misc_add16_tb IS
END ENTITY misc_add16_tb;

ARCHITECTURE misc_add16_tb_arch OF misc_add16_tb IS
    SIGNAL a_b : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL b_b : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL output_b : STD_LOGIC_VECTOR(15 DOWNTO 0);
    -- SIGNAL a_u : UNSIGNED(15 DOWNTO 0);
    -- SIGNAL b_u : UNSIGNED(15 DOWNTO 0);
    -- SIGNAL output_u : UNSIGNED(15 DOWNTO 0);
    SIGNAL a_u : INTEGER;
    SIGNAL b_u : INTEGER;
    SIGNAL output_u : INTEGER;
BEGIN
    add16_comp : ENTITY work.add16(add16_arch)
        PORT MAP(a => a_b, b => b_b, output => output_b);

        a_b <= std_logic_vector(to_signed(a_u, a_b'length));
        b_b <= std_logic_vector(to_signed(b_u, b_b'length));
        output_u <= to_integer(signed(output_b));

    -- test_process : PROCESS(a_u, b_u)
    -- BEGIN
    --     -- a_u <= 1;
    --     -- b_u <= 15;
    --     -- a_b <= std_logic_vector(to_signed(a_u, a_b'length));
    --     -- b_b <= std_logic_vector(to_signed(b_u, b_b'length));
    --     -- output_u <= to_integer(signed(output_b));
    -- END PROCESS;

END ARCHITECTURE misc_add16_tb_arch; -- misc_add16_tb_arch