----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:35:13 11/27/2018 
-- Design Name: 
-- Module Name:    PC_adder1 - Behavioral 
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
use ieee.std_logic_unsigned.all;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pcadder4_component is
    Port ( PC : in  STD_LOGIC_VECTOR (15 downto 0);
           newPC : out  STD_LOGIC_VECTOR (15 downto 0);
			  rst : in  STD_LOGIC);
end pcadder4_component;

architecture Behavioral of pcadder4_component is


begin
	


	process(PC,rst)
	begin
		if (rst = '0') then
			newPC<="1111111111111111";
		else
		newPC <= PC +1;
		end if;
	end process;

end Behavioral;

