	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r7, .L16
	ldr	r4, .L16+4
	ldr	r6, .L16+8
	ldr	fp, .L16+12
	ldr	r9, .L16+16
	ldr	sl, .L16+20
	ldr	r8, .L16+24
	mov	r5, #67108864
.L14:
	ldr	r1, [r4, #0]
	ldr	r2, [r5, #304]
	ldr	r3, [r6, #0]
	str	r1, [r7, #0]
	str	r2, [r4, #0]
	cmp	r3, #9
	ldrls	pc, [pc, r3, asl #2]
	b	.L2
.L13:
	.word	.L3
	.word	.L4
	.word	.L5
	.word	.L6
	.word	.L7
	.word	.L8
	.word	.L9
	.word	.L10
	.word	.L11
	.word	.L12
.L12:
	ldr	r3, .L16+28
	mov	lr, pc
	bx	r3
.L2:
	mov	lr, pc
	bx	sl
	mov	lr, pc
	bx	r8
	b	.L14
.L11:
	ldr	r3, .L16+32
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	sl
	mov	lr, pc
	bx	r8
	b	.L14
.L10:
	ldr	r3, .L16+36
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	sl
	mov	lr, pc
	bx	r8
	b	.L14
.L9:
	ldr	r3, .L16+40
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	sl
	mov	lr, pc
	bx	r8
	b	.L14
.L8:
	ldr	r3, .L16+44
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	sl
	mov	lr, pc
	bx	r8
	b	.L14
.L7:
	ldr	r3, .L16+48
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	sl
	mov	lr, pc
	bx	r8
	b	.L14
.L6:
	mov	lr, pc
	bx	r9
	mov	lr, pc
	bx	sl
	mov	lr, pc
	bx	r8
	b	.L14
.L5:
	mov	lr, pc
	bx	fp
	mov	lr, pc
	bx	sl
	mov	lr, pc
	bx	r8
	b	.L14
.L4:
	ldr	r3, .L16+52
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	sl
	mov	lr, pc
	bx	r8
	b	.L14
.L3:
	ldr	r3, .L16+56
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	sl
	mov	lr, pc
	bx	r8
	b	.L14
.L17:
	.align	2
.L16:
	.word	oldButtons
	.word	buttons
	.word	.LANCHOR0
	.word	levelOne
	.word	pause
	.word	waitForVblank
	.word	flipPage
	.word	l2Lose
	.word	l2Win
	.word	levelTwo
	.word	l2Instructions
	.word	l1Lose
	.word	l1Win
	.word	l1Instructions
	.word	splash
	.size	main, .-main
	.global	state
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	prevState,4,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	state, %object
	.size	state, 4
state:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
