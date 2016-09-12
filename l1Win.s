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
	.file	"l1Win.c"
	.text
	.align	2
	.global	l1Win
	.type	l1Win, %function
l1Win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r4, #67108864
	ldr	r1, [r4, #304]
	ldr	r2, .L10
	mov	r3, #1024
	add	r3, r3, #4
	str	r1, [r2, #0]
	ldr	r0, .L10+4
	strh	r3, [r4, #0]	@ movhi
	ldr	r6, .L10+8
	ldr	r3, .L10+12
	mov	lr, pc
	bx	r3
	ldr	r5, .L10+16
	mov	lr, pc
	bx	r6
	ldr	r0, .L10+20
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r6
	ldr	r0, .L10+20
	mov	lr, pc
	bx	r5
	ldr	r2, .L10+24
	mov	r1, #2
	ldr	r3, [r2, #0]
	b	.L7
.L6:
	ldr	r3, [r4, #304]
	tst	r3, #1
	streq	r1, [r2, #0]
	ldr	r3, [r4, #304]
	tst	r3, #8
	beq	.L4
	ldr	r3, [r2, #0]
.L7:
	cmp	r3, #4
	beq	.L6
.L8:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L4:
	mov	r3, #6
	str	r3, [r2, #0]
	b	.L8
.L11:
	.align	2
.L10:
	.word	buttons
	.word	l1WinImagePal
	.word	flipPage
	.word	loadPalette
	.word	drawBackgroundImage4
	.word	l1WinImageBitmap
	.word	state
	.size	l1Win, .-l1Win
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
