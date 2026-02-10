----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:00:22 03/14/2020 
-- Design Name: 
-- Module Name:    MUX_32_to_1 - Behavioral 
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

entity MUX_32_to_1 is
Port ( 		
			  In_0 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_1 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_3 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_4 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_5 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_6 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_7 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_8 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_9 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_10 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_11 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_12 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_13 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_14 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_15 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_16 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_17 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_18 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_19 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_20 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_21 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_22 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_23 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_24 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_25 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_26 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_27 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_28 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_29 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_30 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_31 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Ard : in STD_LOGIC_VECTOR (4 downto 0);
           DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
			  
end MUX_32_to_1;


architecture Behavioral of MUX_32_to_1 is


begin
	process(Ard,In_0,In_1,In_2,In_3,In_4,In_5,In_6,In_7,In_8,In_9,In_10,In_11,In_12,In_13,In_14,In_15,In_16,In_17,In_18,In_19,In_20,In_21,In_22,In_23,In_24,In_25,In_26,In_27,In_28,In_29,In_30,In_31)
	 begin
	
		case Ard is
	
				when "00000" => DataOut<=In_0 after 10 ns;
				when "00001" => DataOut<=In_1 after 10 ns;
				when "00010" => DataOut<=In_2 after 10 ns;
				when "00011" => DataOut<=In_3 after 10 ns;
				when "00100" => DataOut<=In_4 after 10 ns;
				when "00101" => DataOut<=In_5 after 10 ns;
				when "00110" => DataOut<=In_6 after 10 ns;
				when "00111" => DataOut<=In_7 after 10 ns;
				when "01000" => DataOut<=In_8 after 10 ns;
				when "01001" => DataOut<=In_9 after 10 ns;
				when "01010" => DataOut<=In_10 after 10 ns;
				when "01011" => DataOut<=In_11 after 10 ns;
				when "01100" => DataOut<=In_12 after 10 ns;
				when "01101" => DataOut<=In_13 after 10 ns;
				when "01110" => DataOut<=In_14 after 10 ns;
				when "01111" => DataOut<=In_15 after 10 ns;
				when "10000" => DataOut<=In_16 after 10 ns;
				when "10001" => DataOut<=In_17 after 10 ns;
				when "10010" => DataOut<=In_18 after 10 ns;
				when "10011" => DataOut<=In_19 after 10 ns;
				when "10100" => DataOut<=In_20 after 10 ns;
				when "10101" => DataOut<=In_21 after 10 ns;
				when "10110" => DataOut<=In_22 after 10 ns;
				when "10111" => DataOut<=In_23 after 10 ns;
				when "11000" => DataOut<=In_24 after 10 ns;
				when "11001" => DataOut<=In_25 after 10 ns;
				when "11010" => DataOut<=In_26 after 10 ns;
				when "11011" => DataOut<=In_27 after 10 ns;
				when "11100" => DataOut<=In_28 after 10 ns;
				when "11101" => DataOut<=In_29 after 10 ns;
				when "11110" => DataOut<=In_30 after 10 ns;
				when "11111" => DataOut<=In_31 after 10 ns;
				when others => DataOut<="00000000000000000000000000000000" after 10 ns;
			end case;
			
	end process;



end Behavioral;

