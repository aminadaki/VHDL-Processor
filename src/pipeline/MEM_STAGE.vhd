----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:16:58 03/22/2020 
-- Design Name: 
-- Module Name:    MEM_STAGE - Behavioral 
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
use IEEE.STD_LOGIC_1164.ALL;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_signed.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MEM_STAGE is
    Port ( clk : in  STD_LOGIC;
           Mem_WrEn : in  STD_LOGIC;
           ALU_MEM_Addr : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_DataIn : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_DataOut : out  STD_LOGIC_VECTOR (31 downto 0);
           ByteOp : in STD_LOGIC;
			  pcToInstr: in std_logic_vector(31 downto 0);
			  pcToInstrout: out std_logic_vector(31 downto 0)
			  );
end MEM_STAGE;

architecture Behavioral of MEM_STAGE is

signal trueALU_MEM_Addr,MEM_DataOut_temp,tmp,MEM_DataIn_temp,tmp1: std_logic_vector(31 downto 0);
signal adder: std_logic_vector(31 downto 0);
signal wrEtmp:std_logic;

component RAM    
		port (clk: in std_logic;  
			   inst_addr : in std_logic_vector(10 downto 0);
				inst_dout : out std_logic_vector(31 downto 0);  
				data_we   : in std_logic;         
				data_addr : in std_logic_vector(10 downto 0);  
				data_din  : in std_logic_vector(31 downto 0);    
				data_dout : out std_logic_vector(31 downto 0));  
end component;

component MUX_2_to_1 is
		Port(		In0 : in  STD_LOGIC_VECTOR (31 downto 0);
					In1 : in  STD_LOGIC_VECTOR (31 downto 0);
					Sel : in STD_LOGIC;
					DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

begin
adder<="00000000000000000001000000000000";
--process(ALU_MEM_Addr,adder)
--begin
--	trueALU_MEM_Addr <= ALU_MEM_Addr + adder;
--end process;


trueALU_MEM_Addr <= ALU_MEM_Addr + adder;


ram1: RAM     
	port map (clk =>clk,
			    inst_addr =>pcToInstr(12 downto 2),
				 inst_dout => pcToInstrout, 
				 data_we => wrEtmp ,         
				 data_addr =>trueALU_MEM_Addr(12 downto 2),  
				 data_din =>MEM_DataIn_temp,   
				 data_dout=> MEM_DataOut_temp);  
				 
tmp<="00000000000000000000000011111111" and MEM_DataOut_temp;
wrEtmp<=Mem_WrEn after 2 ns ;
muxMemOut: MUX_2_to_1 
		Port map(In0 =>tmp,
					In1 =>MEM_DataOut_temp,
					Sel =>ByteOp,
					DataOut =>MEM_DataOut);
					
tmp1<="00000000000000000000000011111111" and MEM_DataIn;
					
muxMemIn:MUX_2_to_1 
		Port map(In0 =>tmp1,
					In1 =>MEM_DataIn,
					Sel =>ByteOp,
					DataOut =>MEM_DataIn_temp);
					

end Behavioral;

