----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:04:44 04/17/2020 
-- Design Name: 
-- Module Name:    DATAPATH - Behavioral 
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

entity DATAPATH is
		Port(
		
			  Clk: in std_logic;
			  Rst: in std_logic;
			  PC_sel_DATAPATH: in std_logic;
			  PC_LdEn_DATAPATH:in std_logic;
			  ALU_Binsel_DATAPATH:in std_logic;
			  ALU_func_DATAPATH:in std_logic_vector(3 downto 0);
			  RF_WrData_sel_DATAPATH:in std_logic;
			  RF_B_sel_DATAPATH:in std_logic;
			  ImmExt_DATAPATH:in std_logic_vector(1 downto 0);
			  ByteOp_DATAPATH:in std_logic;
			  Mem_WrEn_DATAPATH:in std_logic;
			  RF_WrEn_DATAPATH:in std_logic;
			  ALU_zero_DATAPATH: out std_logic;
			  ALURegWrEn:in std_logic;
			  InstrRegWrEn:in std_logic;
			  MemRegWrEn:in std_logic;
			  DecRegWrEn:in std_logic;
			  Instruction_DATAPATH: out std_logic_vector (31 downto 0)
			  
			  
			  
		
		);

end DATAPATH;

architecture Behavioral of DATAPATH is

signal PC_ImmedTemp,ALU_outTemp_MEM,ALU_outTemp_DEC,MemDataOutTemp_DEC,RF_B_temp_MEM,PCToInstrTemp,PCToInstrOutTemp,InstrTemp,RF_A_temp,RF_B_temp,ALU_outTemp,MemDataOutTemp,ImmedTemp,RF_B_temp_ALU,RF_A_temp_ALU,ImmedTemp_ALU,InstrTemp_DEC: std_logic_vector(31  downto 0);

component IF_vathmida
    Port ( PC_Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_sel : in  STD_LOGIC;
           PC_LdEn : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           PC : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


component DECSTAGE 
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
end component;

component EX_STAGE 
    Port ( RF_A : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_B : in  STD_LOGIC_VECTOR (31 downto 0);
           Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           ALU_Bin_sel : in  STD_LOGIC;
           ALU_func : in  STD_LOGIC_VECTOR (3 downto 0);
           ALU_out : inout  STD_LOGIC_VECTOR (31 downto 0);
           ALU_zero : out  STD_LOGIC);
end component;


component MEM_STAGE 
    Port ( clk : in  STD_LOGIC;
           Mem_WrEn : in  STD_LOGIC;
           ALU_MEM_Addr : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_DataIn : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_DataOut : out  STD_LOGIC_VECTOR (31 downto 0);
           
			  ByteOp : in STD_LOGIC;
			  pcToInstr: in std_logic_vector(31 downto 0);
			  pcToInstrout: out std_logic_vector(31 downto 0));
end component;

component InstrReg is
	 Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           DataIn : in  STD_LOGIC_VECTOR (31 downto 0);
           WrEn : in  STD_LOGIC;
           DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


component MemReg is
Port (     CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           DataIn1 : in  STD_LOGIC_VECTOR (31 downto 0);
			  DataIn2 : in  STD_LOGIC_VECTOR (31 downto 0);
           WrEn : in  STD_LOGIC;
           DataOut1 : out  STD_LOGIC_VECTOR (31 downto 0);
			  DataOut2 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component ALUReg is
Port (     CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           DataIn1 : in  STD_LOGIC_VECTOR (31 downto 0);
			  DataIn2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  DataIn3 : in  STD_LOGIC_VECTOR (31 downto 0);
           WrEn : in  STD_LOGIC;
           DataOut1 : out  STD_LOGIC_VECTOR (31 downto 0);
			  DataOut2 : out  STD_LOGIC_VECTOR (31 downto 0);
			  DataOut3 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


begin



ifstage: IF_vathmida
    Port Map ( PC_Immed =>ImmedTemp_ALU,
					PC_sel =>PC_sel_DATAPATH,
					PC_LdEn =>PC_LdEn_DATAPATH,
					Reset =>Rst,
					Clk =>Clk,
					PC =>PCToInstrTemp );
			  
dec:	DECSTAGE 
	Port Map ( Instr =>InstrTemp_DEC,
				  RF_WrEn =>RF_WrEn_DATAPATH,
				  ALU_out =>ALU_outTemp_DEC,
				  MEM_out =>MemDataOutTemp_DEC,
				  RF_WrData_sel => RF_WrData_sel_DATAPATH,
				  RF_B_sel =>RF_B_sel_DATAPATH,
				  ImmExt =>ImmExt_DATAPATH,
				  Clk =>Clk,
				  Immed =>ImmedTemp,
				  RF_A =>RF_A_temp,
				  rst=>Rst,
				  RF_B =>RF_B_temp );

				  
ex: EX_STAGE 
    Port Map ( RF_A =>RF_A_temp_ALU,
					RF_B =>RF_B_temp_ALU,
					Immed =>ImmedTemp_ALU,
					ALU_Bin_sel =>ALU_Binsel_DATAPATH,
					ALU_func =>ALU_func_DATAPATH,
					ALU_out =>ALU_outTemp,
					ALU_zero =>ALU_zero_DATAPATH );			  


mem: MEM_STAGE 
    Port Map ( clk =>Clk,
					Mem_WrEn =>Mem_WrEn_DATAPATH,
					ALU_MEM_Addr =>ALU_outTemp_MEM,
					MEM_DataIn =>RF_B_temp_MEM,
					MEM_DataOut =>MemDataOutTemp,
					ByteOp =>ByteOp_DATAPATH,
					pcToInstr=>	PCToInstrTemp,	
					pcToInstrout=>InstrTemp );



DecToALUReg:ALUReg 
	  Port Map (CLK =>Clk,
					RST =>Rst,
					DataIn1 =>RF_A_temp,
					DataIn2 =>RF_B_temp,
					DataIn3 =>ImmedTemp,
					WrEn =>ALURegWrEn,
					DataOut1 => RF_A_temp_ALU,
					DataOut2 =>RF_B_temp_ALU,
					DataOut3 =>ImmedTemp_ALU);



MemToDecReg:InstrReg 
		Port Map ( CLK => Clk,
					  RST => Rst,
					  DataIn => InstrTemp,
					  WrEn =>InstrRegWrEn,
					  DataOut =>InstrTemp_DEC );
					  
					  
ALUtoMemReg:MemReg 
		Port Map(CLK =>Clk, 
					RST =>Rst,
					DataIn1 => ALU_outTemp,
					DataIn2 => RF_B_temp,
					WrEn => MemRegWrEn,
					DataOut1 => ALU_outTemp_MEM,
					DataOut2 => RF_B_temp_MEM);					  
ALUtoDecReg:MemReg 
		Port Map(CLK =>Clk, 
					RST =>Rst,
					DataIn1 => ALU_outTemp,
					DataIn2 => MemDataOutTemp,
					WrEn => DecRegWrEn,
					DataOut1 => ALU_outTemp_DEC,
					DataOut2 => MemDataOutTemp_DEC);


Instruction_DATAPATH<=InstrTemp;			  
end Behavioral;


