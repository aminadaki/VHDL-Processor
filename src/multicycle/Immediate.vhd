----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:46:13 03/21/2020 
-- Design Name: 
-- Module Name:    Immediate - Behavioral 
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
use IEEE.STD_LOGIC_1164.ALL;
use ieee.NUMERIC_STD.all;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_signed.all;
library UNISIM;
use UNISIM.VComponents.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Immediate is
Port(	Instr: in std_logic_vector (15 downto 0);
		Immed1 : out std_logic_vector ( 31 downto 0);
		selector : in std_logic_vector (1 downto 0)
		
		);
end Immediate;

architecture Behavioral of Immediate is
signal signExtend: std_logic_vector(31 downto 0);
signal zeroFilling : std_logic_vector(31 downto 0);
begin
	process(Instr,selector,signExtend,zeroFilling)
		begin 
			case selector is 
			 
				when "00" => Immed1<=std_logic_vector(resize(unsigned(Instr), Immed1 'length)); --zerofilling
				
				when "01" => Immed1<=std_logic_vector(resize(signed(Instr), Immed1 'length)); -- sign extend
				
				when "10" => zeroFilling<=std_logic_vector(resize(unsigned(Instr), zeroFilling 'length));
								 Immed1<=std_logic_vector(unsigned(zeroFilling) sll 16);--shift 16 me zero filling
								
				when "11" => signExtend<=std_logic_vector(resize(signed(Instr), signExtend 'length));
								 Immed1<=std_logic_vector(signed(signExtend) sll 2); --shift 2 me sign extend
								 
				when others => Immed1<="00000000000000000000000000000000";
			end case;
	end process;
end Behavioral;
