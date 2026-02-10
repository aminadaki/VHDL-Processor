----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:04:44 04/17/2020 
-- Design Name: 
-- Module Name:    DATAPATH - Behavioral 
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

entity DATAPATH is
		Port(Clk: in std_logic;
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
			  WrEnInsDec_DATAPATH:in std_logic;
			  WrEnDecEx_DATAPATH: in std_logic;
			  WrEnExMem_DATAPATH:in std_logic;
			  WrEnMemWrite_DATAPATH:in std_logic;
			  SelALUaddr: in std_logic_vector(1 downto 0);
			  Instruction_DATAPATH_in: in std_logic_vector (31 downto 0);
				
			  ALU_zero_DATAPATH: out std_logic;
			  Instruction_DATAPATH: out std_logic_vector (31 downto 0);
			  StallFlag_DATAPATH: out std_logic
		);

end DATAPATH;

architecture Behavioral of DATAPATH is

signal ALU_outTemp_MEM,RF_B_temp_MEM,
		 ALU_outTemp_DEC,MemDataOutTemp_DEC,InstrTemp_DEC,
		 RF_B_temp_ALU,RF_A_temp_ALU,ImmedTemp_ALU,
		 PCToInstrTemp,PCToInstrOutTemp,RF_A_temp,RF_B_temp,PC_ImmedTemp,ALU_outTemp,MemDataOutTemp,ImmedTemp,
		 RF_B_temp1,Instruction_out_TEMP,RF_A_temp1,ImmedTemp1,RF_B_temp2,ALU_outTemp1,ALU_outTemp2,MemDataOutTemp1,RF_B_temp3,
		 ALU_address,muxFw_A,muxFw_B,datain_tmp: std_logic_vector(31  downto 0);
		 
signal WrEnDecEx_out_TEMP,WrEnExMem_out_TEMP,WrEnMemWrite_out_TEMP,PC_sel_out_TEMP,
		 PC_LdEn_out_TEMP,ALU_Binsel_out_TEMP,RF_WrData_sel_out_TEMP,
		 RF_B_sel_out_TEMP,RF_WrEn_out_TEMP,ByteOp_out_TEMP,Mem_WrEn_out_TEMP,
		 WrEnDecEx_out_TEMP1,WrEnExMem_out_TEMP1,PC_sel_out_TEMP1,PC_LdEn_out_TEMP1,
		 ALU_Binsel_out_TEMP1,RF_WrData_sel_out_TEMP1,RF_WrEn_out_TEMP1,ByteOp_out_TEMP1,
		 Mem_WrEn_out_TEMP1,WrEnMemWrite_out_TEMP1,WrEnMemWrite_out_TEMP2,PC_sel_out_TEMP2,
		 PC_LdEn_out_TEMP2,RF_WrData_sel_out_TEMP2,RF_WrEn_out_TEMP2,ByteOp_out_TEMP2,
		 Mem_WrEn_out_TEMP2,PC_sel_out_TEMP3,PC_LdEn_out_TEMP3,RF_WrData_sel_out_TEMP3,
		 RF_WrEn_out_TEMP3,Mem_WrEn_out_TEMP3,SelALUaddrTemp3,ByteOp_out_TEMP3,ByteOP_true,
		 truePCLdEn,stallTemp:std_logic;
		 
signal ALU_func_out_TEMP,ALU_func_out_TEMP1 :std_logic_vector(3 downto 0);

signal ImmExt_out_TEMP,SelALUaddrTemp,SelALUaddrTemp1,SelALUaddrTemp2,fw_a,fw_b:std_logic_vector(1 downto 0);
signal Instruction_out_TEMP1,Instruction_out_TEMP2,Instruction_out_TEMP3,Instruction_out_TEMPRs,Instruction_out_TEMPRt,
		 Rt_dec_out: std_logic_vector(4 downto 0);
 



component IF_vathmida
    Port ( PC_Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_sel : in  STD_LOGIC;
           PC_LdEn : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           PC : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


component DECSTAGE 
Port (Instr : in std_logic_vector (31 downto 0);
		RF_WrEn : in std_logic;
		ALU_out : in std_logic_vector (31 downto 0);
		MEM_out : in std_logic_vector (31 downto 0);
		RF_WrData_sel : in std_logic;
		RF_B_sel : in std_logic;
		ImmExt : in std_logic_vector (1 downto 0);
		Clk : in std_logic;
		Immed : out std_logic_vector (31 downto 0);
		RF_A : out std_logic_vector (31 downto 0);
	   rst:in std_logic;
		RF_B : out std_logic_vector (31 downto 0);
		Rd : in std_logic_vector( 4 downto 0);
		datain_out: out std_logic_vector (31 downto 0); 
		Rt_out: out std_logic_vector( 4 downto 0)
        );
end component;

component EX_STAGE 
    Port ( RF_A : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_B : in  STD_LOGIC_VECTOR (31 downto 0);
           Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           ALU_Bin_sel : in  STD_LOGIC;
           ALU_func : in  STD_LOGIC_VECTOR (3 downto 0);
           ALU_out : inout  STD_LOGIC_VECTOR (31 downto 0);
           ALU_zero : out  STD_LOGIC);
end component;


component MEM_STAGE 
    Port ( clk : in  STD_LOGIC;
           Mem_WrEn : in  STD_LOGIC;
           ALU_MEM_Addr : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_DataIn : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_DataOut : out  STD_LOGIC_VECTOR (31 downto 0);
           
			  ByteOp : in STD_LOGIC;
			  pcToInstr: in std_logic_vector(31 downto 0);
			  pcToInstrout: out std_logic_vector(31 downto 0));
end component;

component InsDecRegister
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
end component;

component DecToExRegister 
Port (  	  Clk: in std_logic;
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
end component;

component ExMemRegister 
Port (     Clk: in std_logic;
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
end component;


component MemWriteRegister 
Port (     Clk: in std_logic;
			  Rst: in std_logic;
			  WrEnMemWrite_in: in std_logic;
			  PC_sel_in: in std_logic;
			  PC_LdEn_in:in std_logic;
			  RF_WrData_sel_in:in std_logic;
			  RF_WrEn_in:in std_logic;
			  Rd_in:in std_logic_vector (4 downto 0);
			  Mem_WrEn_in:in std_logic;
			  ALU_out_in :in std_logic_vector (31 downto 0);
			  MemData_out_in:in std_logic_vector (31 downto 0);
			  RF_B_in: in std_logic_vector (31 downto 0);
			  SelALUaddr_in: in std_logic;
			  ByteOp_in:in std_logic;

			  
			  
			  PC_sel_out: out std_logic;
			  PC_LdEn_out:out std_logic;
			  RF_WrData_sel_out:out std_logic;
			  RF_WrEn_out:out std_logic;
			  Rd_out:out std_logic_vector (4 downto 0);
			  Mem_WrEn_out:out std_logic;
			  ALU_out_out :out std_logic_vector (31 downto 0);
			  MemData_out_out:out std_logic_vector (31 downto 0);
			  RF_B_out: out std_logic_vector (31 downto 0);
			  SelALUaddr_out: out std_logic;
			  ByteOp_out:out std_logic

			  
			  );

end component;

component mu_2_to_1_ALUaddr is
		Port(		In0 : in  STD_LOGIC_VECTOR (31 downto 0);
					In1 : in  STD_LOGIC_VECTOR (31 downto 0);
					In2: in STD_LOGIC;
					In3: in STD_LOGIC;
					Sel : in STD_LOGIC_VECTOR(1 downto 0);
					DataOut1 : out  STD_LOGIC_VECTOR (31 downto 0);
					DataOut2 :out STD_LOGIC );

end component;

component mux_3_to_1_forward is
		Port(		In0 : in  STD_LOGIC_VECTOR (31 downto 0);
					In1 : in  STD_LOGIC_VECTOR (31 downto 0);
					In2: in STD_LOGIC_VECTOR (31 downto 0);
					Sel : in STD_LOGIC_VECTOR(1 downto 0);
					DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
					
end component;

component Forwarding_Unit is
	Port(RdExMem_in: in std_logic_vector (4 downto 0);
		  RdMemWr_in: in std_logic_vector (4 downto 0);
		  RsInsEx_in: in std_logic_vector (4 downto 0);
		  RtInsEx_in: in std_logic_vector (4 downto 0);
		  RFWrEn_ExMem: in std_logic;
		  RFWrEn_MemWr: in std_logic;
		  sel_fwA: out std_logic_vector (1 downto 0);
		  sel_fwB: out std_logic_vector (1 downto 0));
end component;

component stall_unit is
	Port(RdDecEx_in: in std_logic_vector (4 downto 0);
		  RsInstDec_in: in std_logic_vector (4 downto 0);
		  RtInstDec_in: in std_logic_vector (4 downto 0);
		  SelAluAddress: in std_logic_vector (1 downto 0);
		  stall_flag: out std_logic);

end component;

component mux_pcLdEn is
	Port(In0: in std_logic;
		  In1: in std_logic;
		  sel: in std_logic;
		  muxPCEnout: out std_logic
				);

end component;



begin



ifstage: IF_vathmida
    Port Map ( PC_Immed =>ImmedTemp_ALU,
					PC_sel =>PC_sel_out_TEMP3,
					PC_LdEn =>truePCLdEn,--PC_LdEn_DATAPATH,--PC_LdEn_out_TEMP3,
					Reset =>Rst,
					Clk =>Clk,
					PC =>PCToInstrTemp );
			  
dec:	DECSTAGE 
	Port Map ( Instr =>Instruction_out_TEMP,
				  RF_WrEn =>RF_WrEn_out_TEMP3,
				  ALU_out =>ALU_outTemp2,
				  MEM_out =>MemDataOutTemp1,
				  RF_WrData_sel =>RF_WrData_sel_out_TEMP3,
				  RF_B_sel =>RF_B_sel_out_TEMP,
				  ImmExt =>ImmExt_out_TEMP,
				  Clk =>Clk,
				  Immed =>ImmedTemp,
				  RF_A =>RF_A_temp,
				  rst=>Rst,
				  RF_B =>RF_B_temp,
				  Rd=> Instruction_out_TEMP3,
				  datain_out =>datain_tmp,
				  Rt_out=>Rt_dec_out);

				  
ex: EX_STAGE 
    Port Map ( RF_A =>muxFw_A,
					RF_B =>muxFw_B,
					Immed =>ImmedTemp1,
					ALU_Bin_sel =>ALU_Binsel_out_TEMP1,
					ALU_func =>ALU_func_out_TEMP1,
					ALU_out =>ALU_outTemp,
					ALU_zero =>ALU_zero_DATAPATH );			  


mem: MEM_STAGE 
    Port Map ( clk =>Clk,
					Mem_WrEn =>Mem_WrEn_out_TEMP3,
					ALU_MEM_Addr =>ALU_address,
					MEM_DataIn =>RF_B_temp3,
					MEM_DataOut =>MemDataOutTemp,
					ByteOp =>ByteOP_true,
					pcToInstr=>	PCToInstrTemp,	
					pcToInstrout=>Instruction_DATAPATH );




IDreg:InsDecRegister
		Port Map (Clk=>Clk,
					 Rst=>Rst,
					 WrEnInsDec_in=>WrEnInsDec_DATAPATH,
					 WrEnDecEx_in=>WrEnDecEx_DATAPATH,
					 WrEnExMem_in=>WrEnExMem_DATAPATH,
					 WrEnMemWrite_in=>WrEnMemWrite_DATAPATH,
					 PC_sel_in=>PC_sel_DATAPATH,
					 PC_LdEn_in=>PC_LdEn_DATAPATH,
					 ALU_Binsel_in=>ALU_Binsel_DATAPATH,
					 ALU_func_in=>ALU_func_DATAPATH,
					 RF_WrData_sel_in=>RF_WrData_sel_DATAPATH,
					 RF_B_sel_in=>RF_B_sel_DATAPATH,
					 RF_WrEn_in=>RF_WrEn_DATAPATH,
					 ImmExt_in=>ImmExt_DATAPATH,
					 ByteOp_in=>ByteOp_DATAPATH,
					 Mem_WrEn_in=>Mem_WrEn_DATAPATH,
					 Instruction_in=>Instruction_DATAPATH_in,
					 SelALUaddr_in=>SelALUaddr,
					 --
					 WrEnDecEx_out=>WrEnDecEx_out_TEMP,
					 WrEnExMem_out=>WrEnExMem_out_TEMP,
					 WrEnMemWrite_out=>WrEnMemWrite_out_TEMP,
					 PC_sel_out=>PC_sel_out_TEMP,
				    PC_LdEn_out=>PC_LdEn_out_TEMP,
					 ALU_Binsel_out=>ALU_Binsel_out_TEMP,
					 ALU_func_out=>ALU_func_out_TEMP,
					 RF_WrData_sel_out=>RF_WrData_sel_out_TEMP,
					 RF_B_sel_out=>RF_B_sel_out_TEMP,
					 RF_WrEn_out=>RF_WrEn_out_TEMP,
					 ImmExt_out=>ImmExt_out_TEMP,
					 ByteOp_out=>ByteOp_out_TEMP,
					 Mem_WrEn_out=>Mem_WrEn_out_TEMP,
					 Instruction_out=>Instruction_out_TEMP,
					 SelALUaddr_out=>SelALUaddrTemp);


DEreg:DecToExRegister 
		 Port Map (Clk=>Clk,
					  Rst=>Rst,
					  WrEnDecEx_in=>WrEnDecEx_out_TEMP,
					  WrEnExMem_in=>WrEnExMem_out_TEMP,
					  WrEnMemWrite_in=>WrEnMemWrite_out_TEMP,
					  PC_sel_in=>PC_sel_out_TEMP,
					  PC_LdEn_in=>PC_LdEn_out_TEMP,
					  ALU_Binsel_in=>ALU_Binsel_out_TEMP,
					  ALU_func_in=>ALU_func_out_TEMP,
					  RF_WrData_sel_in=>RF_WrData_sel_out_TEMP,
					  RF_WrEn_in=>RF_WrEn_out_TEMP,
					  RF_A_in=>RF_A_temp,
					  RF_B_in=>RF_B_temp,
					  Immed_in=>ImmedTemp,
					  Rd_in=>Instruction_out_TEMP(20 downto 16),
					  ByteOp_in=>ByteOp_out_TEMP,
					  Mem_WrEn_in=>Mem_WrEn_out_TEMP,
					  SelALUaddr_in=>SelALUaddrTemp,
					  Rs_in=>Instruction_out_TEMP(25 downto 21),
					  Rt_in=>Rt_dec_out,--Instruction_out_TEMP(15 downto 11),
			  
					  WrEnExMem_out=>WrEnExMem_out_TEMP1,
					  WrEnMemWrite_out=>WrEnMemWrite_out_TEMP1,
					  PC_sel_out=>PC_sel_out_TEMP1,
					  PC_LdEn_out=>PC_LdEn_out_TEMP1,
					  ALU_Binsel_out=>ALU_Binsel_out_TEMP1,
					  ALU_func_out=>ALU_func_out_TEMP1,
					  RF_WrData_sel_out=>RF_WrData_sel_out_TEMP1,
					  RF_WrEn_out=>RF_WrEn_out_TEMP1,
					  ByteOp_out=>ByteOp_out_TEMP1,
					  Mem_WrEn_out=>Mem_WrEn_out_TEMP1,
					  RF_A_out=>RF_A_temp1,
					  RF_B_out=>RF_B_temp1,
					  Immed_out=>ImmedTemp1,
					  Rd_out=>Instruction_out_TEMP1,
					  SelALUaddr_out=>SelALUaddrTemp1,
					  Rs_out=>Instruction_out_TEMPRs,
					  Rt_out=>Instruction_out_TEMPRt);


EMreg: ExMemRegister 
		Port Map (Clk=>Clk,
			       Rst=>Rst,
					 WrEnExMem_in=>WrEnExMem_out_TEMP1,
					 WrEnMemWrite_in=>WrEnMemWrite_out_TEMP1,
					 PC_sel_in=>PC_sel_out_TEMP1,
					 PC_LdEn_in=>PC_LdEn_out_TEMP1,
				    RF_WrData_sel_in=>RF_WrData_sel_out_TEMP1,
					 RF_WrEn_in=>RF_WrEn_out_TEMP1,
					 RF_B_in=>muxFw_B,          ---RF_B_temp1,
					 Rd_in=>Instruction_out_TEMP1,
					 ByteOp_in=>ByteOp_out_TEMP1,
					 Mem_WrEn_in=>Mem_WrEn_out_TEMP1,
					 ALU_out_in =>ALU_outTemp,
					 SelALUaddr_in=>SelALUaddrTemp1,
			  
					 WrEnMemWrite_out=>WrEnMemWrite_out_TEMP2,
					 PC_sel_out=>PC_sel_out_TEMP2,
					 PC_LdEn_out=>PC_LdEn_out_TEMP2,
					 RF_WrData_sel_out=>RF_WrData_sel_out_TEMP2,
					 RF_WrEn_out=>RF_WrEn_out_TEMP2,
					 RF_B_out=>RF_B_temp2,
					 Rd_out=>Instruction_out_TEMP2,
					 ByteOp_out=>ByteOp_out_TEMP2,
					 Mem_WrEn_out=>Mem_WrEn_out_TEMP2,
					 ALU_out_out=>ALU_outTemp1,
		          SelALUaddr_out=>	SelALUaddrTemp2 );
					 

MWreg: MemWriteRegister 
		Port Map (Clk=>Clk,
					 Rst=>Rst,
					 WrEnMemWrite_in=>WrEnMemWrite_out_TEMP2,
					 PC_sel_in=>PC_sel_out_TEMP2,
					 PC_LdEn_in=>PC_LdEn_out_TEMP2,
					 RF_WrData_sel_in=>RF_WrData_sel_out_TEMP2,
					 RF_WrEn_in=>RF_WrEn_out_TEMP2,
					 Rd_in=>Instruction_out_TEMP2,
					 Mem_WrEn_in=>Mem_WrEn_out_TEMP2,
					 ALU_out_in=>ALU_outTemp1,
					 MemData_out_in=>MemDataOutTemp,
					 RF_B_in=>RF_B_temp2,
					 SelALUaddr_in=>SelALUaddrTemp2(0),
					 ByteOp_in=>ByteOp_out_TEMP2,

			  
			  
					 PC_sel_out=>PC_sel_out_TEMP3,
					 PC_LdEn_out=>PC_LdEn_out_TEMP3,
					 RF_WrData_sel_out=>RF_WrData_sel_out_TEMP3,
					 RF_WrEn_out=>RF_WrEn_out_TEMP3,
					 Rd_out=>Instruction_out_TEMP3,
					 Mem_WrEn_out=>Mem_WrEn_out_TEMP3,
					 ALU_out_out=> ALU_outTemp2,
					 MemData_out_out=>MemDataOutTemp1,
					 RF_B_out=>RF_B_temp3,
					 SelALUaddr_out=>SelALUaddrTemp3,
					 ByteOp_out=>ByteOp_out_TEMP3);					 

					 

muxALUaddr:mu_2_to_1_ALUaddr 
		Port Map(In0=>ALU_outTemp2,
					In1=>ALU_outTemp1,
					In2=>ByteOp_out_TEMP3,
					In3=>ByteOp_out_TEMP2,
					Sel(0) =>SelALUaddrTemp3,
					Sel(1)=>SelALUaddrTemp2(1),
					DataOut1=>ALU_address,
					DataOut2=>ByteOP_true);


muxALUA:mux_3_to_1_forward 
		Port Map(In0 =>RF_A_temp1,
					In1 =>ALU_outTemp1,
					In2=>datain_tmp, ---ALU_outTemp2,
					Sel =>fw_a,
					DataOut =>muxFw_A);

muxALUB:mux_3_to_1_forward 
		Port Map(In0 => RF_B_temp1,
					In1 =>ALU_outTemp1,
					In2=>datain_tmp,--ALU_outTemp2,
					Sel =>fw_b,
					DataOut =>muxFw_B);
					
					
fw_unit:Forwarding_Unit 
		Port Map(RdExMem_in=>Instruction_out_TEMP2,
					RdMemWr_in=>Instruction_out_TEMP3,
					RsInsEx_in=>Instruction_out_TEMPRs,
					RtInsEx_in=>Instruction_out_TEMPRt,
					RFWrEn_ExMem=>RF_WrEn_out_TEMP2,
					RFWrEn_MemWr=>RF_WrEn_out_TEMP3,
					sel_fwA=>fw_a,
					sel_fwB=>fw_b);
					
					
stall:stall_unit 
		Port Map(RdDecEx_in=>Instruction_out_TEMP1,
					RsInstDec_in=>Instruction_out_TEMP(25 downto 21),
					RtInstDec_in=>Instruction_out_TEMP(15 downto 11),
					SelAluAddress=>SelALUaddrTemp1,
					stall_flag=>stallTemp);

StallFlag_DATAPATH<=stallTemp;

pcLdEnMux:mux_pcLdEn 
		Port Map(In0=> PC_LdEn_DATAPATH,
					In1=>'0',
					sel=>stallTemp,
					muxPCEnout=>truePCLdEn);

		  
end Behavioral;


