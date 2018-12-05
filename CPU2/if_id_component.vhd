----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:06:27 11/29/2018 
-- Design Name: 
-- Module Name:    if_id_component - Behavioral 
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

entity if_id_component is
    Port ( if_pc_i : in  STD_LOGIC_VECTOR (15 downto 0);
           if_inst_i : in  STD_LOGIC_VECTOR (15 downto 0);
           id_pc_o : out  STD_LOGIC_VECTOR (15 downto 0);
           id_inst_o : out  STD_LOGIC_VECTOR (15 downto 0);
			  stall_i: in  STD_LOGIC_VECTOR (1 downto 0);
           clk : in  STD_LOGIC;
			  rst : in  STD_LOGIC);
end if_id_component;

architecture Behavioral of if_id_component is
		type states is (st0,st1,st2,st3,st4,st5);
		signal cur_state:states;
begin

	process(clk,rst)
	begin
		if (rst = '0') then
			id_pc_o <= "0000000000000000";
			id_inst_o <= "0000100000000000";
			cur_state <= st0;
		elsif (CLK'event and CLK = '1') then	
			case cur_state is
				when st0 =>
					case stall_i is
						when "00" =>
							id_pc_o <= if_pc_i;
							id_inst_o <= if_inst_i;	
						when "11" =>
							cur_state <= st1;
							id_pc_o <= "0000000000000000";
							id_inst_o <= "0000100000000000";
						when others =>
							id_pc_o <= if_pc_i;
							id_inst_o <= if_inst_i;	
					end case;
				when st1 =>
					cur_state <= st2;
					id_pc_o <= "0000000000000000";
					id_inst_o <= "0000100000000000";
				when st2 =>					
					id_pc_o <= "0000000000000000";
					id_inst_o <= "0000100000000000";
					cur_state <= st0;
				when others =>
					cur_state <= st0;
			end case;
					
		end if;
	end process;

end Behavioral;

