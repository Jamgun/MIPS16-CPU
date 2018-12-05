----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:06:27 12/03/2018 
-- Design Name: 
-- Module Name:    ram - Behavioral 
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

entity memory_component is
    Port ( clk : in  STD_LOGIC;
			  rst : in  STD_LOGIC;
           pc : in  STD_LOGIC_VECTOR (15 downto 0);
           wm : in  STD_LOGIC_VECTOR (1 downto 0);
           rm : in  STD_LOGIC_VECTOR (1 downto 0);
           Addr : in  STD_LOGIC_VECTOR (15 downto 0);
           writedata : in  STD_LOGIC_VECTOR (15 downto 0);
           readdata : out  STD_LOGIC_VECTOR (15 downto 0);           
			  IMout : out std_logic_vector (15 downto 0);
			  stall : out std_logic_vector (1 downto 0);
			  
			  Ram1OE : out std_logic;
			  Ram1WE : out std_logic;
			  Ram1EN : out std_logic;
			  Ram1Data : inout std_logic_vector (15 downto 0);
			  Ram1Addr : out std_logic_vector (17 downto 0);
			  
			  data_ready : in std_logic;
			  wrn : out std_logic;
			  rdn : out std_logic;
			  tbre : in std_logic;
			  tsre : in std_logic;			  
			  
			  Ram2OE : out std_logic;
			  Ram2WE : out std_logic;
			  Ram2EN : out std_logic;
			  Ram2Data : inout std_logic_vector (15 downto 0);
			  Ram2Addr : out std_logic_vector (17 downto 0)
			  
			  );
end memory_component;

architecture Behavioral of memory_component is
signal ram_stall : std_logic_vector(1 downto 0);--"00"DM2?¨®??¨²¡ä?,IM?¨¢Ram2;"01"DM¨®?Ram2,IM?Y¨ª¡ê,¨º?3?nop;"10"DM¨®?Ram1,IM¨®?Ram2?¨¢;"11"DM¨®?ram1?¨¢D¡ä¡ä??¨²¡ê?IM¨®?Ram2?¨¢
signal readdata_ram1 : std_logic_vector(15 downto 0);
signal readdata_ram2 : std_logic_vector(15 downto 0); --?a¨¢??a??readdata?¨¤¡ä|?3?¦Ì¦Ì??¨¦???¡ê

begin

	stall_control:process(rst, Addr, wm, rm)
	begin
		if(rst = '0')then
			ram_stall <= "00";
		else
			if(wm = "01" or rm = "01")then
				if(Addr >= "0100000000000000" and Addr < "1011111100000000")then
					ram_stall <= "01";
				elsif(Addr = "1011111100000000")then
					ram_stall <= "11";
				else
					ram_stall <= "10";
				end if;
			else
				ram_stall <= "00";
			end if;
		end if;
		stall <= ram_stall;
	end process;			

	Ram1WE_control:process(clk, rst, wm, rm, ram_stall)
	begin
		if(rst = '0')then
			Ram1WE <= '1';
		else
			if(ram_stall = "10")then
				if(rm = "01")then
					Ram1WE <= '1';
				elsif(wm = "01")then
					Ram1WE <= clk;				
				end if;
			else
				Ram1WE <= '1';
			end if;
		end if;			
	end process;

	rdn_control:process(clk, rst, rm, ram_stall)
	begin
		if(rst = '0')then
			rdn <= '1';
		else
			if(ram_stall = "11" and rm = "01")then
				rdn <= clk;
			else
				rdn <= '1';
			end if;
		end if;
	end process;
	wrn_control:process(clk, rst, wm, ram_stall)
	begin
		if(rst = '0')then
			wrn <= '1';
		else
			if(ram_stall = "11" and wm = "01")then
				wrn <= clk;
			else
				wrn <= '1';
			end if;
		end if;
	end process;
	
	
			
	
	Ram1_control:process(rst, Addr, rm, wm, writedata, ram_stall)
	begin
		if(rst = '0')then
			Ram1EN <= '0';
			Ram1OE <= '1';
			Ram1Addr <= (others => '0');
			Ram1Data <= (others => 'Z');
		else
			if(ram_stall = "10")then	--DM¨®?ram1
				Ram1Addr <= "00" & Addr;				
				if(rm = "01") then	--ram1?¨¢
					if(Addr = "1011111100000001")then	--¨¬?¨ºa¡ê??¨¢bf01??
						Ram1EN <= '0';
						Ram1OE <= '1';
						if ((data_ready = '1') and (tbre = '1') and (tsre= '1')) then 
							--¡ä??¨²¨ºy?Y?¨¦?¨¢D¡ä
							Ram1Data <= "0000000000000011";
						elsif ((tbre = '1') and (tsre= '1')) then  
							--¡ä??¨²¨ºy?Y???¨¦D¡ä
							Ram1Data <= "0000000000000001";
						elsif (data_ready = '1') then  
							--¡ä??¨²¨ºy?Y???¨¦?¨¢
							Ram1Data <= "0000000000000010";
						else 
							--¡ä??¨²¨ºy?Y2??¨¦?¨¢D¡ä
							Ram1Data <= (others => '0');
						end if; 
					else	--??¨ª¡§ram1?¨¢
						Ram1EN <= '0';
						Ram1OE <= '0';
						Ram1Data <= (others => 'Z');						
					end if;
					readdata_ram1 <= Ram1Data;
				elsif(wm = "01") then	--ram1D¡ä
					Ram1EN <= '0';
					Ram1OE <= '1';
					Ram1Data <= writedata;				
				end if;
			elsif(ram_stall = "11")then	--¡ä??¨²2¨´¡Á¡Â
				if(rm = "01")then	--?¨¢¡ä??¨²
					Ram1EN <= '1';
					Ram1OE <= '1';
					Ram1Data <= (others => 'Z');
					readdata_ram1 <= Ram1Data;
				elsif(wm = "01")then	--D¡ä¡ä??¨²
					Ram1EN <= '1';
					Ram1OE <= '1';
					Ram1Data <= writedata;
				end if;
			else	--2?¨®?ram1
				Ram1EN <= '0';
				Ram1OE <= '1';
				Ram1Addr <= (others => '0');
				Ram1Data <= (others => 'Z');
			end if;
		end if;	
	end process;
	
	Ram2WE_control:process(clk, rst, wm, rm, ram_stall)
	begin
		if(rst = '0')then
			Ram2WE <= '1';
		else
			if(ram_stall = "01")then --DM¨®?ram2?¨¢D¡ä
				if(rm = "01")then
					Ram2WE <= '1';
				elsif(wm = "01")then
					Ram2WE <= clk;				
				end if;
			elsif(ram_stall = "00" or ram_stall = "10" or ram_stall = "11")then	--IM¨®?ram2?¨¢
				Ram2WE <= '1';
			else
				Ram2WE <= '1';
			end if;
		end if;			
	end process;
	
	Ram2_control:process(rst, Addr, rm, wm, writedata, ram_stall, pc)
	begin
		if(rst = '0')then
			Ram2EN <= '0';
			Ram2OE <= '1';
			Ram2Addr <= (others => '0');
			Ram2Data <= (others => 'Z');
			IMout <= "0000100000000000";
		else
			if(ram_stall = "01")then	--DM¨®?ram2?¨¢D¡ä
				Ram2Addr <= "00" & Addr;
				IMout <= "0000100000000000";	--nop??¨¢?
				if(rm = "01") then	--ram2?¨¢
					Ram2EN <= '0';
					Ram2OE <= '0';
					Ram2Data <= (others => 'Z');
					readdata_ram2 <= Ram2Data;
				elsif(wm = "01") then	--ram2D¡ä
					Ram2EN <= '0';
					Ram2OE <= '1';
					Ram2Data <= writedata;				
				end if;
			elsif(ram_stall = "00" or ram_stall = "10" or ram_stall = "11")then	--IM¨®?ram2?¨¢
				Ram2Addr <= "00" & pc;
				Ram2EN <= '0';
				Ram2OE <= '0';
				Ram2Data <= (others => 'Z');
				IMout <= Ram2Data;
			else	--2?¨®?ram2(2?¨®|¦Ì?¡ä?¡ê?
				Ram2EN <= '0';
				Ram2OE <= '1';
				Ram2Addr <= (others => '0');
				Ram2Data <= (others => 'Z');
			end if;
		end if;	
	end process;
	
	readdata_control:process(rst, readdata_ram1, readdata_ram2, ram_stall)
	begin
		if(ram_stall = "01")then
			readdata <= readdata_ram2;
		elsif(ram_stall = "10" or ram_stall = "11")then
			readdata <= readdata_ram1;
		else
			readdata <= "0000000000000000";
		end if;
	end process;
	
	
end Behavioral;

