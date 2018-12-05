----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:19:43 11/24/2018 
-- Design Name: 
-- Module Name:    NewPC_mux - Behavioral 
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

entity newpc_mux is
    Port ( PC4_IF_i : in  STD_LOGIC_VECTOR (15 downto 0);
           Imm_IF_i : in  STD_LOGIC_VECTOR (15 downto 0);
           AluOut_IF_i : in  STD_LOGIC_VECTOR (15 downto 0);
           PCmuxSel_IF_i : in  STD_LOGIC_VECTOR (1 downto 0);
           NewPC_IF_o : out  STD_LOGIC_VECTOR (15 downto 0));
end newpc_mux;

architecture Behavioral of newpc_mux is

begin

	process(PC4_IF_i,Imm_IF_i,AluOut_IF_i,PCmuxSel_IF_i)
	begin
		case PCmuxSel_IF_i is
				when "00" =>
					NewPC_IF_o <= PC4_IF_i;
				when "01" =>
					NewPC_IF_o <= Imm_IF_i+1;	
				when "10" =>
					NewPC_IF_o <= AluOut_IF_i;	
				when "11" =>
					NewPC_IF_o <= PC4_IF_i -1;	
				when others =>
					NewPC_IF_o <= PC4_IF_i;
		end case;
	end process;

end Behavioral;

