----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:02:47 11/30/2018 
-- Design Name: 
-- Module Name:    pc_component - Behavioral 
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

entity pc_component is
    Port ( if_newpc_i : in  STD_LOGIC_VECTOR (15 downto 0);
           if_newpc_o : out  STD_LOGIC_VECTOR (15 downto 0);
			  stall_i: in  STD_LOGIC_VECTOR (1 downto 0);
			  stall_i2: in  STD_LOGIC_VECTOR (1 downto 0);--½á¹¹³åÍ»
			  clk : in  STD_LOGIC;
			  rst : in  STD_LOGIC);
end pc_component;

architecture Behavioral of pc_component is
		type states is (st0,st1,st2,st3,st4,st5);
		signal cur_state:states;
begin

	PC_PROCESS : process(clk,rst)
	begin
		if (rst = '0') then
			if_newpc_o<="1111111111111111";
			cur_state <= st0;
		elsif (CLK'event and CLK = '1') then	
			case cur_state is
				when st0 =>
					case stall_i is
						when "00" =>
									case stall_i2 is
											when "01" =>
												null;
											when others=>
												if_newpc_o<=if_newpc_i;	
									end case;
						when "11" =>
							cur_state <= st1;							
						when others =>
							cur_state <= st1;	
					end case;
				when st1 =>
					cur_state <= st0;
				when others =>
					cur_state <= st0;
			end case;
					
		end if;
	end process;


end Behavioral;

