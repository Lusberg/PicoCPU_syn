# PicoCPU Calculator for Digilent Nexys 3 Spartan-6

PicoCPU calculator program by Tónis Lusmägi, TTÜ
PicoCPU code modified to run the calculator program by Tónis Lusmägi, TTÜ
Python Assembly translator script modified by Tónis Lusmägi, TTÜ

## Calculator functions

	ADD
	SUB
	AND (bitwise)
	OR 	(bitwise)

## Input bitwidth

	4 bits

## Output

	7 segment display shows result in decimals

## Build

	Add files into Xilinx ISE new project:
		PicoCPU_VHDL folder files
		constraints.ucf
		Debouncer.vhd
		TopLevel.vhd
		VectorToSevenSeg.vhd
	Synthezise in ISE
	Generate Bitstream
	Program Digilent Nexys 3 Spartan 6 with the bitstream:
		open terminal in project folder
		$ djtgcfg enum
		$ djtgcfg init -d Nexys3
		$ djtgcfg prog -d Nexys3 -f TopLevel.bit -i 0

## Use

![](/assets/Digilent_Nexys_3_Spartan-6_PicoCPU_calculator.png?raw=true)

## Python Assembly translator script

	machine_script folder contains a script to convert instructions into machinecode.


## Credits

1. **PicoCPU** by Siavoosh Payandeh Azad, TTÜ
https://ati.ttu.ee/wiki/e/index.php/Non-Pipelined_Version
2. **Python Assembly translator script:** by Karl Janson, TTÜ
https://ati.ttu.ee/wiki/e/index.php/More_Advanced_CPU
3. **Nexys 3 Spartan-6 pic:** Digilent Inc.
https://www.flickr.com/photos/127815101@N07/15587277163