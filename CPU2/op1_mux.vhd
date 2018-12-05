----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:43:18 11/24/2018 
-- Design Name: 
-- Module Name:    Op1_mux - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity op1_mux is
    Port ( RegData1_EXE_i : in  STD_LOGIC_VECTOR (15 downto 0); --�Ĵ���ֵ        
           WriteBackData_EXE_forward_i : in  STD_LOGIC_VECTOR (15 downto 0);--д�ؼĴ���������
			  WriteBackData_EXE_forward_i2 : in  STD_LOGIC_VECTOR (15 downto 0);--д�ؼĴ���������
           AluSel1_EXE_i : in  STD_LOGIC_VECTOR (1 downto 0); --id�׶ε�sel
           ForwardSel1_EXE_i : in  STD_LOGIC_VECTOR (1 downto 0);--forward�ź�
           AluOp1_EXE_o : out  STD_LOGIC_VECTOR (15 downto 0));--���
end op1_mux;

architecture Behavioral of op1_mux is
	
begin
	
	process(RegData1_EXE_i,WriteBackData_EXE_forward_i,AluSel1_EXE_i,ForwardSel1_EXE_i,WriteBackData_EXE_forward_i2 )
	begin
		case ForwardSel1_EXE_i is
				when "00" =>
					case AluSel1_EXE_i is
							when "00" =>
								AluOp1_EXE_o <= RegData1_EXE_i;
							when "01" =>
								AluOp1_EXE_o <= "0000000000000000";				
							when others =>
								AluOp1_EXE_o <= "0000000000000000";
					end case;
				when "11" =>
					AluOp1_EXE_o <= WriteBackData_EXE_forward_i;	
				when "01" =>
					AluOp1_EXE_o <= WriteBackData_EXE_forward_i2;	
				when others =>
					AluOp1_EXE_o <= "0000000000000000";
		end case;	
		
	end process;

end Behavioral;

