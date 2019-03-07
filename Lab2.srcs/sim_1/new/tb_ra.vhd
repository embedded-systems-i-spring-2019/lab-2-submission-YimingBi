library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_ra is
--  Port ( );
end tb_ra;

architecture Behavioral of tb_ra is
    
    component ripple_adder
        Port ( A, B : in STD_LOGIC_VECTOR (3 downto 0);
               C_in : in std_logic;
               C_out : out std_logic;
               S : out std_logic_vector (3 downto 0));
    end component;
    
    signal tb_A, tb_B, tb_S : std_logic_vector(3 downto 0) := (others => '0');
    signal tb_C_in, tb_C_out : std_logic := '0';
    
begin

    inptA_proc: process
    begin
        for H in 0 to 1 loop
            for I in 0 to 15 loop
                for J in 0 to 15 loop
                    wait for 5 ms;
                    tb_B <= std_logic_vector(unsigned(tb_B) + 1);
                end loop;
                wait for 5 ms;
                tb_A <= std_logic_vector(unsigned(tb_A) + 1);
            end loop;
            tb_C_in <= not(tb_C_in);
        end loop;
    end process;

    divice: ripple_adder
    port map ( A => tb_A,
               B => tb_B,
               C_in => tb_C_in,
               C_out => tb_C_out,
               s => tb_S);

end Behavioral;
