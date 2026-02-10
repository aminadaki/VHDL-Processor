----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:00:59 05/15/2020 
-- Design Name: 
-- Module Name:    Forwarding_Unit - Behavioral 
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
 
entity Forwarding_Unit is
	Port(RdExMem_in: in std_logic_vector (4 downto 0);
		  RdMemWr_in: in std_logic_vector (4 downto 0);
		  RsInsEx_in: in std_logic_vector (4 downto 0);
		  RtInsEx_in: in std_logic_vector (4 downto 0);
		  RFWrEn_ExMem: in std_logic;
		  RFWrEn_MemWr: in std_logic;
		  sel_fwA: out std_logic_vector (1 downto 0);
		  sel_fwB: out std_logic_vector (1 downto 0));
end Forwarding_Unit;

architecture Behavioral of Forwarding_Unit is

begin
	process(RdExMem_in,RdMemWr_in,RsInsEx_in,RtInsEx_in,RFWrEn_ExMem,RFWrEn_MemWr)
		begin
		
		  
			if((RFWrEn_ExMem ='1' and RdExMem_in  /= "00000") and (RdExMem_in= RsInsEx_in)) then
				sel_fwA <= "10";
			elsif ((RFWrEn_MemWr='1' and RdMemWr_in/="00000") and (RdMemWr_in=RsInsEx_in)) then
				sel_fwA<="01";
			else 
				sel_fwA<="00";
		  end if;
		  
		  if((RFWrEn_ExMem='1' and RdExMem_in/="00000") and (RdExMem_in=RtInsEx_in)) then
				sel_fwB<="10";
			elsif ((RFWrEn_MemWr='1' and RdMemWr_in/="00000") and (RdMemWr_in=RtInsEx_in)) then
				sel_fwB<="01";
			else 
				sel_fwB<="00";
		  end if;
end process;	  
			
 
  
end Behavioral;

