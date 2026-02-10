----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:14:44 03/17/2020 
-- Design Name: 
-- Module Name:    IF_STAGE - Behavioral 
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

entity IF_vathmida is
    Port ( PC_Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_sel : in  STD_LOGIC;
           PC_LdEn : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           PC : out  STD_LOGIC_VECTOR (31 downto 0));
end IF_vathmida;

architecture Behavioral of IF_vathmida is

signal muxOUT : std_logic_vector (31 downto 0);
signal muxIN0,muxIN1,PC_Out : std_logic_vector (31 downto 0);

component Register_32bit
Port ( 	  CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           DataIn : in  STD_LOGIC_VECTOR (31 downto 0);
           WrEn : in  STD_LOGIC;
           DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component MUX_2_to_1
Port ( 		   In0 : in  STD_LOGIC_VECTOR (31 downto 0);
					In1 : in  STD_LOGIC_VECTOR (31 downto 0);
					Sel : in STD_LOGIC;
					DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component PC_immed_adder
Port ( 	  PCin : in std_logic_vector (31 downto 0);
			  PCimmed : in std_logic_vector (31 downto 0);
			  PCimOut : out std_logic_vector ( 31 downto 0));
end component;

component PC_4_adder
Port ( 	  PC_in : in std_logic_vector (31 downto 0);
			  PC_out : out std_logic_vector (31 downto 0));
end component;

begin
PC<=PC_Out;
regi: Register_32bit
			Port Map( CLK =>Clk,
						 DataIn =>muxOUT,
						 WrEn =>PC_LdEn,
						 DataOut=>PC_Out,
						 RST=>Reset);
						 
mux2_to1: MUX_2_to_1
		   Port Map ( In0=> muxIN0,
						  In1=> muxIN1,
						  Sel=>PC_sel,
						  DataOut=>muxOUT);
						 
pc4: PC_4_adder
		   Port Map ( 	PC_in =>PC_Out,
							PC_out =>muxIN0 );		

pcImm: PC_immed_adder
			Port Map ( 	PCin =>PC_Out,
							PCimmed =>PC_Immed,
							PCimOut =>muxIN1 );						

end Behavioral;

