----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:18:51 05/16/2020 
-- Design Name: 
-- Module Name:    mux_pcLdEn - Behavioral 
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

entity mux_pcLdEn is
	Port(In0: in std_logic;
		  In1: in std_logic;
		  sel: in std_logic;
		  muxPCEnout: out std_logic
				);

end mux_pcLdEn;

architecture Behavioral of mux_pcLdEn is

begin
process(In0,In1,sel)
	 begin
		case sel is
				
				when '0' => muxPCEnout<=In0;
				                
				when '1' =>muxPCEnout<=In1;
								 
				when others => muxPCEnout <='0';
									
		 end case;
end process;
	


end Behavioral;

