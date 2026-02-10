----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:48:28 05/12/2020 
-- Design Name: 
-- Module Name:    InsDecRegister - Behavioral 
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

entity InsDecRegister is
	Port (  Clk: in std_logic;
			  Rst: in std_logic;
			  WrEnInsDec_in: in std_logic;
			  WrEnDecEx_in: in std_logic;
			  WrEnExMem_in: in std_logic;
			  WrEnMemWrite_in: in std_logic;
			  PC_sel_in: in std_logic;
			  PC_LdEn_in:in std_logic;
			  ALU_Binsel_in:in std_logic;
			  ALU_func_in:in std_logic_vector(3 downto 0);
			  RF_WrData_sel_in:in std_logic;
			  RF_B_sel_in:in std_logic;
			  RF_WrEn_in:in std_logic;
			  ImmExt_in:in std_logic_vector(1 downto 0);
			  ByteOp_in:in std_logic;
			  Mem_WrEn_in:in std_logic;
			  Instruction_in: in std_logic_vector (31 downto 0);
			  SelALUaddr_in: in std_logic_vector(1 downto 0);
			  
			  
			  WrEnDecEx_out: out std_logic;
			  WrEnExMem_out: out std_logic;
			  WrEnMemWrite_out: out std_logic;
			  PC_sel_out: out std_logic;
			  PC_LdEn_out:out std_logic;
			  ALU_Binsel_out:out std_logic;
			  ALU_func_out:out std_logic_vector(3 downto 0);
			  RF_WrData_sel_out:out std_logic;
			  RF_B_sel_out:out std_logic;
			  RF_WrEn_out:out std_logic;
			  ImmExt_out:out std_logic_vector(1 downto 0);
			  ByteOp_out:out std_logic;
			  Mem_WrEn_out:out std_logic;
			  Instruction_out: out std_logic_vector (31 downto 0);
			  SelALUaddr_out: out std_logic_vector(1 downto 0)
			  
			  
				);
end InsDecRegister;

architecture Behavioral of InsDecRegister is




begin
	process(Clk,Rst)
	  begin
			
			  if (Rst = '1') then
						WrEnDecEx_out<='0';
						WrEnExMem_out<='0';
					   WrEnMemWrite_out<='0';
						PC_sel_out<='0';
						PC_LdEn_out<='0';
						ALU_Binsel_out<='0';
						ALU_func_out<="0000";
						RF_WrData_sel_out<='0';
						RF_B_sel_out<='0';
						RF_WrEn_out<='0';
						ImmExt_out<="00";
						ByteOp_out<='0';
						Mem_WrEn_out<='0';
						Instruction_out<="00000000000000000000000000000000";
						SelALUaddr_out<="00";
			  elsif (rising_edge(Clk)) then
			  
					if (WrEnInsDec_in = '1') then
						
						WrEnDecEx_out<=WrEnDecEx_in;
						WrEnExMem_out<=WrEnExMem_in;
						WrEnMemWrite_out<=WrEnMemWrite_in;
						PC_sel_out<=PC_sel_in;
						PC_LdEn_out<=PC_LdEn_in;
						ALU_Binsel_out<=ALU_Binsel_in;
						ALU_func_out<=ALU_func_in;
						RF_WrData_sel_out<=RF_WrData_sel_in;
						RF_B_sel_out<=RF_B_sel_in;
						RF_WrEn_out<=RF_WrEn_in;
						ImmExt_out<=ImmExt_in;
						ByteOp_out<=ByteOp_in;
						Mem_WrEn_out<=Mem_WrEn_in;
						Instruction_out<=Instruction_in;
						SelALUaddr_out<=SelALUaddr_in;
							
					end if;
			  end if;
   end process;





end Behavioral;

