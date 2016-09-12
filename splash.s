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
	.file	"splash.c"
	.text
	.align	2
	.global	splash
	.type	splash, %function
splash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r4, #67108864
	ldr	r2, .L8
	ldr	r1, [r4, #304]
	mov	r3, #1024
	add	r3, r3, #4
	str	r1, [r2, #0]
	ldr	r0, .L8+4
	strh	r3, [r4, #0]	@ movhi
	ldr	r6, .L8+8
	ldr	r3, .L8+12
	mov	lr, pc
	bx	r3
	ldr	r5, .L8+16
	mov	lr, pc
	bx	r6
	ldr	r0, .L8+20
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r6
	ldr	r0, .L8+20
	mov	lr, pc
	bx	r5
	ldr	r2, .L8+24
	ldr	r3, [r2, #0]
	cmp	r3, #0
	beq	.L4
.L6:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L4:
	ldr	r3, [r4, #304]
	tst	r3, #8
	bne	.L4
	mov	r3, #1
	str	r3, [r2, #0]
	b	.L6
.L9:
	.align	2
.L8:
	.word	buttons
	.word	splashImagePal
	.word	flipPage
	.word	loadPalette
	.word	drawBackgroundImage4
	.word	splashImageBitmap
	.word	state
	.size	splash, .-splash
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
