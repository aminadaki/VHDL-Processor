--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:58:19 05/13/2020
-- Design Name:   
-- Module Name:   C:/Users/Mulan/Desktop/organwsi/projec2_pipeline/dp_pipeline_test.vhd
-- Project Name:  projec2_pipeline
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DATAPATH
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY dp_pipeline_test IS
END dp_pipeline_test;
 
ARCHITECTURE behavior OF dp_pipeline_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DATAPATH
    PORT(
         Clk : IN  std_logic;
         Rst : IN  std_logic;
         PC_sel_DATAPATH : IN  std_logic;
         PC_LdEn_DATAPATH : IN  std_logic;
         ALU_Binsel_DATAPATH : IN  std_logic;
         ALU_func_DATAPATH : IN  std_logic_vector(3 downto 0);
         RF_WrData_sel_DATAPATH : IN  std_logic;
         RF_B_sel_DATAPATH : IN  std_logic;
         ImmExt_DATAPATH : IN  std_logic_vector(1 downto 0);
         ByteOp_DATAPATH : IN  std_logic;
         Mem_WrEn_DATAPATH : IN  std_logic;
         RF_WrEn_DATAPATH : IN  std_logic;
         WrEnInsDec_DATAPATH : IN  std_logic;
         WrEnDecEx_DATAPATH : IN  std_logic;
         WrEnExMem_DATAPATH : IN  std_logic;
         WrEnMemWrite_DATAPATH : IN  std_logic;
			Instruction_DATAPATH_in: in std_logic_vector (31 downto 0);
			 SelALUaddr: in std_logic_vector(1 downto 0);
         ALU_zero_DATAPATH : OUT  std_logic;
         Instruction_DATAPATH : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Rst : std_logic := '0';
   signal PC_sel_DATAPATH : std_logic := '0';
   signal PC_LdEn_DATAPATH : std_logic := '0';
   signal ALU_Binsel_DATAPATH : std_logic := '0';
   signal ALU_func_DATAPATH : std_logic_vector(3 downto 0) := (others => '0');
   signal RF_WrData_sel_DATAPATH : std_logic := '0';
   signal RF_B_sel_DATAPATH : std_logic := '0';
   signal ImmExt_DATAPATH : std_logic_vector(1 downto 0) := (others => '0');
   signal ByteOp_DATAPATH : std_logic := '0';
   signal Mem_WrEn_DATAPATH : std_logic := '0';
   signal RF_WrEn_DATAPATH : std_logic := '0';
   signal WrEnInsDec_DATAPATH : std_logic := '0';
   signal WrEnDecEx_DATAPATH : std_logic := '0';
   signal WrEnExMem_DATAPATH : std_logic := '0';
   signal WrEnMemWrite_DATAPATH : std_logic := '0';
	signal Instruction_DATAPATH_in: std_logic_vector (31 downto 0):= (others => '0');
	signal SelALUaddr: std_logic_vector(1 downto 0):= (others => '0');

 	--Outputs
   signal ALU_zero_DATAPATH : std_logic;
   signal Instruction_DATAPATH : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DATAPATH PORT MAP (
          Clk => Clk,
          Rst => Rst,
          PC_sel_DATAPATH => PC_sel_DATAPATH,
          PC_LdEn_DATAPATH => PC_LdEn_DATAPATH,
          ALU_Binsel_DATAPATH => ALU_Binsel_DATAPATH,
          ALU_func_DATAPATH => ALU_func_DATAPATH,
          RF_WrData_sel_DATAPATH => RF_WrData_sel_DATAPATH,
          RF_B_sel_DATAPATH => RF_B_sel_DATAPATH,
          ImmExt_DATAPATH => ImmExt_DATAPATH,
          ByteOp_DATAPATH => ByteOp_DATAPATH,
          Mem_WrEn_DATAPATH => Mem_WrEn_DATAPATH,
          RF_WrEn_DATAPATH => RF_WrEn_DATAPATH,
          WrEnInsDec_DATAPATH => WrEnInsDec_DATAPATH,
          WrEnDecEx_DATAPATH => WrEnDecEx_DATAPATH,
          WrEnExMem_DATAPATH => WrEnExMem_DATAPATH,
          WrEnMemWrite_DATAPATH => WrEnMemWrite_DATAPATH,
          ALU_zero_DATAPATH => ALU_zero_DATAPATH,
          Instruction_DATAPATH => Instruction_DATAPATH,
			 Instruction_DATAPATH_in=>Instruction_DATAPATH,
			 
			 SelALUaddr => SelALUaddr
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
     Rst<='1';
      wait for 100 ns;	
   Rst<='0';
      --li r1
          PC_sel_DATAPATH <='0';
          PC_LdEn_DATAPATH <= '1';
          ALU_Binsel_DATAPATH <= '1';
          ALU_func_DATAPATH <= "0000";
          RF_WrData_sel_DATAPATH <= '0';
          RF_B_sel_DATAPATH <= '0';
          ImmExt_DATAPATH <= "01";
          ByteOp_DATAPATH <= '0';
          Mem_WrEn_DATAPATH <= '0';
          RF_WrEn_DATAPATH <= '1';
          WrEnInsDec_DATAPATH <= '1';
          WrEnDecEx_DATAPATH <= '1';
          WrEnExMem_DATAPATH <= '1';
          WrEnMemWrite_DATAPATH <= '1';
			 SelALUaddr<="00";
      wait for Clk_period;
--li r2		
          PC_sel_DATAPATH <='0';
          PC_LdEn_DATAPATH <= '1';
          ALU_Binsel_DATAPATH <= '1';
          ALU_func_DATAPATH <= "0000";
          RF_WrData_sel_DATAPATH <= '0';
          RF_B_sel_DATAPATH <= '0';
          ImmExt_DATAPATH <= "01";
          ByteOp_DATAPATH <= '0';
          Mem_WrEn_DATAPATH <= '0';
          RF_WrEn_DATAPATH <= '1';
          WrEnInsDec_DATAPATH <= '1';
          WrEnDecEx_DATAPATH <= '1';
          WrEnExMem_DATAPATH <= '1';
          WrEnMemWrite_DATAPATH <= '1';
		    SelALUaddr<="00";			 
			  wait for Clk_period; 
			 --li r3 
			  
          PC_sel_DATAPATH <='0';
          PC_LdEn_DATAPATH <= '1';
          ALU_Binsel_DATAPATH <= '1';
          ALU_func_DATAPATH <= "0000";
          RF_WrData_sel_DATAPATH <= '0';
          RF_B_sel_DATAPATH <= '0';
          ImmExt_DATAPATH <= "01";
          ByteOp_DATAPATH <= '0';
          Mem_WrEn_DATAPATH <= '0';
          RF_WrEn_DATAPATH <= '1';
          WrEnInsDec_DATAPATH <= '1';
          WrEnDecEx_DATAPATH <= '1';
          WrEnExMem_DATAPATH <= '1';
          WrEnMemWrite_DATAPATH <= '1';
			 SelALUaddr<="00";			 
 wait for Clk_period; 
 --li r4
          PC_sel_DATAPATH <='0';
          PC_LdEn_DATAPATH <= '1';
          ALU_Binsel_DATAPATH <= '1';
          ALU_func_DATAPATH <= "0000";
          RF_WrData_sel_DATAPATH <= '0';
          RF_B_sel_DATAPATH <= '0';
          ImmExt_DATAPATH <= "01";
          ByteOp_DATAPATH <= '0';
          Mem_WrEn_DATAPATH <= '0';
          RF_WrEn_DATAPATH <= '1';
          WrEnInsDec_DATAPATH <= '1';
          WrEnDecEx_DATAPATH <= '1';
          WrEnExMem_DATAPATH <= '1';
          WrEnMemWrite_DATAPATH <= '1';
			 SelALUaddr<="00";
wait for Clk_period; 
 --li r5
          PC_sel_DATAPATH <='0';
          PC_LdEn_DATAPATH <= '1';
          ALU_Binsel_DATAPATH <= '1';
          ALU_func_DATAPATH <= "0000";
          RF_WrData_sel_DATAPATH <= '0';
          RF_B_sel_DATAPATH <= '0';
          ImmExt_DATAPATH <= "01";
          ByteOp_DATAPATH <= '0';
          Mem_WrEn_DATAPATH <= '0';
          RF_WrEn_DATAPATH <= '1';
          WrEnInsDec_DATAPATH <= '1';
          WrEnDecEx_DATAPATH <= '1';
          WrEnExMem_DATAPATH <= '1';
          WrEnMemWrite_DATAPATH <= '1';
			 SelALUaddr<="00";
wait for Clk_period; 
 --li r6
          PC_sel_DATAPATH <='0';
          PC_LdEn_DATAPATH <= '1';
          ALU_Binsel_DATAPATH <= '1';
          ALU_func_DATAPATH <= "0000";
          RF_WrData_sel_DATAPATH <= '0';
          RF_B_sel_DATAPATH <= '0';
          ImmExt_DATAPATH <= "01";
          ByteOp_DATAPATH <= '0';
          Mem_WrEn_DATAPATH <= '0';
          RF_WrEn_DATAPATH <= '1';
          WrEnInsDec_DATAPATH <= '1';
          WrEnDecEx_DATAPATH <= '1';
          WrEnExMem_DATAPATH <= '1';
          WrEnMemWrite_DATAPATH <= '1';
			 SelALUaddr<="00";
wait for Clk_period; 
 --li r7
          PC_sel_DATAPATH <='0';
          PC_LdEn_DATAPATH <= '1';
          ALU_Binsel_DATAPATH <= '1';
          ALU_func_DATAPATH <= "0000";
          RF_WrData_sel_DATAPATH <= '0';
          RF_B_sel_DATAPATH <= '0';
          ImmExt_DATAPATH <= "01";
          ByteOp_DATAPATH <= '0';
          Mem_WrEn_DATAPATH <= '0';
          RF_WrEn_DATAPATH <= '1';
          WrEnInsDec_DATAPATH <= '1';
          WrEnDecEx_DATAPATH <= '1';
          WrEnExMem_DATAPATH <= '1';
          WrEnMemWrite_DATAPATH <= '1';
			 SelALUaddr<="00";
wait for Clk_period; 
 --sub r8
          PC_sel_DATAPATH <='0';
          PC_LdEn_DATAPATH <= '1';
          ALU_Binsel_DATAPATH <= '0';
          ALU_func_DATAPATH <= "0001";
          RF_WrData_sel_DATAPATH <= '0';
          RF_B_sel_DATAPATH <= '0';
          ImmExt_DATAPATH <= "01";
          ByteOp_DATAPATH <= '0';
          Mem_WrEn_DATAPATH <= '0';
          RF_WrEn_DATAPATH <= '1';
          WrEnInsDec_DATAPATH <= '1';
          WrEnDecEx_DATAPATH <= '1';
          WrEnExMem_DATAPATH <= '1';
          WrEnMemWrite_DATAPATH <= '1';
			 SelALUaddr<="00";
wait for Clk_period; 
 --sb 1025
          PC_sel_DATAPATH <='0';
          PC_LdEn_DATAPATH <= '1';
          ALU_Binsel_DATAPATH <= '1';
          ALU_func_DATAPATH <= "0000";
          RF_WrData_sel_DATAPATH <= '0';
          RF_B_sel_DATAPATH <= '1';
          ImmExt_DATAPATH <= "01";
          ByteOp_DATAPATH <= '0';
          Mem_WrEn_DATAPATH <= '1';
          RF_WrEn_DATAPATH <= '0';
          WrEnInsDec_DATAPATH <= '1';
          WrEnDecEx_DATAPATH <= '1';
          WrEnExMem_DATAPATH <= '1';
          WrEnMemWrite_DATAPATH <= '1';
          SelALUaddr<="01";			 
  
     


WAIT FOR CLK_PERIOD; 
 --LI R9
          PC_SEL_DATAPATH <='0';
          PC_LDEN_DATAPATH <= '1';
          ALU_BINSEL_DATAPATH <= '1';
          ALU_FUNC_DATAPATH <= "0000";
          RF_WRDATA_SEL_DATAPATH <= '0';
          RF_B_SEL_DATAPATH <= '0';
          IMMEXT_DATAPATH <= "01";
          BYTEOP_DATAPATH <= '0';
          MEM_WREN_DATAPATH <= '0';
          RF_WREN_DATAPATH <= '1';
          WRENINSDEC_DATAPATH <= '1';
          WRENDECEX_DATAPATH <= '1';
          WRENEXMEM_DATAPATH <= '1';
          WRENMEMWRITE_DATAPATH <= '1';
           SelALUaddr<="00";
wait for Clk_period; 
-- lb 1025
          PC_sel_DATAPATH <='0';
          PC_LdEn_DATAPATH <= '1';
          ALU_Binsel_DATAPATH <= '1';
          ALU_func_DATAPATH <= "0000";
          RF_WrData_sel_DATAPATH <= '1';
          RF_B_sel_DATAPATH <= '1';
          ImmExt_DATAPATH <= "01";
          ByteOp_DATAPATH <= '1';
          Mem_WrEn_DATAPATH <= '0';
          RF_WrEn_DATAPATH <= '1';
          WrEnInsDec_DATAPATH <= '1';
          WrEnDecEx_DATAPATH <= '1';
          WrEnExMem_DATAPATH <= '1';
          WrEnMemWrite_DATAPATH <= '1';	
			 SelALUaddr<="10";

      wait;
   end process;

END;
