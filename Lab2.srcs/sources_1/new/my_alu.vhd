--my_alu

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity my_alu is
    Port ( A, B, x : in std_logic_vector(3 downto 0);
           output : out std_logic_vector(3 downto 0));
end my_alu;

architecture Behavioral of my_alu is
    
begin

    alu_proc: process (x, A, B)
    begin
        case (x) is 
        when "0000" =>  -- x0
            output <= std_logic_vector(unsigned(A) + unsigned(B));
        when "0001" =>  --x1
            output <= std_logic_vector(unsigned(A) - unsigned(B));
        when "0010" =>  --x2
            output <= std_logic_vector(unsigned(A) + 1);
        when "0011" =>  --x3
            output <= std_logic_vector(unsigned(A) - 1);
        when "0100" =>  --x4
            output <= std_logic_vector( 0 - unsigned(A));
        when "0101" =>  --x5
            if ( A > B ) then
                output <= "0001";
            else
                output <= "0000";
            end if;
        when "0110" =>  --x6
            output <= std_logic_vector(unsigned(A) sll 1);
        when "0111" =>  --x7
            output <= std_logic_vector(unsigned(A) srl 1);
        when "1000" =>  --x8
            output <= to_stdlogicvector(to_bitvector(A) sra 1);
        when "1001" =>  --x9
            output <= not A;
        when "1010" =>  --xA
            output <= A and B;
        when "1011" =>  --xB
            output <= A or B;
        when "1100" =>  --xC
            output <= A xor B;
        when "1101" =>  --xD
            output <= A xnor B;
        when "1110" =>  --xE
            output <= A nand B;
        when "1111" =>  --xF
            output <= A nor B;
        when others =>
            output <= "0000";
        end case;
    end process;

end Behavioral;
