----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:43:20 12/01/2018 
-- Design Name: 
-- Module Name:    stall_component - Behavioral 
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

entity stall_component is
    Port ( id_inst_i : in  STD_LOGIC_VECTOR (15 downto 0);
           id_pcwrite_o : out  STD_LOGIC_VECTOR (1 downto 0);
           id_ifidstall_o : out  STD_LOGIC_VECTOR (1 downto 0));
end stall_component;

architecture Behavioral of stall_component is

begin
	process(id_inst_i)
		begin		
			case id_inst_i(15 downto 11 ) is
					when "01001" =>     --ADDIU
						id_pcwrite_o <= "00";
						id_ifidstall_o <= "00";
					when "01000" =>     --ADDIU3
						id_pcwrite_o <= "00";
						id_ifidstall_o <= "00";
					when "00000" =>     --ADDSP3
						id_pcwrite_o <= "00";
						id_ifidstall_o <= "00";
					when "01100" =>     
						case id_inst_i(10 downto 8 ) is
							when "011" =>     --ADDSP
								id_pcwrite_o <= "00";
								id_ifidstall_o <= "00";
							when "000" =>     --BTEQZ
								id_pcwrite_o <= "11";
								id_ifidstall_o <= "11";
							when "100" =>     --MTSP
								id_pcwrite_o <= "00";
								id_ifidstall_o <= "00";
							when others =>
								null;
						end case;
					when "11100" =>     
						case id_inst_i(1 downto 0 ) is
								when "01" =>     --ADDU
									id_pcwrite_o <= "00";
									id_ifidstall_o <= "00";								
								when "11" =>     --SUBU
									id_pcwrite_o <= "00";
									id_ifidstall_o <= "00";
								when others=>
									null;
						end case;
					when "00010" =>     --B
						id_pcwrite_o <= "11";
						id_ifidstall_o <= "11";
					when "00100" =>     --BEQZ
						id_pcwrite_o <= "11";
						id_ifidstall_o <= "11";
					when "00101" =>     --BNEZ
						id_pcwrite_o <= "11";
						id_ifidstall_o <= "11";
					when "11101" =>     
						case id_inst_i(4 downto 0 ) is
							when "00010" =>     --SLT
								id_pcwrite_o <= "00";
								id_ifidstall_o <= "00";
							when "00011" =>     --SLTU
								id_pcwrite_o <= "00";
								id_ifidstall_o <= "00";
							when "00111" =>     --SRAV
								id_pcwrite_o <= "00";
								id_ifidstall_o <= "00";
							when "01010" =>     --CMP
								id_pcwrite_o <= "00";
								id_ifidstall_o <= "00";
							when "00000" =>     
								case id_inst_i(7 downto 5 ) is
									when "000" =>     --JR
										id_pcwrite_o <= "11";
										id_ifidstall_o <= "11";
									when "010" =>     --MFPC
										id_pcwrite_o <= "00";
										id_ifidstall_o <= "00";
									when others =>
										null;
								end case;							
							when "01100" =>     --AND
								id_pcwrite_o <= "00";
								id_ifidstall_o <= "00";
							when "01101" =>     --OR
								id_pcwrite_o <= "00";
								id_ifidstall_o <= "00";
							when others =>
								null;
						end case;
					when "01101" =>     --LI
						id_pcwrite_o <= "00";
						id_ifidstall_o <= "00";
					when "10011" =>     --LW
						id_pcwrite_o <= "00";
						id_ifidstall_o <= "00";
					when "10010" =>     --LW_SP
						id_pcwrite_o <= "00";
						id_ifidstall_o <= "00";
					when "11110" =>     
						case id_inst_i(7 downto 0 ) is
							when "00000000" =>     --MFIH
								id_pcwrite_o <= "00";
								id_ifidstall_o <= "00";
							when "00000001" =>     --MTIH
								id_pcwrite_o <= "00";
								id_ifidstall_o <= "00";
							when others =>
								null;
						end case;
					when "00001" =>     --NOP
						id_pcwrite_o <= "00";
						id_ifidstall_o <= "00";
					when "00110" =>     
						case id_inst_i(1 downto 0 ) is
								when "00" =>     --SLL
									id_pcwrite_o <= "00";
									id_ifidstall_o <= "00";
								when "11" =>     --SRA
									id_pcwrite_o <= "00";
									id_ifidstall_o <= "00";
								when others =>
									null;
						end case;	
					when "11011" =>     --SW
						id_pcwrite_o <= "00";
						id_ifidstall_o <= "00";
					when "11010" =>     --SW_SP
						id_pcwrite_o <= "00";
						id_ifidstall_o <= "00";
					when "01110" =>     --CMPI
						id_pcwrite_o <= "00";
						id_ifidstall_o <= "00";
					when others =>
						id_pcwrite_o <= "00";
						id_ifidstall_o <= "00";
			end case;
		end process;

end Behavioral;

