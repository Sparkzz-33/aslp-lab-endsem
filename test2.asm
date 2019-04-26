.data
string1: .asciiz  "000001"
string2: .asciiz  "0100010100"
.text

main:
	li	$s0, 6
	li	$s1, 10
	la	$t0, string1
	la	$t1, string2
	li	$a0, 0
	li	$t2, 0
	li	$t3, 0
	li	$t6, 0
	j	loop1

loop1:
	li	$t7, 6
	li	$s2, 10
	beq	$t3, $s2, exit
	beq	$t6, $t7, exit1
	bgt	$t2, $s0, exit1
	lb	$t4, 0($t0)
	lb	$t5, 0($t1)
	beq	$t4, $t5, itr
	li	$t6, 0
	la	$t0, string1
	addi	$t1, $t1, 1
	addi	$t3, $t3, 1
	j	loop1

itr:
	addi	$t0, $t0, 1
	addi	$t1, $t1, 1
	addi	$t2, $t2, 1
	addi	$t6, $t6, 1
	addi	$t3, $t3, 1
	j	loop1

exit1:
	li	$a0, 1
	j	exit
exit:
	li	$v0, 1
	syscall
	jr	$31
