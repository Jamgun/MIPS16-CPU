----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:11:43 12/04/2018 
-- Design Name: 
-- Module Name:    vga - Behavioral 
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
library	ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity vga is
	port (
		reset	: in  std_logic;
		CLK_in	: in  std_logic;			--50M时钟输入

	-- data
		r0, r1, r2, r3, r4,r5,r6,r7 : in std_logic_vector(15 downto 0);
		data : in std_logic_vector(15 downto 0);
		
	--VGA Side
		hs,vs	: out std_logic;		--行同步、场同步信号
		oRed	: out std_logic_vector (2 downto 0);
		oGreen : out std_logic_vector (2 downto 0);
		oBlue	: out std_logic_vector (2 downto 0)
	);		
end entity vga;

architecture behave of vga is

COMPONENT fontRom
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END COMPONENT;


	signal CLK,CLK_2	: std_logic;
	signal rt,gt,bt	: std_logic_vector (2 downto 0);
	signal hst,vst	: std_logic;
	signal x		: std_logic_vector (9 downto 0);		--X坐标
	signal y		: std_logic_vector (8 downto 0);		--Y坐标
	
	shared variable dx : integer range 0 to 7;
	shared variable inty,tmp : integer range 0 to 500;
	signal romAddr :  std_logic_vector(10 downto 0);
	signal romData :  std_logic_vector(7 downto 0);
	
begin

fontRom_component : fontRom
  PORT MAP (
    clka => CLK_in,
    addra => romAddr,
    douta => romData
  );
  
  
CLK<=CLK_2;
 -----------------------------------------------------------------------
	process (CLK_in)
	begin
		if CLK_in'event and CLK_in = '1' then	--对50M输入信号二分频
			CLK_2 <= not CLK_2;
		end if;
	end process;
		

 -----------------------------------------------------------------------
	process (CLK, reset)	--行区间像素数（含消隐区）
	begin
		if reset = '0' then
			x <= (others => '0');
		elsif CLK'event and CLK = '1' then
			if x = 799 then
				x <= (others => '0');
			else
				x <= x + 1;
			end if;
		end if;
	end process;

  -----------------------------------------------------------------------
	 process (CLK, reset)	--场区间行数（含消隐区）
	 begin
	  	if reset = '0' then
	   		y <= (others => '0');
	  	elsif CLK'event and CLK = '1' then
	   		if x = 799 then
	    		if y = 524 then
	     			y <= (others => '0');
	    		else
	     			y <= y + 1;
	    		end if;
	   		end if;
	  	end if;
	 end process;
 
  -----------------------------------------------------------------------
	 process (CLK, reset)	--行同步信号产生（同步宽度96，前沿16）
	 begin
		  if reset = '0' then
		   hst <= '1';
		  elsif CLK'event and CLK = '1' then
		   	if x >= 656 and x < 752 then
		    	hst <= '0';
		   	else
		    	hst <= '1';
		   	end if;
		  end if;
	 end process;
 
 -----------------------------------------------------------------------
	 process (CLK, reset)	--场同步信号产生（同步宽度2，前沿10）
	 begin
	  	if reset = '0' then
	   		vst <= '1';
	  	elsif CLK'event and CLK = '1' then
	   		if y >= 490 and y< 492 then
	    		vst <= '0';
	   		else
	    		vst <= '1';
	   		end if;
	  	end if;
	 end process;
 -----------------------------------------------------------------------
	 process (CLK, reset)	--行同步信号输出
	 begin
	  	if reset = '0' then
	   		hs <= '0';
	  	elsif CLK'event and CLK = '1' then
	   		hs <=  hst;
	  	end if;
	 end process;

 -----------------------------------------------------------------------
	 process (CLK, reset)	--场同步信号输出
	 begin
	  	if reset = '0' then
	   		vs <= '0';
	  	elsif CLK'event and CLK='1' then
	   		vs <=  vst;
	  	end if;
	 end process;

-----------------------------------------------------------------------
	process(reset,clk,x,y) -- XY坐标定位控制
	begin  
		if reset='0' then
			        rt   <= "000";
					gt	<= "000";
					bt	<= "000";	
		elsif(clk'event and clk='1')then
		
			if (x >= 39 and x <= 47) then
				if (y >= 64 and y <= 71) or (y >= 80 and y <= 87) or (y >= 96 and y <= 103) or (y >= 112 and y <= 119)
					or (y >= 128 and y <= 135) or (y >= 144 and y <= 151) or (y >= 160 and y <= 167) or (y >= 176 and y<= 183)
					then
					if x = 39 then
						inty := conv_integer(y);
						romAddr <= conv_std_logic_vector(82 * 8 + inty mod 8,11);--R
					else
						dx := 7 - (conv_integer(x) - 40);
						rt <= (others => romData(dx));
						gt <= (others => romData(dx));
						bt <= (others => romData(dx));
					end if;
				else
					rt <= (others => '0');
					gt <= (others => '0');
					bt <= (others => '0');
				end if;
			elsif (x >= 49 and x <= 57) then
				if (y >= 64 and y <= 71) or (y >= 80 and y <= 87) or (y >= 96 and y <= 103) or (y >= 112 and y <= 119)
					or (y >= 128 and y <= 135) or (y >= 144 and y <= 151) or (y >= 160 and y <= 167) or (y >= 176 and y<= 183)
					then -- 0 ~ 7
					if (x = 49) then
						inty := conv_integer(y);
						romAddr <= conv_std_logic_vector(((inty - 64) / 16  + 48) * 8 + inty mod 8, 11);
					else
						dx := 7 - (conv_integer(x) - 50);
						rt <= (others => romData(dx));
						gt <= (others => romData(dx));
						bt <= (others => romData(dx));
					end if;
				else
					rt <= (others => '0');
					gt <= (others => '0');
					bt <= (others => '0');
				end if;
			elsif (x >= 69 and x <= 77) then
				if (y >= 64 and y <= 71) then -- r0 3
					if (x = 69) then 
						inty := conv_integer(y);
						tmp := conv_integer(r0(15 downto 12));
						if ( tmp <= 9) then
							romAddr <= conv_std_logic_vector( (tmp + 48) * 8 + inty mod 8,11);
						else 
							romAddr <= conv_std_logic_vector((tmp - 10 + 65) * 8 + inty mod 8, 11);
						end if;
					else
						dx := 7 - (conv_integer(x) - 70);
						rt <= (others => romData(dx));
						gt <= (others => romData(dx));
						bt <= (others => romData(dx));
					end if;
				elsif (y >= 80 and y <= 87) then --r1 3
					if (x = 69) then 
						inty := conv_integer(y);
						tmp := conv_integer(r1(15 downto 12));
						if ( tmp <= 9) then
							romAddr <= conv_std_logic_vector( (tmp + 48) * 8 + inty mod 8,11);
						else 
							romAddr <= conv_std_logic_vector((tmp - 10 + 65) * 8 + inty mod 8, 11);
						end if;
					else
						dx := 7 - (conv_integer(x) - 70);
						rt <= (others => romData(dx));
						gt <= (others => romData(dx));
						bt <= (others => romData(dx));
					end if;
				elsif (y >= 96 and y<= 103) then --r2 3
					if (x = 69) then 
						inty := conv_integer(y);
						tmp := conv_integer(r2(15 downto 12));
						if ( tmp <= 9) then
							romAddr <= conv_std_logic_vector( (tmp + 48) * 8 + inty mod 8,11);
						else 
							romAddr <= conv_std_logic_vector((tmp - 10 + 65) * 8 + inty mod 8, 11);
						end if;
					else
						dx := 7 - (conv_integer(x) - 70);
						rt <= (others => romData(dx));
						gt <= (others => romData(dx));
						bt <= (others => romData(dx));
					end if;
				elsif (y >= 112 and y<= 119) then -- r3 3
					if (x = 69) then 
						inty := conv_integer(y);
						tmp := conv_integer(r3(15 downto 12));
						if ( tmp <= 9) then
							romAddr <= conv_std_logic_vector( (tmp + 48) * 8 + inty mod 8,11);
						else 
							romAddr <= conv_std_logic_vector((tmp - 10 + 65) * 8 + inty mod 8, 11);
						end if;
					else
						dx := 7 - (conv_integer(x) - 70);
						rt <= (others => romData(dx));
						gt <= (others => romData(dx));
						bt <= (others => romData(dx));
					end if;
				elsif (y >= 128 and y<= 135) then --r4 3
					if (x = 69) then 
						inty := conv_integer(y);
						tmp := conv_integer(r4(15 downto 12));
						if ( tmp <= 9) then
							romAddr <= conv_std_logic_vector( (tmp + 48) * 8 + inty mod 8,11);
						else 
							romAddr <= conv_std_logic_vector((tmp - 10 + 65) * 8 + inty mod 8, 11);
						end if;
					else
						dx := 7 - (conv_integer(x) - 70);
						rt <= (others => romData(dx));
						gt <= (others => romData(dx));
						bt <= (others => romData(dx));
					end if;
				elsif (y >= 144 and y <= 151) then -- r5 3
					if (x = 69) then 
						inty := conv_integer(y);
						tmp := conv_integer(r5(15 downto 12));
						if ( tmp <= 9) then
							romAddr <= conv_std_logic_vector( (tmp + 48) * 8 + inty mod 8,11);
						else 
							romAddr <= conv_std_logic_vector((tmp - 10 + 65) * 8 + inty mod 8, 11);
						end if;
					else
						dx := 7 - (conv_integer(x) - 70);
						rt <= (others => romData(dx));
						gt <= (others => romData(dx));
						bt <= (others => romData(dx));
					end if;
				elsif (y >= 160 and y <= 167) then -- r6 3
					if (x = 69) then 
						inty := conv_integer(y);
						tmp := conv_integer(r6(15 downto 12));
						if ( tmp <= 9) then
							romAddr <= conv_std_logic_vector( (tmp + 48) * 8 + inty mod 8,11);
						else 
							romAddr <= conv_std_logic_vector((tmp - 10 + 65) * 8 + inty mod 8, 11);
						end if;
					else
						dx := 7 - (conv_integer(x) - 70);
						rt <= (others => romData(dx));
						gt <= (others => romData(dx));
						bt <= (others => romData(dx));
					end if;
				elsif (y >= 176 and y <= 183) then -- r7 3
					if (x = 69) then 
						inty := conv_integer(y);
						tmp := conv_integer(r7(15 downto 12));
						if ( tmp <= 9) then
							romAddr <= conv_std_logic_vector( (tmp + 48) * 8 + inty mod 8,11);
						else 
							romAddr <= conv_std_logic_vector((tmp - 10 + 65) * 8 + inty mod 8, 11);
						end if;
					else
						dx := 7 - (conv_integer(x) - 70);
						rt <= (others => romData(dx));
						gt <= (others => romData(dx));
						bt <= (others => romData(dx));
					end if;
				else 
					rt <= (others => '0');
					gt <= (others => '0');
					bt <= (others => '0');
				end if;
			elsif (x >= 79 and x <= 87) then
				if (y >= 64 and y <= 71) then -- r0 2
					if (x = 79) then 
						inty := conv_integer(y);
						tmp := conv_integer(r0(11 downto 8));
						if ( tmp <= 9) then
							romAddr <= conv_std_logic_vector( (tmp + 48) * 8 + inty mod 8,11);
						else 
							romAddr <= conv_std_logic_vector((tmp - 10 + 65) * 8 + inty mod 8, 11);
						end if;
					else
						dx := 7 - (conv_integer(x) - 80);
						rt <= (others => romData(dx));
						gt <= (others => romData(dx));
						bt <= (others => romData(dx));
					end if;
				elsif (y >= 80 and y <= 87) then --r1 2
					if (x = 79) then 
						inty := conv_integer(y);
						tmp := conv_integer(r1(11 downto 8));
						if ( tmp <= 9) then
							romAddr <= conv_std_logic_vector( (tmp + 48) * 8 + inty mod 8,11);
						else 
							romAddr <= conv_std_logic_vector((tmp - 10 + 65) * 8 + inty mod 8, 11);
						end if;
					else
						dx := 7 - (conv_integer(x) - 80);
						rt <= (others => romData(dx));
						gt <= (others => romData(dx));
						bt <= (others => romData(dx));
					end if;
				elsif (y >= 96 and y<= 103) then --r2 2
					if (x = 79) then 
						inty := conv_integer(y);
						tmp := conv_integer(r2(11 downto 8));
						if ( tmp <= 9) then
							romAddr <= conv_std_logic_vector( (tmp + 48) * 8 + inty mod 8,11);
						else 
							romAddr <= conv_std_logic_vector((tmp - 10 + 65) * 8 + inty mod 8, 11);
						end if;
					else
						dx := 7 - (conv_integer(x) - 80);
						rt <= (others => romData(dx));
						gt <= (others => romData(dx));
						bt <= (others => romData(dx));
					end if;
				elsif (y >= 112 and y<= 119) then -- r3 2
					if (x = 79) then 
						inty := conv_integer(y);
						tmp := conv_integer(r3(11 downto 8));
						if ( tmp <= 9) then
							romAddr <= conv_std_logic_vector( (tmp + 48) * 8 + inty mod 8,11);
						else 
							romAddr <= conv_std_logic_vector((tmp - 10 + 65) * 8 + inty mod 8, 11);
						end if;
					else
						dx := 7 - (conv_integer(x) - 80);
						rt <= (others => romData(dx));
						gt <= (others => romData(dx));
						bt <= (others => romData(dx));
					end if;
				elsif (y >= 128 and y<= 135) then --r4 2
					if (x = 79) then 
						inty := conv_integer(y);
						tmp := conv_integer(r4(11 downto 8));
						if ( tmp <= 9) then
							romAddr <= conv_std_logic_vector( (tmp + 48) * 8 + inty mod 8,11);
						else 
							romAddr <= conv_std_logic_vector((tmp - 10 + 65) * 8 + inty mod 8, 11);
						end if;
					else
						dx := 7 - (conv_integer(x) - 80);
						rt <= (others => romData(dx));
						gt <= (others => romData(dx));
						bt <= (others => romData(dx));
					end if;
				elsif (y >= 144 and y <= 151) then -- r5 2
					if (x = 79) then 
						inty := conv_integer(y);
						tmp := conv_integer(r5(11 downto 8));
						if ( tmp <= 9) then
							romAddr <= conv_std_logic_vector( (tmp + 48) * 8 + inty mod 8,11);
						else 
							romAddr <= conv_std_logic_vector((tmp - 10 + 65) * 8 + inty mod 8, 11);
						end if;
					else
						dx := 7 - (conv_integer(x) - 80);
						rt <= (others => romData(dx));
						gt <= (others => romData(dx));
						bt <= (others => romData(dx));
					end if;
				elsif (y >= 160 and y <= 167) then -- r6 2
					if (x = 79) then 
						inty := conv_integer(y);
						tmp := conv_integer(r6(11 downto 8));
						if ( tmp <= 9) then
							romAddr <= conv_std_logic_vector( (tmp + 48) * 8 + inty mod 8,11);
						else 
							romAddr <= conv_std_logic_vector((tmp - 10 + 65) * 8 + inty mod 8, 11);
						end if;
					else
						dx := 7 - (conv_integer(x) - 80);
						rt <= (others => romData(dx));
						gt <= (others => romData(dx));
						bt <= (others => romData(dx));
					end if;
				elsif (y >= 176 and y <= 183) then -- r7 2
					if (x = 79) then 
						inty := conv_integer(y);
						tmp := conv_integer(r7(11 downto 8));
						if ( tmp <= 9) then
							romAddr <= conv_std_logic_vector( (tmp + 48) * 8 + inty mod 8,11);
						else 
							romAddr <= conv_std_logic_vector((tmp - 10 + 65) * 8 + inty mod 8, 11);
						end if;
					else
						dx := 7 - (conv_integer(x) - 80);
						rt <= (others => romData(dx));
						gt <= (others => romData(dx));
						bt <= (others => romData(dx));
					end if;
				else 
					rt <= (others => '0');
					gt <= (others => '0');
					bt <= (others => '0');
				end if;
			elsif (x >= 89 and x <= 97) then
				if (y >= 64 and y <= 71) then -- r0 1
					if (x = 89) then 
						inty := conv_integer(y);
						tmp := conv_integer(r0(7 downto 4));
						if ( tmp <= 9) then
							romAddr <= conv_std_logic_vector( (tmp + 48) * 8 + inty mod 8,11);
						else 
							romAddr <= conv_std_logic_vector((tmp - 10 + 65) * 8 + inty mod 8, 11);
						end if;
					else
						dx := 7 - (conv_integer(x) - 90);
						rt <= (others => romData(dx));
						gt <= (others => romData(dx));
						bt <= (others => romData(dx));
					end if;
				elsif (y >= 80 and y <= 87) then --r1 1
					if (x = 89) then 
						inty := conv_integer(y);
						tmp := conv_integer(r1(7 downto 4));
						if ( tmp <= 9) then
							romAddr <= conv_std_logic_vector( (tmp + 48) * 8 + inty mod 8,11);
						else 
							romAddr <= conv_std_logic_vector((tmp - 10 + 65) * 8 + inty mod 8, 11);
						end if;
					else
						dx := 7 - (conv_integer(x) - 90);
						rt <= (others => romData(dx));
						gt <= (others => romData(dx));
						bt <= (others => romData(dx));
					end if;
				elsif (y >= 96 and y<= 103) then --r2 1
					if (x = 89) then 
						inty := conv_integer(y);
						tmp := conv_integer(r2(7 downto 4));
						if ( tmp <= 9) then
							romAddr <= conv_std_logic_vector( (tmp + 48) * 8 + inty mod 8,11);
						else 
							romAddr <= conv_std_logic_vector((tmp - 10 + 65) * 8 + inty mod 8, 11);
						end if;
					else
						dx := 7 - (conv_integer(x) - 90);
						rt <= (others => romData(dx));
						gt <= (others => romData(dx));
						bt <= (others => romData(dx));
					end if;
				elsif (y >= 112 and y<= 119) then -- r3 1
					if (x = 89) then 
						inty := conv_integer(y);
						tmp := conv_integer(r3(7 downto 4));
						if ( tmp <= 9) then
							romAddr <= conv_std_logic_vector( (tmp + 48) * 8 + inty mod 8,11);
						else 
							romAddr <= conv_std_logic_vector((tmp - 10 + 65) * 8 + inty mod 8, 11);
						end if;
					else
						dx := 7 - (conv_integer(x) - 90);
						rt <= (others => romData(dx));
						gt <= (others => romData(dx));
						bt <= (others => romData(dx));
					end if;
				elsif (y >= 128 and y<= 135) then --r4 1
					if (x = 89) then 
						inty := conv_integer(y);
						tmp := conv_integer(r4(7 downto 4));
						if ( tmp <= 9) then
							romAddr <= conv_std_logic_vector( (tmp + 48) * 8 + inty mod 8,11);
						else 
							romAddr <= conv_std_logic_vector((tmp - 10 + 65) * 8 + inty mod 8, 11);
						end if;
					else
						dx := 7 - (conv_integer(x) - 90);
						rt <= (others => romData(dx));
						gt <= (others => romData(dx));
						bt <= (others => romData(dx));
					end if;
				elsif (y >= 144 and y <= 151) then -- r5 1
					if (x = 89) then 
						inty := conv_integer(y);
						tmp := conv_integer(r5(7 downto 4));
						if ( tmp <= 9) then
							romAddr <= conv_std_logic_vector( (tmp + 48) * 8 + inty mod 8,11);
						else 
							romAddr <= conv_std_logic_vector((tmp - 10 + 65) * 8 + inty mod 8, 11);
						end if;
					else
						dx := 7 - (conv_integer(x) - 90);
						rt <= (others => romData(dx));
						gt <= (others => romData(dx));
						bt <= (others => romData(dx));
					end if;
				elsif (y >= 160 and y <= 167) then -- r6 1
					if (x = 89) then 
						inty := conv_integer(y);
						tmp := conv_integer(r6(7 downto 4));
						if ( tmp <= 9) then
							romAddr <= conv_std_logic_vector( (tmp + 48) * 8 + inty mod 8,11);
						else 
							romAddr <= conv_std_logic_vector((tmp - 10 + 65) * 8 + inty mod 8, 11);
						end if;
					else
						dx := 7 - (conv_integer(x) - 90);
						rt <= (others => romData(dx));
						gt <= (others => romData(dx));
						bt <= (others => romData(dx));
					end if;
				elsif (y >= 176 and y <= 183) then -- r7 1
					if (x = 89) then 
						inty := conv_integer(y);
						tmp := conv_integer(r7(7 downto 4));
						if ( tmp <= 9) then
							romAddr <= conv_std_logic_vector( (tmp + 48) * 8 + inty mod 8,11);
						else 
							romAddr <= conv_std_logic_vector((tmp - 10 + 65) * 8 + inty mod 8, 11);
						end if;
					else
						dx := 7 - (conv_integer(x) - 90);
						rt <= (others => romData(dx));
						gt <= (others => romData(dx));
						bt <= (others => romData(dx));
					end if;
				else 
					rt <= (others => '0');
					gt <= (others => '0');
					bt <= (others => '0');
				end if;
			elsif (x >= 99 and x <= 107) then
				if (y >= 64 and y <= 71) then -- r0 0
					if (x = 99) then 
						inty := conv_integer(y);
						tmp := conv_integer(r0(3 downto 0));
						if ( tmp <= 9) then
							romAddr <= conv_std_logic_vector( (tmp + 48) * 8 + inty mod 8,11);
						else 
							romAddr <= conv_std_logic_vector((tmp - 10 + 65) * 8 + inty mod 8, 11);
						end if;
					else
						dx := 7 - (conv_integer(x) - 100);
						rt <= (others => romData(dx));
						gt <= (others => romData(dx));
						bt <= (others => romData(dx));
					end if;
				elsif (y >= 80 and y <= 87) then --r1 0
					if (x = 99) then 
						inty := conv_integer(y);
						tmp := conv_integer(r1(3 downto 0));
						if ( tmp <= 9) then
							romAddr <= conv_std_logic_vector( (tmp + 48) * 8 + inty mod 8,11);
						else 
							romAddr <= conv_std_logic_vector((tmp - 10 + 65) * 8 + inty mod 8, 11);
						end if;
					else
						dx := 7 - (conv_integer(x) - 100);
						rt <= (others => romData(dx));
						gt <= (others => romData(dx));
						bt <= (others => romData(dx));
					end if;
				elsif (y >= 96 and y<= 103) then --r2 0
					if (x = 99) then 
						inty := conv_integer(y);
						tmp := conv_integer(r2(3 downto 0));
						if ( tmp <= 9) then
							romAddr <= conv_std_logic_vector( (tmp + 48) * 8 + inty mod 8,11);
						else 
							romAddr <= conv_std_logic_vector((tmp - 10 + 65) * 8 + inty mod 8, 11);
						end if;
					else
						dx := 7 - (conv_integer(x) - 100);
						rt <= (others => romData(dx));
						gt <= (others => romData(dx));
						bt <= (others => romData(dx));
					end if;
				elsif (y >= 112 and y<= 119) then -- r3 0
					if (x = 99) then 
						inty := conv_integer(y);
						tmp := conv_integer(r3(3 downto 0));
						if ( tmp <= 9) then
							romAddr <= conv_std_logic_vector( (tmp + 48) * 8 + inty mod 8,11);
						else 
							romAddr <= conv_std_logic_vector((tmp - 10 + 65) * 8 + inty mod 8, 11);
						end if;
					else
						dx := 7 - (conv_integer(x) - 100);
						rt <= (others => romData(dx));
						gt <= (others => romData(dx));
						bt <= (others => romData(dx));
					end if;
				elsif (y >= 128 and y<= 135) then --r4 0
					if (x = 99) then 
						inty := conv_integer(y);
						tmp := conv_integer(r4(3 downto 0));
						if ( tmp <= 9) then
							romAddr <= conv_std_logic_vector( (tmp + 48) * 8 + inty mod 8,11);
						else 
							romAddr <= conv_std_logic_vector((tmp - 10 + 65) * 8 + inty mod 8, 11);
						end if;
					else
						dx := 7 - (conv_integer(x) - 100);
						rt <= (others => romData(dx));
						gt <= (others => romData(dx));
						bt <= (others => romData(dx));
					end if;
				elsif (y >= 144 and y <= 151) then -- r5 0
					if (x = 99) then 
						inty := conv_integer(y);
						tmp := conv_integer(r5(3 downto 0));
						if ( tmp <= 9) then
							romAddr <= conv_std_logic_vector( (tmp + 48) * 8 + inty mod 8,11);
						else 
							romAddr <= conv_std_logic_vector((tmp - 10 + 65) * 8 + inty mod 8, 11);
						end if;
					else
						dx := 7 - (conv_integer(x) - 100);
						rt <= (others => romData(dx));
						gt <= (others => romData(dx));
						bt <= (others => romData(dx));
					end if;
				elsif (y >= 160 and y <= 167) then -- r6 0
					if (x = 99) then 
						inty := conv_integer(y);
						tmp := conv_integer(r6(3 downto 0));
						if ( tmp <= 9) then
							romAddr <= conv_std_logic_vector( (tmp + 48) * 8 + inty mod 8,11);
						else 
							romAddr <= conv_std_logic_vector((tmp - 10 + 65) * 8 + inty mod 8, 11);
						end if;
					else
						dx := 7 - (conv_integer(x) - 100);
						rt <= (others => romData(dx));
						gt <= (others => romData(dx));
						bt <= (others => romData(dx));
					end if;
				elsif (y >= 176 and y <= 183) then -- r7 0
					if (x = 99) then 
						inty := conv_integer(y);
						tmp := conv_integer(r7(3 downto 0));
						if ( tmp <= 9) then
							romAddr <= conv_std_logic_vector( (tmp + 48) * 8 + inty mod 8,11);
						else 
							romAddr <= conv_std_logic_vector((tmp - 10 + 65) * 8 + inty mod 8, 11);
						end if;
					else
						dx := 7 - (conv_integer(x) - 100);
						rt <= (others => romData(dx));
						gt <= (others => romData(dx));
						bt <= (others => romData(dx));
					end if;
				else 
					rt <= (others => '0');
					gt <= (others => '0');
					bt <= (others => '0');
				end if;

			elsif x>=299 and x<=307 then
				if (y >= 128 and y<= 135) then 
					if (x = 299) then 
						inty := conv_integer(y);
						tmp := conv_integer(data(10 downto 0));
						if ( tmp < 48) then
							romAddr <= conv_std_logic_vector( (tmp + 64) * 8 + inty mod 8,11);
						else 
							romAddr <= conv_std_logic_vector((tmp) * 8 + inty mod 8, 11);
						end if;	
					else
						dx := 7 - (conv_integer(x) - 300);
						rt <= (others => romData(dx));
						gt <= (others => romData(dx));
						bt <= (others => romData(dx));
					end if;

				else
					rt <= (others => '0');
					gt <= (others => '0');
					bt <= (others => '0');
				end if;



			else
				rt <= (others => '0');
				gt <= (others => '0');
				bt <= (others => '0');
			end if;
			
		end if;		 
	end process;	

-----------------------------------------------------------------------
-----------------------------------------------------------------------
-----------------------------------------------------------------------
	process (hst, vst, rt, gt, bt)	--色彩输出
	begin
		if hst = '1' and vst = '1' then
			oRed	<= rt;
			oGreen	<= gt;
			oBlue	<= bt;
		else
			oRed	<= (others => '0');
			oGreen	<= (others => '0');
			oBlue	<= (others => '0');
		end if;
	end process;

end behave;
