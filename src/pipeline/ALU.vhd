----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:25:42 03/11/2020 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_signed.all;
library UNISIM;
use UNISIM.VComponents.all;


entity ALU is

    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0) ;
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Op : in  STD_LOGIC_VECTOR (3 downto 0);
           Out1 : inout STD_LOGIC_VECTOR (31 downto 0);
           Zero : out  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Ovf : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is


begin
process (A,B,Op,Out1)
	begin

	case Op is
		when "0000" => Out1<= A+B after 10 ns; --prosthesi
							Cout <= ((A(31) xnor B(31)) and  Out1(31)) or ((A(31) xor B(31)) and (not Out1(31)));-- cout se prosthesi
							Ovf<=((A(31) xnor  B(31)) and ( Out1(31) xor A(31)));--ovf se prosthesi
								
		when "0001" =>	Out1 <= A-B after 10 ns;		--afairesi
							Cout<=((A(31) xnor B(31)) and  (not Out1(31))) or ((A(31) xor B(31)) and Out1(31) ); --cout se afairesi
							Ovf<=((Out1(31) xnor B(31)) and (A(31) xor B(31))); --ovf se afairesi
							
		when "0010" => Out1 <=A AND B after 10 ns; --and
							Cout<='0';
							Ovf<='0';
		when "0011" => Out1 <=A OR B after 10 ns; -- or
							Cout<='0';
							Ovf<='0';
		when "0100" => Out1 <=(NOT A) after 10 ns; --antistrofi
							Cout<='0';
							Ovf<='0';
		when "0101" => Out1 <=A NAND B after 10 ns; --nand
							Cout<='0';
							Ovf<='0';
		when "1000" => Out1 <= std_logic_vector(shift_right(signed(A), 1)) after 10 ns;--arithmitiki olisthisi deksia kata 1(gemizei to msb me o,ti eixe to msb)
							Cout<='0';
							Ovf<='0';
		when "1001" => Out1 <= std_logic_vector(unsigned(A) srl 1) after 10 ns; --logiki olisthisi deksia kata 1 (gemizei to msb me 0)
							Cout<='0';
							Ovf<='0';
		when "1010" => Out1 <= std_logic_vector(unsigned(A) sll 1) after 10 ns; -- logiki olisthisi aristera kata 1(gemizei to lsb me 0)
							Cout<='0';
							Ovf<='0';
		when "1100" => Out1 <= std_logic_vector(unsigned(A) rol 1) after 10 ns; -- kukliki olisthisi aristera( sto lsb mpainei shift to msb)
							Cout<='0';
							Ovf<='0';
		when "1101" => Out1 <= std_logic_vector(unsigned(A) ror 1) after 10 ns; -- kukliki olisthisi deksia ( sto msb mpainei shift to lsb)
							Cout<='0';
							Ovf<='0';
		when others => Out1<="11111111111111111111111111111111" after 10 ns;
							Cout<='0';
							Ovf<='0';
	end case;
	
	
	
		case Out1 is

		when "00000000000000000000000000000000" => Zero <= '1';		--zero flag
		when others => Zero<='0';
end case;



end process;
end Behavioral;

