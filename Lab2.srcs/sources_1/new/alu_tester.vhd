--alu_tester

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu_tester is
    Port ( sw, btn : in std_logic_vector(3 downto 0);
           clk : in std_logic;
           led : out std_logic_vector(3 downto 0));
end alu_tester;

architecture Behavioral of alu_tester is

    component debounce
        Port ( btn, clk : in std_logic;
               dbnc : out std_logic);
    end component;
    component my_alu
        Port ( A, B, x : in std_logic_vector(3 downto 0);
               output : out std_logic_vector(3 downto 0));
    end component;
    
    signal d0, d1, d2, d3 : std_logic;
    signal x, a, b, led_reg : std_logic_vector(3 downto 0);
    
begin

    alu_unit:  my_alu
    port map ( A => a,
               B => b,
               x => x, 
               output => led_reg);
    
    deb0: debounce
    port map ( btn => btn(0),
               clk => clk,
               dbnc => d0);               
    deb1: debounce
    port map ( btn => btn(1),
               clk => clk,
               dbnc => d1);                            
    deb2: debounce
    port map ( btn => btn(2),
               clk => clk,
               dbnc => d2);           
    deb3: debounce
    port map ( btn => btn(3),
               clk => clk,
               dbnc => d3); 
   
    load_a: process(clk)
    begin
        if rising_edge(clk) then
        if (d3 = '1') then
            a <= "0000";
            b <= "0000";
            x <= "0000";
        end if;
        if (d2 = '1') then
            x <= sw;
        end if;
        if (d1 = '1') then
            a <= sw;
        end if;
        if (d0 = '1') then
            b <= sw;
        end if;
        end if;
    end process;   
    
    led <= led_reg;
  
end Behavioral;
