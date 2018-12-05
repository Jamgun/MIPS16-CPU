----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:07:43 12/03/2018 
-- Design Name: 
-- Module Name:    exe_wdmux - Behavioral 
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

entity exe_wdmux is
    Port ( exe_wd_i : in  STD_LOGIC_VECTOR (15 downto 0);
           exe_wd_o : out  STD_LOGIC_VECTOR (15 downto 0);
           wb_wdfor_i : in  STD_LOGIC_VECTOR (15 downto 0);
           exe_for1sel_i : in  STD_LOGIC_VECTOR (1 downto 0));
end exe_wdmux;

architecture Behavioral of exe_wdmux is

begin
	process(exe_wd_i ,wb_wdfor_i,exe_for1sel_i )
	begin
		case exe_for1sel_i is
				when "00" =>
					exe_wd_o<=exe_wd_i;
				when "11" =>
					exe_wd_o<=wb_wdfor_i;			
				when others =>
					exe_wd_o<=exe_wd_i;
		end case;
		
	end process;


end Behavioral;

