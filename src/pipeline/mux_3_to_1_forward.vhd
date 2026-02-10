----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:56:14 05/15/2020 
-- Design Name: 
-- Module Name:    mux_3_to_1_forward - Behavioral 
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

entity mux_3_to_1_forward is
		Port(		In0 : in  STD_LOGIC_VECTOR (31 downto 0);
					In1 : in  STD_LOGIC_VECTOR (31 downto 0);
					In2: in STD_LOGIC_VECTOR (31 downto 0);
					Sel : in STD_LOGIC_VECTOR(1 downto 0);
					DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
					
end mux_3_to_1_forward;

architecture Behavioral of mux_3_to_1_forward is

begin
process(Sel,In0,In1,In2)
	 begin
		case Sel is
				
				when "00" => DataOut<=In0;
				                
				when "10" => DataOut<=In1;
				
				when "01" => DataOut<=In2;
								 
				when others => DataOut <= "00000000000000000000000000000000";
									
		 end case;
end process;



end Behavioral;

