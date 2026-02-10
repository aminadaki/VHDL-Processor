----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:09:35 05/07/2020 
-- Design Name: 
-- Module Name:    PROCESSOR_MC - Behavioral 
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

entity PROCESSOR_MC is
Port(CLOCK : in std_logic;
	  RESET : in std_logic

);
end PROCESSOR_MC;

architecture Behavioral of PROCESSOR_MC is

signal PC_sel,PC_LdEn,ALU_Binsel,RF_WrData_sel,RF_B_sel,ByteOp,Mem_WrEn,RF_WrEn,ALU_zero,ALURegWrEn_temp,InstrRegWrEn_temp,MemRegWrEn_temp,DecRegWrEn_temp: std_logic;
signal ALU_func: std_logic_vector(3 downto 0);
signal ImmExt:std_logic_vector(1 downto 0);
signal Instruction_temp :std_logic_vector(31 downto 0);


component DATAPATH is
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
			  Instruction_DATAPATH: out std_logic_vector (31 downto 0));
end component;

component CONTROL_MC is
Port(
		
			  Clk: in std_logic;
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
			  ALU_zero_CONTROL: in std_logic;
			  ALURegWrEn_CONTROL:out std_logic;
			  InstrRegWrEn_CONTROL:out std_logic;
			  MemRegWrEn_CONTROL:out std_logic;
			  DecRegWrEn_CONTROL:out std_logic;
			  Instruction_CONTROL: in std_logic_vector (31 downto 0));
end component;

begin

data: DATAPATH 
		Port Map( Clk=>CLOCK,
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
					 ALU_zero_DATAPATH=>ALU_zero,
					 ALURegWrEn=>ALURegWrEn_temp,
					 InstrRegWrEn=>InstrRegWrEn_temp,
					 MemRegWrEn=>MemRegWrEn_temp,
					 DecRegWrEn=>DecRegWrEn_temp,
					 Instruction_DATAPATH=>Instruction_temp);


ctrl: CONTROL_MC 
		Port Map( Clk=>CLOCK,
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
					 ALU_zero_CONTROL=>ALU_zero,
					 ALURegWrEn_CONTROL=>ALURegWrEn_temp,
					 InstrRegWrEn_CONTROL=>InstrRegWrEn_temp,
					 MemRegWrEn_CONTROL=>MemRegWrEn_temp,
					 DecRegWrEn_CONTROL=>DecRegWrEn_temp,
					 Instruction_CONTROL=>Instruction_temp);


end Behavioral;

