----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:53:38 05/12/2020 
-- Design Name: 
-- Module Name:    ExMemRegister - Behavioral 
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

entity ExMemRegister is
Port (  Clk: in std_logic;
			  Rst: in std_logic;
			  
			  
			  WrEnExMem_in: in std_logic;
			  WrEnMemWrite_in: in std_logic;
			  PC_sel_in: in std_logic;
			  PC_LdEn_in:in std_logic;
			  RF_WrData_sel_in:in std_logic;
			  RF_WrEn_in:in std_logic;
			  RF_B_in: in std_logic_vector (31 downto 0);
			  Rd_in:in std_logic_vector (4 downto 0);
			  ByteOp_in:in std_logic;
			  Mem_WrEn_in:in std_logic;
			  ALU_out_in :in std_logic_vector (31 downto 0);
			  SelALUaddr_in: in std_logic_vector(1 downto 0);
			  
			  WrEnMemWrite_out: out std_logic;
			  PC_sel_out: out std_logic;
			  PC_LdEn_out:out std_logic;
			  RF_WrData_sel_out:out std_logic;
			  RF_WrEn_out:out std_logic;
			  RF_B_out: out std_logic_vector (31 downto 0);
			  Rd_out:out std_logic_vector (4 downto 0);
			  ByteOp_out:out std_logic;
			  Mem_WrEn_out:out std_logic;
			  ALU_out_out :out std_logic_vector (31 downto 0);
			  SelALUaddr_out: out std_logic_vector(1 downto 0)
			  
			  
			  
			  
				);
end ExMemRegister;

architecture Behavioral of ExMemRegister is

begin
	process(Clk,Rst)
	  begin
			
			  if (Rst = '1') then
						
						
					   WrEnMemWrite_out<='0';
						PC_sel_out<='0';
						PC_LdEn_out<='0';
						RF_WrData_sel_out<='0';
						RF_WrEn_out<='0';
						ByteOp_out<='0';
						Mem_WrEn_out<='0';
						RF_B_out<="00000000000000000000000000000000";
						Rd_out<="00000";
						ALU_out_out <="00000000000000000000000000000000";
						SelALUaddr_out<="00";
						
			  elsif (rising_edge(Clk)) then
			  
					if (WrEnExMem_in = '1') then
						
						
						
						WrEnMemWrite_out<=WrEnMemWrite_in;
						PC_sel_out<=PC_sel_in;
						PC_LdEn_out<=PC_LdEn_in;
						RF_WrData_sel_out<=RF_WrData_sel_in;
						RF_WrEn_out<=RF_WrEn_in;
						ByteOp_out<=ByteOp_in;
						Mem_WrEn_out<=Mem_WrEn_in;
						RF_B_out<=RF_B_in;
						Rd_out<=Rd_in;
						ALU_out_out <=ALU_out_in;
						SelALUaddr_out<=SelALUaddr_in;
					
							
					end if;
			  end if;
   end process;




end Behavioral;

