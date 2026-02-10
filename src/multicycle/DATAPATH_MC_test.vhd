--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:59:18 05/06/2020
-- Design Name:   
-- Module Name:   C:/Users/Mulan/Desktop/organwsi/project2/DATAPATH_MC_test.vhd
-- Project Name:  project2
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
 
ENTITY DATAPATH_MC_test IS
END DATAPATH_MC_test;
 
ARCHITECTURE behavior OF DATAPATH_MC_test IS 
 
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
         ALU_zero_DATAPATH : OUT  std_logic;
         ALURegWrEn : IN  std_logic;
         InstrRegWrEn : IN  std_logic;
         MemRegWrEn : IN  std_logic;
         DecRegWrEn : IN  std_logic
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
   signal ALURegWrEn : std_logic := '0';
   signal InstrRegWrEn : std_logic := '0';
   signal MemRegWrEn : std_logic := '0';
   signal DecRegWrEn : std_logic := '0';

 	--Outputs
   signal ALU_zero_DATAPATH : std_logic;

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
          ALU_zero_DATAPATH => ALU_zero_DATAPATH,
          ALURegWrEn => ALURegWrEn,
          InstrRegWrEn => InstrRegWrEn,
          MemRegWrEn => MemRegWrEn,
          DecRegWrEn => DecRegWrEn
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
      -- hold reset state for 100 ns.
		Rst<='1';
      wait for 150 ns;	
		Rst<='0';
		--test gia li r1,8
		--PC_sel_DATAPATH<='0';
		--PC_LdEn_DATAPATH<='1';
		InstrRegWrEn<='1';
	   RF_B_sel_DATAPATH<='0';
		ImmExt_DATAPATH<="01";
		wait for Clk_period;
		InstrRegWrEn<='0';
		ALURegWrEn<='1';
		ALU_Binsel_DATAPATH<='1';
		ALU_func_DATAPATH<="0000";
		wait for Clk_period;
		ALURegWrEn<='0';
		DecRegWrEn<='1';
		RF_WrData_sel_DATAPATH<='0';
		RF_WrEn_DATAPATH<='1';
		wait for Clk_period;
		DecRegWrEn<='0';
		RF_WrEn_DATAPATH<='0';
		
		
		--test gia addi<=r5,ro,8
		
	    PC_sel_DATAPATH<='0';
	    PC_LdEn_DATAPATH<='1';
	    wait for Clk_period;
	    PC_LdEn_DATAPATH<='0';

	    InstrRegWrEn<='1';

		 RF_B_sel_DATAPATH<='0';
		 ImmExt_DATAPATH<="01";
		 wait for Clk_period;
		 InstrRegWrEn<='0';
		 ALURegWrEn<='1';
		 ALU_Binsel_DATAPATH<='1';
		 ALU_func_DATAPATH<="0000";
		 wait for Clk_period;
		 ALURegWrEn<='0';
		 DecRegWrEn<='1';
		 RF_WrData_sel_DATAPATH<='0';
		 RF_WrEn_DATAPATH<='1';
		 wait for Clk_period;
		 DecRegWrEn<='0';
		 RF_WrEn_DATAPATH<='0';
		
		
		
		--test gia add<=r17,r5,r1
		 
		 PC_sel_DATAPATH<='0';
		 PC_LdEn_DATAPATH<='1';
		 wait for Clk_period;
	    PC_LdEn_DATAPATH<='0';
		 
		 InstrRegWrEn<='1';
		 RF_B_sel_DATAPATH<='0';
		 wait for Clk_period;
		 InstrRegWrEn<='0';
		 ALURegWrEn<='1';
		 ALU_Binsel_DATAPATH<='0';
		 ALU_func_DATAPATH<="0000";
		 wait for Clk_period;
		 ALURegWrEn<='0';
		 DecRegWrEn<='1';
		 RF_WrData_sel_DATAPATH<='0';
		 RF_WrEn_DATAPATH<='1';
		 wait for Clk_period;
		 DecRegWrEn<='0';
		 RF_WrEn_DATAPATH<='0';
		
		
		--test gia sw r1,1(rs)
		
		 PC_sel_DATAPATH<='0';
		 PC_LdEn_DATAPATH<='1';
		 wait for Clk_period;
	    PC_LdEn_DATAPATH<='0';
		 InstrRegWrEn<='1';
		 ImmExt_DATAPATH<="01";
		 wait for Clk_period;
		 InstrRegWrEn<='0';
		 ALURegWrEn<='1';
		 ALU_Binsel_DATAPATH<='1';
		 ALU_func_DATAPATH<="0000";
       RF_B_sel_DATAPATH<='1';
		 wait for Clk_period;
		 ALURegWrEn<='0';
		 MemRegWrEn<='1';
		 		

		 ByteOp_DATAPATH<='1';
		 Mem_WrEn_DATAPATH<='1';
		 wait for Clk_period;
		 Mem_WrEn_DATAPATH<='0';
		 MemRegWrEn<='0';
		 
		 
--		 --lb test 
--		 PC_sel_DATAPATH<='0';
--		 PC_LdEn_DATAPATH<='1';
--		 wait for Clk_period;
--	    PC_LdEn_DATAPATH<='0';
--		 InstrRegWrEn<='1';
--		 ImmExt_DATAPATH<="01";
--		 wait for Clk_period;
--		 InstrRegWrEn<='0';
--		 ALURegWrEn<='1';
--		 ALU_Binsel_DATAPATH<='1';
--		 ALU_func_DATAPATH<="0000";
--     wait for Clk_period;
--		 ALURegWrEn<='0';
--		 MemRegWrEn<='1';
--		 ByteOp_DATAPATH<='1';
--		 wait for Clk_period;
--		 MemRegWrEn<='0';
--		 DecRegWrEn<='1';
--		 RF_WrData_sel_DATAPATH<='1';
--		 RF_WrEn_DATAPATH<='1';
--		 wait for Clk_period;
--		 DecRegWrEn<='0';
--		 RF_WrEn_DATAPATH<='0';
		 
		 
		 
		
		 

		
		

      wait for Clk_period;

      -- insert stimulus here 

      wait;
   end process;

END;
