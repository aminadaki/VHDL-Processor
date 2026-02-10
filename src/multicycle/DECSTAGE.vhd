----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:51:49 03/19/2020 
-- Design Name: 
-- Module Name:    DECSTAGE - Behavioral 
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

entity DECSTAGE is
Port (Instr : in std_logic_vector (31 downto 0);
		RF_WrEn : in std_logic;
		ALU_out : in std_logic_vector (31 downto 0);
		MEM_out : in std_logic_vector (31 downto 0);
		RF_WrData_sel : in std_logic;
		RF_B_sel : in std_logic;
		ImmExt : in std_logic_vector (1 downto 0);
		Clk : in std_logic;
		Immed : out std_logic_vector (31 downto 0);
		RF_A : out std_logic_vector (31 downto 0);
		rst:in std_logic;
		RF_B : out std_logic_vector (31 downto 0)
        );
end DECSTAGE;

architecture Behavioral of DECSTAGE is

signal mux_WrData_out : std_logic_vector (31 downto 0);
signal  mux_RF_out : std_logic_vector (4 downto 0);


component Register_File 
 Port ( 	  Ard1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Ard2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Awr : in  STD_LOGIC_VECTOR (4 downto 0);
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           WrEn : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
			  Dout1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Dout2 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reset : in STD_LOGIC			  );
end component;

component MUX_2_to_1
Port(		  In0 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In1 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Sel : in STD_LOGIC;
			  DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component MUX_2_to_1_5bit
Port(				In0 : in  STD_LOGIC_VECTOR (4 downto 0);
					In1 : in  STD_LOGIC_VECTOR (4 downto 0);
					Sel : in STD_LOGIC;
					DataOut : out  STD_LOGIC_VECTOR (4 downto 0));
end component;

component Immediate
Port(	Instr: in std_logic_vector (15 downto 0);
		Immed1 : out std_logic_vector ( 31 downto 0);
		selector : in std_logic_vector (1 downto 0)
		);
		
end component;


begin

regFile : Register_File
		Port Map( Ard1 =>Instr(25 downto 21), 
					 Ard2 =>mux_RF_out,
					 Awr =>Instr(20 downto 16),
					 Din =>mux_WrData_out,
					 WrEn =>RF_WrEn,
					 Clk =>Clk,
					 Dout1 =>RF_A,
					 Dout2 =>RF_B,
					 Reset =>rst	);



mux_RF : MUX_2_to_1_5bit
		Port Map(	In0 => Instr(15 downto 11),
						In1 => Instr (20 downto 16),
						Sel => RF_B_sel,
						DataOut =>mux_RF_out);
						
mux_WrData : MUX_2_to_1
		Port Map(	In0 =>ALU_out,
						In1 =>MEM_out,
						Sel => RF_WRData_sel,
						DataOut =>mux_WrData_out);
						
immed1: Immediate
	   Port Map(	Instr=>Instr(15 downto 0),
						Immed1 => Immed,
						selector =>ImmExt);

end Behavioral;

