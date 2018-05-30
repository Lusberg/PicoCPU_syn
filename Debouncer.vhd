--https://stackoverflow.com/questions/37667666/encoder-debounce-vhdl
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY Debouncer IS
GENERIC( counter_size  :  INTEGER := 20); --counter size (8 bits gives 51.6 us with 5MHz clock)
PORT(
clk     : IN  STD_LOGIC;  --input clock
bounce_a  : IN  STD_LOGIC;  --input signal to be debounced
result  : OUT STD_LOGIC); --debounced signal
END Debouncer;

ARCHITECTURE logic OF Debouncer IS
SIGNAL flipflops   : STD_LOGIC_VECTOR(1 DOWNTO 0); --input flip flops
SIGNAL counter_set : STD_LOGIC;                    --sync reset to zero
SIGNAL counter_out : STD_LOGIC_VECTOR(counter_size DOWNTO 0) := (OTHERS => '0'); --counter output
BEGIN

counter_set <= flipflops(0) xor flipflops(1);   --determine when to start/reset counter

PROCESS(clk) -- occurs within a clock event
BEGIN
IF(clk'EVENT and clk = '1') THEN -- can be rising_edge(clk)
flipflops(0) <= bounce_a;                   -- adresses the signal as a set value
  flipflops(1) <= flipflops(0);
  If(counter_set = '1') THEN                  --reset counter because input is changing
    counter_out <= (OTHERS => '0');           --set all bits to '0'
  ELSIF(counter_out(counter_size) = '0') THEN --stable input time is not yet met
    counter_out <= counter_out + 1;
  ELSE                                        --stable input time is met
    result <= flipflops(1);
  END IF;    
END IF;
END PROCESS;
END logic;