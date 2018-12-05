	----------------------------------------------------------------------------------
	-- Company: 
	-- Engineer: 
	-- 
	-- Create Date:    19:39:32 11/24/2018 
	-- Design Name: 
	-- Module Name:    Control_unit - Behavioral 
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

	entity control_component is
		 Port ( Inst_Control_ID_i : in  STD_LOGIC_VECTOR (15 downto 0);
				  AluSel1_Control_ID_o : out  STD_LOGIC_VECTOR (1 downto 0);
				  AluSel2_Control_ID_o : out  STD_LOGIC_VECTOR (1 downto 0);
				  AluCode_Control_ID_o : out  STD_LOGIC_VECTOR (3 downto 0);
				  WriteMem_Control_ID_o : out  STD_LOGIC_VECTOR (1 downto 0);
				  ReadMem_Control_ID_o : out  STD_LOGIC_VECTOR (1 downto 0);
				  BUnitSel_Control_ID_o : out  STD_LOGIC_VECTOR (2 downto 0);
				  WriteBackSel_Control_ID_o : out  STD_LOGIC_VECTOR (1 downto 0);
				  Reg1_Control_ID_o : out  STD_LOGIC_VECTOR (3 downto 0);
				  Reg2_Control_ID_o : out  STD_LOGIC_VECTOR (3 downto 0));
	end control_component;

	architecture Behavioral of control_component is

	begin

		process(Inst_Control_ID_i)
		begin		
			case Inst_Control_ID_i(15 downto 11 ) is
					when "01001" =>     --ADDIU
						AluSel1_Control_ID_o <= "00";
						AluSel2_Control_ID_o <= "11";
						AluCode_Control_ID_o <= "0000";
						WriteMem_Control_ID_o <= "00";
						ReadMem_Control_ID_o <= "00";
						BUnitSel_Control_ID_o <= "000";
						WriteBackSel_Control_ID_o <= "01";
						Reg1_Control_ID_o<= "0"&Inst_Control_ID_i(10 downto 8);
						Reg2_Control_ID_o<= "1111";
					when "01000" =>     --ADDIU3
						AluSel1_Control_ID_o <= "00";
						AluSel2_Control_ID_o <= "11";
						AluCode_Control_ID_o <= "0000";
						WriteMem_Control_ID_o <= "00";
						ReadMem_Control_ID_o <= "00";
						BUnitSel_Control_ID_o <= "000";
						WriteBackSel_Control_ID_o <= "01";
						Reg1_Control_ID_o<= "0"&Inst_Control_ID_i(10 downto 8);
						Reg2_Control_ID_o<= "1111";
					when "00000" =>     --ADDSP3
						AluSel1_Control_ID_o <= "00";
						AluSel2_Control_ID_o <= "11";
						AluCode_Control_ID_o <= "0000";
						WriteMem_Control_ID_o <= "00";
						ReadMem_Control_ID_o <= "00";
						BUnitSel_Control_ID_o <= "000";
						WriteBackSel_Control_ID_o <= "01";
						Reg1_Control_ID_o<= "1000";
						Reg2_Control_ID_o<= "1111";
					when "01100" =>     
						case Inst_Control_ID_i(10 downto 8 ) is
							when "011" =>     --ADDSP
								AluSel1_Control_ID_o <= "00";
								AluSel2_Control_ID_o <= "11";
								AluCode_Control_ID_o <= "0000";
								WriteMem_Control_ID_o <= "00";
								ReadMem_Control_ID_o <= "00";
								BUnitSel_Control_ID_o <= "000";
								WriteBackSel_Control_ID_o <= "01";
								Reg1_Control_ID_o<= "1000";
								Reg2_Control_ID_o<= "1111";
							when "000" =>     --BTEQZ
								AluSel1_Control_ID_o <= "00";
								AluSel2_Control_ID_o <= "01";
								AluCode_Control_ID_o <= "0100";
								WriteMem_Control_ID_o <= "00";
								ReadMem_Control_ID_o <= "00";
								BUnitSel_Control_ID_o <= "011";
								WriteBackSel_Control_ID_o <= "00";
								Reg1_Control_ID_o<= "1010";
								Reg2_Control_ID_o<= "1111";
							when "100" =>     --MTSP
								AluSel1_Control_ID_o <= "00";
								AluSel2_Control_ID_o <= "01";
								AluCode_Control_ID_o <= "0000";
								WriteMem_Control_ID_o <= "00";
								ReadMem_Control_ID_o <= "00";
								BUnitSel_Control_ID_o <= "000";
								WriteBackSel_Control_ID_o <= "01";
								Reg1_Control_ID_o<= "0"&Inst_Control_ID_i(7 downto 5);
								Reg2_Control_ID_o<= "1111";
							when others =>
								null;
						end case;
					when "11100" =>     
						case Inst_Control_ID_i(1 downto 0 ) is
								when "01" =>     --ADDU
									AluSel1_Control_ID_o <= "00";
									AluSel2_Control_ID_o <= "00";
									AluCode_Control_ID_o <= "0000";
									WriteMem_Control_ID_o <= "00";
									ReadMem_Control_ID_o <= "00";
									BUnitSel_Control_ID_o <= "000";
									WriteBackSel_Control_ID_o <= "01";
									Reg1_Control_ID_o<= "0"&Inst_Control_ID_i(10 downto 8);
									Reg2_Control_ID_o<= "0"&Inst_Control_ID_i(7 downto 5);								
								when "11" =>     --SUBU
									AluSel1_Control_ID_o <= "00";
									AluSel2_Control_ID_o <= "00";
									AluCode_Control_ID_o <= "0001";
									WriteMem_Control_ID_o <= "00";
									ReadMem_Control_ID_o <= "00";
									BUnitSel_Control_ID_o <= "000";
									WriteBackSel_Control_ID_o <= "01";
									Reg1_Control_ID_o<= "0"&Inst_Control_ID_i(10 downto 8);
									Reg2_Control_ID_o<= "0"&Inst_Control_ID_i(7 downto 5);
								when others=>
									null;
						end case;
					when "00010" =>     --B
						AluSel1_Control_ID_o <= "00";
						AluSel2_Control_ID_o <= "00";
						AluCode_Control_ID_o <= "0000";
						WriteMem_Control_ID_o <= "00";
						ReadMem_Control_ID_o <= "00";
						BUnitSel_Control_ID_o <= "001";
						WriteBackSel_Control_ID_o <= "00";
						Reg1_Control_ID_o<= "1111";
						Reg2_Control_ID_o<= "1111";
					when "00100" =>     --BEQZ
						AluSel1_Control_ID_o <= "00";
						AluSel2_Control_ID_o <= "01";
						AluCode_Control_ID_o <= "0100";
						WriteMem_Control_ID_o <= "00";
						ReadMem_Control_ID_o <= "00";
						BUnitSel_Control_ID_o <= "011";
						WriteBackSel_Control_ID_o <= "00";
						Reg1_Control_ID_o<= "0"&Inst_Control_ID_i(10 downto 8);
						Reg2_Control_ID_o<= "1111";
					when "00101" =>     --BNEZ
						AluSel1_Control_ID_o <= "00";
						AluSel2_Control_ID_o <= "01";
						AluCode_Control_ID_o <= "0100";
						WriteMem_Control_ID_o <= "00";
						ReadMem_Control_ID_o <= "00";
						BUnitSel_Control_ID_o <= "010";
						WriteBackSel_Control_ID_o <= "00";
						Reg1_Control_ID_o<= "0"&Inst_Control_ID_i(10 downto 8);
						Reg2_Control_ID_o<= "1111";
					when "11101" =>     
						case Inst_Control_ID_i(4 downto 0 ) is
							when "00010" =>     --SLT
								AluSel1_Control_ID_o <= "00";
								AluSel2_Control_ID_o <= "00";
								AluCode_Control_ID_o <= "0110";
								WriteMem_Control_ID_o <= "00";
								ReadMem_Control_ID_o <= "00";
								BUnitSel_Control_ID_o <= "000";
								WriteBackSel_Control_ID_o <= "01";
								Reg1_Control_ID_o<= "0"&Inst_Control_ID_i(10 downto 8);
								Reg2_Control_ID_o<= "0"&Inst_Control_ID_i(7 downto 5);
							when "00011" =>     --SLTU
								AluSel1_Control_ID_o <= "00";
								AluSel2_Control_ID_o <= "00";
								AluCode_Control_ID_o <= "0101";
								WriteMem_Control_ID_o <= "00";
								ReadMem_Control_ID_o <= "00";
								BUnitSel_Control_ID_o <= "000";
								WriteBackSel_Control_ID_o <= "01";
								Reg1_Control_ID_o<= "0"&Inst_Control_ID_i(10 downto 8);
								Reg2_Control_ID_o<= "0"&Inst_Control_ID_i(7 downto 5);
							when "00111" =>     --SRAV
								AluSel1_Control_ID_o <= "00";
								AluSel2_Control_ID_o <= "00";
								AluCode_Control_ID_o <= "1001";
								WriteMem_Control_ID_o <= "00";
								ReadMem_Control_ID_o <= "00";
								BUnitSel_Control_ID_o <= "000";
								WriteBackSel_Control_ID_o <= "01";
								Reg1_Control_ID_o<= "0"&Inst_Control_ID_i(10 downto 8);
								Reg2_Control_ID_o<= "0"&Inst_Control_ID_i(7 downto 5);
							when "01010" =>     --CMP
								AluSel1_Control_ID_o <= "00";
								AluSel2_Control_ID_o <= "00";
								AluCode_Control_ID_o <= "0100";
								WriteMem_Control_ID_o <= "00";
								ReadMem_Control_ID_o <= "00";
								BUnitSel_Control_ID_o <= "000";
								WriteBackSel_Control_ID_o <= "01";
								Reg1_Control_ID_o<= "0"&Inst_Control_ID_i(10 downto 8);
								Reg2_Control_ID_o<= "0"&Inst_Control_ID_i(7 downto 5);
							when "00000" =>     
								case Inst_Control_ID_i(7 downto 5 ) is
									when "000" =>     --JR
										AluSel1_Control_ID_o <= "00";
										AluSel2_Control_ID_o <= "01";
										AluCode_Control_ID_o <= "0000";
										WriteMem_Control_ID_o <= "00";
										ReadMem_Control_ID_o <= "00";
										BUnitSel_Control_ID_o <= "110";
										WriteBackSel_Control_ID_o <= "00";
										Reg1_Control_ID_o<= "0"&Inst_Control_ID_i(10 downto 8);
										Reg2_Control_ID_o<= "1111";
									when "010" =>     --MFPC
										AluSel1_Control_ID_o <= "01";
										AluSel2_Control_ID_o <= "01";
										AluCode_Control_ID_o <= "0000";
										WriteMem_Control_ID_o <= "00";
										ReadMem_Control_ID_o <= "00";
										BUnitSel_Control_ID_o <= "000";
										WriteBackSel_Control_ID_o <= "11";	
										Reg1_Control_ID_o<= "1111";
										Reg2_Control_ID_o<= "1111";
									when others =>
										null;
								end case;							
							when "01100" =>     --AND
								AluSel1_Control_ID_o <= "00";
								AluSel2_Control_ID_o <= "00";
								AluCode_Control_ID_o <= "0010";
								WriteMem_Control_ID_o <= "00";
								ReadMem_Control_ID_o <= "00";
								BUnitSel_Control_ID_o <= "000";
								WriteBackSel_Control_ID_o <= "01";	
								Reg1_Control_ID_o<= "0"&Inst_Control_ID_i(10 downto 8);
								Reg2_Control_ID_o<= "0"&Inst_Control_ID_i(7 downto 5);
							when "01101" =>     --OR
								AluSel1_Control_ID_o <= "00";
								AluSel2_Control_ID_o <= "00";
								AluCode_Control_ID_o <= "0011";
								WriteMem_Control_ID_o <= "00";
								ReadMem_Control_ID_o <= "00";
								BUnitSel_Control_ID_o <= "000";
								WriteBackSel_Control_ID_o <= "01";	
								Reg1_Control_ID_o<= "0"&Inst_Control_ID_i(10 downto 8);
								Reg2_Control_ID_o<= "0"&Inst_Control_ID_i(7 downto 5);
							when others =>
								null;
						end case;
					when "01101" =>     --LI
						AluSel1_Control_ID_o <= "01";
						AluSel2_Control_ID_o <= "11";
						AluCode_Control_ID_o <= "0000";
						WriteMem_Control_ID_o <= "00";
						ReadMem_Control_ID_o <= "00";
						BUnitSel_Control_ID_o <= "000";
						WriteBackSel_Control_ID_o <= "01";
						Reg1_Control_ID_o<= "1111";
						Reg2_Control_ID_o<= "1111";
					when "10011" =>     --LW
						AluSel1_Control_ID_o <= "00";
						AluSel2_Control_ID_o <= "11";
						AluCode_Control_ID_o <= "0000";
						WriteMem_Control_ID_o <= "00";
						ReadMem_Control_ID_o <= "01";
						BUnitSel_Control_ID_o <= "000";
						WriteBackSel_Control_ID_o <= "10";
						Reg1_Control_ID_o<= "0"&Inst_Control_ID_i(10 downto 8);
						Reg2_Control_ID_o<= "1111";
					when "10010" =>     --LW_SP
						AluSel1_Control_ID_o <= "00";
						AluSel2_Control_ID_o <= "11";
						AluCode_Control_ID_o <= "0000";
						WriteMem_Control_ID_o <= "00";
						ReadMem_Control_ID_o <= "01";
						BUnitSel_Control_ID_o <= "000";
						WriteBackSel_Control_ID_o <= "10";
						Reg1_Control_ID_o<= "1000";
						Reg2_Control_ID_o<= "1111";
					when "11110" =>     
						case Inst_Control_ID_i(7 downto 0 ) is
							when "00000000" =>     --MFIH
								AluSel1_Control_ID_o <= "00";
								AluSel2_Control_ID_o <= "01";
								AluCode_Control_ID_o <= "0000";
								WriteMem_Control_ID_o <= "00";
								ReadMem_Control_ID_o <= "00";
								BUnitSel_Control_ID_o <= "000";
								WriteBackSel_Control_ID_o <= "01";
								Reg1_Control_ID_o<= "1001";
								Reg2_Control_ID_o<= "1111";
							when "00000001" =>     --MTIH
								AluSel1_Control_ID_o <= "00";
								AluSel2_Control_ID_o <= "01";
								AluCode_Control_ID_o <= "0000";
								WriteMem_Control_ID_o <= "00";
								ReadMem_Control_ID_o <= "00";
								BUnitSel_Control_ID_o <= "000";
								WriteBackSel_Control_ID_o <= "01";
								Reg1_Control_ID_o<= "0"&Inst_Control_ID_i(10 downto 8);
								Reg2_Control_ID_o<= "1111";
							when others =>
								null;
						end case;
					when "00001" =>     --NOP
						AluSel1_Control_ID_o <= "01";
						AluSel2_Control_ID_o <= "01";
						AluCode_Control_ID_o <= "0000";
						WriteMem_Control_ID_o <= "00";
						ReadMem_Control_ID_o <= "00";
						BUnitSel_Control_ID_o <= "111";
						WriteBackSel_Control_ID_o <= "00";
						Reg1_Control_ID_o<= "1111";
						Reg2_Control_ID_o<= "1111";
					when "00110" =>     
						case Inst_Control_ID_i(1 downto 0 ) is
								when "00" =>     --SLL
									AluSel1_Control_ID_o <= "00";					
									case Inst_Control_ID_i(4 downto 2 ) is
										when "000" =>     --等于0
											AluSel2_Control_ID_o <= "10";
											AluCode_Control_ID_o <= "1000";
										when others =>		--不等于0
											AluSel2_Control_ID_o <= "11";
											AluCode_Control_ID_o <= "1000";
									end case;					
									WriteMem_Control_ID_o <= "00";
									ReadMem_Control_ID_o <= "00";
									BUnitSel_Control_ID_o <= "000";
									WriteBackSel_Control_ID_o <= "01";
									Reg1_Control_ID_o<= "0"&Inst_Control_ID_i(10 downto 8);
									Reg2_Control_ID_o<= "0"&Inst_Control_ID_i(7 downto 5);
								when "11" =>     --SRA
									AluSel1_Control_ID_o <= "00";					
									case Inst_Control_ID_i(4 downto 2 ) is
										when "000" =>     --等于0
											AluSel2_Control_ID_o <= "10";
											AluCode_Control_ID_o <= "0111";
										when others =>		--不等于0
											AluSel2_Control_ID_o <= "11";
											AluCode_Control_ID_o <= "0111";
									end case;					
									WriteMem_Control_ID_o <= "00";
									ReadMem_Control_ID_o <= "00";
									BUnitSel_Control_ID_o <= "000";
									WriteBackSel_Control_ID_o <= "01";
									Reg1_Control_ID_o<= "0"&Inst_Control_ID_i(10 downto 8);
									Reg2_Control_ID_o<= "0"&Inst_Control_ID_i(7 downto 5);
								when others =>
									null;
						end case;	
					when "11011" =>     --SW
						AluSel1_Control_ID_o <= "00";
						AluSel2_Control_ID_o <= "11";
						AluCode_Control_ID_o <= "0000";
						WriteMem_Control_ID_o <= "01";
						ReadMem_Control_ID_o <= "00";
						BUnitSel_Control_ID_o <= "000";
						WriteBackSel_Control_ID_o <= "00";
						Reg1_Control_ID_o<= "0"&Inst_Control_ID_i(10 downto 8);
						Reg2_Control_ID_o<= "1111";
					when "11010" =>     --SW_SP
						AluSel1_Control_ID_o <= "00";
						AluSel2_Control_ID_o <= "11";
						AluCode_Control_ID_o <= "0000";
						WriteMem_Control_ID_o <= "01";
						ReadMem_Control_ID_o <= "00";
						BUnitSel_Control_ID_o <= "000";
						WriteBackSel_Control_ID_o <= "00";
						Reg1_Control_ID_o<= "1000";
						Reg2_Control_ID_o<= "1111";
					when "01110" =>     --CMPI
						AluSel1_Control_ID_o <= "00";
						AluSel2_Control_ID_o <= "11";
						AluCode_Control_ID_o <= "0100";
						WriteMem_Control_ID_o <= "00";
						ReadMem_Control_ID_o <= "00";
						BUnitSel_Control_ID_o <= "000";
						WriteBackSel_Control_ID_o <= "01";
						Reg1_Control_ID_o<= "0"&Inst_Control_ID_i(10 downto 8);
						Reg2_Control_ID_o<= "1111";
					when others =>
						AluSel1_Control_ID_o <= "01";
						AluSel2_Control_ID_o <= "01";
						AluCode_Control_ID_o <= "0000";
						WriteMem_Control_ID_o <= "00";
						ReadMem_Control_ID_o <= "00";
						BUnitSel_Control_ID_o <= "111";
						WriteBackSel_Control_ID_o <= "00";
						Reg1_Control_ID_o<= "1111";
						Reg2_Control_ID_o<= "1111";
			end case;
		end process;

	end Behavioral;

