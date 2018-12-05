----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:08:01 11/27/2018 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu_component is
    Port ( R1D : in  STD_LOGIC_VECTOR (15 downto 0);
           R2D : in  STD_LOGIC_VECTOR (15 downto 0);
           ALUcode : in  STD_LOGIC_VECTOR (3 downto 0);
           flag : out  STD_LOGIC;
           ALUout : out  STD_LOGIC_VECTOR (15 downto 0));
end alu_component;

architecture Behavioral of alu_component is
	shared variable cin1:std_logic_vector(15 downto 0); 
	shared variable cin2:std_logic_vector(15 downto 0); 
	shared variable cin11:std_logic_vector(16 downto 0); 
	shared variable cin22:std_logic_vector(16 downto 0);
	shared variable zeros:std_logic_vector(15 downto 0); --全0，用于比较等
	shared variable theALUout:std_logic_vector(15 downto 0); --ALUout，用于判断ALUout是否为全零
	shared variable mid:std_logic_vector(15 downto 0); --存储中间的计算值
	shared variable midd:std_logic_vector(16 downto 0); --存储中间的计算值
	shared variable ifZero:std_logic; --ALUout是否为全零
	
	CONSTANT ALU_ADD: STD_LOGIC_VECTOR(3 downto 0):= "0000";
	CONSTANT ALU_SUB: STD_LOGIC_VECTOR(3 downto 0):= "0001";
	CONSTANT ALU_AND: STD_LOGIC_VECTOR(3 downto 0):= "0010";
	CONSTANT ALU_OR: STD_LOGIC_VECTOR(3 downto 0):= "0011";
	CONSTANT ALU_EQUAL: STD_LOGIC_VECTOR(3 downto 0):= "0100";
	CONSTANT ALU_LESS: STD_LOGIC_VECTOR(3 downto 0):= "0110";
	CONSTANT ALU_LESSU: STD_LOGIC_VECTOR(3 downto 0):= "0101";
	CONSTANT ALU_SLL: STD_LOGIC_VECTOR(3 downto 0):= "1000";
	CONSTANT ALU_SRA: STD_LOGIC_VECTOR(3 downto 0):= "0111";

begin

process(R1D, R2D, ALUcode)
	begin 
		cin1 := R1D;
		cin2 := R2D;
		zeros := (15 downto 0 => '0');
		case ALUcode is
			when ALU_ADD =>
				theALUout := cin1 + cin2;
				
			when ALU_SUB =>
				theALUout := cin1 - cin2;
				
			when ALU_AND =>
				theALUout := cin1 and cin2;
				
			when ALU_OR =>
				theALUout := cin1 or cin2;
				
			when ALU_EQUAL =>
				mid := cin1 - cin2;
				if (mid = zeros) then
					theALUout := "0000000000000000";
				else 
					theALUout := "0000000000000001";
				end if;
				
			when ALU_LESS =>
				mid := cin1 - cin2;
				if (mid = zeros) then
					theALUout := "0000000000000000";
				elsif (cin1(15) = '0') and (cin2(15) = '1') then
					theALUout := "0000000000000000";
				elsif (cin1(15) = '1') and (cin2(15) = '0') then
					theALUout := "0000000000000001";
				elsif (mid(15) = '0') then
					theALUout := "0000000000000000";
				else	
					theALUout := "0000000000000001";
				end if;
				
			when ALU_LESSU =>
				cin11:='0'&cin1;
				cin22:='0'&cin2;
				midd := cin11 - cin22;
				if (midd(16) = '0') then
					theALUout := "0000000000000000";
				else
					theALUout := "0000000000000001";
				end if;
				--if (mid = zeros) then
				--	theALUout := "0000000000000000";
				--elsif (cin1(15) = '0') and (cin2(15) = '1') then
				--	theALUout := "0000000000000000";
				--elsif (cin1(15) = '1') and (cin2(15) = '0') then
				--	theALUout := "0000000000000001";
				--elsif (mid(15) = '0') then
				--	theALUout := "0000000000000000";
				--else	
				--	theALUout := "0000000000000001";
				--end if;

				
				
			when ALU_SLL =>
				theALUout := to_stdlogicvector(to_bitvector(cin1) sll conv_integer(cin2));
				
			when ALU_SRA =>
				theALUout := to_stdlogicvector(to_bitvector(cin1) sra conv_integer(cin2));
				
			when others =>
				NULL;
			end case;
			
			ALUout <= theALUout;
			if (theALUout = zeros) then
				ifZero := '0';
			else 
				ifZero := '1';
			end if;
			flag <= ifZero;
		end process;

end Behavioral;

