----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:00:55 03/14/2020 
-- Design Name: 
-- Module Name:    Decoder_5_to_32 - Behavioral 
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

entity Decoder_5_to_32 is
	Port( DecIn : in std_logic_vector (4 downto 0);
			DecOut: out std_logic_vector(31 downto 0));


end Decoder_5_to_32;

architecture Behavioral of Decoder_5_to_32 is

begin
process(DecIn)
	 begin
		case DecIn is
				
				when "00000" => DecOut<= "00000000000000000000000000000001" after 10 ns;
				when "00001" => DecOut<= "00000000000000000000000000000010" after 10 ns;
				when "00010" => DecOut<= "00000000000000000000000000000100" after 10 ns;
				when "00011" => DecOut<= "00000000000000000000000000001000" after 10 ns;
				when "00100" => DecOut<= "00000000000000000000000000010000" after 10 ns;
				when "00101" => DecOut<= "00000000000000000000000000100000" after 10 ns;
				when "00110" => DecOut<= "00000000000000000000000001000000" after 10 ns;
				when "00111" => DecOut<= "00000000000000000000000010000000" after 10 ns;
				when "01000" => DecOut<= "00000000000000000000000100000000" after 10 ns;
				when "01001" => DecOut<= "00000000000000000000001000000000" after 10 ns;
				when "01010" => DecOut<= "00000000000000000000010000000000" after 10 ns;
				when "01011" => DecOut<= "00000000000000000000100000000000" after 10 ns;
				when "01100" => DecOut<= "00000000000000000001000000000000" after 10 ns;
				when "01101" => DecOut<= "00000000000000000010000000000000" after 10 ns;
				when "01110" => DecOut<= "00000000000000000100000000000000" after 10 ns;
				when "01111" => DecOut<= "00000000000000001000000000000000" after 10 ns;
				when "10000" => DecOut<= "00000000000000010000000000000000" after 10 ns;
				when "10001" => DecOut<= "00000000000000100000000000000000" after 10 ns;
				when "10010" => DecOut<= "00000000000001000000000000000000" after 10 ns;
				when "10011" => DecOut<= "00000000000010000000000000000000" after 10 ns;
				when "10100" => DecOut<= "00000000000100000000000000000000" after 10 ns;
				when "10101" => DecOut<= "00000000001000000000000000000000" after 10 ns;
				when "10110" => DecOut<= "00000000010000000000000000000000" after 10 ns;
				when "10111" => DecOut<= "00000000100000000000000000000000" after 10 ns;
				when "11000" => DecOut<= "00000001000000000000000000000000" after 10 ns;
				when "11001" => DecOut<= "00000010000000000000000000000000" after 10 ns;
				when "11010" => DecOut<= "00000100000000000000000000000000" after 10 ns;
				when "11011" => DecOut<= "00001000000000000000000000000000" after 10 ns;
				when "11100" => DecOut<= "00010000000000000000000000000000" after 10 ns;
				when "11101" => DecOut<= "00100000000000000000000000000000" after 10 ns;
				when "11110" => DecOut<= "01000000000000000000000000000000" after 10 ns;
				when "11111" => DecOut<= "10000000000000000000000000000000" after 10 ns;
				when others =>  DecOut<="00000000000000000000000000000000" after 10 ns;
			end case;	
	end process;




end Behavioral;

