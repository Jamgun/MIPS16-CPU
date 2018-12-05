----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:43:29 11/23/2018 
-- Design Name: 
-- Module Name:    WriteBack_mux - Behavioral 
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

entity writeback_mux is
    Port ( AluOut_WB_i : in  STD_LOGIC_VECTOR (15 downto 0);--alu����
           WriteBackData_WB_i : in  STD_LOGIC_VECTOR (15 downto 0);--WBD����
           PC_WB_i : in  STD_LOGIC_VECTOR (15 downto 0);--PC����
           WriteBackSel_WB_i : in  STD_LOGIC_VECTOR (1 downto 0);--�����ź�
           WriteBackData_WB_o : out  STD_LOGIC_VECTOR (15 downto 0));--�������
end writeback_mux;

architecture Behavioral of writeback_mux is

begin

	process(AluOut_WB_i,WriteBackData_WB_i,PC_WB_i,WriteBackSel_WB_i)
	begin
		case WriteBackSel_WB_i is
				when "00" =>
					WriteBackData_WB_o <= "0000000000000000";
				when "01" =>
					WriteBackData_WB_o <= AluOut_WB_i;
				when "10" =>
					WriteBackData_WB_o <= WriteBackData_WB_i;
				when "11" =>
					WriteBackData_WB_o <= PC_WB_i+1;
				when others =>
					WriteBackData_WB_o <= "0000000000000000";
		end case;
	end process;

end Behavioral;

