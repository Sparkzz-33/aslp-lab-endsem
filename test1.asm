main:
	li	$a0, 0
	jal	fib
	add	$a0, $v0, $zero
	li	$v0, 1
	syscall
	li	$v0, 10
	syscall

fib:
	addi	$sp, $sp, -12
	sw	$ra, 0($sp)
	sw	$s0, 4($sp)
	sw	$s1, 8($sp)
	addi	$s0, $a0, 0
	addi	$t0, $zero, 1
	beq	$s0, $t0, return1
	beq	$s0, $zero, return0
	addi	$a0, $s0, -1
	jal	fib
	add	$v0, $v0, $s0
	
exit:
	lw	$ra, 0($sp)
	lw	$s0, 4($sp)
	lw	$s1, 8($sp)
	addi	$sp, $sp,12
	jr	$ra
	
return1:
	li	$v0, 1
	j	exit
return0:
	li	$v0, 0
	j	exit
	

	
