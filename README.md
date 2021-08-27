
# Computer Architecture Course - Final Project - CPU-Simulator


## SUMMARY

Basic Assembler and Simulator programs for a simplified MIPS architecture processor

The Simulator implements Arithmetic, Branching, and I/O instructions, Interrupts derived from devices and user-generated,
and interconnection between CPU and I/O devices  

The project is comprised of 3 parts: Assembly Files, Assembler program, and Simulator Program.
Both the Assembler and Simulator are implemented in C language

Lines of code: ~1800


## FLOW

1. The Assembler recieves an Assembly file which its content corresspond to the CPU's ISA (further description in '_ISA & Memory_' section)
For your Convenience, several Assembly files with different functionality are provided.
2. The Assembler translates the Assembly language to machine language instructions and outputs two txt files - Instrucion Memory
and Data Memory files
3. The Simulator recieves the output from the Assembler along with additional input files (further description in the '_files_' section)
and simulates a fetch-decode-excecute loop according to the input files
4. The Simulator generates txt files which provide overall extensive information regarding CPU and I/O devices state at each cycle 
 
 

>![image](https://user-images.githubusercontent.com/72262159/128005071-bbc5d971-dd4c-4594-9bd3-bb8b59b24df5.png)

The files which are marked in red are the input files from the user and the files marked in green will
be created automatically by the Assembler and Simulator programs (descritption for each file is provided in the '_files_' segment below)



## BASIC SPECIFICATION
1. Clock Rate - 1024 cycles per second
2. Assembly Instrucions which utilize the $imm register - takes 2 cycles to complete; other Instrucions takes 1 cycle.
3. The CPU executes only a single instruction at a time


## CPU REGISTERS

The CPU contains 16 32-bit registers, as seen below:

  ![image](https://user-images.githubusercontent.com/72262159/128005564-030d1883-0201-4df7-bd23-88635a6d8e4a.png)


## ISA & MEMORY

Memory is divided between Instrucion Memory and Data Memory:
  1. Instruction memory is comprised of 1024 20-bit instructions (1024 instructions encoded to machine language)
  2. Data Memory is comprised of 4096 32-bit memory addresses


**Assembly Code to Machine Language**

The CPU has two instructions encoding formats:
  1. Instuctions which utilies the $imm register:
 
![image](https://user-images.githubusercontent.com/72262159/128008429-2065a264-f0cd-4f3d-838b-80675e405c08.png)

  2. Other Instructions:

![image](https://user-images.githubusercontent.com/72262159/128007915-c94f7b1f-3e34-47be-a30f-2085c6e23a82.png)

**Instructions Set and Enconding**

![image](https://user-images.githubusercontent.com/72262159/128018301-f9f1e0f8-1810-4cd5-8bc0-ded6247fa479.png)


## I/O DEVICES
The CPU is connected to the following I/O devices - leds, screen, timer, and hard-drive

The proccessor is a dedicated I/O processor - each device has its own I/O register and the CPU is able to communicate with these registers using the 'in' and 'out' I/O commands. below are the I/O registers and their encodings:

![image](https://user-images.githubusercontent.com/72262159/128021392-f5402533-8c17-48aa-91c3-c535c1e7bc7f.png)

**Computer Screen**

The CPU is connected to a 352x288 monochromatic computer screen. each pixel is repreented with 8 bits where 0 is black and 256 is white

 The screen has a 352x288 frame buffer which at any time will store the current screen state. at the beginning all values are set to 0

monitorx register contains the x coordinate where the cpu will change it's pixel value. equivallently to monitory register and y coordinate.
the monitordata register holds the pixel value which the CPU wishes to write

**Timer**

when changing the timerenable register value to 1 - the timer is activated. in each clock cycle where timer is enabled - timercurrent register's value is
incremented by 1

**Hard Drive**

The CPU is connected to 64KB hard-drive, comprised of 128 512-bytes sectors. The CPU uses DMA to copy a sector from main memory to disk and vice versa

It takes 1024 clock cycles to copy a sector which during this time the diskstatus register value will be 1 (indicating hard-drive is busy).  Upon reciving write/read command, the Assembly code must assure that the hard-drive is free to recieve a new command by checking the diskstatus register. 
after 1024 clock cycles, diskcmd and diskstatus registers' values will be set to zero



## INTERRUPTS
The CPU supports 3 types of interrupts, as detailed below:

**irq0 - Timer**

when timercurrent=timermax, irqstatus0 is set to 1 and timercurrent is reset to 0

**irq1 - Hard Drive**

when DMA is done copying a sector - irqstatus is set to 1

**irq2 - user-generated**

The simulator is provided by the user with the irq2in.txt file which specifies at which clock cycles an interrupt should occur

before carrying out each machine language instruction, the CPU examines the signals:
irq = (irq0enable & irq0status) | (irq1enable & irq1status) | (irq2enable & irq2status)
if irq  == 1, and the CPU is not currently using its interrupt service routine, the proccessor handles the signal, by moving the PC register to the address
stored in the irqhandler register while saving the original PC value in the irqreturn register
The Assembly code should reset the irqstatus registers.
terminating the interrupt service is done with the reti command, which will result in PC=irqreturn


## FILES
At the beginning of the simulation, PC=0. with each iteration, the simulator fetches the next instuction according to the PC, decodes it, and updates registers' state and other internal constitues of the program

The Simulator program will recieve the following files (files' path name) as command line arguments:

imemin.txt dmemin.txt diskin.txt irq2in.txt dmemout.txt regout.txt
trace.txt hwregtrace.txt cycles.txt leds.txt monitor.txt monitor.yuv diskout.txt

1. imemin.txt - 















 









