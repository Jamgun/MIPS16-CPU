----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:25:57 11/28/2018 
-- Design Name: 
-- Module Name:    Reg - Behavioral 
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

entity reg_component is
    Port ( 
			  inst1 : in  STD_LOGIC_VECTOR (3 downto 0);		--�Ĵ���1�Ĵ���	
           inst2 : in  STD_LOGIC_VECTOR (3 downto 0);		--�Ĵ���1�Ĵ���
			  inst : in  STD_LOGIC_VECTOR (15 downto 0);
			  R1D : out  STD_LOGIC_VECTOR (15 downto 0);		--��ȡ�ļĴ���1������
           R2D : out  STD_LOGIC_VECTOR (15 downto 0);		--��ȡ�ļĴ���2������			  
           
			  WBD : in  STD_LOGIC_VECTOR (15 downto 0);		--д�ص�����
           WBR : in  STD_LOGIC_VECTOR (3 downto 0);		--д�ؼĴ���
           sreg : out  STD_LOGIC_VECTOR (3 downto 0);
			  send_out_data : out  STD_LOGIC_VECTOR (15 downto 0);		--д�ص�����
			  
			  rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
			  write_enable : in  STD_LOGIC;	
			  
			  --for test
			  reg0 : out std_logic_vector (15 downto 0);
           reg1 : out std_logic_vector (15 downto 0);
           reg2 : out std_logic_vector (15 downto 0);
           reg3 : out std_logic_vector (15 downto 0);
           reg4 : out std_logic_vector (15 downto 0);
           reg5 : out std_logic_vector (15 downto 0);
           reg6 : out std_logic_vector (15 downto 0);
           reg7 : out std_logic_vector (15 downto 0)
			  );
			 
end reg_component;

architecture Behavioral of reg_component is
	--inst��ǰ��λ ��ָ����
	signal inst_code : std_logic_vector (4 downto 0):= (others => '0');
	signal ry : std_logic_vector (2 downto 0):= (others => '0');

	--�Ĵ�������
	type RegArray is array(0 to 15) of std_logic_vector(15 downto 0);
	signal regs : RegArray;
	--SP "1000"
	--IH "1001"
	--T  "1010"
	--RA "1011"

begin
--���Ը���ֵ
	--regs(0) <= "0000000000000001";
	--regs(1) <= "0000000000000001";
	inst_code <= inst(15 downto 11);
	
	
	reg0 <= regs(0);
	reg1 <= regs(1);
	reg2 <= regs(2);
	reg3 <= regs(3);
	reg4 <= regs(4);
	reg5 <= regs(5);
	reg6 <= regs(6);
	reg7 <= regs(7);
	
	process(inst)
	begin
		if (inst(15 downto 11 ) = "11011") then
			sreg <='0'&inst(7 downto 5);
			ry <= inst(7 downto 5);
			send_out_data <= regs(conv_integer(ry));
		elsif (inst(15 downto 11 ) = "11010") then
			sreg <='0'&inst(10 downto 8);
			ry <= inst(10 downto 8);
			send_out_data <= regs(conv_integer(ry));
		else
			send_out_data <= "0000000000000000";
			--do nothing
		end if;
	end process;

	--���Ĵ������� ����߼�
	--��ȡ�Ĵ���1������
	process(inst1, WBR, WBD, regs)
	begin
		if (inst1 = WBR) then
			R1D <= WBD;
		elsif (inst1 = "1111") then
			R1D <= "0000000000000000";
		else 
			R1D <= regs(conv_integer(inst1));
		end if;
	end process;
	
	--��ȡ�Ĵ���2������
	process(inst2, WBR, WBD, regs)
	begin
			
		if (inst2 = WBR) then
			R2D <= WBD;
		elsif (inst2 = "1111") then
			R2D <= "0000000000000000";
		else 
			R2D <= regs(conv_integer(inst2));
		end if;
	end process;
	
	
	
	--д��Ĵ������� ʱ���߼� 
	--д������
	 process(clk, rst, WBD)
    begin
		
      if (rst = '0') then
		--rstΪ0ʱ ��λ regsȫ����Ϊ0
            regs <= (others => (others => '0'));
        elsif (clk'event and clk = '0') then
            if (write_enable = '1' and WBR /="1111") then
                regs(conv_integer(WBR)) <= WBD;
            end if;
        end if;
    end process;


end Behavioral;

