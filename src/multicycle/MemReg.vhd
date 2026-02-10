----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:15:20 05/05/2020 
-- Design Name: 
-- Module Name:    MemReg - Behavioral 
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

entity MemReg is
Port (     CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           DataIn1 : in  STD_LOGIC_VECTOR (31 downto 0);
			  DataIn2 : in  STD_LOGIC_VECTOR (31 downto 0);
           WrEn : in  STD_LOGIC;
           DataOut1 : out  STD_LOGIC_VECTOR (31 downto 0);
			  DataOut2 : out  STD_LOGIC_VECTOR (31 downto 0));
end MemReg;

architecture Behavioral of MemReg is

begin
process(CLK,RST,WrEn,DataIn1,DataIn2)
	  begin
			
			  if (RST = '1') then
						DataOut1 <= "00000000000000000000000000000000";
						DataOut2 <= "00000000000000000000000000000000";
			  elsif (rising_edge(CLK)) then
					if (WrEn = '1') then
							DataOut1 <= DataIn1;
							DataOut2 <= DataIn2;

					end if;
			  end if;
   end process;


end Behavioral;

