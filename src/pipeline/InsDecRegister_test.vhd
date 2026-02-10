--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:57:28 05/12/2020
-- Design Name:   
-- Module Name:   C:/Users/Mulan/Desktop/organwsi/projec2_pipeline/InsDecRegister_test.vhd
-- Project Name:  projec2_pipeline
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: InsDecRegister
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
 
ENTITY InsDecRegister_test IS
END InsDecRegister_test;
 
ARCHITECTURE behavior OF InsDecRegister_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT InsDecRegister
    PORT(
         Clk : IN  std_logic;
         Rst : IN  std_logic;
         WrEnInsDec_in : IN  std_logic;
         WrEnDecEx_in : IN  std_logic;
         WrEnExMem_in : IN  std_logic;
         WrEnMemWrite_in : IN  std_logic;
         PC_sel_in : IN  std_logic;
         PC_LdEn_in : IN  std_logic;
         ALU_Binsel_in : IN  std_logic;
         ALU_func_in : IN  std_logic_vector(3 downto 0);
         RF_WrData_sel_in : IN  std_logic;
         RF_B_sel_in : IN  std_logic;
         RF_WrEn_in : IN  std_logic;
         ImmExt_in : IN  std_logic_vector(1 downto 0);
         ByteOp_in : IN  std_logic;
         Mem_WrEn_in : IN  std_logic;
         Instruction_in : IN  std_logic_vector(31 downto 0);
         WrEnDecEx_out : OUT  std_logic;
         WrEnExMem_out : OUT  std_logic;
         WrEnMemWrite_out : OUT  std_logic;
         PC_sel_out : OUT  std_logic;
         PC_LdEn_out : OUT  std_logic;
         ALU_Binsel_out : OUT  std_logic;
         ALU_func_out : OUT  std_logic_vector(3 downto 0);
         RF_WrData_sel_out : OUT  std_logic;
         RF_B_sel_out : OUT  std_logic;
         RF_WrEn_out : OUT  std_logic;
         ImmExt_out : OUT  std_logic_vector(1 downto 0);
         ByteOp_out : OUT  std_logic;
         Mem_WrEn_out : OUT  std_logic;
         Instruction_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Rst : std_logic := '0';
   signal WrEnInsDec_in : std_logic := '0';
   signal WrEnDecEx_in : std_logic := '0';
   signal WrEnExMem_in : std_logic := '0';
   signal WrEnMemWrite_in : std_logic := '0';
   signal PC_sel_in : std_logic := '0';
   signal PC_LdEn_in : std_logic := '0';
   signal ALU_Binsel_in : std_logic := '0';
   signal ALU_func_in : std_logic_vector(3 downto 0) := (others => '0');
   signal RF_WrData_sel_in : std_logic := '0';
   signal RF_B_sel_in : std_logic := '0';
   signal RF_WrEn_in : std_logic := '0';
   signal ImmExt_in : std_logic_vector(1 downto 0) := (others => '0');
   signal ByteOp_in : std_logic := '0';
   signal Mem_WrEn_in : std_logic := '0';
   signal Instruction_in : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal WrEnDecEx_out : std_logic;
   signal WrEnExMem_out : std_logic;
   signal WrEnMemWrite_out : std_logic;
   signal PC_sel_out : std_logic;
   signal PC_LdEn_out : std_logic;
   signal ALU_Binsel_out : std_logic;
   signal ALU_func_out : std_logic_vector(3 downto 0);
   signal RF_WrData_sel_out : std_logic;
   signal RF_B_sel_out : std_logic;
   signal RF_WrEn_out : std_logic;
   signal ImmExt_out : std_logic_vector(1 downto 0);
   signal ByteOp_out : std_logic;
   signal Mem_WrEn_out : std_logic;
   signal Instruction_out : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: InsDecRegister PORT MAP (
          Clk => Clk,
          Rst => Rst,
          WrEnInsDec_in => WrEnInsDec_in,
          WrEnDecEx_in => WrEnDecEx_in,
          WrEnExMem_in => WrEnExMem_in,
          WrEnMemWrite_in => WrEnMemWrite_in,
          PC_sel_in => PC_sel_in,
          PC_LdEn_in => PC_LdEn_in,
          ALU_Binsel_in => ALU_Binsel_in,
          ALU_func_in => ALU_func_in,
          RF_WrData_sel_in => RF_WrData_sel_in,
          RF_B_sel_in => RF_B_sel_in,
          RF_WrEn_in => RF_WrEn_in,
          ImmExt_in => ImmExt_in,
          ByteOp_in => ByteOp_in,
          Mem_WrEn_in => Mem_WrEn_in,
          Instruction_in => Instruction_in,
          WrEnDecEx_out => WrEnDecEx_out,
          WrEnExMem_out => WrEnExMem_out,
          WrEnMemWrite_out => WrEnMemWrite_out,
          PC_sel_out => PC_sel_out,
          PC_LdEn_out => PC_LdEn_out,
          ALU_Binsel_out => ALU_Binsel_out,
          ALU_func_out => ALU_func_out,
          RF_WrData_sel_out => RF_WrData_sel_out,
          RF_B_sel_out => RF_B_sel_out,
          RF_WrEn_out => RF_WrEn_out,
          ImmExt_out => ImmExt_out,
          ByteOp_out => ByteOp_out,
          Mem_WrEn_out => Mem_WrEn_out,
          Instruction_out => Instruction_out
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
      wait for 100 ns;	
		Rst<='0';
		
		PC_sel_in<='1';
		ALU_func_in<="0010";
		ImmExt_in<="01";
		ByteOp_in<='1';
		Instruction_in<="00000000000000000000000000001111";
		
		
		
		
		WrEnInsDec_in<='1';

      wait for Clk_period;
		WrEnInsDec_in<='0';

      -- insert stimulus here 

      wait;
   end process;

END;
