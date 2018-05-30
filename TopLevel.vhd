 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity TopLevel is
	port(
	 rst: in std_logic;
    clk: in std_logic;
	 ClkBttn: in std_logic ;
	 --ClockSrc: in std_logic;
	 LED_out: out std_logic;
	 AN: 			out std_logic_vector(3 downto 0);
    SevenSeg: 	out std_logic_vector(6 downto 0);
	 SW:			in std_logic_vector(7 downto 0);
	 BE: in std_logic;
	 FlagOutput: out std_logic_vector ( 3 downto 0)
	 );
end TopLevel;

architecture Behavioral of TopLevel is

component PicoCPU is
  port(
    rst: in std_logic;
    clk: in std_logic;
	 SW: in std_logic_vector (7 downto 0);
	 BE: in std_logic;
	 FlagOut: out std_logic_vector ( 3 downto 0);
	 output: out std_logic_vector ( 7 downto 0)
  );
end component;

component Debouncer is
    Port ( 
			clk : in  STD_LOGIC;
           bounce_a : in  STD_LOGIC;
           result : out  STD_LOGIC);
end component;

component VectorToSevenSeg is
port( clk: 			in std_logic;
		InputVector:in  std_logic_vector (7 downto 0);
		AN: 			out std_logic_vector(3 downto 0);
		SevenSeg: 	out std_logic_vector(6 downto 0)
);
end component;

signal ClkBtnout : STD_LOGIC;
signal SystemClk: std_logic;
signal BE_debounced: std_logic;
signal FlagOut: std_logic_vector (3 downto 0);
signal ALUVal: std_logic_vector (7 downto 0);
begin
--Debouncer_comp: Debouncer  port map (rst,clk,ClkBttn,ClkBtnout);

Debouncer_comp: Debouncer  port map (clk,BE,BE_debounced);

PicoCPU_comp: PicoCPU  port map (rst,SystemClk,SW,BE_debounced,FlagOut,ALUVal);
SevSeg_comp: VectorToSevenSeg port map (clk,ALUVal,AN,SevenSeg);
---------------------------------------------
--      Clock Source
---------------------------------------------
--process(clk,ClkBtnout,ClockSrc)begin
	--if(ClockSrc='1')then
		--SystemClk<= ClkBtnout;
	--else
		SystemClk<= clk;
	--end if;
--end process;

FlagOutput(3 downto 0) <= 	FlagOut;
LED_out <= BE;
end Behavioral;

