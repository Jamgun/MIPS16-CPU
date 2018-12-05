----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:18:10 12/04/2018 
-- Design Name: 
-- Module Name:    top - Behavioral 
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

entity top is
PORT(
		--cpu
		
		rst : IN std_logic;
		clk : IN std_logic;		
		data_ready : IN std_logic;
		tbre : IN std_logic;
		tsre : IN std_logic;    
		Ram1Data : INOUT std_logic_vector(15 downto 0);
		Ram2Data : INOUT std_logic_vector(15 downto 0);      
		Ram1OE : OUT std_logic;
		Ram1WE : OUT std_logic;
		Ram1EN : OUT std_logic;
		Ram1Addr : OUT std_logic_vector(17 downto 0);
		L : OUT std_logic_vector(15 downto 0);
		wrn : OUT std_logic;
		rdn : OUT std_logic;
		Ram2OE : OUT std_logic;
		Ram2WE : OUT std_logic;
		Ram2EN : OUT std_logic;
		Ram2Addr : OUT std_logic_vector(17 downto 0);
	ps2clk: in std_logic;
	ps2data: in std_logic;
		--vga
		--clk_50m : IN std_logic;
		hs,vs	: out std_logic;		--行同步、场同步信号
		oRed	: out std_logic_vector (2 downto 0);
		oGreen : out std_logic_vector (2 downto 0);
		oBlue	: out std_logic_vector (2 downto 0)
	
		);
end top;

architecture Behavioral of top is
COMPONENT vga
	PORT(
		reset : IN std_logic;
		CLK_in : IN std_logic;
		r0 : IN std_logic_vector(15 downto 0);
		r1 : IN std_logic_vector(15 downto 0);
		r2 : IN std_logic_vector(15 downto 0);
		r3 : IN std_logic_vector(15 downto 0);
		r4 : IN std_logic_vector(15 downto 0);
		r5 : IN std_logic_vector(15 downto 0);
		r6 : IN std_logic_vector(15 downto 0);
		r7 : IN std_logic_vector(15 downto 0);
		data : IN std_logic_vector(15 downto 0);
		hs : OUT std_logic;
		vs : OUT std_logic;
		oRed : OUT std_logic_vector(2 downto 0);
		oGreen : OUT std_logic_vector(2 downto 0);
		oBlue : OUT std_logic_vector(2 downto 0)
		);
	END COMPONENT;
	COMPONENT ps2
	PORT(
		rst: in std_logic;
		clk50M: in std_logic;
		
		ps2clk: in std_logic;
		ps2data: in std_logic;

		data_ready: out std_logic; -- 常0，有数据到来时变成1，至少保持两个CPU周期
		key_value: out std_logic_vector(15 downto 0) -- 总是保持前一次的结果    根据a-z  , . 0-9 - = ESC BKSP ENTER SPACE 输出
	);
	END COMPONENT;
COMPONENT cpu1_component
	PORT(
		test_inst_if : out std_logic_vector(15 downto 0);
		rst : IN std_logic;
		clk : IN std_logic;
		data_ready : IN std_logic;
		tbre : IN std_logic;
		tsre : IN std_logic;    
		Ram1Data : INOUT std_logic_vector(15 downto 0);
		Ram2Data : INOUT std_logic_vector(15 downto 0);      
		Ram1OE : OUT std_logic;
		Ram1WE : OUT std_logic;
		Ram1EN : OUT std_logic;
		Ram1Addr : OUT std_logic_vector(17 downto 0);
		L : OUT std_logic_vector(15 downto 0);
		wrn : OUT std_logic;
		rdn : OUT std_logic;
		Ram2OE : OUT std_logic;
		Ram2WE : OUT std_logic;
		Ram2EN : OUT std_logic;
		Ram2Addr : OUT std_logic_vector(17 downto 0);
		r0 : OUT std_logic_vector(15 downto 0);
		r1 : OUT std_logic_vector(15 downto 0);
		r2 : OUT std_logic_vector(15 downto 0);
		r3 : OUT std_logic_vector(15 downto 0);
		r4 : OUT std_logic_vector(15 downto 0);
		r5 : OUT std_logic_vector(15 downto 0);
		r6 : OUT std_logic_vector(15 downto 0);
		r7 : OUT std_logic_vector(15 downto 0);
		vga_data : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;
	
	signal r0,r1,r2,r3,r4,r5,r6,r7,vga_data,inst_if : std_logic_vector(15 downto 0);
	signal clk_2:std_logic:='0';

	
begin

	process(clk)	--二分频
	begin

	if clk'event and clk='1' then
		clk_2 <= not clk_2;
	end if;
	end process;

	vga_component: vga PORT MAP(
		reset => rst,
		CLK_in => clk,
		r0 => r0,
		r1 => r1,
		r2 => r2,
		r3 => r3,
		r4 => r4,
		r5 => r5,
		r6 => r6,
		r7 => inst_if,
		data => vga_data,
		hs => hs,
		vs => vs,
		oRed => oRed,
		oGreen => oGreen,
		oBlue => oBlue 
	);
	
	ps2_component : ps2	PORT map(
		rst => rst,
		clk50M=> clk,
		
		ps2clk=>ps2clk,
		ps2data=>ps2data,


		key_value=> vga_data
	);

	
	cpu_component: cpu1_component PORT MAP(
		test_inst_if => inst_if,
		rst => rst,
		clk => clk_2,
		Ram1OE => Ram1OE,
		Ram1WE => Ram1WE,
		Ram1EN => Ram1EN,
		Ram1Data => Ram1Data,
		Ram1Addr => Ram1Addr,
		L => L,
		data_ready => data_ready,
		wrn => wrn,
		rdn => rdn,
		tbre => tbre,
		tsre => tsre,
		Ram2OE => Ram2OE,
		Ram2WE => Ram2WE,
		Ram2EN => Ram2EN,
		Ram2Data => Ram2Data,
		Ram2Addr => Ram2Addr,
		r0 => r0,
		r1 => r1,
		r2 => r2,
		r3 => r3,
		r4 => r4,
		r5 => r5,
		r6 => r6,
		r7 => r7
	);

end Behavioral;

