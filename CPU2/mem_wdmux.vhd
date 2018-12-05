----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:09:04 12/03/2018 
-- Design Name: 
-- Module Name:    mem_wdmux - Behavioral 
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

entity mem_wdmux is
    Port (mem_wd_i : in  STD_LOGIC_VECTOR (15 downto 0);
           mem_wd_o : out  STD_LOGIC_VECTOR (15 downto 0);
           wb_wdfor_i : in  STD_LOGIC_VECTOR (15 downto 0);
           mem_for2sel_i : in  STD_LOGIC_VECTOR (1 downto 0));
end mem_wdmux;

architecture Behavioral of mem_wdmux is

begin

	process(mem_wd_i ,wb_wdfor_i ,mem_for2sel_i )
	begin
		case mem_for2sel_i is
				when "00" =>
					mem_wd_o<=mem_wd_i;
				when "11" =>
					mem_wd_o<= wb_wdfor_i ;			
				when others =>
					mem_wd_o<=mem_wd_i;
		end case;
		
	end process;


end Behavioral;

