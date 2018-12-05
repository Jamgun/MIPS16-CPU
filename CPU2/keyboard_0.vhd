----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:16:55 12/04/2017 
-- Design Name: 
-- Module Name:    keyboard_drv - Behavioral 
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

--��ʼλ��1���� + ����λ��8��+ У��λ��1��+����λ��1����

entity keyboard_0 is
port(
	clk, rst : in std_logic;   --����clk
	ps2clk, ps2data : in std_logic;  --PS2���ݺ�ʱ��
	key_code : out std_logic_vector(7 downto 0)   --ɨ����
);
end keyboard_0;

architecture Behavioral of keyboard_0 is

signal kclk : std_logic; -- ȥë�̼���ʱ��
signal kdata : std_logic; -- ȥë�̼�������

signal last_kclk : std_logic;   --
signal clk1, clk2, check : std_logic; -- ��ʱʱ�ӣ�У��λ
signal stat : std_logic_vector(3 downto 0);   --״̬
signal data : std_logic_vector(7 downto 0);   --�洢ɨ����
signal paral_data : std_logic_vector(7 downto 0);  --���ɨ����
signal count : integer range 0 to 1000000;  --����
begin
	clk1 <= ps2clk when rising_edge(clk);
	clk2 <= clk1 when rising_edge(clk);
	kclk <= (not clk1) and clk2;        
	kdata <= ps2data when rising_edge(clk);   --����ë��
	
	key_code <= paral_data;
	process(clk)
	begin
		if rst = '0' then
			stat <= "0000";
			check <= '1';
			paral_data <= (others => '0');
			last_kclk <= kclk;
			count <= 0;
		elsif clk'event and clk = '1' then
			last_kclk <= kclk;
			if count > 0 then
				if count = 1000000 then
					stat <= "0000";
					check <= '1';
					-- paral_data <= (others => '0');
					count <= 0;
				else
					count <= count + 1;
				end if;
			end if;
			
			if last_kclk = '0' and kclk = '1' then    --��ʼ����
				case stat is
					when "0000" => --����״̬   ��һλ����
						if kdata = '0' then
							stat <= "0010";
							check <= '1';
							-- paral_data <= (others => '0');
							count <= 1;
						else
							stat <= "0000";
						end if;
					when "0010" => --����״̬  0
						if kdata = '1' then
							check <= not check;
						end if;
						data(0) <= kdata;
						stat <= "0011";
					when "0011" => --����״̬  1
						if kdata = '1' then
							check <= not check;
						end if;
						data(1) <= kdata;
						stat <= "0100";
					when "0100" => --����״̬  2
						if kdata = '1' then
							check <= not check;
						end if;
						data(2) <= kdata;
						stat <= "0101";
					when "0101" => --����״̬  3
						if kdata = '1' then
							check <= not check;
						end if;
						data(3) <= kdata;
						stat <= "0110";
					when "0110" => --����״̬  4
						if kdata = '1' then
							check <= not check;
						end if;
						data(4) <= kdata;
						stat <= "0111";
					when "0111" => --����״̬  5
						if kdata = '1' then
							check <= not check;
						end if;
						data(5) <= kdata;
						stat <= "1000";
					when "1000" => --����״̬  6
						if kdata = '1' then
							check <= not check;
						end if;
						data(6) <= kdata;
						stat <= "1001";
					when "1001" => --����״̬  7
						if kdata = '1' then
							check <= not check;
						end if;
						data(7) <= kdata;
						stat <= "1010";
					when "1010" => --У��״̬  
						if check = kdata then
							stat <= "1011";
						else
							stat <= "0000";
							count <= 0;
						end if;
					when "1011" => -- ����״̬
						if kdata = '1' then
							paral_data <= data;
							count <= 0;
						end if;
						stat <= "0000";
					when others => 
						stat <= "0000";
				end case;
			end if;
		end if;
	end process;
end Behavioral;
