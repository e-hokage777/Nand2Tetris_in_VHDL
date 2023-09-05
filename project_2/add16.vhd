LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY add16 IS
    PORT (
        a: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        b: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        output: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END ENTITY add16;

ARCHITECTURE add16_arch OF add16 IS
    SIGNAL carry_0: STD_LOGIC;
    SIGNAL carry_1: STD_LOGIC;
    SIGNAL carry_2: STD_LOGIC;
    SIGNAL carry_3: STD_LOGIC;
    SIGNAL carry_4: STD_LOGIC;
    SIGNAL carry_5: STD_LOGIC;
    SIGNAL carry_6: STD_LOGIC;
    SIGNAL carry_7: STD_LOGIC;
    SIGNAL carry_8: STD_LOGIC;
    SIGNAL carry_9: STD_LOGIC;
    SIGNAL carry_10: STD_LOGIC;
    SIGNAL carry_11: STD_LOGIC;
    SIGNAL carry_12: STD_LOGIC;
    SIGNAL carry_13: STD_LOGIC;
    SIGNAL carry_14: STD_LOGIC;
    SIGNAL carry_15: STD_LOGIC;
BEGIN
    full_adder_0: ENTITY work.full_adder(full_adder_arch)
        PORT MAP(a => a(0), b => b(0), cin => '0', sum => output(0), cout => carry_0);
    full_adder_1: ENTITY work.full_adder(full_adder_arch)
        PORT MAP(a => a(1), b => b(1), cin => carry_0, sum => output(1), cout => carry_1);
    full_adder_2: ENTITY work.full_adder(full_adder_arch)
        PORT MAP(a => a(2), b => b(2), cin => carry_1, sum => output(2), cout => carry_2);
    full_adder_3: ENTITY work.full_adder(full_adder_arch)
        PORT MAP(a => a(3), b => b(3), cin => carry_2, sum => output(3), cout => carry_3);
    full_adder_4: ENTITY work.full_adder(full_adder_arch)
        PORT MAP(a => a(4), b => b(4), cin => carry_3, sum => output(4), cout => carry_4);
    full_adder_5: ENTITY work.full_adder(full_adder_arch)
        PORT MAP(a => a(5), b => b(5), cin => carry_4, sum => output(5), cout => carry_5);
    full_adder_6: ENTITY work.full_adder(full_adder_arch)
        PORT MAP(a => a(6), b => b(6), cin => carry_5, sum => output(6), cout => carry_6);
    full_adder_7: ENTITY work.full_adder(full_adder_arch)
        PORT MAP(a => a(7), b => b(7), cin => carry_6, sum => output(7), cout => carry_7);
    full_adder_8: ENTITY work.full_adder(full_adder_arch)
        PORT MAP(a => a(8), b => b(8), cin => carry_7, sum => output(8), cout => carry_8);
    full_adder_9: ENTITY work.full_adder(full_adder_arch)
        PORT MAP(a => a(9), b => b(9), cin => carry_8, sum => output(9), cout => carry_9);
    full_adder_10: ENTITY work.full_adder(full_adder_arch)
        PORT MAP(a => a(10), b => b(10), cin => carry_9, sum => output(10), cout => carry_10);
    full_adder_11: ENTITY work.full_adder(full_adder_arch)
        PORT MAP(a => a(11), b => b(11), cin => carry_10, sum => output(11), cout => carry_11);
    full_adder_12: ENTITY work.full_adder(full_adder_arch)
        PORT MAP(a => a(12), b => b(12), cin => carry_11, sum => output(12), cout => carry_12);
    full_adder_13: ENTITY work.full_adder(full_adder_arch)
        PORT MAP(a => a(13), b => b(13), cin => carry_12, sum => output(13), cout => carry_13);
    full_adder_14: ENTITY work.full_adder(full_adder_arch)
        PORT MAP(a => a(14), b => b(14), cin => carry_13, sum => output(14), cout => carry_14);
    full_adder_15: ENTITY work.full_adder(full_adder_arch)
        PORT MAP(a => a(15), b => b(15), cin => carry_14, sum => output(15), cout => carry_15);
END ARCHITECTURE add16_arch;