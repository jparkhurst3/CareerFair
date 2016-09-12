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
	.file	"myLib.c"
	.text
	.align	2
	.global	setPixel3
	.type	setPixel3, %function
setPixel3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L2
	rsb	r0, r0, r0, asl #4
	add	r0, r1, r0, asl #4
	ldr	r3, [r3, #0]
	mov	r0, r0, asl #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L3:
	.align	2
.L2:
	.word	.LANCHOR0
	.size	setPixel3, .-setPixel3
	.align	2
	.global	drawRect3
	.type	drawRect3, %function
drawRect3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	cmp	r2, #0
	sub	sp, sp, #12
	ble	.L4
	ldr	ip, .L9
	rsb	r0, r0, r0, asl #4
	ldr	r4, [ip, #4]
	ldr	ip, [ip, #0]
	add	r1, r1, r0, asl #4
	add	r1, ip, r1, asl #1
	add	r0, r4, #36
	mov	ip, #0
	orr	r4, r3, #-2130706432
	add	r3, sp, #6
.L6:
	add	ip, ip, #1
	cmp	ip, r2
	str	r3, [r0, #0]
	str	r1, [r0, #4]
	str	r4, [r0, #8]
	add	r1, r1, #480
	bne	.L6
.L4:
	add	sp, sp, #12
	ldmfd	sp!, {r4}
	bx	lr
.L10:
	.align	2
.L9:
	.word	.LANCHOR0
	.size	drawRect3, .-drawRect3
	.align	2
	.global	drawImage3
	.type	drawImage3, %function
drawImage3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6}
	cmp	r3, #0
	ldr	r4, [sp, #12]
	ble	.L11
	ldr	r5, .L15
	rsb	r1, r1, r1, asl #4
	ldmia	r5, {r6, ip}	@ phole ldm
	add	r1, r2, r1, asl #4
	orr	r5, r4, #-2147483648
	add	ip, ip, #36
	mov	r4, r4, asl #1
	add	r1, r6, r1, asl #1
	mov	r2, #0
.L13:
	add	r2, r2, #1
	cmp	r2, r3
	str	r0, [ip, #0]
	str	r1, [ip, #4]
	add	r0, r0, r4
	str	r5, [ip, #8]
	add	r1, r1, #480
	bne	.L13
.L11:
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L16:
	.align	2
.L15:
	.word	.LANCHOR0
	.size	drawImage3, .-drawImage3
	.align	2
	.global	fillScreen3
	.type	fillScreen3, %function
fillScreen3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L18
	sub	sp, sp, #8
	ldmia	r3, {r0, r1}	@ phole ldm
	mov	r3, #-2130706432
	add	r2, r1, #36
	add	r3, r3, #38400
	add	ip, sp, #6
	str	ip, [r1, #36]
	str	r0, [r2, #4]
	str	r3, [r2, #8]
	add	sp, sp, #8
	bx	lr
.L19:
	.align	2
.L18:
	.word	.LANCHOR0
	.size	fillScreen3, .-fillScreen3
	.align	2
	.global	setPixel4
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r0, r0, r0, asl #4
	mov	r3, r0, asl #3
	ldr	r0, .L23
	add	ip, r1, r1, lsr #31
	add	r3, r3, ip, asr #1
	ldr	ip, [r0, #0]
	mov	r3, r3, asl #1
	tst	r1, #1
	ldrh	r1, [ip, r3]
	biceq	r1, r1, #255
	andne	r1, r1, #255
	orreq	r2, r2, r1
	orrne	r2, r1, r2, asl #8
	streqh	r2, [ip, r3]	@ movhi
	strneh	r2, [ip, r3]	@ movhi
	bx	lr
.L24:
	.align	2
.L23:
	.word	.LANCHOR0
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawRect4
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #44
	ldrb	r4, [sp, #80]	@ zero_extendqisi2
	cmp	r2, #0
	str	r2, [sp, #4]
	orr	r2, r4, r4, asl #8
	str	r4, [sp, #8]
	str	r1, [sp, #16]
	strh	r2, [sp, #38]	@ movhi
	ble	.L25
	rsb	r6, r0, r0, asl #4
	add	r7, r1, #1
	add	ip, r1, r1, lsr #31
	mov	r6, r6, asl #3
	add	r7, r7, r7, lsr #31
	add	r7, r6, r7, asr #1
	mov	r5, r0
	add	r6, r6, ip, asr #1
	add	r0, r3, r3, lsr #31
	ldr	ip, [sp, #16]
	mov	r0, r0, asr #1
	sub	r1, r0, #1
	sub	ip, ip, #1
	str	ip, [sp, #20]
	orr	r1, r1, #-2130706432
	mov	r2, r3, lsr #31
	str	r1, [sp, #28]
	ldr	r1, [sp, #20]
	add	fp, r3, r2
	ldr	r4, [sp, #16]
	and	fp, fp, #1
	mov	r7, r7, asl #1
	orr	r0, r0, #-2130706432
	add	r3, r1, r3
	and	r9, r4, #1
	ldr	sl, .L34
	str	r0, [sp, #12]
	rsb	fp, r2, fp
	mov	r6, r6, asl #1
	mov	r8, r7
	mov	r4, #0
	add	ip, sp, #38
	str	r3, [sp, #20]
	b	.L30
.L33:
	ldmia	sl, {r1, r2}	@ phole ldm
	add	r3, r2, #36
	str	ip, [r2, #36]
	ldr	r2, [sp, #12]
	add	r1, r1, r6
	cmp	fp, #1
	str	r1, [r3, #4]
	str	r2, [r3, #8]
	beq	.L32
.L28:
	ldr	r1, [sp, #4]
	add	r4, r4, #1
	cmp	r1, r4
	add	r5, r5, #1
	add	r8, r8, #240
	add	r7, r7, #240
	add	r6, r6, #240
	ble	.L25
.L30:
	cmp	r9, #0
	beq	.L33
	mov	r0, r5
	ldr	r1, [sp, #16]
	ldr	r2, [sp, #8]
	str	ip, [sp, #0]
	bl	setPixel4
	cmp	fp, #1
	mov	r0, r5
	ldr	r1, [sp, #20]
	ldr	r2, [sp, #8]
	ldr	ip, [sp, #0]
	bne	.L29
	ldmia	sl, {r1, r2}	@ phole ldm
	add	r1, r1, r8
	add	r3, r2, #36
	str	ip, [r2, #36]
	str	r1, [r3, #4]
	ldr	r1, [sp, #12]
	str	r1, [r3, #8]
	ldr	r1, [sp, #4]
	add	r4, r4, #1
	cmp	r1, r4
	add	r5, r5, #1
	add	r8, r8, #240
	add	r7, r7, #240
	add	r6, r6, #240
	bgt	.L30
.L25:
	add	sp, sp, #44
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L29:
	ldmia	sl, {r3, lr}	@ phole ldm
	add	r3, r3, r7
	str	r3, [sp, #24]
	str	ip, [lr, #36]
	add	r3, lr, #36
	ldr	lr, [sp, #24]
	str	lr, [r3, #4]
	ldr	lr, [sp, #28]
	str	lr, [r3, #8]
	str	ip, [sp, #0]
	bl	setPixel4
	ldr	ip, [sp, #0]
	b	.L28
.L32:
	mov	r0, r5
	ldr	r1, [sp, #20]
	ldr	r2, [sp, #8]
	str	ip, [sp, #0]
	bl	setPixel4
	ldr	ip, [sp, #0]
	b	.L28
.L35:
	.align	2
.L34:
	.word	.LANCHOR0
	.size	drawRect4, .-drawRect4
	.align	2
	.global	fillScreen4
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L37
	sub	sp, sp, #8
	ldmia	r3, {r0, r1}	@ phole ldm
	mov	r3, #-2130706432
	add	r2, r1, #36
	add	r3, r3, #19200
	add	ip, sp, #6
	str	ip, [r1, #36]
	str	r0, [r2, #4]
	str	r3, [r2, #8]
	add	sp, sp, #8
	bx	lr
.L38:
	.align	2
.L37:
	.word	.LANCHOR0
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	drawBackgroundImage4
	.type	drawBackgroundImage4, %function
drawBackgroundImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L40
	ldr	r1, [r3, #4]
	ldr	ip, [r3, #0]
	mov	r3, #-2147483648
	add	r2, r1, #36
	add	r3, r3, #19200
	str	r0, [r1, #36]
	str	ip, [r2, #4]
	str	r3, [r2, #8]
	bx	lr
.L41:
	.align	2
.L40:
	.word	.LANCHOR0
	.size	drawBackgroundImage4, .-drawBackgroundImage4
	.align	2
	.global	drawImage4
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	tst	r2, #1
	stmfd	sp!, {r4, r5, r6}
	addne	r2, r2, #1
	cmp	r3, #0
	ldr	r4, [sp, #12]
	ble	.L42
	ldr	r5, .L47
	rsb	r1, r1, r1, asl #4
	ldr	ip, [r5, #4]
	mov	r6, r1, asl #3
	add	r4, r4, r4, lsr #31
	ldr	r1, [r5, #0]
	add	r2, r2, r2, lsr #31
	mov	r4, r4, asr #1
	add	r2, r6, r2, asr #1
	orr	r5, r4, #-2147483648
	add	r2, r1, r2, asl #1
	add	ip, ip, #36
	mov	r4, r4, asl #1
	mov	r1, #0
.L45:
	add	r1, r1, #1
	cmp	r1, r3
	str	r0, [ip, #0]
	str	r2, [ip, #4]
	add	r0, r0, r4
	str	r5, [ip, #8]
	add	r2, r2, #240
	bne	.L45
.L42:
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L48:
	.align	2
.L47:
	.word	.LANCHOR0
	.size	drawImage4, .-drawImage4
	.align	2
	.global	drawSubImage4
	.type	drawSubImage4, %function
drawSubImage4:
	@ Function supports interworking.
	@ args = 12, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, sl}
	ldr	ip, [sp, #24]
	tst	r2, #1
	ldr	r4, [sp, #28]
	addne	r2, r2, #1
	tst	ip, #1
	addne	ip, ip, #1
	cmp	r4, #0
	ldr	r6, [sp, #32]
	ble	.L49
	add	r6, r6, r6, lsr #31
	mov	r6, r6, asr #1
	mul	r1, r6, r1
	ldr	r5, .L55
	rsb	r3, r3, r3, asl #4
	ldr	r8, [r5, #4]
	add	r2, r2, r2, lsr #31
	mov	sl, r3, asl #3
	add	ip, ip, ip, lsr #31
	ldr	r3, [r5, #0]
	add	r7, r1, r2, asr #1
	add	ip, sl, ip, asr #1
	add	ip, r3, ip, asl #1
	add	r2, r8, #36
	orr	r5, r6, #-2147483648
	mov	r1, r6, asl #1
	add	r0, r0, r7, asl #1
	mov	r3, #0
.L53:
	add	r3, r3, #1
	cmp	r3, r4
	str	r0, [r2, #0]
	str	ip, [r2, #4]
	add	r0, r0, r1
	str	r5, [r2, #8]
	add	ip, ip, #240
	bne	.L53
.L49:
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl}
	bx	lr
.L56:
	.align	2
.L55:
	.word	.LANCHOR0
	.size	drawSubImage4, .-drawSubImage4
	.align	2
	.global	loadPalette
	.type	loadPalette, %function
loadPalette:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L58
	ldr	r1, [r3, #4]
	mov	r3, #-2147483648
	add	r2, r1, #36
	str	r0, [r1, #36]
	add	r3, r3, #256
	mov	r1, #83886080
	str	r1, [r2, #4]
	str	r3, [r2, #8]
	bx	lr
.L59:
	.align	2
.L58:
	.word	.LANCHOR0
	.size	loadPalette, .-loadPalette
	.align	2
	.global	DMANow
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, .L61
	str	r4, [sp, #-4]!
	ldr	ip, [ip, #4]
	add	r0, r0, r0, asl #1
	add	r4, ip, r0, asl #2
	orr	r3, r3, #-2147483648
	str	r1, [ip, r0, asl #2]
	str	r2, [r4, #4]
	str	r3, [r4, #8]
	ldmfd	sp!, {r4}
	bx	lr
.L62:
	.align	2
.L61:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	waitForVblank
	.type	waitForVblank, %function
waitForVblank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L64:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L64
	mov	r2, #67108864
.L66:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L66
	bx	lr
	.size	waitForVblank, .-waitForVblank
	.align	2
	.global	flipPage
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldrh	r2, [r3, #0]
	tst	r2, #16
	ldrne	r1, .L72
	ldreq	r1, .L72
	ldrne	r0, [r1, #8]
	ldreq	r0, [r1, #12]
	bicne	r2, r2, #16
	orreq	r2, r2, #16
	strneh	r2, [r3, #0]	@ movhi
	streqh	r2, [r3, #0]	@ movhi
	strne	r0, [r1, #0]
	streq	r0, [r1, #0]
	bx	lr
.L73:
	.align	2
.L72:
	.word	.LANCHOR0
	.size	flipPage, .-flipPage
	.align	2
	.global	setupSounds
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mvn	r2, #1264
	mov	r3, #67108864
	sub	r2, r2, #1
	mov	r1, #128	@ movhi
	strh	r1, [r3, #132]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	mov	r2, #0	@ movhi
	strh	r2, [r3, #128]	@ movhi
	bx	lr
	.size	setupSounds, .-setupSounds
	.global	__aeabi_idiv
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	playSoundA
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r3, .L76+8
	ldr	ip, [r3, #4]
	mov	r9, r1
	mov	sl, #67108864
	ldr	r1, .L76+12
	mov	r3, #-1241513984
	mov	r6, r2
	mov	r5, #0
	add	r2, ip, #12
	mov	fp, r0
	add	r3, r3, #4194304
	add	r0, sl, #160
	add	sl, sl, #256
	str	r5, [r2, #8]
	str	r5, [r1, #0]
	str	fp, [ip, #12]
	mov	r1, r6
	str	r0, [r2, #4]
	str	r3, [r2, #8]
	mov	r0, #16777216
	strh	r5, [sl, #2]	@ movhi
	ldr	r3, .L76+16
	mov	lr, pc
	bx	r3
	rsb	r3, r0, #0
	mov	r3, r3, asl #16
	ldr	r4, .L76+20
	mov	r3, r3, lsr #16
	strh	r3, [sl, #0]	@ movhi
	mov	r3, #128	@ movhi
	str	fp, [r4, #0]
	mov	r8, #1
	strh	r3, [sl, #2]	@ movhi
	ldr	r7, .L76+24
	mov	r0, r9
	str	r9, [r4, #4]
	str	r6, [r4, #8]
	str	r8, [r4, #12]
	mov	lr, pc
	bx	r7
	adr	r3, .L76
	ldmia	r3, {r2-r3}
	ldr	ip, .L76+28
	mov	lr, pc
	bx	ip
	mov	sl, r0
	mov	r0, r6
	mov	fp, r1
	mov	lr, pc
	bx	r7
	ldr	ip, .L76+32
	mov	r2, r0
	mov	r3, r1
	mov	r0, sl
	mov	r1, fp
	mov	lr, pc
	bx	ip
	ldr	r3, .L76+36
	mov	lr, pc
	bx	r3
	str	r8, [r4, #16]
	str	r0, [r4, #20]
	str	r5, [r4, #24]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L77:
	.align	3
.L76:
	.word	1443109011
	.word	1078844686
	.word	.LANCHOR0
	.word	vbCountA
	.word	__aeabi_idiv
	.word	soundA
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundA, .-playSoundA
	.align	2
	.global	interruptHandler
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	add	r3, r3, #512
	stmfd	sp!, {r4, lr}
	ldrh	r1, [r3, #2]
	mov	r2, #0
	tst	r1, #1
	strh	r2, [r3, #8]	@ movhi
	beq	.L79
	ldr	r1, .L82
	ldr	ip, .L82+4
	ldr	r3, .L82+8
	ldr	r0, [r1, #0]
	ldr	r4, [ip, #0]
	ldr	ip, [r3, #20]
	add	r0, r0, #1
	add	ip, r4, ip
	cmp	r0, ip
	str	r0, [r1, #0]
	bgt	.L81
.L80:
	mov	r3, #67108864
	add	r3, r3, #512
	mov	r2, #1	@ movhi
	strh	r2, [r3, #2]	@ movhi
.L79:
	mov	r3, #67108864
	add	r3, r3, #512
	mov	r2, #1	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L81:
	ldr	r1, [r3, #12]
	cmp	r1, r2
	beq	.L80
	ldr	r1, .L82+12
	ldr	r0, [r1, #4]
	mov	r1, #67108864
	ldr	ip, [r3, #16]
	add	r1, r1, #256
	add	r0, r0, #12
	str	r2, [r0, #8]
	strh	r2, [r1, #2]	@ movhi
	ldr	r1, .L82+16
	cmp	ip, #1
	str	r2, [r1, #12]
	bne	.L80
	ldmia	r3, {r0, r1, r2}	@ phole ldm
	bl	playSoundA
	b	.L80
.L83:
	.align	2
.L82:
	.word	vbCountB
	.word	vbCountA
	.word	soundB
	.word	.LANCHOR0
	.word	soundA
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	playSoundB
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r3, .L85+8
	ldr	ip, [r3, #4]
	mov	sl, #67108864
	mov	r3, #-1241513984
	mov	r6, r2
	mov	fp, r0
	add	r2, ip, #24
	mov	r5, #0
	add	r0, sl, #164
	add	r3, r3, #4194304
	add	sl, sl, #256
	str	r5, [r2, #8]
	mov	r9, r1
	str	fp, [ip, #24]
	mov	r1, r6
	str	r0, [r2, #4]
	str	r3, [r2, #8]
	mov	r0, #16777216
	strh	r5, [sl, #6]	@ movhi
	ldr	r3, .L85+12
	mov	lr, pc
	bx	r3
	rsb	r3, r0, #0
	mov	r3, r3, asl #16
	ldr	r4, .L85+16
	mov	r3, r3, lsr #16
	strh	r3, [sl, #4]	@ movhi
	mov	r3, #128	@ movhi
	mov	r7, #1
	str	fp, [r4, #0]
	ldr	r8, .L85+20
	strh	r3, [sl, #6]	@ movhi
	mov	r0, r9
	str	r9, [r4, #4]
	str	r6, [r4, #8]
	str	r7, [r4, #12]
	mov	lr, pc
	bx	r8
	adr	r3, .L85
	ldmia	r3, {r2-r3}
	ldr	ip, .L85+24
	mov	lr, pc
	bx	ip
	mov	sl, r0
	mov	r0, r6
	mov	fp, r1
	mov	lr, pc
	bx	r8
	ldr	ip, .L85+28
	mov	r2, r0
	mov	r3, r1
	mov	r0, sl
	mov	r1, fp
	mov	lr, pc
	bx	ip
	ldr	r3, .L85+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L85+36
	str	r0, [r4, #20]
	str	r7, [r4, #16]
	str	r5, [r4, #24]
	str	r7, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L86:
	.align	3
.L85:
	.word	1443109011
	.word	1078844686
	.word	.LANCHOR0
	.word	__aeabi_idiv
	.word	soundB
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.word	vbCountB
	.size	playSoundB, .-playSoundB
	.align	2
	.global	pauseSound
	.type	pauseSound, %function
pauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldrh	r2, [r3, #132]
	and	r2, r2, #768
	strh	r2, [r3, #130]	@ movhi
	bx	lr
	.size	pauseSound, .-pauseSound
	.align	2
	.global	unpauseSound
	.type	unpauseSound, %function
unpauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldrh	r2, [r3, #132]
	orr	r2, r2, #768
	strh	r2, [r3, #130]	@ movhi
	bx	lr
	.size	unpauseSound, .-unpauseSound
	.align	2
	.global	stopSound
	.type	stopSound, %function
stopSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r2, #2048	@ movhi
	strh	r2, [r3, #130]	@ movhi
	bx	lr
	.size	stopSound, .-stopSound
	.align	2
	.global	setupInterrupts
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	add	r3, r2, #512
	str	r4, [sp, #-4]!
	ldrh	r0, [r2, #4]
	ldrh	ip, [r3, #0]
	mov	r1, #50331648
	ldr	r4, .L91
	add	r1, r1, #28672
	orr	ip, ip, #1
	orr	r0, r0, #8
	str	r4, [r1, #4092]
	strh	ip, [r3, #0]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	mov	r2, #1	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldmfd	sp!, {r4}
	bx	lr
.L92:
	.align	2
.L91:
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.global	videoBuffer
	.global	frontBuffer
	.global	backBuffer
	.global	dma
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	soundA,28,4
	.comm	soundB,28,4
	.comm	vbCountA,4,4
	.comm	vbCountB,4,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.type	backBuffer, %object
	.size	backBuffer, 4
backBuffer:
	.word	100704256
	.type	frontBuffer, %object
	.size	frontBuffer, 4
frontBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 31) 4.5.0"
