LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;

ENTITY misc_adder IS
    PORT (
        a : IN UNSIGNED(15 DOWNTO 0);
        b : IN UNSIGNED(15 DOWNTO 0);
        output : OUT UNSIGNED(15 DOWNTO 0)
    );
END ENTITY misc_adder;

ARCHITECTURE misc_adder_arch OF misc_adder IS
    SIGNAL a_b : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL b_b : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL output_b : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
    -- converting unsigned to binary
    a_b <= std_logic_vector(a);
    b_b <= std_logic_vector(b);
    add16_comp : ENTITY work.add16(add16_arch)
        PORT MAP(a_b, b_b, output => output_b);

    output <= unsigned(output_b);
END ARCHITECTURE misc_adder_arch;