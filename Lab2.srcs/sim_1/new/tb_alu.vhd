library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_alu is
--  Port ( );
end tb_alu;

architecture Behavioral of tb_alu is

    component my_alu
        Port ( A, B, x : in std_logic_vector(3 downto 0);
               output : out std_logic_vector(3 downto 0));
    end component;

    signal tb_A, tb_B, tb_x, tb_output : std_logic_vector(3 downto 0) := (others => '0');

begin

    a_proc: process
    begin 
        tb_A <= "0001"; wait for 2000 ms;
    end process;

    b_proc: process
    begin 
        tb_B <= "0001"; wait for 2000 ms;
    end process;
    
    x_proc: process
    begin 
        for I in 0 to 15 loop
            tb_x <= std_logic_vector(unsigned(tb_x) + 1);
            wait for 100 ms;
        end loop;
    end process;
    
    alu_divice: my_alu
    port map ( A => tb_A,
               B => tb_B,
               x => tb_x,
               output => tb_output);
    
end Behavioral;
