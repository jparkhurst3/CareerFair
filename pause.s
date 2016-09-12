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
	.file	"pause.c"
	.text
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	mov	r4, #67108864
	ldr	r1, [r4, #304]
	ldr	r2, .L16
	mov	r3, #1024
	add	r3, r3, #4
	str	r1, [r2, #0]
	ldr	r0, .L16+4
	ldr	r6, .L16+8
	strh	r3, [r4, #0]	@ movhi
	ldr	r3, .L16+12
	mov	lr, pc
	bx	r3
	ldr	r5, .L16+16
	mov	lr, pc
	bx	r6
	ldr	r0, .L16+20
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r6
	ldr	r6, .L16+24
	ldr	r0, .L16+20
	mov	lr, pc
	bx	r5
	ldr	r3, [r6, #0]
	cmp	r3, #3
	ldr	r5, .L16+28
	ldr	r7, .L16+32
	bne	.L15
.L11:
	ldr	r3, [r4, #304]
	tst	r3, #1
	bne	.L3
	ldr	r3, [r5, #0]
	cmp	r3, #2
	beq	.L13
.L3:
	ldr	r3, [r4, #304]
	tst	r3, #1
	bne	.L11
	ldr	r3, [r5, #0]
	cmp	r3, #7
	bne	.L11
.L13:
	str	r3, [r6, #0]
	mov	lr, pc
	bx	r7
	ldr	r3, [r6, #0]
	cmp	r3, #3
	beq	.L11
.L15:
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	buttons
	.word	pauseImagePal
	.word	flipPage
	.word	loadPalette
	.word	drawBackgroundImage4
	.word	pauseImageBitmap
	.word	state
	.word	prevState
	.word	unpauseSound
	.size	pause, .-pause
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
