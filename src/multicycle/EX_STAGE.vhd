----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:34:40 03/22/2020 
-- Design Name: 
-- Module Name:    EX_STAGE - Behavioral 
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

entity EX_STAGE is
    Port ( RF_A : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_B : in  STD_LOGIC_VECTOR (31 downto 0);
           Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           ALU_Bin_sel : in  STD_LOGIC;
           ALU_func : in  STD_LOGIC_VECTOR (3 downto 0);
           ALU_out : inout  STD_LOGIC_VECTOR (31 downto 0);
           ALU_zero : out  STD_LOGIC);
end EX_STAGE;


architecture Behavioral of EX_STAGE is

signal mux_ALU_out : std_logic_vector (31 downto 0);

component ALU
	 Port ( A : in  STD_LOGIC_VECTOR (31 downto 0) ;
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Op : in  STD_LOGIC_VECTOR (3 downto 0);
           Out1 : inout STD_LOGIC_VECTOR (31 downto 0);
           Zero : out  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Ovf : out  STD_LOGIC);
end component;

component MUX_2_to_1 
		Port(		In0 : in  STD_LOGIC_VECTOR (31 downto 0);
					In1 : in  STD_LOGIC_VECTOR (31 downto 0);
					Sel : in STD_LOGIC;
					DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

begin

alu1: ALU 
	Port Map( A =>RF_A,
				 B =>mux_ALU_out,
				 Op =>ALU_func,
				 Out1 =>ALU_out,
				 Zero =>ALU_zero,
				 Cout =>open,
				 Ovf =>open );

mux_ALU: MUX_2_to_1
	Port Map(	In0 => RF_B,
					In1 =>Immed,
					Sel =>ALU_Bin_sel,
					DataOut =>mux_ALU_out );

end Behavioral;

