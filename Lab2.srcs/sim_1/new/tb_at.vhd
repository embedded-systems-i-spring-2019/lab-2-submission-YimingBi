library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_at is
--  Port ( );
end tb_at;

architecture Behavioral of tb_at is

    component alu_tester
        Port ( sw, btn : in std_logic_vector(3 downto 0);
               clk : in std_logic;
               led : out std_logic_vector(3 downto 0));
    end component;

    signal tb_sw, tb_btn, tb_led : std_logic_vector(3 downto 0) := (others => '0');
    signal tb_clk : std_logic;
    
begin

    clk_gen_proc: process
    begin 
        wait for 4 ns;
        tb_clk <= '1';
        wait for 4 ns;
        tb_clk <= '0';  
    end process clk_gen_proc;
    
    btn_proc: process
    begin
        tb_btn <= "0001";   wait for 30ms;
        tb_btn <= "0010";   wait for 30ms;
        tb_btn <= "0100";   wait for 30ms;
        tb_btn <= "1000";   wait for 30ms;
    end process;
    
    sw_proc: process
    begin 
        tb_sw <= "0001";    wait for 30 ms;
        tb_sw <= "0001";    wait for 30 ms;
        tb_sw <= "0000";    wait for 30 ms;
        tb_sw <= "0000";    wait for 30 ms;
        tb_sw <= "0100";    wait for 30 ms;
        tb_sw <= "0010";    wait for 30 ms;
        tb_sw <= "0001";    wait for 2000 ms;        
    end process;
    
    divice: alu_tester
    port map ( sw => tb_sw,
               btn => tb_btn,
               clk => tb_clk,
               led => tb_led);
end Behavioral;
