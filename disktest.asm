

			add $t0,$zero,$imm,0      # set sector counter 
			add $t1,$zero,$imm,6      
			add $t2,$zero,$imm,0      # address counter
isitready:  in  $t3,$zero,$imm,17     # check if the disk status is 0
            bne $imm,$t3,$zero,isitready # go back and check again
			add $t3,$zero,$imm,4
			beq $imm,$t0,$t3,xor	  # check if our counter==4 so we can go save our parity and finish
			out $t0,$imm,$zero,15     # set sector
			out $t2,$imm,$zero,16     # set buffer
			add $t3,$zero,$imm,14
			out $imm,$t3,$zero,1      # set disk cmd to read
			add $t0,$t0,$imm,1        # append counters
			add $t2,$t2,$imm,128	  # append counters
			jal $imm,$zero,$zero,isitready #jump back to check if disk is ready
xor:
			add $t0,$zero,$imm,128      # set address
nextsector:	add $t1,$zero,$imm,0
nextword:	lw  $t2,$zero,$t0,0         # load data that is now in the memory
			lw  $t3,$zero,$t1,0
			xor $t3,$t3,$t2,0           # use xor on the data and save it back
			sw  $t3,$zero,$t1,0         # we rewrite the data that first held the data from disk 1
			add $t0,$t0,$imm,1          # append address
			add $t1,$t1,$imm,1
			add $t2,$zero,$imm,128
			bne $imm,$t2,$t1,nextword   #check if need to read next word in a sector or go to other sector
			add $t2,$zero,$imm,512
			bne $imm,$t2,$t0,nextsector
isitready2: in  $t3,$zero,$imm,17       # check if the disk status is 0
            bne $imm,$t3,$zero,isitready2
			add $t2,$zero,$imm,4
			out $t2,$imm,$zero,15       # set sector
			out $zero,$imm,$zero,16     # set buffer
			add $t3,$zero,$imm,14
			out $imm,$t3,$zero,2        # set disk cmd to write
isitready3: in  $t3,$zero,$imm,17       # check if the disk status is 0 
            bne $imm,$t3,$zero,isitready3 # we wait for the disk to finish writing back before we leave
			halt $zero, $zero, $zero, 0	# halt
