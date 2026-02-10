----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:12:43 05/05/2020 
-- Design Name: 
-- Module Name:    InstrReg - Behavioral 
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

entity InstrReg is
Port (     CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           DataIn : in  STD_LOGIC_VECTOR (31 downto 0);
           WrEn : in  STD_LOGIC;
           DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end InstrReg;


architecture Behavioral of InstrReg is



begin
	process(CLK,RST,WrEn,DataIn)
	  begin
			
			  if (RST = '1') then
						DataOut <= "00000000000000000000000000000000";
			  elsif (rising_edge(CLK)) then
					if (WrEn = '1') then
							DataOut <= DataIn;
					end if;
			  end if;
   end process;




end Behavioral;




