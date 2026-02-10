----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:13:09 03/21/2020 
-- Design Name: 
-- Module Name:    MUX_2_to_1_5bit - Behavioral 
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

entity MUX_2_to_1_5bit is
	Port(			In0 : in  STD_LOGIC_VECTOR (4 downto 0);
					In1 : in  STD_LOGIC_VECTOR (4 downto 0);
					Sel : in STD_LOGIC;
					DataOut : out  STD_LOGIC_VECTOR (4 downto 0));
end MUX_2_to_1_5bit;

architecture Behavioral of MUX_2_to_1_5bit is


begin
process(Sel,In0,In1)
	 begin
		case Sel is
				
				when '0' => DataOut<=In0 after 10 ns;
				when '1' => DataOut<=In1 after 10 ns;
				when others => DataOut <= "00000";
		 end case;
end process;


end Behavioral;

