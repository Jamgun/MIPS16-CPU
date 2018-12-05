----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:54:03 11/24/2018 
-- Design Name: 
-- Module Name:    Op2_mux - Behavioral 
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

entity op2_mux is
    Port ( RegData2_EXE_i : in  STD_LOGIC_VECTOR (15 downto 0);--寄存器数据          
           WriteBackData_EXE_forward_i : in  STD_LOGIC_VECTOR (15 downto 0);--forward数据
			  WriteBackData_EXE_forward_i2 : in  STD_LOGIC_VECTOR (15 downto 0);--forward数据
           Imm_EXE_i : in  STD_LOGIC_VECTOR (15 downto 0);--立即数
           AluSel2_EXE_i : in  STD_LOGIC_VECTOR (1 downto 0);--id阶段信号
           ForwardSel2_EXE_i : in  STD_LOGIC_VECTOR (1 downto 0);--forward信号
           AluOp2_EXE_o : out  STD_LOGIC_VECTOR (15 downto 0));--输出
end op2_mux;

architecture Behavioral of op2_mux is

begin
	process(RegData2_EXE_i,WriteBackData_EXE_forward_i,Imm_EXE_i,AluSel2_EXE_i,ForwardSel2_EXE_i,WriteBackData_EXE_forward_i2 )
	begin
		case ForwardSel2_EXE_i is
				when "00" =>
					case AluSel2_EXE_i is
							when "00" =>
								AluOp2_EXE_o <= RegData2_EXE_i;
							when "11" =>
								AluOp2_EXE_o <= Imm_EXE_i;
							when "01" =>
								AluOp2_EXE_o <= "0000000000000000";		
							when "10" =>
								AluOp2_EXE_o <= "0000000000001000";									
							when others =>
								AluOp2_EXE_o <= "0000000000000000";
					end case;
				when "11" =>
					AluOp2_EXE_o <= WriteBackData_EXE_forward_i;		
				when "01" =>
					AluOp2_EXE_o <= WriteBackData_EXE_forward_i2;						
				when others =>
					AluOp2_EXE_o <= "0000000000000000";
		end case;
	
		
	end process;
	
end Behavioral;

