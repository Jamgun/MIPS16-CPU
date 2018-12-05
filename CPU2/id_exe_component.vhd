----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:40:12 11/29/2018 
-- Design Name: 
-- Module Name:    id_exe_component - Behavioral 
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

entity id_exe_component is
    Port ( id_AluOp1Sel_i : in  STD_LOGIC_VECTOR (1 downto 0);
           id_AluOp2Sel_i : in  STD_LOGIC_VECTOR (1 downto 0);
           id_AluSel_i : in  STD_LOGIC_VECTOR (3 downto 0);
           id_WriteMemSel_i : in  STD_LOGIC_VECTOR (1 downto 0);
           id_ReadMemSel_i : in  STD_LOGIC_VECTOR (1 downto 0);
           id_BUnitSel_i : in  STD_LOGIC_VECTOR (2 downto 0);
           id_WriteBackSel_i : in  STD_LOGIC_VECTOR (1 downto 0);
           id_pc_i : in  STD_LOGIC_VECTOR (15 downto 0);
			  id_rs_i : in  STD_LOGIC_VECTOR (3 downto 0);
           id_rt_i : in  STD_LOGIC_VECTOR (3 downto 0);
           id_reg1data_i : in  STD_LOGIC_VECTOR (15 downto 0);
           id_reg2data_i : in  STD_LOGIC_VECTOR (15 downto 0);
           id_imm_i : in  STD_LOGIC_VECTOR (15 downto 0);
           id_DestReg_i : in  STD_LOGIC_VECTOR (3 downto 0);
           id_WriteData_i : in  STD_LOGIC_VECTOR (15 downto 0);
			  id_sreg_i : in  STD_LOGIC_VECTOR (3 downto 0);
			  exe_sreg_o : out  STD_LOGIC_VECTOR (3 downto 0);
           exe_AluOp1Sel_o : out  STD_LOGIC_VECTOR (1 downto 0);
           exe_AluOp2Sel_o : out  STD_LOGIC_VECTOR (1 downto 0);
           exe_AluSel_o : out  STD_LOGIC_VECTOR (3 downto 0);
           exe_WriteMemSel_o : out  STD_LOGIC_VECTOR (1 downto 0);
           exe_ReadMemSel_o: out  STD_LOGIC_VECTOR (1 downto 0);
           exe_BUnitSel_o : out  STD_LOGIC_VECTOR (2 downto 0);
           exe_WriteBackSel_o : out  STD_LOGIC_VECTOR (1 downto 0);
           exe_pc_o : out  STD_LOGIC_VECTOR (15 downto 0);
			  exe_rs_i : out  STD_LOGIC_VECTOR (3 downto 0);
           exe_rt_i : out  STD_LOGIC_VECTOR (3 downto 0);
           exe_reg1data_o : out  STD_LOGIC_VECTOR (15 downto 0);
           exe_reg2data_o : out  STD_LOGIC_VECTOR (15 downto 0);
           exe_imm_o : out  STD_LOGIC_VECTOR (15 downto 0);
           exe_DestReg_o : out  STD_LOGIC_VECTOR (3 downto 0);
           exe_WriteData_o : out  STD_LOGIC_VECTOR (15 downto 0);
           id_inst_i : in  STD_LOGIC_VECTOR (15 downto 0);
           exe_inst_o : out  STD_LOGIC_VECTOR (15 downto 0);
			  clk : in  STD_LOGIC;
			  rst : in  STD_LOGIC);
			 
end id_exe_component;

architecture Behavioral of id_exe_component is

begin

	process(clk,rst)
	begin
		if (rst = '0') then
				exe_AluOp1Sel_o <= "01";
				exe_AluOp2Sel_o <= "01";
				exe_AluSel_o <= "0000";
				exe_WriteMemSel_o <= "00";
				exe_ReadMemSel_o <= "00";
				exe_BUnitSel_o <= "000";
				exe_WriteBackSel_o <= "00";
				exe_pc_o  <= "0000000000000000";
				exe_reg1data_o <= "0000000000000000";
				exe_reg2data_o  <= "0000000000000000";
				exe_imm_o <= "0000000000000000";
				exe_DestReg_o <= "1111";
				exe_WriteData_o <= "0000000000000000";
				exe_inst_o <= "0000000000000000";
			   exe_rs_i <="1111";
            exe_rt_i <="1111";	
				exe_sreg_o <="1111";			
		elsif(clk'event and clk = '1') then
				exe_AluOp1Sel_o <= id_AluOp1Sel_i;
				exe_AluOp2Sel_o <= id_AluOp2Sel_i;	
				exe_AluSel_o <= id_AluSel_i;
				exe_WriteMemSel_o <= id_WriteMemSel_i;
				exe_ReadMemSel_o <= id_ReadMemSel_i;
				exe_BUnitSel_o <= id_BUnitSel_i;
				exe_WriteBackSel_o <= id_WriteBackSel_i;
				exe_pc_o  <= id_pc_i;
				exe_reg1data_o <= id_reg1data_i;
				exe_reg2data_o  <= id_reg2data_i;
				exe_imm_o <= id_imm_i;
				exe_DestReg_o <= id_DestReg_i;
				exe_WriteData_o <= id_WriteData_i;	
				exe_inst_o <= id_inst_i;
			   exe_rs_i <=id_rs_i ;
            exe_rt_i <=id_rt_i ;	
				exe_sreg_o <=id_sreg_i ;				
		end if;
	end process;


end Behavioral;

