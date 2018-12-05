----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:35:04 11/30/2018 
-- Design Name: 
-- Module Name:    cpu1_component - Behavioral 
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

entity cpu1_component is
    Port ( 
	 --test
				test_inst_if : out std_logic_vector(15 downto 0);
	 
		rst : in  STD_LOGIC;
				clk : in  STD_LOGIC;
				Ram1OE : out std_logic;
			  Ram1WE : out std_logic;
			  Ram1EN : out std_logic;
			  Ram1Data : inout std_logic_vector (15 downto 0);
			  Ram1Addr : out std_logic_vector (17 downto 0);
			  L : out  STD_LOGIC_VECTOR (15 downto 0);
			  data_ready : in std_logic;
			  wrn : out std_logic;
			  rdn : out std_logic;
			  tbre : in std_logic;
			  tsre : in std_logic;			  
			  
			  Ram2OE : out std_logic;
			  Ram2WE : out std_logic;
			  Ram2EN : out std_logic;
			  Ram2Data : inout std_logic_vector (15 downto 0);
			  Ram2Addr : out std_logic_vector (17 downto 0);
			  
			  --vga
			  r0, r1, r2, r3, r4,r5,r6,r7 : out std_logic_vector(15 downto 0);
				vga_data : out std_logic_vector(15 downto 0)
				
			

);
end cpu1_component;

architecture Behavioral of cpu1_component is

--连接pc与之后模块的pc变量
signal pc_pc : STD_LOGIC_VECTOR(15 downto 0):= (others => '0');

--连接im与ifid模块的inst变量
signal inst_if : STD_LOGIC_VECTOR(15 downto 0):= (others => '0');

--连接ifid与之后模块的inst变量
signal id_inst : STD_LOGIC_VECTOR(15 downto 0):= (others => '0');

--连接newpc与之后模块的pc变量
signal if_pcnew : STD_LOGIC_VECTOR(15 downto 0):= (others => '0');

--连接pcadder4与之后模块的pc变量
signal if_pc4 : STD_LOGIC_VECTOR(15 downto 0);

--连接ctrl与之后模块的相关变量
signal id_AluSel1 :  STD_LOGIC_VECTOR (1 downto 0):= (others => '0');
signal id_AluSel2 :  STD_LOGIC_VECTOR (1 downto 0):= (others => '0');
signal id_AluCode :  STD_LOGIC_VECTOR (3 downto 0):= (others => '0');
signal id_WriteMem :  STD_LOGIC_VECTOR (1 downto 0):= (others => '0');
signal id_ReadMem :  STD_LOGIC_VECTOR (1 downto 0):= (others => '0');
signal id_BUnitSel :  STD_LOGIC_VECTOR (2 downto 0):= (others => '0');
signal id_WriteBackSel :  STD_LOGIC_VECTOR (1 downto 0):= (others => '0');
signal id_Reg1 :  STD_LOGIC_VECTOR (3 downto 0):= (others => '0');
signal id_Reg2 :  STD_LOGIC_VECTOR (3 downto 0):= (others => '0');

--连接extend与之后模块的相关变量
signal id_imm :  STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
signal id_rs :  STD_LOGIC_VECTOR (3 downto 0):= (others => '0');
signal id_rt :  STD_LOGIC_VECTOR (3 downto 0):= (others => '0');
signal id_dr :  STD_LOGIC_VECTOR (3 downto 0):= (others => '0');
signal exe_rs :  STD_LOGIC_VECTOR (3 downto 0):= (others => '0');
signal exe_rt :  STD_LOGIC_VECTOR (3 downto 0):= (others => '0');
--连接stall与之后模块的相关变量
signal id_pcwrite :   STD_LOGIC_VECTOR (1 downto 0):= (others => '0');
signal id_ifidstall :   STD_LOGIC_VECTOR (1 downto 0):= (others => '0');

--连接reg与之后模块的相关变量
signal id_R1D :  STD_LOGIC_VECTOR (15 downto 0):= (others => '0');		--读取的寄存器1的数据
signal id_R2D :  STD_LOGIC_VECTOR (15 downto 0):= (others => '0');		--读取的寄存器2的数据          
signal id_WD :  STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
signal id_sreg :  STD_LOGIC_VECTOR (3 downto 0):= (others => '1');
--连接ifid与之后模块的pc变量
signal id_pc : STD_LOGIC_VECTOR(15 downto 0):= (others => '0');

--连接idexe与之后模块的相关变量
signal exe_AluOp1Sel :  STD_LOGIC_VECTOR (1 downto 0):= (others => '0');
signal exe_AluOp2Sel :  STD_LOGIC_VECTOR (1 downto 0):= (others => '0');
signal exe_AluSel :  STD_LOGIC_VECTOR (3 downto 0):= (others => '0');
signal exe_WriteMemSel :  STD_LOGIC_VECTOR (1 downto 0):= (others => '0');
signal exe_ReadMemSel:   STD_LOGIC_VECTOR (1 downto 0):= (others => '0');
signal exe_BUnitSel :  STD_LOGIC_VECTOR (2 downto 0):= (others => '0');
signal exe_WriteBackSel :  STD_LOGIC_VECTOR (1 downto 0):= (others => '0');
signal exe_pc :  STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
signal exe_reg1data :  STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
signal exe_reg2data :  STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
signal exe_imm :  STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
signal exe_DestReg : STD_LOGIC_VECTOR (3 downto 0):= (others => '0');
signal exe_WriteData :  STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
signal exe_WriteData2 :  STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
signal exe_inst :  STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
signal exe_sreg :  STD_LOGIC_VECTOR (3 downto 0):= (others => '1');
signal exe_wbfor1sel :  STD_LOGIC_VECTOR (1 downto 0):= (others => '0');

--连接pcimm与之后模块的相关变量
signal  exe_pcimm :  STD_LOGIC_VECTOR (15 downto 0):= (others => '0');

--连接opmux与之后模块的相关变量
signal  exe_op1 :  STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
signal  exe_op2 :  STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
--连接opmux与之forward的相关变量
signal  exe_for1 :  STD_LOGIC_VECTOR (1 downto 0):= (others => '0');
signal  exe_for2 :  STD_LOGIC_VECTOR (1 downto 0):= (others => '0');

--连接opmux与之后模块的相关变量
signal exe_flag :  STD_LOGIC;
signal exe_aluout :   STD_LOGIC_VECTOR (15 downto 0):= (others => '0');

--连接exemem与之后模块的相关变量
signal mem_WriteMemSel :  STD_LOGIC_VECTOR (1 downto 0):= (others => '0');
signal mem_ReadMemSel :  STD_LOGIC_VECTOR (1 downto 0):= (others => '0');
signal mem_BUnitSel :  STD_LOGIC_VECTOR (2 downto 0):= (others => '0');
signal mem_WriteBackSel :  STD_LOGIC_VECTOR (1 downto 0):= (others => '0');
signal mem_pc :  STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
signal mem_DestReg :  STD_LOGIC_VECTOR (3 downto 0):= (others => '0');
signal mem_WriteData :  STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
signal mem_WriteData2 :  STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
signal mem_pcImm :  STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
signal mem_AluFlag :  STD_LOGIC:= '0';
signal mem_AluOut :  STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
signal mem_sreg :  STD_LOGIC_VECTOR (3 downto 0):= (others => '1');
signal mem_wbfor1sel :  STD_LOGIC_VECTOR (1 downto 0):= (others => '0');

--连接dm与之后模块的相关变量
signal mem_RD : STD_LOGIC_VECTOR (15 downto 0):= (others => '0');

--连接wdmux与之后模块的相关变量
signal mem_wd : STD_LOGIC_VECTOR (15 downto 0):= (others => '0');

--连接Bunit与之后模块的相关变量
signal mem_Bsel : STD_LOGIC_VECTOR (1 downto 0):= (others => '0');

--连接memwb与之后模块的相关变量
signal wb_DestReg:  STD_LOGIC_VECTOR (3 downto 0):= (others => '0');
signal wb_wd:  STD_LOGIC_VECTOR (15 downto 0):= (others => '0');

--连接datamux与之后模块的相关变量
signal wb_wbdata :  STD_LOGIC_VECTOR (15 downto 0):= (others => '0');

signal pc_stall2 :  STD_LOGIC_VECTOR (1 downto 0):= (others => '0');

signal clk_2 : STD_LOGIC:='0';


component pc_component
    Port ( if_newpc_i : in  STD_LOGIC_VECTOR (15 downto 0);
           if_newpc_o : out  STD_LOGIC_VECTOR (15 downto 0);
			  stall_i: in  STD_LOGIC_VECTOR (1 downto 0);
			  stall_i2: in  STD_LOGIC_VECTOR (1 downto 0);--结构冲突
			  clk : in  STD_LOGIC;
			  rst : in  STD_LOGIC);
end component;




component memory_component
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
end component;

component pcadder4_component
    Port ( PC : in  STD_LOGIC_VECTOR (15 downto 0);
           newPC : out  STD_LOGIC_VECTOR (15 downto 0);
			   rst : in  STD_LOGIC);
end component;

component newpc_mux
    Port ( PC4_IF_i : in  STD_LOGIC_VECTOR (15 downto 0);
           Imm_IF_i : in  STD_LOGIC_VECTOR (15 downto 0);
           AluOut_IF_i : in  STD_LOGIC_VECTOR (15 downto 0);
           PCmuxSel_IF_i : in  STD_LOGIC_VECTOR (1 downto 0);
           NewPC_IF_o : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component if_id_component
    Port ( if_pc_i : in  STD_LOGIC_VECTOR (15 downto 0);
           if_inst_i : in  STD_LOGIC_VECTOR (15 downto 0);
           id_pc_o : out  STD_LOGIC_VECTOR (15 downto 0);
           id_inst_o : out  STD_LOGIC_VECTOR (15 downto 0);
			  stall_i: in  STD_LOGIC_VECTOR (1 downto 0);
           clk : in  STD_LOGIC;
			  rst : in  STD_LOGIC);
end component;

component stall_component
    Port ( id_inst_i : in  STD_LOGIC_VECTOR (15 downto 0);
           id_pcwrite_o : out  STD_LOGIC_VECTOR (1 downto 0);
           id_ifidstall_o : out  STD_LOGIC_VECTOR (1 downto 0));
end component;

component control_component
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
end component;

component reg_component
    Port ( 
			  inst1 : in  STD_LOGIC_VECTOR (3 downto 0);		--寄存器1的代号	
           inst2 : in  STD_LOGIC_VECTOR (3 downto 0);		--寄存器1的代号
			  inst : in  STD_LOGIC_VECTOR (15 downto 0);
			  R1D : out  STD_LOGIC_VECTOR (15 downto 0);		--读取的寄存器1的数据
           R2D : out  STD_LOGIC_VECTOR (15 downto 0);		--读取的寄存器2的数据          
			  WBD : in  STD_LOGIC_VECTOR (15 downto 0);		--写回的数据
           WBR : in  STD_LOGIC_VECTOR (3 downto 0);		--写回寄存器 
				sreg : out  STD_LOGIC_VECTOR (3 downto 0);			  
			  send_out_data : out  STD_LOGIC_VECTOR (15 downto 0);		--写回的数据			  
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
end component;

component extend_component
    Port ( inst : in  STD_LOGIC_VECTOR (15 downto 0);
           imm : out  STD_LOGIC_VECTOR (15 downto 0);
           rs : out  STD_LOGIC_VECTOR (3 downto 0);
           rt : out  STD_LOGIC_VECTOR (3 downto 0);
           dr : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component id_exe_component
    Port ( id_AluOp1Sel_i : in  STD_LOGIC_VECTOR (1 downto 0);
           id_AluOp2Sel_i : in  STD_LOGIC_VECTOR (1 downto 0);
           id_AluSel_i : in  STD_LOGIC_VECTOR (3 downto 0);
           id_WriteMemSel_i : in  STD_LOGIC_VECTOR (1 downto 0);
           id_ReadMemSel_i : in  STD_LOGIC_VECTOR (1 downto 0);
           id_BUnitSel_i : in  STD_LOGIC_VECTOR (2 downto 0);
           id_WriteBackSel_i : in  STD_LOGIC_VECTOR (1 downto 0);
           id_pc_i : in  STD_LOGIC_VECTOR (15 downto 0);
			  id_rs_i : in  STD_LOGIC_VECTOR (3 downto 0);
           id_rt_i : in  STD_LOGIC_VECTOR (3 downto 0);
           id_reg1data_i : in  STD_LOGIC_VECTOR (15 downto 0);
           id_reg2data_i : in  STD_LOGIC_VECTOR (15 downto 0);
           id_imm_i : in  STD_LOGIC_VECTOR (15 downto 0);
           id_DestReg_i : in  STD_LOGIC_VECTOR (3 downto 0);
           id_WriteData_i : in  STD_LOGIC_VECTOR (15 downto 0);
			  id_sreg_i : in  STD_LOGIC_VECTOR (3 downto 0);
			  exe_sreg_o : out  STD_LOGIC_VECTOR (3 downto 0);
           exe_AluOp1Sel_o : out  STD_LOGIC_VECTOR (1 downto 0);
           exe_AluOp2Sel_o : out  STD_LOGIC_VECTOR (1 downto 0);
           exe_AluSel_o : out  STD_LOGIC_VECTOR (3 downto 0);
           exe_WriteMemSel_o : out  STD_LOGIC_VECTOR (1 downto 0);
           exe_ReadMemSel_o: out  STD_LOGIC_VECTOR (1 downto 0);
           exe_BUnitSel_o : out  STD_LOGIC_VECTOR (2 downto 0);
           exe_WriteBackSel_o : out  STD_LOGIC_VECTOR (1 downto 0);
           exe_pc_o : out  STD_LOGIC_VECTOR (15 downto 0);
			  exe_rs_i : out  STD_LOGIC_VECTOR (3 downto 0);
           exe_rt_i : out  STD_LOGIC_VECTOR (3 downto 0);
           exe_reg1data_o : out  STD_LOGIC_VECTOR (15 downto 0);
           exe_reg2data_o : out  STD_LOGIC_VECTOR (15 downto 0);
           exe_imm_o : out  STD_LOGIC_VECTOR (15 downto 0);
           exe_DestReg_o : out  STD_LOGIC_VECTOR (3 downto 0);
           exe_WriteData_o : out  STD_LOGIC_VECTOR (15 downto 0);
           id_inst_i : in  STD_LOGIC_VECTOR (15 downto 0);
           exe_inst_o : out  STD_LOGIC_VECTOR (15 downto 0);
			  clk : in  STD_LOGIC;
			  rst : in  STD_LOGIC);
end component;

component pcadderimm_component
    Port ( PC : in  STD_LOGIC_VECTOR (15 downto 0);
           imm : in  STD_LOGIC_VECTOR (15 downto 0);
           newPC : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component op1_mux
    Port ( RegData1_EXE_i : in  STD_LOGIC_VECTOR (15 downto 0);
           WriteBackData_EXE_forward_i : in  STD_LOGIC_VECTOR (15 downto 0);
			  WriteBackData_EXE_forward_i2 : in  STD_LOGIC_VECTOR (15 downto 0);--写回寄存器的数据
           AluSel1_EXE_i : in  STD_LOGIC_VECTOR (1 downto 0);
           ForwardSel1_EXE_i : in  STD_LOGIC_VECTOR (1 downto 0);
           AluOp1_EXE_o : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component op2_mux
    Port ( RegData2_EXE_i : in  STD_LOGIC_VECTOR (15 downto 0);
           WriteBackData_EXE_forward_i : in  STD_LOGIC_VECTOR (15 downto 0);
			  WriteBackData_EXE_forward_i2 : in  STD_LOGIC_VECTOR (15 downto 0);--写回寄存器的数据
           Imm_EXE_i : in  STD_LOGIC_VECTOR (15 downto 0);
           AluSel2_EXE_i : in  STD_LOGIC_VECTOR (1 downto 0);
           ForwardSel2_EXE_i : in  STD_LOGIC_VECTOR (1 downto 0);
           AluOp2_EXE_o : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component exe_wdmux
	    Port ( exe_wd_i : in  STD_LOGIC_VECTOR (15 downto 0);
           exe_wd_o : out  STD_LOGIC_VECTOR (15 downto 0);
           wb_wdfor_i : in  STD_LOGIC_VECTOR (15 downto 0);
           exe_for1sel_i : in  STD_LOGIC_VECTOR (1 downto 0));
end component;

component alu_component
    Port ( R1D : in  STD_LOGIC_VECTOR (15 downto 0);
           R2D : in  STD_LOGIC_VECTOR (15 downto 0);
           ALUcode : in  STD_LOGIC_VECTOR (3 downto 0);
           flag : out  STD_LOGIC;
           ALUout : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component forward_component 
    Port ( exe_rs_i : in  STD_LOGIC_VECTOR (3 downto 0);
           exe_rt_i : in  STD_LOGIC_VECTOR (3 downto 0);
           mem_dr_i : in  STD_LOGIC_VECTOR (3 downto 0);
			  wb_dr_i : in  STD_LOGIC_VECTOR (3 downto 0);
           mem_wbsel_i : in  STD_LOGIC_VECTOR (1 downto 0);
           exe_op1sel_o : out  STD_LOGIC_VECTOR (1 downto 0);
           exe_op2sel_o : out  STD_LOGIC_VECTOR (1 downto 0));
end component;

component wd_forward
    Port ( exe_sreg_i : in  STD_LOGIC_VECTOR (3 downto 0);
           mem_sreg_i : in  STD_LOGIC_VECTOR (3 downto 0);
           wb_dr_i : in  STD_LOGIC_VECTOR (3 downto 0);
           exe_forsel_o : out  STD_LOGIC_VECTOR (1 downto 0);
           mem_forsel_o : out  STD_LOGIC_VECTOR (1 downto 0));
end component;

component exe_mem_component
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
end component;



component mem_wdmux
    Port (mem_wd_i : in  STD_LOGIC_VECTOR (15 downto 0);
           mem_wd_o : out  STD_LOGIC_VECTOR (15 downto 0);
           wb_wdfor_i : in  STD_LOGIC_VECTOR (15 downto 0);
           mem_for2sel_i : in  STD_LOGIC_VECTOR (1 downto 0));
end component;

component branch_component
    Port ( BranchUnitSel_MEM_i : in  STD_LOGIC_VECTOR (2 downto 0);
           AluZeroFlag_MEM_i : in  STD_LOGIC;
           BSel_MEM_o : out  STD_LOGIC_VECTOR (1 downto 0));
end component;

component mem_wb_component
    Port ( mem_wd_i : in  STD_LOGIC_VECTOR (15 downto 0);
           mem_DestReg_i : in  STD_LOGIC_VECTOR (3 downto 0);
           wb_wd_o : out  STD_LOGIC_VECTOR (15 downto 0);
           wb_DestReg_o : out  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
			  rst : in  STD_LOGIC);
end component;

component  writeback_mux 
    Port ( AluOut_WB_i : in  STD_LOGIC_VECTOR (15 downto 0);--alu输入
           WriteBackData_WB_i : in  STD_LOGIC_VECTOR (15 downto 0);--WBD输入
           PC_WB_i : in  STD_LOGIC_VECTOR (15 downto 0);--PC输入
           WriteBackSel_WB_i : in  STD_LOGIC_VECTOR (1 downto 0);--控制信号
           WriteBackData_WB_o : out  STD_LOGIC_VECTOR (15 downto 0));--数据输出
end component;

begin	
	L<=inst_if;
	test_inst_if <= inst_if;
	pc: pc_component  port map( if_newpc_i=>if_pcnew,
           if_newpc_o=>pc_pc,
			  stall_i=>id_pcwrite,
			  stall_i2=>pc_stall2 ,
			  clk=>clk,
			  rst=>rst);

	memory : memory_component port map( clk => clk , 
			  rst =>rst,
           pc  => pc_pc,
           wm =>mem_WriteMemSel,
           rm=>mem_ReadMemSel ,
           Addr => mem_AluOut,
           writedata =>mem_WriteData2 ,
           readdata=>mem_RD ,         
			  IMout => inst_if,
			  stall =>pc_stall2 ,
			  
			  Ram1OE =>Ram1OE ,
			  Ram1WE=> Ram1WE,
			  Ram1EN =>Ram1EN,
			  Ram1Data =>Ram1Data,
			  Ram1Addr =>Ram1Addr,
			  
			  data_ready =>data_ready,
			  wrn=> wrn,
			  rdn =>rdn,
			  tbre =>tbre,
			  tsre=> tsre		,	  
			  
			  Ram2OE =>Ram2OE,
			  Ram2WE =>Ram2WE,
			  Ram2EN =>Ram2EN ,
			  Ram2Data =>Ram2Data,
			  Ram2Addr =>Ram2Addr 
			  
			  );

	
	pc_adder4 : pcadder4_component port map( PC =>pc_pc,
           newPC=>if_pc4,
			   rst=>rst);
	new_pc : newpc_mux port map( PC4_IF_i => if_pc4,
           Imm_IF_i=>mem_pcImm,
           AluOut_IF_i=>mem_AluOut,
           PCmuxSel_IF_i =>mem_Bsel,
           NewPC_IF_o =>if_pcnew);
			  
	stall : stall_component port map(  id_inst_i=>id_inst,
           id_pcwrite_o =>id_pcwrite,
           id_ifidstall_o =>id_ifidstall);
			  
			  
	if_id : if_id_component port map( if_pc_i=>pc_pc,
           if_inst_i=>inst_if,
           id_pc_o =>id_pc,
           id_inst_o=>id_inst,
			  stall_i=>id_ifidstall,
           clk=>clk,
			  rst=>rst);
			  
	 ctrl : control_component port map( Inst_Control_ID_i=>id_inst,
				  AluSel1_Control_ID_o=>id_AluSel1 ,
				  AluSel2_Control_ID_o=>id_AluSel2,
				  AluCode_Control_ID_o=>id_AluCode ,
				  WriteMem_Control_ID_o=>id_WriteMem,
				  ReadMem_Control_ID_o=>id_ReadMem,
				  BUnitSel_Control_ID_o=>id_BUnitSel,
				  WriteBackSel_Control_ID_o=>id_WriteBackSel,
				  Reg1_Control_ID_o=>id_Reg1,
				  Reg2_Control_ID_o=>id_Reg2);
	reg : reg_component port map( 
			  inst1=>id_Reg1,		--寄存器1的代号	
           inst2=>id_Reg2,		--寄存器1的代号
			  inst=>id_inst,
			  R1D=>id_R1D,		--读取的寄存器1的数据
           R2D=>id_R2D,	--读取的寄存器2的数据          
			  WBD=>wb_wd,		--写回的数据
           WBR=>wb_DestReg,		--写回寄存器  
			  sreg =>id_sreg,		  
			  send_out_data=>id_WD,		--写回的数据			  
			  rst=>rst,
           clk=>clk,
			  write_enable=>'1',
				reg0=>r0,
           reg1=>r1,
           reg2=>r2,
           reg3=>r3,
           reg4=>r4,
           reg5=>r5,
           reg6=>r6,
           reg7=>r7			  
			  );	
	extendimm : extend_component port map( inst=>id_inst,
           imm=>id_imm,
           rs=>id_rs,
           rt=>id_rt,
           dr=>id_dr);
	id_exe : id_exe_component port map( id_AluOp1Sel_i =>id_AluSel1,
           id_AluOp2Sel_i=>id_AluSel2,
           id_AluSel_i =>id_AluCode ,
           id_WriteMemSel_i=>id_WriteMem,
           id_ReadMemSel_i=>id_ReadMem,
           id_BUnitSel_i=>id_BUnitSel,
           id_WriteBackSel_i=>id_WriteBackSel,
           id_pc_i =>id_pc,
           id_reg1data_i=>id_R1D,	
           id_reg2data_i=>id_R2D,
			  id_rs_i =>id_rs,
           id_rt_i=>id_rt,
           id_imm_i => id_imm,
           id_DestReg_i=>id_dr,
           id_WriteData_i=>id_WD,
			  id_sreg_i =>id_sreg,
			  exe_sreg_o =>exe_sreg,
           exe_AluOp1Sel_o=>exe_AluOp1Sel,
           exe_AluOp2Sel_o=>exe_AluOp2Sel,
           exe_AluSel_o=>exe_AluSel,
           exe_WriteMemSel_o =>exe_WriteMemSel,
           exe_ReadMemSel_o=>exe_ReadMemSel,
           exe_BUnitSel_o=>exe_BUnitSel ,
           exe_WriteBackSel_o =>exe_WriteBackSel,
           exe_pc_o =>exe_pc,
           exe_reg1data_o =>exe_reg1data,
           exe_reg2data_o =>exe_reg2data,
			  exe_rs_i =>exe_rs,
           exe_rt_i=>exe_rt,
           exe_imm_o =>exe_imm,
           exe_DestReg_o =>exe_DestReg,
           exe_WriteData_o =>exe_WriteData ,
           id_inst_i =>id_inst,
           exe_inst_o =>exe_inst ,
			  clk=>clk,
			  rst =>rst);

	pc_adderimm : pcadderimm_component port map( PC =>exe_pc,
           imm  =>exe_imm,
           newPC=>exe_pcimm );
			 
	op1mux : op1_mux port map( RegData1_EXE_i=>exe_reg1data,
           WriteBackData_EXE_forward_i =>mem_wd,
			  WriteBackData_EXE_forward_i2=>wb_wd,
           AluSel1_EXE_i=>exe_AluOp1Sel,
           ForwardSel1_EXE_i =>exe_for1,
           AluOp1_EXE_o =>exe_op1);


	op2mux : op2_mux port map( RegData2_EXE_i=>exe_reg2data,
           WriteBackData_EXE_forward_i =>mem_wd,
			  WriteBackData_EXE_forward_i2=>wb_wd,
           Imm_EXE_i =>exe_imm,
           AluSel2_EXE_i =>exe_AluOp2Sel,
           ForwardSel2_EXE_i  =>exe_for2,
           AluOp2_EXE_o =>exe_op2);
		
	wdmux1 : exe_wdmux port map( exe_wd_i => exe_WriteData,
           exe_wd_o =>exe_WriteData2,
           wb_wdfor_i =>wb_wd,
           exe_for1sel_i =>exe_wbfor1sel);

	
	alu : alu_component port map( R1D =>exe_op1,
           R2D  =>exe_op2,
           ALUcode=>exe_AluSel,
           flag =>exe_flag ,
           ALUout =>exe_aluout );
			  
	forward  : forward_component port map( exe_rs_i =>exe_rs,
           exe_rt_i=>exe_rt,
           mem_dr_i =>mem_DestReg,
			  wb_dr_i=>wb_DestReg,
           mem_wbsel_i => mem_WriteBackSel ,
           exe_op1sel_o=>exe_for1,
           exe_op2sel_o=>exe_for2);
	
	wdforward : wd_forward port map( exe_sreg_i =>exe_sreg,
           mem_sreg_i =>mem_sreg,
           wb_dr_i=>wb_DestReg,
           exe_forsel_o =>exe_wbfor1sel,
           mem_forsel_o =>mem_wbfor1sel);

			  
	exe_mem : exe_mem_component port map( exe_WriteMemSel_i=>exe_WriteMemSel,
           exe_ReadMemSel_i=>exe_ReadMemSel,
           exe_BUnitSel_i =>exe_BUnitSel ,
           exe_WriteBackSel_i =>exe_WriteBackSel,
           exe_pc_i =>exe_pc,
           exe_DestReg_i =>exe_DestReg,
           exe_WriteData_i =>exe_WriteData2 ,
           exe_pcImm_i =>exe_pcimm ,
           exe_AluFlag_i=>exe_flag ,
           exe_AluOut_i =>exe_aluout ,
			  exe_sreg_i =>exe_sreg,
			  mem_sreg_o =>mem_sreg,
           mem_WriteMemSel_o =>mem_WriteMemSel,
           mem_ReadMemSel_o =>mem_ReadMemSel ,
           mem_BUnitSel_o => mem_BUnitSel ,
           mem_WriteBackSel_o => mem_WriteBackSel ,
           mem_pc_o =>mem_pc ,
           mem_DestReg_o =>mem_DestReg,
           mem_WriteData_o =>mem_WriteData ,
           mem_pcImm_o => mem_pcImm ,
           mem_AluFlag_o =>mem_AluFlag ,
           mem_AluOut_o => mem_AluOut,
			  clk =>clk,
			  rst=>rst);

	wdmux2 : mem_wdmux port map(mem_wd_i  =>mem_WriteData ,
           mem_wd_o =>mem_WriteData2 ,
           wb_wdfor_i =>wb_wd,
           mem_for2sel_i =>mem_wbfor1sel);
  
	writebackmux : writeback_mux port map( AluOut_WB_i =>mem_AluOut,--alu输入
           WriteBackData_WB_i =>mem_RD,--WBD输入
           PC_WB_i =>mem_pc,--PC输入
           WriteBackSel_WB_i =>mem_WriteBackSel ,--控制信号
           WriteBackData_WB_o =>mem_wd  );--数据输出
	
	
	branch : branch_component port map( BranchUnitSel_MEM_i =>mem_BUnitSel ,
           AluZeroFlag_MEM_i =>mem_AluFlag ,
           BSel_MEM_o =>mem_Bsel );
			  
	mem_wb : mem_wb_component port map(
           mem_wd_i => mem_wd,
           mem_DestReg_i =>mem_DestReg,
           wb_wd_o =>wb_wd,
           wb_DestReg_o =>wb_DestReg,
           clk =>clk,
			  rst=>rst);
			  

	--process(clk)
	--begin
	--	if clk'event and clk = '1' then
	--		clk_2 <= not clk_2;
	--	end if;
	--end process;
			  
			  



end Behavioral;

