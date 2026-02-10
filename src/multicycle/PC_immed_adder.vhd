----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:36:41 03/18/2020 
-- Design Name: 
-- Module Name:    PC_immed_adder - Behavioral 
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

use ieee.NUMERIC_STD.all;
use ieee.std_logic_signed.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC_immed_adder is
	Port(
			PCin : in std_logic_vector (31 downto 0);
			PCimmed : in std_logic_vector (31 downto 0);
			PCimOut : out std_logic_vector ( 31 downto 0));
			
end PC_immed_adder;

architecture Behavioral of PC_immed_adder is

signal add4 : std_logic_vector (31 downto 0);

begin
add4<= "00000000000000000000000000000100";
	process(PCin,PCimmed,add4)
		begin 
			PCimOut<= PCin + add4 + PCimmed;

end process;


end Behavioral;

