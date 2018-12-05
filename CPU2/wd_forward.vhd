----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:17:15 12/03/2018 
-- Design Name: 
-- Module Name:    wd_forward - Behavioral 
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

entity wd_forward is
    Port ( exe_sreg_i : in  STD_LOGIC_VECTOR (3 downto 0);
           mem_sreg_i : in  STD_LOGIC_VECTOR (3 downto 0);
           wb_dr_i : in  STD_LOGIC_VECTOR (3 downto 0);
           exe_forsel_o : out  STD_LOGIC_VECTOR (1 downto 0);
           mem_forsel_o : out  STD_LOGIC_VECTOR (1 downto 0));
end wd_forward;

architecture Behavioral of wd_forward is

begin
	process(exe_sreg_i,mem_sreg_i,wb_dr_i)
	begin					
			if(exe_sreg_i = wb_dr_i and wb_dr_i /="1111") then
				exe_forsel_o  <= "11";
			else
				exe_forsel_o  <= "00";
			end if;
			
			if( mem_sreg_i = wb_dr_i and wb_dr_i /="1111") then
				mem_forsel_o<= "11";
			else
				mem_forsel_o <= "00";
			end if;
	end process;

end Behavioral;

