.word 0x100 4
.word 0x101 1
.word 0x102 3
.word 0x103 6
.word 0x104 2
.word 0x105 2
.word 0x106 2
.word 0x107 4
.word 0x108 6
.word 0x109 5
.word 0x10A 7
.word 0x10B 2
.word 0x10C 3
.word 0x10D 0
.word 0x10E 7
.word 0x10F 1
.word 0x110 2
.word 0x111 4
.word 0x112 0
.word 0x113 9
.word 0x114 1
.word 0x115 6
.word 0x116 8
.word 0x117 3
.word 0x118 9
.word 0x119 8
.word 0x11A 3
.word 0x11B 2
.word 0x11C 7
.word 0x11D 1
.word 0x11E 4
.word 0x11F 3

				add $sp,$zero,$imm,1        
				sll $sp, $sp, $imm, 11		# set $sp = 1 << 11 = 2048
				add $sp,$sp,$imm,-5         # set place for five items
				sw $s2, $sp, $imm, 4        # save registers that will be re-writen
				sw $s1, $sp, $imm, 3        
				sw $s0, $sp, $imm, 2        
				sw $a1, $sp, $imm, 1 
				sw $a0, $sp, $imm, 0 
				add $s0,$zero,$imm, 0x100 #store matrix address
				add $s1,$zero,$imm, 0x110  
				add $s2,$zero,$imm, 0x120 
                add $t3,$zero,$zero,0   #set main counter that will count 16 iterations
				jal $imm,$zero,$zero,nextentry  #skip the reset step as we just started the iterations
reset:      	                          #reset colum position and append row
                add $s1,$zero,$imm, 0x110  #point again at the first column and row
				add $s0,$s0,$imm, 4        #append to the next row in A matrix

nextentry:      
                add $t1,$zero,$imm,0x114   
                beq $imm,$s1,$t1,reset     #check if we reached the last column in the multiplying matrix and jump to reset if needed
                add $t0,$zero,$imm,0       #reset counters and place 0 in t0, this reg will hold our temp sum of the calculations
                add $a0,$zero,$imm,0       #row counter
				add $a1,$zero,$imm,0       #colum counter
nextrow:		
         		lw $t1,$a0,$s1,0     #load the right entries while a0 and a1 are our offset
				lw $t2,$a1,$s0,0
				mul $t1,$t1,$t2,0   #multiply one row entry and one column entry
				add $t0,$t0,$t1,0   #sum the mult of the entries and save at t0
				add $a0,$a0,$imm,4  #append our counters/offsets to next row by a0 and next column by a1
				add $a1,$a1,$imm,1
				add $t1,$zero,$imm,4
				bne $imm,$a1,$t1,nextrow     #check if we are at the last row/colum for that entry or if we need to continue
				sw $t0,$t3,$s2,0                 #save and append output matrix entry
				add $s1,$s1,$imm,1            #append the multiplying matrix to the next column
				add $t3, $t3, $imm, 1         #append main counter
				add $t1,$zero,$imm,16
				bne $imm,$t3,$t1,nextentry   #check if we filled the output matrix 16 times if not we go back
				sw $a0, $sp, $imm, 0         #if we got here we finished multiplying and now we restore register and stack
				sw $a1, $sp, $imm, 1
				sw $s0, $sp, $imm, 2
				sw $s1, $sp, $imm, 3
				sw $s2, $sp, $imm, 4
				add $sp, $sp, $imm, 5
				halt $zero,$zero,$zero,0

