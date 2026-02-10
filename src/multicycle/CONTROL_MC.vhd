----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:52:39 05/07/2020 
-- Design Name: 
-- Module Name:    CONTROL_MC - Behavioral 
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

entity CONTROL_MC is
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
			  ALURegWrEn_CONTROL:out std_logic;
			  InstrRegWrEn_CONTROL:out std_logic;
			  MemRegWrEn_CONTROL:out std_logic;
			  DecRegWrEn_CONTROL:out std_logic;
			  ALU_zero_CONTROL: in std_logic;
			  Instruction_CONTROL: in std_logic_vector (31 downto 0)
			  
			  
			  
		
		);

end CONTROL_MC;

architecture Behavioral of CONTROL_MC is

type stateType is (reset_state,If_state,RtypeDEC_state,R_Ex_state,R_Write_state,
                                        ItypeDEC_state1,allEX_state,
													 ItypeDEC_state2,noEX_state,I_write_state,
													 StoreDEC_state,StoreEX_state,sb_Write_state,sw_Write_state,
													 LoadDEC_state,LoadEX_state,lbMEM_state,lwMEM_state,LoadWrite_state,
													 BDEC_state,b_state,bne_state,beq_state);
signal currentS,nextS :stateType;



begin

fsm: process ( currentS,nextS,Instruction_CONTROL)
		begin			
			case currentS IS
			
			when reset_state => if (Instruction_CONTROL= "00000000000000000000000000000000") then 
										   nextS<=reset_state;
										else nextS<=If_state;
										end if;
										
			when If_state =>  if( Instruction_CONTROL= "00000000000000000000000000000000") then 
										   nextS<=If_state;
									elsif (Instruction_CONTROL(31 downto 26)="100000") then 
											nextS<=RtypeDEC_state;
									elsif (  Instruction_CONTROL(31 downto 30)="11" and (not(Instruction_CONTROL(31 downto 26)="111111")) and Instruction_CONTROL(27)='0' ) then
												nextS<=ItypeDEC_state1;
									elsif (  Instruction_CONTROL(31 downto 30)="11" and (not(Instruction_CONTROL(31 downto 26)="111111")) and Instruction_CONTROL(27)='1' ) then
												nextS<=ItypeDEC_state2;
									elsif ( (Instruction_CONTROL(31 downto 26)="000111") or (Instruction_CONTROL(31 downto 26)="011111")) then
												nextS<=StoreDEC_state;		
									elsif ( (Instruction_CONTROL(31 downto 26)="000011") or (Instruction_CONTROL(31 downto 26)="001111")) then
												nextS<=LoadDEC_state;		
									elsif ((Instruction_CONTROL(31 downto 26)="000000") or (Instruction_CONTROL(31 downto 26)="111111") or (Instruction_CONTROL(31 downto 26)="000001")) then
												nextS<=BDEC_state;
									else
											nextS<=If_state;
									end if;
									
			when RtypeDEC_state=> nextS<=R_Ex_state;	
			
			when R_Ex_state => nextS<=R_Write_state;
			
			when R_Write_state => nextS<=If_state;
			
			when ItypeDEC_state1 => nextS<=allEX_state;
			
			when ItypeDEC_state2 => nextS<=noEX_state;
			
			when allEX_state => nextS<=I_Write_state;
			
			when noEX_state => nextS<=I_Write_state;
			
			when I_Write_state => nextS<=If_state;
			
			when StoreDEC_state => nextS<=StoreEX_state;
			
			when StoreEX_state => if( Instruction_CONTROL(29)='0') then 
												nextS<=sb_Write_state;
										  elsif ( Instruction_CONTROL(29)='1') then 
												nextS<=sw_Write_state;
										  else
											   nextS<=If_state;
									     end if;
			when sb_Write_state =>  nextS<=If_state;
			
			when sw_Write_state =>  nextS<=If_state;
			
			when LoadDEC_state => nextS<=LoadEX_state;
			
			when LoadEX_state => if( Instruction_CONTROL(29)='0') then 
												nextS<=lbMEM_state;
										  elsif ( Instruction_CONTROL(29)='1') then 
												nextS<=lwMEM_state;
										  else
											   nextS<=If_state;
									     end if;
			
			when lbMEM_state => nextS<=LoadWrite_state;
			
			when lwMEM_state => nextS<=LoadWrite_state;
			
			when LoadWrite_state => nextS<=If_state;
			
			when BDEC_state => if(Instruction_CONTROL(31 downto 26)="000000") then 
											nextS<=beq_state;
									 elsif (Instruction_CONTROL(31 downto 26)="111111") then
											nextS<=b_state;
									 elsif (Instruction_CONTROL(31 downto 26)="000001") then 
											nextS<=bne_state;
									 else
											   nextS<=If_state;
									     end if;
										  
			when beq_state=> nextS<=If_state;
			
			when b_state=> nextS<=If_state;
			
			when bne_state=> nextS<=If_state;
									 
										
											
			
			
			
         end case;
    end process;
	


	
fsm_synch: process (Clk, Rst)
		begin
			if (Rst='1') then    currentS <= reset_state;
									
											
				elsif (rising_edge(Clk))  	then	
																currentS <= nextS;
																
																
			end if;
			
			
		end process fsm_synch;	

		
  
	
		 
		
	






with currentS select
              PC_sel_CONTROL<='0' when RtypeDEC_state,
									   '0' when R_Ex_state,
									   '0' when R_Write_state,
									   '0' when If_state,
										'0' when I_Write_state,
										'0' when ItypeDEC_state1,
										'0' when ItypeDEC_state2,
										'0' when allEX_state,
									   '0' when noEX_state,
										'0' when StoreDEC_state,
										'0' when StoreEX_state,
										'0' when sb_Write_state,
										'0' when sw_Write_state,
										'0' when LoadDEC_state,
									   '0' when LoadEX_state,
										'0' when lbMEM_state,
										'0' when lwMEM_state,
										'0' when LoadWrite_state,
										'0' when BDEC_state,
										'1' when b_state,
										not (ALU_zero_CONTROL) when bne_state,
										ALU_zero_CONTROL when beq_state,
										'0' when others;
			  
			  
			  
with currentS select
			     PC_LdEn_CONTROL<='0' when RtypeDEC_state,
									    '0' when R_Ex_state,
									    '1' when R_Write_state,
									    '0' when If_state,
										 '1' when I_Write_state,
										 '0' when ItypeDEC_state1,
										 '0' when ItypeDEC_state2,
										 '0' when allEX_state,
									    '0' when noEX_state,
										 '0' when StoreDEC_state,
										 '0' when StoreEX_state,
										 '1' when sb_Write_state,
										 '1' when sw_Write_state,
										 '0' when LoadDEC_state,
										 '0' when LoadEX_state,
										 '0' when lbMEM_state,
										 '0' when lwMEM_state,
										 '1' when LoadWrite_state,
										 '0' when BDEC_state,
										 '1' when b_state,
										 '1' when bne_state,
										 '1' when beq_state,
									    '0' when others;
			  
			  
			  
with currentS select
			     ALU_Binsel_CONTROL<='0' when RtypeDEC_state,
										    '0' when R_Ex_state,
										    '0' when R_Write_state,
										    '0' when If_state,
											 '0' when ItypeDEC_state1,
											 '0' when ItypeDEC_state2,
											 '1' when allEX_state,
											 '1' when noEX_state,
											 '0' when I_Write_state,
											 '0' when StoreDEC_state,
											 '1' when StoreEx_state,
											 '0' when sb_Write_state,
										    '0' when sw_Write_state,
											 '0' when LoadDEC_state,
											 '1' when LoadEX_state,
											 '0' when lbMEM_state,
										    '0' when lwMEM_state,
											 '0' when LoadWrite_state,
											 '0' when BDEC_state,
											 '0' when b_state,
											 '0' when bne_state,
											 '0' when beq_state,
										    '0' when others;
			  
			  
with currentS select
			     ALU_func_CONTROL<="0000" when RtypeDEC_state,
										  Instruction_CONTROL(3 downto 0) when R_Ex_state,
										  "0000" when R_Write_state,
										  "0000" when If_state,
										  "0000" when ItypeDEC_state1,
										  "0000" when ItypeDEC_state2,
										  "0000" when allEX_state,
										  (Instruction_CONTROL(29),not(Instruction_CONTROL(26)),Instruction_CONTROL(26),Instruction_CONTROL(30))	when noEX_state,
										  "0000"	when I_Write_state,
										  "0000" when StoreDEC_state,
										  "0000" when StoreEX_state,
										  "0000" when sb_Write_state,
										  "0000" when sw_Write_state,
										  "0000" when LoadDEC_state,
										  "0000" when LoadEX_state,
										  "0000" when lbMEM_state,
										  "0000" when lwMEM_state,
										  "0000" when LoadWrite_state,
										  "0000" when BDEC_state,
										  "0000" when b_state,
										  "0001" when bne_state,
										  "0001" when beq_state,
										  "0000" when others;
			  
			  
			  
with currentS select
			     RF_WrData_sel_CONTROL<='0' when RtypeDEC_state,
											    '0' when R_Ex_state,
											    '0' when R_Write_state,
											    '0' when If_state,
												 '0' when ItypeDEC_state1,
												 '0' when ItypeDEC_state2,
												 '0' when I_Write_state,
												 '0' when allEX_state,
									          '0' when noEX_state,
												 '0' when StoreDEC_state,
												 '0' when StoreEX_state,
												 '0' when sb_Write_state,
										       '0' when sw_Write_state,
												 '0' when LoadDEC_state,
												 '0' when LoadEX_state,
												 '0' when lbMEM_state,
										       '0' when lwMEM_state,
												 '1' when LoadWrite_state,
												 '0' when BDEC_state,
												 '0' when b_state,
												 '0' when bne_state,
												 '0' when beq_state,
											    '0' when others;
				  
				  
				  
			  
with currentS select
			     RF_B_sel_CONTROL <='0' when RtypeDEC_state,
										   '0' when R_Ex_state,
										   '0' when R_Write_state,
										   '0' when If_state,
											'0' when ItypeDEC_state1,
											'0' when ItypeDEC_state2,
											'0' when I_Write_state,
											'0' when allEX_state,
									      '0' when noEX_state,
											'0' when StoreDEC_state,
											'1' when StoreEX_state,
											'0' when sb_Write_state,
										   '0' when sw_Write_state,
											'0' when LoadDEC_state,
											'0' when LoadEX_state,
											'0' when lbMEM_state,
										   '0' when lwMEM_state,
											'0' when LoadWrite_state,
											'1' when BDEC_state,
											'0' when b_state,
											'0' when bne_state,
											'0' when beq_state,
										   '0' when others;
			  
			  
with currentS select
			     ImmExt_CONTROL <="00" when RtypeDEC_state,
									    "00" when R_Ex_state,
									    "00" when R_Write_state,
									    "00" when If_state,
										 (Instruction_CONTROL(26),not(Instruction_CONTROL(26)))  when ItypeDEC_state1,
										 "00"	when ItypeDEC_state2,
										 "00" when I_Write_state,
										 "00" when allEX_state,
									    "00" when noEX_state,
										 "01" when StoreDEC_state,
										 "00" when StoreEX_state,
										 "00" when sb_Write_state,
										 "00" when sw_Write_state,
										 "01" when LoadDEC_state,
										 "00" when LoadEX_state,
										 "00" when lbMEM_state,
										 "00" when lwMEM_state,
										 "00" when LoadWrite_state,
										 "11" when BDEC_state,
										 "00" when b_state,
										 "00" when bne_state,
										 "00" when beq_state,
									    "00" when others;
				  
with currentS select
              ByteOp_CONTROL <='0' when RtypeDEC_state,
									    '0' when R_Ex_state,
									    '0' when R_Write_state,
									    '0' when If_state,
										 '0' when ItypeDEC_state1,
										 '0' when ItypeDEC_state2,
										 '0' when I_Write_state,
										 '0' when allEX_state,
									    '0' when noEX_state,
										 '0' when StoreDEC_state,
										 '0' when StoreEX_state,
										 '0' when sb_Write_state,
										 '1' when sw_Write_state,
										 '0' when LoadDEC_state,
										 '0' when LoadEX_state,
										 '0' when lbMEM_state,
										 '1' when lwMEM_state,
										 '0' when LoadWrite_state,
										 '0' when BDEC_state,
										 '0' when b_state,
										 '0' when bne_state,
										 '0' when beq_state,
									    '0' when others;
				  
with currentS select
              Mem_WrEn_CONTROL <='0' when RtypeDEC_state,
										   '0' when R_Ex_state,
										   '0' when R_Write_state,
										   '0' when If_state,
											'0' when ItypeDEC_state1,
											'0' when ItypeDEC_state2,
											'0' when I_Write_state,
										   '0' when allEX_state,
									      '0' when noEX_state,
											'0' when StoreDEC_state,
											'0' when StoreEX_state,
											'1' when sb_Write_state,
										   '1' when sw_Write_state,
											'0' when LoadDEC_state,
											'0' when LoadEX_state,
											'0' when lbMEM_state,
										   '0' when lwMEM_state,
											'0' when LoadWrite_state,
											'0' when BDEC_state,
											'0' when b_state,
											'0' when bne_state,
											'0' when beq_state,
										   '0' when others;
			  
with currentS select
              RF_WrEn_CONTROL <='0' when RtypeDEC_state,
										  '0' when R_Ex_state,
										  '1' when R_Write_state,
										  '0' when If_state,
										  '0' when ItypeDEC_state1,
										  '0' when ItypeDEC_state2,
										  '1' when I_Write_state,
										  '0' when allEX_state,
									     '0' when noEX_state,
										  '0' when StoreDEC_state,
										  '0' when StoreEX_state,
										  '0' when sb_Write_state,
										  '0' when sw_Write_state,
										  '0' when LoadDEC_state,
										  '0' when LoadEX_state,
										  '0' when lbMEM_state,
										  '0' when lwMEM_state,
										  '1' when LoadWrite_state,
										  '0' when BDEC_state,
										  '0' when b_state,
										  '0' when bne_state,
										  '0' when beq_state,
										  '0' when others;

with currentS select
              ALURegWrEn_CONTROL <='1' when RtypeDEC_state,
											  '0' when R_Ex_state,
											  '0' when R_Write_state,
											  '0' when If_state,
											  '1' when ItypeDEC_state1,
											  '1' when ItypeDEC_state2,
											  '0' when I_Write_state,
											  '0' when allEX_state,
									        '0' when noEX_state,
											  '1' when StoreDEC_state,
											  '0' when StoreEX_state,
											  '0' when sb_Write_state,
										     '0' when sw_Write_state,
											  '1' when LoadDEC_state,
											  '0' when LoadEX_state,
											  '0' when lbMEM_state,
										     '0' when lwMEM_state,
											  '0' when LoadWrite_state,
											  '1' when BDEC_state,
											  '0' when b_state,
											  '0' when bne_state,
											  '0' when beq_state,
											  '0' when others;
			  
with currentS select
              InstrRegWrEn_CONTROL <='0' when  RtypeDEC_state,
											    '0' when R_Ex_state,
											    '0' when R_Write_state,
											    '1' when If_state,
												 '0' when ItypeDEC_state1,
												 '0' when ItypeDEC_state2,
												 '0' when I_Write_state,
												 '0' when allEX_state,
									          '0' when noEX_state,
												 '0' when StoreDEC_state,
												 '0' when StoreEX_state,
												 '0' when sb_Write_state,
										       '0' when sw_Write_state,
												 '0' when LoadDEC_state,
												 '0' when LoadEX_state,
												 '0' when lbMEM_state,
										       '0' when lwMEM_state,
												 '0' when LoadWrite_state,
												 '0' when BDEC_state,
												 '0' when b_state,
												 '0' when bne_state,
												 '0' when beq_state,
											    '0' when others;
			  
with currentS select
              MemRegWrEn_CONTROL <='0' when RtypeDEC_state,
											  '0' when R_Ex_state,
											  '0' when R_Write_state,
											  '0' when If_state,
											  '0' when ItypeDEC_state1,
											  '0' when ItypeDEC_state2,
											  '0' when I_Write_state,
											  '0' when allEX_state,
									        '0' when noEX_state,
											  '0' when StoreDEC_state,
											  '1' when StoreEX_state,
											  '0' when sb_Write_state,
										     '0' when sw_Write_state,
											  '0' when LoadDEC_state,
											  '1' when LoadEX_state,
											  '0' when lbMEM_state,
										     '0' when lwMEM_state,
											  '0' when LoadWrite_state,
											  '0' when BDEC_state,
											  '0' when b_state,
											  '0' when bne_state,
											  '0' when beq_state,
											  '0' when others;
			  
with currentS select
              DecRegWrEn_CONTROL <='0' when RtypeDEC_state,
											  '1' when R_Ex_state,
											  '0' when R_Write_state,
											  '0' when If_state,
											  '0' when ItypeDEC_state1,
											  '0' when ItypeDEC_state2,
											  '0' when I_Write_state,
											  '1' when allEX_state,
									        '1' when noEX_state,
											  '0' when StoreDEC_state,
											  '0' when StoreEX_state,
											  '0' when sb_Write_state,
										     '0' when sw_Write_state,
											  '0' when LoadDEC_state,
											  '0' when LoadEX_state,
											  '1' when lbMEM_state,
										     '1' when lwMEM_state,
											  '0' when LoadWrite_state,
											  '0' when BDEC_state,
											  '0' when b_state,
											  '0' when bne_state,
											  '0' when beq_state,
											  '0' when others;
	
	
	
		 
		 
      
				
		 
		
		 
	   
		 
		
	

end Behavioral;

