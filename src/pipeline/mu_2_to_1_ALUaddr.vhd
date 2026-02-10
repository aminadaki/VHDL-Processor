----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:38:48 05/13/2020 
-- Design Name: 
-- Module Name:    mu_2_to_1_ALUaddr - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mu_2_to_1_ALUaddr is
		Port(		In0 : in  STD_LOGIC_VECTOR (31 downto 0);
					In1 : in  STD_LOGIC_VECTOR (31 downto 0);
					In2: in STD_LOGIC;
					In3: in STD_LOGIC;
					Sel : in STD_LOGIC_VECTOR(1 downto 0);
					DataOut1 : out  STD_LOGIC_VECTOR (31 downto 0);
					DataOut2 :out STD_LOGIC);

end mu_2_to_1_ALUaddr;

architecture Behavioral of mu_2_to_1_ALUaddr is
begin
process(Sel,In0,In1,In2,In3)
	 begin
		case Sel is
				
				when "01" => DataOut1<=In0;
				             DataOut2<=In2;
				                
				when "10" => DataOut1<=In1;
								 DataOut2<=In3;
				when others => DataOut1 <= "00000000000000000000000000000000";
									DataOut2 <='0';
		 end case;
end process;

end Behavioral;

