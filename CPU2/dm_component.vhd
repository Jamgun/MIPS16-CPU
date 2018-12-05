----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:32:04 11/30/2018 
-- Design Name: 
-- Module Name:    DM - Behavioral 
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

entity dm_component is
    Port ( WM : in  STD_LOGIC_VECTOR (1 downto 0);
           RM : in  STD_LOGIC_VECTOR (1 downto 0);
           Aluout : in  STD_LOGIC_VECTOR (15 downto 0);
           WD : in  STD_LOGIC_VECTOR (15 downto 0);
           RD : out  STD_LOGIC_VECTOR (15 downto 0);
			  clk : in	STD_LOGIC);
end dm_component;

architecture Behavioral of dm_component is
COMPONENT ram1
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END COMPONENT;
begin
	ram11 : ram1
	PORT MAP (
		clka => clk,
		wea =>"0",
		addra => Aluout(5 downto 0),
		dina => WD,
		douta => RD
	);

end Behavioral;

