----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:32:39 11/30/2018 
-- Design Name: 
-- Module Name:    extend_WR - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity extend_component is
    Port ( inst : in  STD_LOGIC_VECTOR (15 downto 0);
           imm : out  STD_LOGIC_VECTOR (15 downto 0);
           rs : out  STD_LOGIC_VECTOR (3 downto 0);
           rt : out  STD_LOGIC_VECTOR (3 downto 0);
           dr : out  STD_LOGIC_VECTOR (3 downto 0));
end extend_component;

architecture Behavioral of extend_component is

begin
	extend_WR: process(inst)
		variable op : STD_LOGIC_VECTOR(4 downto 0);
		variable op_end2 : STD_LOGIC_VECTOR(1 downto 0);
		variable op_end5 : STD_LOGIC_VECTOR(4 downto 0);
		variable imm3 : STD_LOGIC_VECTOR(2 downto 0);
		variable imm4 : STD_LOGIC_VECTOR(3 downto 0);
		variable imm5 : STD_LOGIC_VECTOR(4 downto 0);
		variable imm8 : STD_LOGIC_VECTOR(7 downto 0);
		variable imm11 : STD_LOGIC_VECTOR(10 downto 0);
		variable rx, ry, rz, sp, ih, t, r0 : STD_LOGIC_VECTOR(3 downto 0);
		variable imm0 : STD_LOGIC_VECTOR(15 downto 0);
		--¼Ä´æÆ÷±àÂë£ºR[]:"0"&xxx;ÌØÊâ:SP:"1000"IH:"1001"T:"1010";¿Õ:"1111"
		
	begin
		op := inst(15 downto 11);
		op_end2 := inst(1 downto 0);
		op_end5 := inst(4 downto 0);
		imm3 := inst(4 downto 2);
		imm4 := inst(3 downto 0);
		imm5 := inst(4 downto 0);
		imm8 := inst(7 downto 0);
		imm11 := inst(10 downto 0);		
		rx := "0"&inst(10 downto 8);
		ry := "0"&inst(7 downto 5);
		rz := "0"&inst(4 downto 2);
		imm0 := "0000000000000000";
		sp := "1000";
		ih := "1001";
		t := "1010";
		r0 := "1111";
		case op is 
			when "01001" => --ADDIU
				dr <= rx;
				rs <= rx;
				rt <= r0;
				imm <= SXT(imm8, 16);
			when "01000" => --ADDIU3
				dr <= ry;
				rs <= rx;
				rt <= r0;
				imm <= SXT(imm4, 16);
			when "01100" => --ADDSP/BTEQZ/MTSP
				case rx is
					when "0011" => --ADDSP
						dr <= sp;
						rs <= sp;
						rt <= r0;
						imm <= SXT(imm8, 16);
					when "0000" => --BTEQZ
						dr <= r0;
						rs <= t;
						rt <= r0;
						imm <= SXT(imm8, 16);
					when "0100" => --MTSP
						dr <= sp;
						rs <= ry;
						rt <= r0;
						imm <= imm0;
					when others =>
				end case;
			when "11100" => --ADDU/SUBU
				case op_end2 is
					when "01" => --ADDU					
						dr <= rz;
						rs <= rx;
						rt <= ry;
						imm <= imm0;
					when "11" => --SUBU
						dr <= rz;
						rs <= rx;
						rt <= ry;
						imm <= imm0;
					when others =>
				end case;
			when "11101" => --AND/CMP/JR/MFPC/OR/SLT/SLTU/SRAV
				case op_end5 is
					when "01100" => --AND					
						dr <= rx;
						rs <= rx;
						rt <= ry;
						imm <= imm0;
					when "01010" => --CMP
						dr <= t;
						rs <= rx;
						rt <= ry;
						imm <= imm0;
					when "00000" => --JR/MFPC
						case ry is
							when "0000" => --JR
								dr <= r0;
								rs <= rx;
								rt <= r0;
								imm <= imm0;
							when "0010" => --MFPC
								dr <= rx;
								rs <= r0;
								rt <= r0;
								imm <= imm0;
							when others => 
						end case;
					when "01101" => --OR
						dr <= rx;
						rs <= rx;
						rt <= ry;
						imm <= imm0;
					when "00010" => --SLT
						dr <= t;
						rs <= rx;
						rt <= ry;
						imm <= imm0;
					when "00011" => --SLTU
						dr <= t;
						rs <= rx;
						rt <= ry;
						imm <= imm0;
					when "00111" => --SRAV
						dr <= ry;
						rs <= ry;
						rt <= rx;
						imm <= imm0;
					when others =>
				end case;
			when "00010" => --B
				dr <= r0;
				rs <= r0;
				rt <= r0;
				imm <= SXT(imm11, 16);
			when "00100" => --BEQZ
				dr <= r0;
				rs <= rx;
				rt <= r0;
				imm <= SXT(imm8, 16);
			when "00101" => --BNEZ
				dr <= r0;
				rs <= rx;
				rt <= r0;
				imm <= SXT(imm8, 16);
			when "01101" => --LI
				dr <= rx;
				rs <= r0;
				rt <= r0;
				imm <= EXT(imm8, 16);
			when "10011" => --LW
				dr <= ry;
				rs <= rx;
				rt <= r0;
				imm <= SXT(imm5, 16);
			when "10010" => --LW_SP
				dr <= rx;
				rs <= sp;
				rt <= r0;
				imm <= SXT(imm8, 16);
			when "11110" => --MFIH/MTIH
				case op_end2 is
					when "00" => --MFIH
						dr <= rx;
						rs <= ih;
						rt <= r0;
						imm <= imm0;		
					when "01" => --MTIH
						dr <= ih;
						rs <= rx;
						rt <= r0;
						imm <= imm0;
					when others =>
				end case;
			when "00001" => --NOP
				dr <= r0;
				rs <= r0;
				rt <= r0;
				imm <= imm0;
			when "00110" => --SLL & SRA
				dr <= rx;
				rs <= ry;
				rt <= r0;
				imm <= EXT(imm3, 16);
			when "11011" => --SW
				dr <= r0;
				rs <= rx;
				rt <= r0;
				imm <= SXT(imm5, 16);
			when "11010" => --SW_SP
				dr <= r0;
				rs <= sp;
				rt <= r0;
				imm <= SXT(imm8, 16);	
			when "01110" => --CMPI
				dr <= t;
				rs <= rx;
				rt <= r0;
				imm <= SXT(imm8, 16);
			when "00000" => --ADDSP3
			--zsh
				dr <= rx;
				rs <= sp;
				rt <= r0;
				imm <= SXT(imm8, 16);
				--dr <= "1111";
				--rs <= "1111";
				--rt <= "1111";
				--imm <= "0000000000000000";
			when others =>
				dr <= "1111";
				rs <= "1111";
				rt <= "1111";
				imm <= "0000000000000000";
		end case;
	end process;
end Behavioral;

