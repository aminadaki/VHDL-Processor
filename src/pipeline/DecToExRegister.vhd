----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:40:39 05/12/2020 
-- Design Name: 
-- Module Name:    DecToExRegister - Behavioral 
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

entity DecToExRegister is
Port (  Clk: in std_logic;
			  Rst: in std_logic;
			  
			  WrEnDecEx_in: in std_logic;
			  WrEnExMem_in: in std_logic;
			  WrEnMemWrite_in: in std_logic;
			  PC_sel_in: in std_logic;
			  PC_LdEn_in:in std_logic;
			  ALU_Binsel_in:in std_logic;
			  ALU_func_in:in std_logic_vector(3 downto 0);
			  RF_WrData_sel_in:in std_logic;
			  RF_WrEn_in:in std_logic;
			  RF_A_in: in std_logic_vector (31 downto 0);
			  RF_B_in: in std_logic_vector (31 downto 0);
			  Immed_in: in std_logic_vector (31 downto 0);
			  Rd_in:in std_logic_vector (4 downto 0);
			  ByteOp_in:in std_logic;
			  Mem_WrEn_in:in std_logic;
			  SelALUaddr_in: in std_logic_vector(1 downto 0);
			  Rs_in:in std_logic_vector (4 downto 0);
			  Rt_in:in std_logic_vector (4 downto 0);
			  
			  
			  
			  WrEnExMem_out: out std_logic;
			  WrEnMemWrite_out: out std_logic;
			  PC_sel_out: out std_logic;
			  PC_LdEn_out:out std_logic;
			  ALU_Binsel_out:out std_logic;
			  ALU_func_out:out std_logic_vector(3 downto 0);
			  RF_WrData_sel_out:out std_logic;
			  RF_WrEn_out:out std_logic;
			  ByteOp_out:out std_logic;
			  Mem_WrEn_out:out std_logic;
			  RF_A_out: out std_logic_vector (31 downto 0);
			  RF_B_out: out std_logic_vector (31 downto 0);
			  Immed_out: out std_logic_vector (31 downto 0);
			  Rd_out:out std_logic_vector (4 downto 0);
			  SelALUaddr_out: out std_logic_vector(1 downto 0);
			  Rs_out:out std_logic_vector (4 downto 0);
			  Rt_out:out std_logic_vector (4 downto 0)
			  
			  
			  
			  
				);
end DecToExRegister;

architecture Behavioral of DecToExRegister is




begin
	process(Clk,Rst)
	  begin
			
			  if (Rst = '1') then
						
						WrEnExMem_out<='0';
					   WrEnMemWrite_out<='0';
						PC_sel_out<='0';
						PC_LdEn_out<='0';
						ALU_Binsel_out<='0';
						ALU_func_out<="0000";
						RF_WrData_sel_out<='0';
						RF_WrEn_out<='0';
						ByteOp_out<='0';
						Mem_WrEn_out<='0';
						RF_A_out<="00000000000000000000000000000000";
						RF_B_out<="00000000000000000000000000000000";
						Immed_out<="00000000000000000000000000000000";
						Rd_out<="00000";
						SelALUaddr_out<="00";
						Rs_out<="00000";
						Rt_out<="00000";
						
			  elsif (rising_edge(Clk)) then
			  
					if (WrEnDecEx_in = '1') then
						
						
						WrEnExMem_out<=WrEnExMem_in;
						WrEnMemWrite_out<=WrEnMemWrite_in;
						PC_sel_out<=PC_sel_in;
						PC_LdEn_out<=PC_LdEn_in;
						ALU_Binsel_out<=ALU_Binsel_in;
						ALU_func_out<=ALU_func_in;
						RF_WrData_sel_out<=RF_WrData_sel_in;
						RF_WrEn_out<=RF_WrEn_in;
						ByteOp_out<=ByteOp_in;
						Mem_WrEn_out<=Mem_WrEn_in;
						RF_A_out<=RF_A_in;
						RF_B_out<=RF_B_in;
						Immed_out<=Immed_in;
						Rd_out<=Rd_in;
						SelALUaddr_out<=SelALUaddr_in;
						Rs_out<=Rs_in;
						Rt_out<=Rt_in;
					
							
					end if;
			  end if;
   end process;





end Behavioral;
