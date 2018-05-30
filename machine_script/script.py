import re
InstructionOpCode = {

                'Add_A_B':	"000000",
                'Add_A_Mem': 	"000001",
                'Add_A_Dir': 	"000010",
                'Sub_A_B':	"000011",
                'Sub_A_Mem':	"000100",
                'Sub_A_Dir': 	"000101",

                'IncA': 	"000110",
                'DecA':		"000111",

                'ShiftArithR':	"001000",
                'ShiftArithL':	"001001",
                'ShiftA_R':	"001010",
                'ShiftA_L':	"001011",
                'RRC':	  	"001100",
                'RLC':		"001101",

                'And_A_B':	"001110",
                'OR_A_B':	"001111",
                'XOR_A_B':	"010000",
                'FlipA':	"010001",
                'NegA':		"010010 ",

                'Jump':		"010011",
                'JmpZ':		"010100",
                'JmpOV':	"010101",
                'JmpC':		"010110",
                'Jmp_rel':	"010111",
                'JMPEQ':	"011000",

                'ClearZ':	"011001",
                'ClearOV':	"011010 ",
                'ClearC':	"011011",
                'ClearACC':	"011100",

                'LoadPC': 	"011101",
                'SavePC':	"011110",

                'Load_A_Mem':	"011111",
                'Store_A_Mem':	"100000",
                'Load_B_Dir':	"100001",
                'Load_B_Mem':	"100010",

                'Load_A_B':	"100011",
                'Load_B_A':	"100100",
                'Load_Ind_A ':	"100101",

                'PUSH':		"111100",
                'POP':		"111101",
                'NOP':		"111110",
                'HALT':		"111111",

}
AssemblyFile = open('Assembly.txt', 'r+')
MachineCodeFile = open('MachineCode.txt', 'w')
counter=0
for line in AssemblyFile:

    for key in InstructionOpCode:
        if key in line:
            operand = re.findall(r'\d+',line)[0]
            MachineCodeFile.write(str(counter)+ " =>   "+ "\""+InstructionOpCode[key]+operand+'\",'+'\n')
            counter +=1

MachineCodeFile.close()
AssemblyFile.close()
