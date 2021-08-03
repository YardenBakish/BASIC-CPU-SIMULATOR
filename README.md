
# Computer Architecture Course - Final Project - CPU-Simulator

## SUMMARY

Basic Assembler and Simulator programs for a simplified MIPS architecture processor

The Project implements simulation of Arithmetic, Branching, and I/O instructions, Interrupts derived from devices and user-generated,
and interconnection between CPU and I/O devices  

The project is comprised of 3 parts: Assembly Files, Assembler program, and Simulator Program.
Both the Assembler and Simulator are implemented in C language


## FLOW

1. The Assembler recieves an Assembly file which its content corresspondes to the CPU's ISA (further description in '_ISA & Memory_').
For your Convenience, several Assembly files with different functionality are provided.
2. The Assembler translates the Assembly language to machine lanagues instructions and outputs two txt files - Instrucion Memory
and Data Memory files
3. The Simulator recieves the output from the Assembler along with additional input files (further description in the '_files_' segment below)
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

Memory is divided between Instrucion Meomry and Data Memory:
  1. Instruction memory is comprised of 1024 20-bit instructions (1024 instrucions encoded to machine language)
  2. Data Memory is comprised of 4096 32-bit memory addressess


**Assembly Code to Machine Language**

The CPU has two instructions encoding formats:
  1. Instuctions which utilies the $imm register:
 
![image](https://user-images.githubusercontent.com/72262159/128008429-2065a264-f0cd-4f3d-838b-80675e405c08.png)

  2. Other Instructions:

![image](https://user-images.githubusercontent.com/72262159/128007915-c94f7b1f-3e34-47be-a30f-2085c6e23a82.png)

**Instructions Set and Econding**

![image](https://user-images.githubusercontent.com/72262159/128018301-f9f1e0f8-1810-4cd5-8bc0-ded6247fa479.png)







**INTERRUPTS**

**I/O DEVICES**
The CPU is connected to multiple I/O devices - leds, screen, and hard-drive.




