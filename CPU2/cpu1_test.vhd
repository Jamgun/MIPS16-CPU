--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:45:59 12/02/2018
-- Design Name:   
-- Module Name:   D:/iseFiles/CPU2/cpu1_test.vhd
-- Project Name:  CPU1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cpu1_component
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
 
ENTITY cpu1_test IS
END cpu1_test;
 
ARCHITECTURE behavior OF cpu1_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cpu1_component
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
			test_clk_2 : out std_logic;
         test_pc_pc : OUT  std_logic_vector(15 downto 0);
         test_inst_if : OUT  std_logic_vector(15 downto 0);
         test_id_inst : OUT  std_logic_vector(15 downto 0);
         test_if_pcnew : OUT  std_logic_vector(15 downto 0);
         test_if_pc4 : OUT  std_logic_vector(15 downto 0);
         test_id_AluSel1 : OUT  std_logic_vector(1 downto 0);
         test_id_AluSel2 : OUT  std_logic_vector(1 downto 0);
         test_id_AluCode : OUT  std_logic_vector(3 downto 0);
         test_id_WriteMem : OUT  std_logic_vector(1 downto 0);
         test_id_ReadMem : OUT  std_logic_vector(1 downto 0);
         test_id_BUnitSel : OUT  std_logic_vector(2 downto 0);
         test_id_WriteBackSel : OUT  std_logic_vector(1 downto 0);
         test_id_Reg1 : OUT  std_logic_vector(3 downto 0);
         test_id_Reg2 : OUT  std_logic_vector(3 downto 0);
         test_id_imm : OUT  std_logic_vector(15 downto 0);
         test_id_rs : OUT  std_logic_vector(3 downto 0);
         test_id_rt : OUT  std_logic_vector(3 downto 0);
         test_id_dr : OUT  std_logic_vector(3 downto 0);
         test_exe_rs : OUT  std_logic_vector(3 downto 0);
         test_exe_rt : OUT  std_logic_vector(3 downto 0);
         test_id_pcwrite : OUT  std_logic_vector(1 downto 0);
         test_id_ifidstall : OUT  std_logic_vector(1 downto 0);
         test_id_R1D : OUT  std_logic_vector(15 downto 0);
         test_id_R2D : OUT  std_logic_vector(15 downto 0);
         test_id_WD : OUT  std_logic_vector(15 downto 0);
         test_id_pc : OUT  std_logic_vector(15 downto 0);
         test_exe_AluOp1Sel : OUT  std_logic_vector(1 downto 0);
         test_exe_AluOp2Sel : OUT  std_logic_vector(1 downto 0);
         test_exe_AluSel : OUT  std_logic_vector(3 downto 0);
         test_exe_WriteMemSel : OUT  std_logic_vector(1 downto 0);
         test_exe_ReadMemSel : OUT  std_logic_vector(1 downto 0);
         test_exe_BUnitSel : OUT  std_logic_vector(2 downto 0);
         test_exe_WriteBackSel : OUT  std_logic_vector(1 downto 0);
         test_exe_pc : OUT  std_logic_vector(15 downto 0);
         test_exe_reg1data : OUT  std_logic_vector(15 downto 0);
         test_exe_reg2data : OUT  std_logic_vector(15 downto 0);
         test_exe_imm : OUT  std_logic_vector(15 downto 0);
         test_exe_DestReg : OUT  std_logic_vector(3 downto 0);
         test_exe_WriteData : OUT  std_logic_vector(15 downto 0);
         test_exe_inst : OUT  std_logic_vector(15 downto 0);
         test_exe_pcimm : OUT  std_logic_vector(15 downto 0);
         test_exe_op1 : OUT  std_logic_vector(15 downto 0);
         test_exe_op2 : OUT  std_logic_vector(15 downto 0);
         test_exe_for1 : OUT  std_logic_vector(1 downto 0);
         test_exe_for2 : OUT  std_logic_vector(1 downto 0);
         test_exe_flag : OUT  std_logic;
         test_exe_aluout : OUT  std_logic_vector(15 downto 0);
         test_mem_WriteMemSel : OUT  std_logic_vector(1 downto 0);
         test_mem_ReadMemSel : OUT  std_logic_vector(1 downto 0);
         test_mem_BUnitSel : OUT  std_logic_vector(2 downto 0);
         test_mem_WriteBackSel : OUT  std_logic_vector(1 downto 0);
         test_mem_pc : OUT  std_logic_vector(15 downto 0);
         test_mem_DestReg : OUT  std_logic_vector(3 downto 0);
         test_mem_WriteData : OUT  std_logic_vector(15 downto 0);
         test_mem_pcImm : OUT  std_logic_vector(15 downto 0);
         test_mem_AluFlag : OUT  std_logic;
         test_mem_AluOut : OUT  std_logic_vector(15 downto 0);
         test_mem_RD : OUT  std_logic_vector(15 downto 0);
         test_mem_wd : OUT  std_logic_vector(15 downto 0);
         test_mem_Bsel : OUT  std_logic_vector(1 downto 0);
         test_wb_DestReg : OUT  std_logic_vector(3 downto 0);
         test_wb_wd : OUT  std_logic_vector(15 downto 0);
         test_wb_wbdata : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
	
   
   
   
   
   
 	--Outputs
	signal test_clk_2 : std_logic;
   signal test_pc_pc : std_logic_vector(15 downto 0);
   signal test_inst_if : std_logic_vector(15 downto 0);   
   signal test_if_pcnew : std_logic_vector(15 downto 0);
   signal test_if_pc4 : std_logic_vector(15 downto 0);
	signal test_id_inst : std_logic_vector(15 downto 0);
	signal test_id_pcwrite : std_logic_vector(1 downto 0) := (others => '0');
   signal test_id_ifidstall : std_logic_vector(1 downto 0) := (others => '0');
   signal test_id_AluSel1 : std_logic_vector(1 downto 0);
   signal test_id_AluSel2 : std_logic_vector(1 downto 0);
   signal test_id_AluCode : std_logic_vector(3 downto 0);
   signal test_id_WriteMem : std_logic_vector(1 downto 0);
   signal test_id_ReadMem : std_logic_vector(1 downto 0);
   signal test_id_BUnitSel : std_logic_vector(2 downto 0);
   signal test_id_WriteBackSel : std_logic_vector(1 downto 0);
   signal test_id_Reg1 : std_logic_vector(3 downto 0);
   signal test_id_Reg2 : std_logic_vector(3 downto 0);
   signal test_id_imm : std_logic_vector(15 downto 0);
   signal test_id_rs : std_logic_vector(3 downto 0);
   signal test_id_rt : std_logic_vector(3 downto 0);
   signal test_id_dr : std_logic_vector(3 downto 0);
   signal test_id_R1D : std_logic_vector(15 downto 0);
   signal test_id_R2D : std_logic_vector(15 downto 0);
   signal test_id_WD : std_logic_vector(15 downto 0);
   signal test_id_pc : std_logic_vector(15 downto 0);
   signal test_exe_AluOp1Sel : std_logic_vector(1 downto 0);
   signal test_exe_AluOp2Sel : std_logic_vector(1 downto 0);
   signal test_exe_AluSel : std_logic_vector(3 downto 0);
   signal test_exe_WriteMemSel : std_logic_vector(1 downto 0);
   signal test_exe_ReadMemSel : std_logic_vector(1 downto 0);
   signal test_exe_BUnitSel : std_logic_vector(2 downto 0);
   signal test_exe_WriteBackSel : std_logic_vector(1 downto 0);
   signal test_exe_pc : std_logic_vector(15 downto 0);
   signal test_exe_reg1data : std_logic_vector(15 downto 0);
   signal test_exe_reg2data : std_logic_vector(15 downto 0);
   signal test_exe_imm : std_logic_vector(15 downto 0);
   signal test_exe_DestReg : std_logic_vector(3 downto 0);
   signal test_exe_WriteData : std_logic_vector(15 downto 0);
   signal test_exe_inst : std_logic_vector(15 downto 0);
   signal test_exe_pcimm : std_logic_vector(15 downto 0);
   signal test_exe_op1 : std_logic_vector(15 downto 0);
   signal test_exe_op2 : std_logic_vector(15 downto 0);
   signal test_exe_flag : std_logic;
   signal test_exe_aluout : std_logic_vector(15 downto 0);
	signal test_exe_rs : std_logic_vector(3 downto 0) := (others => '0');
   signal test_exe_rt : std_logic_vector(3 downto 0) := (others => '0');
	signal test_exe_for1 : std_logic_vector(1 downto 0) := (others => '0');
   signal test_exe_for2 : std_logic_vector(1 downto 0) := (others => '0');
   signal test_mem_WriteMemSel : std_logic_vector(1 downto 0);
   signal test_mem_ReadMemSel : std_logic_vector(1 downto 0);
   signal test_mem_BUnitSel : std_logic_vector(2 downto 0);
   signal test_mem_WriteBackSel : std_logic_vector(1 downto 0);
   signal test_mem_pc : std_logic_vector(15 downto 0);
   signal test_mem_DestReg : std_logic_vector(3 downto 0);
   signal test_mem_WriteData : std_logic_vector(15 downto 0);
   signal test_mem_pcImm : std_logic_vector(15 downto 0);
   signal test_mem_AluFlag : std_logic;
   signal test_mem_AluOut : std_logic_vector(15 downto 0);
   signal test_mem_RD : std_logic_vector(15 downto 0);
   signal test_mem_Bsel : std_logic_vector(1 downto 0);
	signal test_mem_wd : std_logic_vector(15 downto 0) := (others => '0');
   signal test_wb_DestReg : std_logic_vector(3 downto 0);
   signal test_wb_wbdata : std_logic_vector(15 downto 0);
	signal test_wb_wd : std_logic_vector(15 downto 0) := (others => '0');


   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cpu1_component PORT MAP (
          rst => rst,
          clk => clk,
			 test_clk_2 => test_clk_2,
          test_pc_pc => test_pc_pc,
          test_inst_if => test_inst_if,
          test_id_inst => test_id_inst,
          test_if_pcnew => test_if_pcnew,
          test_if_pc4 => test_if_pc4,
          test_id_AluSel1 => test_id_AluSel1,
          test_id_AluSel2 => test_id_AluSel2,
          test_id_AluCode => test_id_AluCode,
          test_id_WriteMem => test_id_WriteMem,
          test_id_ReadMem => test_id_ReadMem,
          test_id_BUnitSel => test_id_BUnitSel,
          test_id_WriteBackSel => test_id_WriteBackSel,
          test_id_Reg1 => test_id_Reg1,
          test_id_Reg2 => test_id_Reg2,
          test_id_imm => test_id_imm,
          test_id_rs => test_id_rs,
          test_id_rt => test_id_rt,
          test_id_dr => test_id_dr,
          test_exe_rs => test_exe_rs,
          test_exe_rt => test_exe_rt,
          test_id_pcwrite => test_id_pcwrite,
          test_id_ifidstall => test_id_ifidstall,
          test_id_R1D => test_id_R1D,
          test_id_R2D => test_id_R2D,
          test_id_WD => test_id_WD,
          test_id_pc => test_id_pc,
          test_exe_AluOp1Sel => test_exe_AluOp1Sel,
          test_exe_AluOp2Sel => test_exe_AluOp2Sel,
          test_exe_AluSel => test_exe_AluSel,
          test_exe_WriteMemSel => test_exe_WriteMemSel,
          test_exe_ReadMemSel => test_exe_ReadMemSel,
          test_exe_BUnitSel => test_exe_BUnitSel,
          test_exe_WriteBackSel => test_exe_WriteBackSel,
          test_exe_pc => test_exe_pc,
          test_exe_reg1data => test_exe_reg1data,
          test_exe_reg2data => test_exe_reg2data,
          test_exe_imm => test_exe_imm,
          test_exe_DestReg => test_exe_DestReg,
          test_exe_WriteData => test_exe_WriteData,
          test_exe_inst => test_exe_inst,
          test_exe_pcimm => test_exe_pcimm,
          test_exe_op1 => test_exe_op1,
          test_exe_op2 => test_exe_op2,
          test_exe_for1 => test_exe_for1,
          test_exe_for2 => test_exe_for2,
          test_exe_flag => test_exe_flag,
          test_exe_aluout => test_exe_aluout,
          test_mem_WriteMemSel => test_mem_WriteMemSel,
          test_mem_ReadMemSel => test_mem_ReadMemSel,
          test_mem_BUnitSel => test_mem_BUnitSel,
          test_mem_WriteBackSel => test_mem_WriteBackSel,
          test_mem_pc => test_mem_pc,
          test_mem_DestReg => test_mem_DestReg,
          test_mem_WriteData => test_mem_WriteData,
          test_mem_pcImm => test_mem_pcImm,
          test_mem_AluFlag => test_mem_AluFlag,
          test_mem_AluOut => test_mem_AluOut,
          test_mem_RD => test_mem_RD,
          test_mem_wd => test_mem_wd,
          test_mem_Bsel => test_mem_Bsel,
          test_wb_DestReg => test_wb_DestReg,
          test_wb_wd => test_wb_wd,
          test_wb_wbdata => test_wb_wbdata
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 6 ns;	
		rst <= '1';

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
