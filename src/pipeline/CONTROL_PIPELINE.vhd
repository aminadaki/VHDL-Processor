----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:25:09 05/14/2020 
-- Design Name: 
-- Module Name:    CONTROL_PIPELINE - Behavioral 
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

entity CONTROL_PIPELINE is
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
			  StallFlag_CONTROL: in std_logic
		);

end CONTROL_PIPELINE;

architecture Behavioral of CONTROL_PIPELINE is

type stateType is (reset_state,RType_state,all_state,no_state,store_state,load_state,stall_state);
signal currentS,nextS :stateType;
signal currentInstr,nextInstr: std_logic_vector(31 downto 0);

begin

fsm: process ( currentS,nextS,nextInstr,StallFlag_CONTROL)

begin			
			case currentS IS
			
			when reset_state => if (nextInstr= "00000000000000000000000000000000") then 
												nextS<=reset_state;
										elsif (nextInstr(31 downto 26)="100000") then 
												nextS<=RType_state;
										elsif (  nextInstr(31 downto 30)="11" and (not(nextInstr(31 downto 26)="111111")) and nextInstr(27)='0' ) then
												nextS<=all_state;
									   elsif (  nextInstr(31 downto 30)="11" and (not(nextInstr(31 downto 26)="111111")) and nextInstr(27)='1' ) then
												nextS<=no_state;
										elsif ( (nextInstr(31 downto 26)="000111") or (nextInstr(31 downto 26)="011111")) then
												nextS<=store_state;		
										elsif ( (nextInstr(31 downto 26)="000011") or (nextInstr(31 downto 26)="001111")) then
												nextS<=load_state;
										else
											nextS<=reset_state;
									end if;
			when	RType_state => if( rising_edge(StallFlag_CONTROL)) then
												nextS<=stall_state;
										elsif (nextInstr(31 downto 26)="100000") then 
												nextS<=RType_state;
										elsif (  nextInstr(31 downto 30)="11" and (not(nextInstr(31 downto 26)="111111")) and nextInstr(27)='0' ) then
												nextS<=all_state;
									   elsif (  nextInstr(31 downto 30)="11" and (not(nextInstr(31 downto 26)="111111")) and nextInstr(27)='1' ) then
												nextS<=no_state;
										elsif ( (nextInstr(31 downto 26)="000111") or (nextInstr(31 downto 26)="011111")) then
												nextS<=store_state;		
										elsif ( (nextInstr(31 downto 26)="000011") or (nextInstr(31 downto 26)="001111")) then
												nextS<=load_state;
										
												
										else
											nextS<=reset_state;
									   end if;	
												
			when 	all_state =>	if( StallFlag_CONTROL='1') then
												nextS<=stall_state;
										elsif (nextInstr(31 downto 26)="100000") then 
												nextS<=RType_state;
										elsif (  nextInstr(31 downto 30)="11" and (not(nextInstr(31 downto 26)="111111")) and nextInstr(27)='0' ) then
												nextS<=all_state;
									   elsif (  nextInstr(31 downto 30)="11" and (not(nextInstr(31 downto 26)="111111")) and nextInstr(27)='1' ) then
												nextS<=no_state;
										elsif ( (nextInstr(31 downto 26)="000111") or (nextInstr(31 downto 26)="011111")) then
												nextS<=store_state;		
										elsif ( (nextInstr(31 downto 26)="000011") or (nextInstr(31 downto 26)="001111")) then
												nextS<=load_state;
										
										else
											nextS<=reset_state;
									   end if;
										
			when 	no_state =>		if( StallFlag_CONTROL='1') then
												nextS<=stall_state;
										elsif (nextInstr(31 downto 26)="100000") then 
												nextS<=RType_state;
										elsif (  nextInstr(31 downto 30)="11" and (not(nextInstr(31 downto 26)="111111")) and nextInstr(27)='0' ) then
												nextS<=all_state;
									   elsif (  nextInstr(31 downto 30)="11" and (not(nextInstr(31 downto 26)="111111")) and nextInstr(27)='1' ) then
												nextS<=no_state;
										elsif ( (nextInstr(31 downto 26)="000111") or (nextInstr(31 downto 26)="011111")) then
												nextS<=store_state;		
										elsif ( (nextInstr(31 downto 26)="000011") or (nextInstr(31 downto 26)="001111")) then
												nextS<=load_state;
										
										else
											nextS<=reset_state;
									   end if;
		
			when 	store_state =>	if( StallFlag_CONTROL='1') then
												nextS<=stall_state;
										elsif (nextInstr(31 downto 26)="100000") then 
												nextS<=RType_state;
										elsif (  nextInstr(31 downto 30)="11" and (not(nextInstr(31 downto 26)="111111")) and nextInstr(27)='0' ) then
												nextS<=all_state;
									   elsif (  nextInstr(31 downto 30)="11" and (not(nextInstr(31 downto 26)="111111")) and nextInstr(27)='1' ) then
												nextS<=no_state;
										elsif ( (nextInstr(31 downto 26)="000111") or (nextInstr(31 downto 26)="011111")) then
												nextS<=store_state;		
										elsif ( (nextInstr(31 downto 26)="000011") or (nextInstr(31 downto 26)="001111")) then
												nextS<=load_state;
										
										else
											nextS<=reset_state;
									   end if;
			
			when 	load_state =>	if( StallFlag_CONTROL='1') then
												nextS<=stall_state;
										elsif (nextInstr(31 downto 26)="100000") then 
												nextS<=RType_state;
										elsif (  nextInstr(31 downto 30)="11" and (not(nextInstr(31 downto 26)="111111")) and nextInstr(27)='0' ) then
												nextS<=all_state;
									   elsif (  nextInstr(31 downto 30)="11" and (not(nextInstr(31 downto 26)="111111")) and nextInstr(27)='1' ) then
												nextS<=no_state;
										elsif ( (nextInstr(31 downto 26)="000111") or (nextInstr(31 downto 26)="011111")) then
												nextS<=store_state;		
										elsif ( (nextInstr(31 downto 26)="000011") or (nextInstr(31 downto 26)="001111")) then
												nextS<=load_state;
										
										else
											nextS<=reset_state;
									   end if;
										
			when stall_state => if (nextInstr(31 downto 26)="100000") then 
												nextS<=RType_state;
										elsif (  nextInstr(31 downto 30)="11" and (not(nextInstr(31 downto 26)="111111")) and nextInstr(27)='0' ) then
												nextS<=all_state;
									   elsif (  nextInstr(31 downto 30)="11" and (not(nextInstr(31 downto 26)="111111")) and nextInstr(27)='1' ) then
												nextS<=no_state;
										elsif ( (nextInstr(31 downto 26)="000111") or (nextInstr(31 downto 26)="011111")) then
												nextS<=store_state;		
										elsif ( (nextInstr(31 downto 26)="000011") or (nextInstr(31 downto 26)="001111")) then
												nextS<=load_state;
										else
											nextS<=reset_state;
									end if;
										
			end case;
    end process;
	 
	 
	 
fsm_synch: process (Clk, Rst,StallFlag_CONTROL)
		begin
			if (Rst='1') then    currentS <= reset_state;
			   elsif  (rising_edge(StallFlag_CONTROL))then
                    currentS<=stall_state;
           						  --currentInstr<=nextInstr;
						
				elsif (rising_edge(Clk))  	then	
																currentS <= nextS;
																currentInstr<=nextInstr;
																							
																
			end if;
			
			
		if(currentS=stall_state) then 
		 currentInstr<=currentInstr;
		 nextInstr<=currentInstr;
		 else
			nextInstr<=Instruction_CONTROL;
			end if ;
			
		end process fsm_synch;


with currentS select
              PC_sel_CONTROL<='0' when RType_state,
										'0' when all_state,
										'0' when no_state,
										'0' when store_state,
										'0' when load_state,
										'0' when stall_state,
										'0' when others;
			  
--with currentS select 
--				 PC_LdEn_CONTROL<='0' when stall_state,
--										'0' when reset_state,
--									   '1' when others;	

			  
			  
with nextS select
			     PC_LdEn_CONTROL<='1' when RType_state,
										 '1' when all_state,
										 '1' when no_state,
										 '1' when store_state,
										 '1' when load_state,
										 '0' when stall_state,
									    '0' when others;
			  
			  
			  
with currentS select
			     ALU_Binsel_CONTROL<='0' when RType_state,
										    '1' when all_state,
											 '1' when no_state,
											 '1' when store_state,
											 '1' when load_state,
											 '0' when stall_state,
										    '0' when others;
			  
			  
with currentS select
			     ALU_func_CONTROL<=currentInstr(3 downto 0) when RType_state,
										  "0000" when all_state,
										  (currentInstr(29),not(currentInstr(26)),currentInstr(26),currentInstr(30)) when no_state,
										  "0000" when store_state,
										  "0000" when load_state,
										  "0000" when stall_state,
										  "0000" when others;
			  
			  
			  
with currentS select
			     RF_WrData_sel_CONTROL<='0' when RType_state,
										       '0' when all_state,
										       '0' when no_state,
										       '0' when store_state,
										       '1' when load_state,
												 '0' when stall_state,
											    '0' when others;
				  
				  
				  
			  
with currentS select
			     RF_B_sel_CONTROL <='0' when RType_state,
										   '0' when all_state,
										   '0' when no_state,
										   '1' when store_state,
										   '0' when load_state,
											'0' when stall_state,
										   '0' when others;
			  
			  
with currentS select
			     ImmExt_CONTROL <="00" when RType_state,
										 (currentInstr(26),not(currentInstr(26))) when all_state,
										 "00" when no_state,
										 "01" when store_state,
										 "01" when load_state,
										 "00" when stall_state,
									    "00" when others;
				  
with currentS select
              ByteOp_CONTROL <='0' when RType_state,
										 '0' when all_state,
										 '0' when no_state,
										 currentInstr(30) when store_state,
										 currentInstr	(29) when load_state,
										 '0' when stall_state,
									    '0' when others;
				  
with currentS select
              Mem_WrEn_CONTROL <='0' when RType_state,
										   '0' when all_state,
											'0' when no_state,
											'1' when store_state,
											'0' when load_state,
											'0' when stall_state,
										   '0' when others;
			  
with currentS select
              RF_WrEn_CONTROL <='1' when RType_state,
										  '1' when all_state,
										  '1' when no_state,
										  '0' when store_state,
										  '1' when load_state,
										  '0' when stall_state,
										  '0' when others;

with currentS select
              WrEnInsDec_CONTROL <='1' when RType_state,
											  '1' when all_state,
											  '1' when no_state,
											  '1' when store_state,
											  '1' when load_state,
											  '1' when reset_state,
											  '0' when stall_state,
											  '0' when others;
			  
with currentS select
              WrEnDecEx_CONTROL <='1' when RType_state,
											 '1' when all_state,
											 '1' when no_state,
											 '1' when store_state,
											 '1' when load_state,
											 '1' when reset_state,
											 '0' when stall_state,
											 '0' when others;
			  
with currentS select
              WrEnExMem_CONTROL <='1' when RType_state,
											 '1' when all_state,
											 '1' when no_state,
											 '1' when store_state,
											 '1' when load_state,
											 '1' when reset_state,
											 '0' when stall_state,
											 '0' when others;
			  
with currentS select
              WrEnMemWrite_CONTROL <='1' when RType_state,
												 '1' when all_state,
												 '1' when no_state,
												 '1' when store_state,
												 '1' when load_state,
												 '1' when reset_state,
												 '0' when stall_state,
											    '0' when others;

with currentS select
              SelALUaddr_CONTROL <="00" when RType_state,
											  "00" when all_state,
											  "00" when no_state,
											  "01" when store_state,
											  "10" when load_state,
											  "00" when stall_state,
											  "00" when others;	

with currentS select
              Instruction_CONTROL_out	 <=currentInstr when RType_state,
											         currentInstr when all_state,
											         currentInstr when no_state,
											         currentInstr when store_state,
											         currentInstr when load_state,
														currentInstr when stall_state,
											         "00000000000000000000000000000000" when others;	


										  
		
	

end Behavioral;
		
	 
	 
			  
			  
			  
			  
			  
	 
	 
	 
	 
	 
	 
	 



