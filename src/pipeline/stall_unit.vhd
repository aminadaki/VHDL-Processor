----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:14:10 05/16/2020 
-- Design Name: 
-- Module Name:    stall_unit - Behavioral 
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

entity stall_unit is
	Port(RdDecEx_in: in std_logic_vector (4 downto 0);
		  RsInstDec_in: in std_logic_vector (4 downto 0);
		  RtInstDec_in: in std_logic_vector (4 downto 0);
		  SelAluAddress: in std_logic_vector (1 downto 0);
		  stall_flag: out std_logic);

end stall_unit;

architecture Behavioral of stall_unit is

begin
	process(RdDecEx_in,RsInstDec_in,RtInstDec_in,SelAluAddress)
		begin
				if(SelAluAddress="10" and ((RdDecEx_in=RsInstDec_in) or (RdDecEx_in=RtInstDec_in)))then
					stall_flag<='1';
				 else 
					stall_flag<='0';
				end if;
   end process;

end Behavioral;

