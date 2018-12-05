----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:18:38 11/27/2018 
-- Design Name: 
-- Module Name:    PC_adder2 - Behavioral 
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

entity pcadderimm_component is
    Port ( PC : in  STD_LOGIC_VECTOR (15 downto 0);
           imm : in  STD_LOGIC_VECTOR (15 downto 0);
           newPC : out  STD_LOGIC_VECTOR (15 downto 0));
end pcadderimm_component;

architecture Behavioral of pcadderimm_component is


begin

process(PC,imm)
	begin
		newPC <= PC+imm;
	end process;

end Behavioral;

