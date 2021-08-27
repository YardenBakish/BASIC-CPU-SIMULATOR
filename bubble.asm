
			add $sp,$zero,$imm,1        
			sll $sp, $sp, $imm, 11		# set $sp = 1 << 11 = 2048
			add $sp,$sp,$imm,-3         # set place for 3 items 
		    sw $s1, $sp, $imm, 2
		    sw $s0, $sp, $imm, 1        # save registers that will be re-writen
		    sw $a0, $sp, $imm, 0 
			add $a0,$zero,$imm,1024		# get argument address
			add $s0,$zero,$zero,0		# set main counter will count till 16 which is the number of elements given
mainloop:
			add $s1,$zero,$zero,0		# set/reset offset  if secoundloop ended
secoundloop:
			lw  $t0,$a0,$s1,0			# read input data 
			add $t1,$s1,$imm,1			# get the next offset 
			lw  $t2,$a0,$t1,0			# read next number in array
			ble $imm,$t0,$t2,next		# we skip if the current number is less then the next one thus swap is not needed
			sw  $t0,$a0,$t1,0           # "else" swap is needed and is being done here
			sw  $t2,$a0,$s1,0			
next:							        # skip here swap is not needed
			add $s1,$s1,$imm,1			# append offset                                 		
			sub $t1,$imm,$s0,15			# the new ending index as each iteration "bubbles" the biggest number in the array upwards
			blt $imm,$s1,$t1,secoundloop	    # check if all taken data have been processed for a suitable location
			add $s0,$s0,$imm,1			# append main counter	
			add $t1,$imm,$zero,15
			blt $imm,$s0,$t1,mainloop	# check if all input data has been processed (main counter finished 16 iterations)
			sw $a0, $sp, $imm, 0        # restore arguments and stack
			sw $s0, $sp, $imm, 1
			sw $s1, $sp, $imm, 2
			add $sp, $sp, $imm, 3
			halt $zero,$zero,$zero,0	# exit



.word 1024 10
.word 1025 -11
.word 1026 80
.word 1027 -3
.word 1028 2000
.word 1029 0xffffffff
.word 1030 777
.word 1031 555
.word 1032 000
.word 1033 001
.word 1034 12
.word 1035 4000
.word 1036 11
.word 1037 13
.word 1038 80
.word 1039 99
