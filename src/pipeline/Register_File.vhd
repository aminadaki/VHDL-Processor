----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:42:07 03/15/2020 
-- Design Name: 
-- Module Name:    Register_File - Behavioral 
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

entity Register_File is
    Port ( Ard1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Ard2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Awr : in  STD_LOGIC_VECTOR (4 downto 0);
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           WrEn : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
			  Dout1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Dout2 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reset : in STD_LOGIC			  );
end Register_File;

architecture Behavioral of Register_File is

signal decOut1 : std_logic_vector(31 downto 0);
signal trueWriteEnable: std_logic_vector(31 downto 0);
signal dout0,dout01,dout02,dout3,dout4,dout5,dout6,dout7,dout8,dout9,dout10,dout11,dout12,dout13,dout14,dout15,dout16,dout17,dout18,dout19,dout20,dout21,dout22,dout23,dout24,dout25,dout26,dout27,dout28,dout29,dout30,dout31: std_logic_vector(31 downto 0);


component Register_32bit
Port ( 	  CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           DataIn : in  STD_LOGIC_VECTOR (31 downto 0);
           WrEn : in  STD_LOGIC;
           DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Decoder_5_to_32
Port( 	DecIn : in std_logic_vector (4 downto 0);
			DecOut: out std_logic_vector(31 downto 0));
end component;

component MUX_32_to_1
Port ( 	  
			  In_0 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_1 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_3 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_4 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_5 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_6 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_7 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_8 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_9 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_10 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_11 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_12 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_13 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_14 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_15 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_16 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_17 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_18 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_19 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_20 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_21 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_22 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_23 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_24 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_25 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_26 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_27 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_28 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_29 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_30 : in  STD_LOGIC_VECTOR (31 downto 0);
			  In_31 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Ard : in STD_LOGIC_VECTOR (4 downto 0);
           DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

begin
trueWriteEnable(0)<='1';
trueWriteEnable(1)<=WrEn and DecOut1(1) after 2 ns;
trueWriteEnable(2)<=WrEn and DecOut1(2) after 2 ns;
trueWriteEnable(3)<= WrEn and DecOut1(3) after 2 ns;
trueWriteEnable(4)<= WrEn and DecOut1(4) after 2 ns;
trueWriteEnable(5)<= WrEn and DecOut1(5) after 2 ns;
trueWriteEnable(6)<= WrEn and DecOut1(6) after 2 ns;
trueWriteEnable(7)<= WrEn and DecOut1(7) after 2 ns;
trueWriteEnable(8)<= WrEn and DecOut1(8) after 2 ns;
trueWriteEnable(9)<= WrEn and DecOut1(9) after 2 ns;
trueWriteEnable(10)<= WrEn and DecOut1(10) after 2 ns;
trueWriteEnable(11)<= WrEn and DecOut1(11) after 2 ns;
trueWriteEnable(12)<= WrEn and DecOut1(12) after 2 ns;
trueWriteEnable(13)<= WrEn and DecOut1(13) after 2 ns;
trueWriteEnable(14)<= WrEn and DecOut1(14) after 2 ns;
trueWriteEnable(15)<= WrEn and DecOut1(15) after 2 ns;
trueWriteEnable(16)<= WrEn and DecOut1(16) after 2 ns;
trueWriteEnable(17)<= WrEn and DecOut1(17) after 2 ns;
trueWriteEnable(18)<= WrEn and DecOut1(18) after 2 ns;
trueWriteEnable(19)<= WrEn and DecOut1(19) after 2 ns;
trueWriteEnable(20)<= WrEn and DecOut1(20) after 2 ns;
trueWriteEnable(21)<= WrEn and DecOut1(21) after 2 ns;
trueWriteEnable(22)<= WrEn and DecOut1(22) after 2 ns;
trueWriteEnable(23)<= WrEn and DecOut1(23) after 2 ns;
trueWriteEnable(24)<= WrEn and DecOut1(24) after 2 ns;
trueWriteEnable(25)<= WrEn and DecOut1(25) after 2 ns;
trueWriteEnable(26)<= WrEn and DecOut1(26) after 2 ns;
trueWriteEnable(27)<= WrEn and DecOut1(27) after 2 ns;
trueWriteEnable(28)<= WrEn and DecOut1(28) after 2 ns;
trueWriteEnable(29)<= WrEn and DecOut1(29) after 2 ns;
trueWriteEnable(30)<= WrEn and DecOut1(30) after 2 ns;
trueWriteEnable(31)<= WrEn and DecOut1(31) after 2 ns;


dec: Decoder_5_to_32 
			Port Map( DecIn =>Awr,
						 DecOut=>DecOut1);


regist0: Register_32bit
			Port Map( CLK =>Clk,
						 DataIn =>"00000000000000000000000000000000",
						 WrEn =>trueWriteEnable(0),
						 DataOut=>dout0,
						 RST=>Reset);
regist1: Register_32bit
			Port Map( CLK =>Clk,
						 DataIn =>Din,
						 WrEn =>trueWriteEnable(1),
						 DataOut=>dout01,
						 RST=>Reset);

regist2: Register_32bit
			Port Map( CLK =>Clk,
						 DataIn =>Din,
						 WrEn =>trueWriteEnable(2),
						 DataOut=>dout02,
						 RST=>Reset);
regist3:Register_32bit
			Port Map( CLK =>Clk,
						 DataIn =>Din,
						 WrEn =>trueWriteEnable(3),
						 DataOut=>dout3,
						 RST=>Reset);
regist4: Register_32bit
			Port Map( CLK =>Clk,
						 DataIn =>Din,
						 WrEn =>trueWriteEnable(4),
						 DataOut=>dout4,
						 RST=>Reset);
regist5: Register_32bit
			Port Map( CLK =>Clk,
						 DataIn =>Din,
						 WrEn =>trueWriteEnable(5),
						 DataOut=>dout5,
						 RST=>Reset);
regist6: Register_32bit
			Port Map( CLK =>Clk,
						 DataIn =>Din,
						 WrEn =>trueWriteEnable(6),
						 DataOut=>dout6,
						 RST=>Reset);
regist7: Register_32bit
			Port Map( CLK =>Clk,
						 DataIn =>Din,
						 WrEn =>trueWriteEnable(7),
						 DataOut=>dout7,
						 RST=>Reset);
regist8: Register_32bit
			Port Map( CLK =>Clk,
						 DataIn =>Din,
						 WrEn =>trueWriteEnable(8),
						 DataOut=>dout8,
						 RST=>Reset);
regist9: Register_32bit
			Port Map( CLK =>Clk,
						 DataIn =>Din,
						 WrEn =>trueWriteEnable(9),
						 DataOut=>dout9,
						 RST=>Reset);
regist10: Register_32bit
			Port Map( CLK =>Clk,
						 DataIn =>Din,
						 WrEn =>trueWriteEnable(10),
						 DataOut=>dout10,
						 RST=>Reset);
regist11: Register_32bit
			Port Map( CLK =>Clk,
						 DataIn =>Din,
						 WrEn =>trueWriteEnable(11),
						 DataOut=>dout11,
						 RST=>Reset);
regist12: Register_32bit
			Port Map( CLK =>Clk,
						 DataIn =>Din,
						 WrEn =>trueWriteEnable(12),
						 DataOut=>dout12,
						 RST=>Reset);
regist13: Register_32bit
			Port Map( CLK =>Clk,
						 DataIn =>Din,
						 WrEn =>trueWriteEnable(13),
						 DataOut=>dout13,
						 RST=>Reset);
regist14: Register_32bit
			Port Map( CLK =>Clk,
						 DataIn =>Din,
						 WrEn =>trueWriteEnable(14),
						 DataOut=>dout14,
						 RST=>Reset);
regist15: Register_32bit
			Port Map( CLK =>Clk,
						 DataIn =>Din,
						 WrEn =>trueWriteEnable(15),
						 DataOut=>dout15,
						 RST=>Reset);
regist16: Register_32bit
			Port Map( CLK =>Clk,
						 DataIn =>Din,
						 WrEn =>trueWriteEnable(16),
						 DataOut=>dout16,
						 RST=>Reset);
regist17: Register_32bit
			Port Map( CLK =>Clk,
						 DataIn =>Din,
						 WrEn =>trueWriteEnable(17),
						 DataOut=>dout17,
						 RST=>Reset);
regist18: Register_32bit
			Port Map( CLK =>Clk,
						 DataIn =>Din,
						 WrEn =>trueWriteEnable(18),
						 DataOut=>dout18,
						 RST=>Reset);
regist19: Register_32bit
			Port Map( CLK =>Clk,
						 DataIn =>Din,
						 WrEn =>trueWriteEnable(19),
						 DataOut=>dout19,
						 RST=>Reset);
regist20: Register_32bit
			Port Map( CLK =>Clk,
						 DataIn =>Din,
						 WrEn =>trueWriteEnable(20),
						 DataOut=>dout20,
						 RST=>Reset);
regist21: Register_32bit
			Port Map( CLK =>Clk,
						 DataIn =>Din,
						 WrEn =>trueWriteEnable(21),
						 DataOut=>dout21,
						 RST=>Reset);
regist22: Register_32bit
			Port Map( CLK =>Clk,
						 DataIn =>Din,
						 WrEn =>trueWriteEnable(22),
						 DataOut=>dout22,
						 RST=>Reset);
regist23: Register_32bit
			Port Map( CLK =>Clk,
						 DataIn =>Din,
						 WrEn =>trueWriteEnable(23),
						 DataOut=>dout23,
						 RST=>Reset);
regist24: Register_32bit
			Port Map( CLK =>Clk,
						 DataIn =>Din,
						 WrEn =>trueWriteEnable(24),
						 DataOut=>dout24,
						 RST=>Reset);
regist25: Register_32bit
			Port Map( CLK =>Clk,
						 DataIn =>Din,
						 WrEn =>trueWriteEnable(25),
						 DataOut=>dout25,
						 RST=>Reset);
regist26: Register_32bit
			Port Map( CLK =>Clk,
						 DataIn =>Din,
						 WrEn =>trueWriteEnable(26),
						 DataOut=>dout26,
						 RST=>Reset);
regist27: Register_32bit
			Port Map( CLK =>Clk,
						 DataIn =>Din,
						 WrEn =>trueWriteEnable(27),
						 DataOut=>dout27,
						 RST=>Reset);
regist28: Register_32bit
			Port Map( CLK =>Clk,
						 DataIn =>Din,
						 WrEn =>trueWriteEnable(28),
						 DataOut=>dout28,
						 RST=>Reset);
regist29: Register_32bit
			Port Map( CLK =>Clk,
						 DataIn =>Din,
						 WrEn =>trueWriteEnable(29),
						 DataOut=>dout29,
						 RST=>Reset);
regist30: Register_32bit
			Port Map( CLK =>Clk,
						 DataIn =>Din,
						 WrEn =>trueWriteEnable(30),
						 DataOut=>dout30,
						 RST=>Reset);
regist31: Register_32bit
			Port Map( CLK =>Clk,
						 DataIn =>Din,
						 WrEn =>trueWriteEnable(31),
						 DataOut=>dout31,
						 RST=>Reset);
						 


mux1: MUX_32_to_1
			Port Map(  
			           Ard =>Ard1,
						  DataOut=>Dout1,
						  In_0 =>dout0,
						  In_1 =>dout01,
						  In_2 =>dout02,
						  In_3 =>dout3,
						  In_4 =>dout4,
						  In_5 =>dout5,
						  In_6 =>dout6,
						  In_7 =>dout7,
						  In_8 =>dout8,
						  In_9 =>dout9,
						  In_10 =>dout10,
						  In_11 =>dout11,
						  In_12 =>dout12,
						  In_13 =>dout13,
						  In_14 =>dout14,
						  In_15 =>dout15,
						  In_16 =>dout16,
						  In_17 =>dout17,
						  In_18 =>dout18,
						  In_19 =>dout19,
						  In_20 =>dout20,
						  In_21 =>dout21,
						  In_22 =>dout22,
						  In_23 =>dout23,
						  In_24 =>dout24,
						  In_25 =>dout25,
						  In_26 =>dout26,
						  In_27 =>dout27,
						  In_28 =>dout28,
						  In_29 =>dout29,
						  In_30 =>dout30,
						  In_31 =>dout31);

mux2: MUX_32_to_1
			Port Map(  
						  Ard=>Ard2,
						  DataOut=>Dout2,
						  In_0 =>dout0,
						  In_1 =>dout01,
						  In_2 =>dout02,
						  In_3 =>dout3,
						  In_4 =>dout4,
						  In_5 =>dout5,
						  In_6 =>dout6,
						  In_7 =>dout7,
						  In_8 =>dout8,
						  In_9 =>dout9,
						  In_10 =>dout10,
						  In_11 =>dout11,
						  In_12 =>dout12,
						  In_13 =>dout13,
						  In_14 =>dout14,
						  In_15 =>dout15,
						  In_16 =>dout16,
						  In_17 =>dout17,
						  In_18 =>dout18,
						  In_19 =>dout19,
						  In_20 =>dout20,
						  In_21 =>dout21,
						  In_22 =>dout22,
						  In_23 =>dout23,
						  In_24 =>dout24,
						  In_25 =>dout25,
						  In_26 =>dout26,
						  In_27 =>dout27,
						  In_28 =>dout28,
						  In_29 =>dout29,
						  In_30 =>dout30,
						  In_31 =>dout31);
						 
						 
end Behavioral;

