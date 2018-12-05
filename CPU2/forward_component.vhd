----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:10:44 12/02/2018 
-- Design Name: 
-- Module Name:    forward_component - Behavioral 
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

entity forward_component is
    Port ( exe_rs_i : in  STD_LOGIC_VECTOR (3 downto 0);
           exe_rt_i : in  STD_LOGIC_VECTOR (3 downto 0);
           wb_dr_i : in  STD_LOGIC_VECTOR (3 downto 0);
			  mem_dr_i : in  STD_LOGIC_VECTOR (3 downto 0);
           mem_wbsel_i : in  STD_LOGIC_VECTOR (1 downto 0);
           exe_op1sel_o : out  STD_LOGIC_VECTOR (1 downto 0);
           exe_op2sel_o : out  STD_LOGIC_VECTOR (1 downto 0));
end forward_component;

architecture Behavioral of forward_component is

begin
	
	process(exe_rs_i,exe_rt_i,wb_dr_i ,mem_dr_i,mem_wbsel_i)
	begin					
			if(exe_rs_i = mem_dr_i and exe_rs_i /="1111") then
				exe_op1sel_o <= "11";
			elsif(exe_rs_i = wb_dr_i and exe_rs_i /="1111") then
				exe_op1sel_o <= "01";
			else
				exe_op1sel_o <= "00";
			end if;
			
			if(exe_rt_i = mem_dr_i and exe_rt_i /="1111") then
				exe_op2sel_o <= "11";
			elsif(exe_rt_i = wb_dr_i and exe_rt_i /="1111") then
				exe_op2sel_o <= "01";
			else
				exe_op2sel_o <= "00";
			end if;
	end process;

end Behavioral;

