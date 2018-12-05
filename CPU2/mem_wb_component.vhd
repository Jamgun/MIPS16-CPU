----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:37:00 11/29/2018 
-- Design Name: 
-- Module Name:    mem_wb_component - Behavioral 
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

entity mem_wb_component is
    Port ( mem_wd_i : in  STD_LOGIC_VECTOR (15 downto 0);
           mem_DestReg_i : in  STD_LOGIC_VECTOR (3 downto 0);
           wb_wd_o : out  STD_LOGIC_VECTOR (15 downto 0);
           wb_DestReg_o : out  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
			  rst : in  STD_LOGIC);
end mem_wb_component;

architecture Behavioral of mem_wb_component is

begin

	process(clk,rst)
	begin
		if (rst = '0') then
				wb_DestReg_o  <= "1111"	;			
				wb_wd_o   <=  "0000000000000000"	;
		elsif(clk'event and clk = '1') then	
				wb_DestReg_o  <= mem_DestReg_i;				
				wb_wd_o   <= mem_wd_i;					
		end if;
	end process;

end Behavioral;

