----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:44:08 11/29/2018 
-- Design Name: 
-- Module Name:    Branch_unit - Behavioral 
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

entity branch_component is
    Port ( BranchUnitSel_MEM_i : in  STD_LOGIC_VECTOR (2 downto 0);
           AluZeroFlag_MEM_i : in  STD_LOGIC;
           BSel_MEM_o : out  STD_LOGIC_VECTOR (1 downto 0));
end branch_component;

architecture Behavioral of branch_component is

begin

	process(BranchUnitSel_MEM_i,AluZeroFlag_MEM_i)
	begin
		case BranchUnitSel_MEM_i is
				when "000" =>   --正常
					BSel_MEM_o <= "00";
				when "001" =>   --立即数
					BSel_MEM_o <= "01";		
				when "011" =>   --等于0立即数
					case AluZeroFlag_MEM_i is
						when '0' =>   --等于零
							BSel_MEM_o <= "01";
						when others =>   --不等于零
							BSel_MEM_o <= "11";
					end case;
				when "010" =>   --不等于0立即数
					case AluZeroFlag_MEM_i is
						when '0' =>   --等于零
							BSel_MEM_o <= "11";
						when others =>   --不等于零
							BSel_MEM_o <= "01";
					end case;
				when "111" =>   --nop
					BSel_MEM_o <= "00";	
				when "110" =>   --alu
					BSel_MEM_o <= "10";
				when others =>
					BSel_MEM_o <= "00";
		end case;
	end process;
end Behavioral;

