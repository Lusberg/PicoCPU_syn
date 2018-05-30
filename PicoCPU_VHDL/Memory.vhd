library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.Numeric_Std.all;

entity Mem is 
  generic (BitWidth: integer);
  port ( RdAddress: in std_logic_vector (BitWidth-1 downto 0);
         Data_in: in std_logic_vector (BitWidth-1 downto 0);
			WrtAddress: in std_logic_vector (BitWidth-1 downto 0);
         clk: in std_logic;
         RW: in std_logic;
         rst: in std_logic;
			SW: in std_logic_vector (BitWidth-1 downto 0);
			BE: in std_logic; --button_enter
			SW_result: out std_logic_vector (BitWidth-1 downto 0);
         Data_Out: out std_logic_vector (BitWidth-1 downto 0) 
    );
end Mem;

architecture beh of Mem is

  type Mem_type is array (0 to (2**BitWidth)-1) of std_logic_vector(BitWidth-1 downto 0);
   signal Mem : Mem_type;
   
begin
  
 MemProcess: process(clk,rst) is

  begin
    if rst = '1' then 
      Mem<= ((others=> (others=>'0')));
    elsif rising_edge(clk) then
      if RW = '1' then
        Mem(to_integer(unsigned(WrtAddress(7 downto 0)))) <= Data_in;
      end if;
		Mem(1) <= "0000" & SW(7 downto 4); --operators
		Mem(2) <= "0000" & SW(3 downto 0); --operand
		Mem(3) <= "0000000" & BE; --enter button
    end if;
  end process MemProcess;

  Data_Out <= Mem(to_integer(unsigned(RdAddress(7 downto 0))));
  SW_result <= Mem(4);
end beh;