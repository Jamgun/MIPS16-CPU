----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:18:02 11/29/2018 
-- Design Name: 
-- Module Name:    exe_mem_component - Behavioral 
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

entity exe_mem_component is
    Port ( exe_WriteMemSel_i : in  STD_LOGIC_VECTOR (1 downto 0);
           exe_ReadMemSel_i : in  STD_LOGIC_VECTOR (1 downto 0);
           exe_BUnitSel_i : in  STD_LOGIC_VECTOR (2 downto 0);
           exe_WriteBackSel_i : in  STD_LOGIC_VECTOR (1 downto 0);
           exe_pc_i : in  STD_LOGIC_VECTOR (15 downto 0);
           exe_DestReg_i : in  STD_LOGIC_VECTOR (3 downto 0);
           exe_WriteData_i : in  STD_LOGIC_VECTOR (15 downto 0);
           exe_pcImm_i : in  STD_LOGIC_VECTOR (15 downto 0);
           exe_AluFlag_i : in  STD_LOGIC;
           exe_AluOut_i : in  STD_LOGIC_VECTOR (15 downto 0);
			  exe_sreg_i : in  STD_LOGIC_VECTOR (3 downto 0);
			  mem_sreg_o : out  STD_LOGIC_VECTOR (3 downto 0);
           mem_WriteMemSel_o : out  STD_LOGIC_VECTOR (1 downto 0);
           mem_ReadMemSel_o : out  STD_LOGIC_VECTOR (1 downto 0);
           mem_BUnitSel_o : out  STD_LOGIC_VECTOR (2 downto 0);
           mem_WriteBackSel_o : out  STD_LOGIC_VECTOR (1 downto 0);
           mem_pc_o : out  STD_LOGIC_VECTOR (15 downto 0);
           mem_DestReg_o : out  STD_LOGIC_VECTOR (3 downto 0);
           mem_WriteData_o : out  STD_LOGIC_VECTOR (15 downto 0);
           mem_pcImm_o : out  STD_LOGIC_VECTOR (15 downto 0);
           mem_AluFlag_o : out  STD_LOGIC;
           mem_AluOut_o : out  STD_LOGIC_VECTOR (15 downto 0);
			  clk : in  STD_LOGIC;
			  rst : in  STD_LOGIC);
end exe_mem_component;
architecture Behavioral of exe_mem_component is
begin
	process(clk,rst)
	begin
		if (rst = '0') then
				mem_WriteMemSel_o <= "00";
				mem_ReadMemSel_o<= "00";
				mem_BUnitSel_o <= "000";
				mem_WriteBackSel_o<= "00";
				mem_pc_o  <= "0000000000000000";
				mem_DestReg_o  <= "1111";
				mem_WriteData_o<= "0000000000000000";
				mem_pcImm_o  <= "0000000000000000";
				mem_AluFlag_o  <= '0';
				mem_AluOut_o   <="0000000000000000";				
			   mem_sreg_o <= "1111";
		elsif(clk'event and clk = '1') then
				mem_WriteMemSel_o <= exe_WriteMemSel_i;
				mem_ReadMemSel_o<= exe_ReadMemSel_i;	
				mem_BUnitSel_o <= exe_BUnitSel_i;
				mem_WriteBackSel_o<= exe_WriteBackSel_i;
				mem_pc_o  <= exe_pc_i;
				mem_DestReg_o  <= exe_DestReg_i;
				mem_WriteData_o<= exe_WriteData_i;
				mem_pcImm_o  <= exe_pcImm_i;
				mem_AluFlag_o  <= exe_AluFlag_i;
				mem_AluOut_o   <= exe_AluOut_i;				
			   mem_sreg_o <= exe_sreg_i ;
				
		end if;
	end process;


end Behavioral;

