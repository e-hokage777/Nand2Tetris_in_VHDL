LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY alu_tb IS
END ENTITY alu_tb;

ARCHITECTURE alu_tb_arch OF alu_tb IS
    SIGNAL x : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL y : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL input : STD_LOGIC_VECTOR(5 DOWNTO 0);
    SIGNAL output: STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL zr : STD_LOGIC;
    SIGNAL ng : STD_LOGIC;
BEGIN
    alu_comp : ENTITY work.alu(alu_arch)
        PORT MAP(
            x => x,
            y => y,
            zx => input(5),
            nx => input(4),
            zy => input(3),
            ny => input(2),
            f => input(1),
            no => input(0),
            output => output,
            zr => zr,
            ng => ng
        );

        test_process : PROCESS
        BEGIN

            -- x <= "0000000000001001";
            -- y <= "0000000000000111";
            input <= (OTHERS => '0');
            WAIT FOR 100 ns;

            -- computes: 0
            -- x <= "0000000000001001";
            -- y <= "0000000000000111";
            input <= "101010";
            WAIT FOR 100 ns;

            -- computes: 1
            -- x <= "0000000000001001";
            -- y <= "0000000000000111";
            input <= (OTHERS => '1');
            WAIT FOR 100 ns;

            -- computes: -1
            -- x <= "0000000000001001";
            -- y <= "0000000000000111";
            input <= "111010";

            -- computes: x
            WAIT FOR 100 ns;
            -- x <= "0000000000001001";
            -- y <= "0000000000000111";
            input <= "001100";

            -- computes: y
            WAIT FOR 100 ns;
            -- x <= "0000000000001001";
            -- y <= "0000000000000111";
            input <= "110000";


            -- computes: !x
            WAIT FOR 100 ns;
            -- x <= "0000000000001001";
            -- y <= "0000000000000111";
            input <= "001101";

            -- computes: !y
            WAIT FOR 100 ns;
            -- x <= "0000000000001001";
            -- y <= "0000000000000111";
            input <= "110001";

            -- computes: -x
            WAIT FOR 100 ns;
            -- x <= "0000000000001001";
            -- y <= "0000000000000111";
            input <= "001111";

            -- computes: -y
            WAIT FOR 100 ns;
            -- x <= "0000000000001001";
            -- y <= "0000000000000111";
            input <= "110011";

            -- computes: x+1
            WAIT FOR 100 ns;
            -- x <= "0000000000001001";
            -- y <= "0000000000000111";
            input <= "011111";

            -- computes: y+1
            WAIT FOR 100 ns;
            -- x <= "0000000000001001";
            -- y <= "0000000000000111";
            input <= "110111";


            WAIT FOR 100 ns;

            WAIT;
        END PROCESS;
END ARCHITECTURE alu_tb_arch;