----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:04:08 05/14/2020 
-- Design Name: 
-- Module Name:    PROCESSOR_PIPELINE - Behavioral 
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

entity PROCESSOR_PIPELINE is
		Port(CLOCK : in std_logic;
		     RESET : in std_logic);
			  
end PROCESSOR_PIPELINE;

architecture Behavioral of PROCESSOR_PIPELINE is

signal PC_sel,PC_LdEn,ALU_Binsel,RF_WrData_sel,RF_B_sel,ByteOp,Mem_WrEn,RF_WrEn,WrEnInsDec,
		 WrEnDecEx,WrEnExMem,WrEnMemWrite,ALU_zero,StallFlag : std_logic;
signal ALU_func:std_logic_vector(3 downto 0);
signal ImmExt,SelALUaddrTEMP:std_logic_vector(1 downto 0);
signal Instruction,instr_temp:std_logic_vector (31 downto 0);

component DATAPATH is
		Port(Clk: in std_logic;
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
			  WrEnInsDec_DATAPATH:in std_logic;
			  WrEnDecEx_DATAPATH: in std_logic;
			  WrEnExMem_DATAPATH:in std_logic;
			  WrEnMemWrite_DATAPATH:in std_logic;
			  SelALUaddr: in std_logic_vector(1 downto 0);
			  Instruction_DATAPATH_in: in std_logic_vector (31 downto 0);
			  
			  ALU_zero_DATAPATH: out std_logic;
			  Instruction_DATAPATH: out std_logic_vector (31 downto 0);
			  StallFlag_DATAPATH : out std_logic
			  
		);

end component;

component CONTROL_PIPELINE is
		Port(Clk: in std_logic;
			  Rst: in std_logic;
			  PC_sel_CONTROL: out std_logic;
			  PC_LdEn_CONTROL:out std_logic;
			  ALU_Binsel_CONTROL:out std_logic;
			  ALU_func_CONTROL:out std_logic_vector(3 downto 0);
			  RF_WrData_sel_CONTROL:out std_logic;
			  RF_B_sel_CONTROL:out std_logic;
			  ImmExt_CONTROL:out std_logic_vector(1 downto 0);
			  ByteOp_CONTROL:out std_logic;
			  Mem_WrEn_CONTROL:out std_logic;
			  RF_WrEn_CONTROL:out std_logic;
			  WrEnInsDec_CONTROL:out std_logic;
			  WrEnDecEx_CONTROL: out std_logic;
			  WrEnExMem_CONTROL:out std_logic;
			  WrEnMemWrite_CONTROL:out std_logic;
			  SelALUaddr_CONTROL: out std_logic_vector(1 downto 0);
			   Instruction_CONTROL_out: out std_logic_vector (31 downto 0);
			  
			  ALU_zero_CONTROL: in std_logic;
			  Instruction_CONTROL: in std_logic_vector (31 downto 0);
			  StallFlag_CONTROL : in std_logic
		);

end component;

--attribute keep :string;
--attribute keep of ImmExt: signal is "true";
begin


data: DATAPATH 
		Port Map(Clk=>CLOCK,
					Rst=>RESET,
					PC_sel_DATAPATH=>PC_sel,
					PC_LdEn_DATAPATH=>PC_LdEn,
					ALU_Binsel_DATAPATH=>ALU_Binsel,
					ALU_func_DATAPATH=>ALU_func,
					RF_WrData_sel_DATAPATH=>RF_WrData_sel,
					RF_B_sel_DATAPATH=>RF_B_sel,
					ImmExt_DATAPATH=>ImmExt,
					ByteOp_DATAPATH=>ByteOp,
					Mem_WrEn_DATAPATH=>Mem_WrEn,
					RF_WrEn_DATAPATH=>RF_WrEn,
					WrEnInsDec_DATAPATH=>WrEnInsDec,
					WrEnDecEx_DATAPATH=>WrEnDecEx,
					WrEnExMem_DATAPATH=>WrEnExMem,
					WrEnMemWrite_DATAPATH=>WrEnMemWrite,
					SelALUaddr=>SelALUaddrTEMP,
					ALU_zero_DATAPATH=>ALU_zero,
					Instruction_DATAPATH_in=>instr_temp,
					Instruction_DATAPATH=>Instruction,
					StallFlag_DATAPATH =>StallFlag);

ctlr:CONTROL_PIPELINE 
		Port Map(Clk=>CLOCK,
					Rst=>RESET,
					PC_sel_CONTROL=>PC_sel,
					PC_LdEn_CONTROL=>PC_LdEn,
					ALU_Binsel_CONTROL=>ALU_Binsel,
					ALU_func_CONTROL=>ALU_func,
					RF_WrData_sel_CONTROL=>RF_WrData_sel,
					RF_B_sel_CONTROL=>RF_B_sel,
					ImmExt_CONTROL=>ImmExt,
					ByteOp_CONTROL=>ByteOp,
					Mem_WrEn_CONTROL=>Mem_WrEn,
					RF_WrEn_CONTROL=>RF_WrEn,
					WrEnInsDec_CONTROL=>WrEnInsDec,
					WrEnDecEx_CONTROL=>WrEnDecEx,
					WrEnExMem_CONTROL=>WrEnExMem,
					WrEnMemWrite_CONTROL=>WrEnMemWrite,
					SelALUaddr_CONTROL=>SelALUaddrTEMP,
					ALU_zero_CONTROL=>ALU_zero,
					Instruction_CONTROL_out=>instr_temp,
					Instruction_CONTROL=>Instruction,
					StallFlag_CONTROL=>StallFlag);


end Behavioral;

