----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:31:01 03/18/2020 
-- Design Name: 
-- Module Name:    MUX_2_to_1 - Behavioral 
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

entity MUX_2_to_1 is
		Port(		In0 : in  STD_LOGIC_VECTOR (31 downto 0);
					In1 : in  STD_LOGIC_VECTOR (31 downto 0);
					Sel : in STD_LOGIC;
					DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX_2_to_1;

architecture Behavioral of MUX_2_to_1 is
begin
process(Sel,In0,In1)
	 begin
		case Sel is
				
				when '0' => DataOut<=In0  ;
				when '1' => DataOut<=In1 ;
				when others => DataOut <= "00000000000000000000000000000000";
		 end case;
end process;

end Behavioral;

