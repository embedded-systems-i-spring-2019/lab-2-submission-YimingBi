--ripple_adder

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ripple_adder is
    Port ( A, B : in STD_LOGIC_VECTOR (3 downto 0);
           C_in : in std_logic;
           C_out : out std_logic;
           S : out std_logic_vector (3 downto 0));
end ripple_adder;

architecture Behavioral of ripple_adder is
    
    component adder
    Port ( A, B, C_in : in STD_LOGIC;
           S, C_out : out STD_LOGIC);
    end component;
    
    signal C1_out, C2_out, C3_out : std_logic;
    
begin
    a1: adder
    port map ( A => A(0),
               B => B(0),
               C_in => C_in,
               S => S(0),
               C_out => C1_out);
               
    a2: adder
    port map ( A => A(1),
               B => B(1),
               C_in => C1_out,
               S => S(1),
               C_out => C2_out);

    a3: adder
    port map ( A => A(2),
               B => B(2),
               C_in => C2_out,
               S => S(2),
               C_out => C3_out);
               
    a4: adder
    port map ( A => A(3),
               B => B(3),
               C_in => C3_out,
               S => S(3),
               C_out => C_out);      
                        
end Behavioral;
