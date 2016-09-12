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
	.file	"levelTwo.c"
	.text
	.align	2
	.global	loadBackground
	.type	loadBackground, %function
loadBackground:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r0, .L2
	ldr	r3, .L2+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L2+8
	mov	r0, #3
	ldr	r1, .L2+12
	mov	r2, #100663296
	mov	r3, #672
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L2+16
	add	r2, r2, #55296
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	levelTwoImagePal
	.word	loadPalette
	.word	DMANow
	.word	levelTwoImageTiles
	.word	levelTwoImageMap
	.size	loadBackground, .-loadBackground
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L8
	mov	r3, #0
.L5:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L5
	bx	lr
.L9:
	.align	2
.L8:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.align	2
	.global	drawRecruiters
	.type	drawRecruiters, %function
drawRecruiters:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, sl}
	ldr	r6, .L23
	ldr	r0, [r6, #0]
	sub	r0, r0, #3
	cmp	r0, #0
	ble	.L22
	ldr	r8, .L23+4
	ldr	r7, .L23+8
	ldr	r5, .L23+12
	mov	r3, r8
	mov	r1, r7
	mov	ip, #0
.L14:
	ldr	r4, [r3, #12]
	ldr	sl, [r3, #32]
	mov	r4, r4, asl #23
	ldrb	r2, [r3, #8]	@ zero_extendqisi2
	mvn	r4, r4, lsr #6
	mvn	r4, r4, lsr #17
	cmp	sl, #0
	strh	r2, [r1, #40]	@ movhi
	strh	r4, [r1, #42]	@ movhi
	bne	.L12
	ldr	r2, [r3, #24]
	add	r2, r2, #1
	smull	r4, sl, r5, r2
	mov	r4, r2, asr #31
	rsb	r4, r4, sl, asr #6
	add	r4, r4, r4, asl #2
	add	r4, r4, r4, asl #2
	cmp	r2, r4, asl #3
	str	r2, [r3, #24]
	movne	r4, #24	@ movhi
	moveq	r2, #152	@ movhi
	streqh	r2, [r1, #44]	@ movhi
	strneh	r4, [r1, #44]	@ movhi
.L12:
	add	ip, ip, #1
	cmp	ip, r0
	add	r3, r3, #36
	add	r1, r1, #8
	blt	.L14
.L11:
	mov	r2, r0, asl #3
	add	r3, r2, r0
	ldr	r5, [r6, #0]
	ldr	r6, .L23+12
	add	r3, r8, r3, asl #2
	add	r2, r7, r2
.L17:
	ldr	r1, [r3, #12]
	ldr	r4, [r3, #32]
	mov	r1, r1, asl #23
	ldrb	ip, [r3, #8]	@ zero_extendqisi2
	mvn	r1, r1, lsr #6
	mvn	r1, r1, lsr #17
	cmp	r4, #0
	strh	ip, [r2, #40]	@ movhi
	strh	r1, [r2, #42]	@ movhi
	bne	.L15
	ldr	r1, [r3, #24]
	smull	ip, r4, r6, r1
	mov	ip, r1, asr #31
	rsb	ip, ip, r4, asr #6
	add	ip, ip, ip, asl #2
	add	ip, ip, ip, asl #2
	cmp	r1, ip, asl #3
	moveq	r1, #156	@ movhi
	movne	r4, #28	@ movhi
	streqh	r1, [r2, #44]	@ movhi
	strneh	r4, [r2, #44]	@ movhi
.L15:
	add	r0, r0, #1
	cmp	r5, r0
	add	r3, r3, #36
	add	r2, r2, #8
	bgt	.L17
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl}
	bx	lr
.L22:
	ldr	r8, .L23+4
	ldr	r7, .L23+8
	b	.L11
.L24:
	.align	2
.L23:
	.word	.LANCHOR0
	.word	recruiters
	.word	shadowOAM
	.word	1374389535
	.size	drawRecruiters, .-drawRecruiters
	.align	2
	.global	drawPlayer
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	lr, .L26
	ldr	r3, [lr, #36]
	ldr	r5, [lr, #44]
	add	r5, r3, r5, asl #4
	ldr	r3, .L26+4
	ldr	r6, [lr, #4]
	ldrh	r7, [r3, #0]
	ldr	r3, .L26+8
	ldr	ip, .L26+12
	ldrh	r8, [r3, #0]
	ldrh	lr, [lr, #0]
	mvn	r6, r6, asl #17
	mov	r4, #67108864
	mvn	r6, r6, lsr #17
	mov	r5, r5, asl #2
	strh	r7, [r4, #16]	@ movhi
	mov	r1, ip
	strh	lr, [ip, #0]	@ movhi
	strh	r6, [ip, #2]	@ movhi
	strh	r5, [ip, #4]	@ movhi
	mov	r0, #3
	mov	r2, #117440512
	mov	r3, #512
	strh	r8, [r4, #18]	@ movhi
	ldr	ip, .L26+16
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	player
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.word	DMANow
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawGameClock
	.type	drawGameClock, %function
drawGameClock:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L33
	ldr	r3, [r3, #0]
	cmp	r3, #1
	bxeq	lr
	ldr	r1, .L33+4
	mov	r2, #-1241513984
	ldr	r3, [r1, #0]
	add	r2, r2, #745472
	add	r3, r3, #1
	add	r2, r2, #183
	smull	r0, r2, r3, r2
	mov	r0, r3, asr #31
	add	r2, r2, r3
	rsb	r2, r0, r2, asr #7
	add	r0, r2, r2, asl #1
	rsb	r0, r0, r0, asl #4
	cmp	r3, r0, asl #2
	str	r3, [r1, #0]
	ldrne	r3, .L33+8
	ldreq	r3, .L33+8
	ldrne	r2, [r3, #28]
	streq	r2, [r3, #28]
	cmp	r2, #4
	ldrgt	r1, .L33+12
	movgt	r0, #9
	strgt	r0, [r1, #0]
	add	r0, r3, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	mvn	r1, r1, asl #17
	ldr	r3, .L33+16
	mov	r2, r2, asl #6
	orr	r0, r0, #16384
	mvn	r1, r1, lsr #17
	add	r2, r2, #212
	strh	r0, [r3, #8]	@ movhi
	strh	r1, [r3, #10]	@ movhi
	strh	r2, [r3, #12]	@ movhi
	bx	lr
.L34:
	.align	2
.L33:
	.word	billReached
	.word	gameClockCounter
	.word	gameClock
	.word	state
	.word	shadowOAM
	.size	drawGameClock, .-drawGameClock
	.align	2
	.global	drawResumes
	.type	drawResumes, %function
drawResumes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L41
	stmfd	sp!, {r4, r5}
	ldr	r2, [r3, #0]
	cmp	r2, #0
	beq	.L36
	cmp	r0, #0
	ble	.L35
	ldr	r3, .L41+4
	ldr	r2, .L41+8
	add	r0, r3, r0, asl #3
.L39:
	ldr	r1, [r2, #12]
	ldrh	ip, [r2, #8]
	orr	r1, r1, #16384
	strh	r1, [r3, #18]	@ movhi
	mov	r1, #150	@ movhi
	strh	ip, [r3, #16]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	add	r3, r3, #8
	cmp	r3, r0
	add	r2, r2, #28
	bne	.L39
.L35:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L36:
	ldr	r1, .L41+8
	ldr	r2, .L41+4
	ldrh	r5, [r1, #8]
	ldr	r4, [r1, #12]
	ldr	ip, [r1, #40]
	ldr	r0, [r1, #68]
	orr	r4, r4, #16384
	strh	r5, [r2, #16]	@ movhi
	ldrh	r5, [r1, #36]
	ldrh	r1, [r1, #64]
	strh	r4, [r2, #18]	@ movhi
	orr	ip, ip, #16384
	mov	r4, #148	@ movhi
	orr	r0, r0, #16384
	strh	r4, [r2, #20]	@ movhi
	strh	r5, [r2, #24]	@ movhi
	strh	ip, [r2, #26]	@ movhi
	strh	r4, [r2, #28]	@ movhi
	strh	r1, [r2, #32]	@ movhi
	strh	r0, [r2, #34]	@ movhi
	strh	r4, [r2, #36]	@ movhi
	mov	r2, #1
	str	r2, [r3, #0]
	b	.L35
.L42:
	.align	2
.L41:
	.word	drawAllResumesFirst
	.word	shadowOAM
	.word	resumes
	.size	drawResumes, .-drawResumes
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r3, #67108864
	sub	sp, sp, #12
	ldr	r1, .L52
	ldr	r0, [r3, #304]
	ldr	r5, .L52+4
	ldr	lr, [r1, #0]
	ldr	r4, .L52+8
	str	r0, [r1, #0]
	mov	r1, #9
	str	r1, [r5, #0]
	mov	r1, #96
	str	r1, [r4, #0]
	ldr	r1, .L52+12
	mov	r6, #0
	str	r6, [r1, #0]
	ldr	r1, .L52+16
	str	r6, [r1, #0]
	ldr	r1, .L52+20
	str	r6, [r1, #0]
	ldr	r1, .L52+24
	ldr	ip, .L52+28
	mov	r2, #-1224736768
	str	r6, [r1, #0]
	mov	r2, r2, asr #17
	mov	r1, #4352	@ movhi
	str	lr, [ip, #0]
	strh	r1, [r3, #0]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	bl	loadBackground
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L52+32
	add	r2, r2, #512
	mov	r3, #16
	ldr	r7, .L52+36
	mov	lr, pc
	bx	r7
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L52+40
	add	r2, r2, #65536
	mov	r3, #16384
	mov	lr, pc
	bx	r7
	ldr	r3, .L52+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L52+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L52+52
.L44:
	mov	r2, #512	@ movhi
	strh	r2, [r3, r6]	@ movhi
	add	r6, r6, #8
	cmp	r6, #1024
	bne	.L44
	ldr	r2, .L52+56
	ldr	r1, [r4, #0]
	mov	ip, #64
	mov	r3, #1
	mov	r9, #32
	mov	r7, #0
	str	ip, [r2, #0]
	add	r0, r1, #64
	mov	ip, #104
	add	r1, r1, #104
	str	ip, [r2, #4]
	str	r3, [r2, #16]
	str	r3, [r2, #20]
	str	r1, [r2, #12]
	str	r9, [r2, #24]
	str	r9, [r2, #28]
	str	r0, [r2, #8]
	str	r7, [r2, #32]
	str	r7, [r2, #44]
	str	r7, [r2, #36]
	ldr	sl, .L52+60
	str	r3, [sp, #4]
	mov	lr, pc
	bx	sl
	mov	r2, r0, asr #31
	mov	r2, r2, lsr #24
	add	r1, r0, r2
	ldr	r6, .L52+64
	and	r1, r1, #255
	rsb	r2, r2, r1
	str	r2, [r6, #0]
	mov	lr, pc
	bx	sl
	mov	r2, r0, asr #31
	mov	r2, r2, lsr #24
	ldr	fp, .L52+68
	add	r0, r0, r2
	and	r8, r0, #255
	ldr	lr, [r6, #0]
	ldr	r0, [r4, #0]
	ldr	r1, [r5, #0]
	ldr	ip, [fp, #0]
	rsb	r2, r2, r8
	rsb	r0, r0, lr
	rsb	r1, r1, r2
	cmp	ip, r7
	str	r2, [r6, #4]
	str	r0, [r6, #8]
	str	r1, [r6, #12]
	str	r9, [r6, #16]
	str	r9, [r6, #20]
	ble	.L45
	ldr	r6, .L52+72
	mov	r8, r7
	b	.L48
.L51:
	ldr	r3, [fp, #0]
	add	r7, r7, #1
	cmp	r7, r3
	str	r8, [r6, #-4]
	add	r6, r6, #36
	bge	.L45
.L48:
	mov	lr, pc
	bx	sl
	mov	r3, r0, asr #31
	mov	r3, r3, lsr #24
	add	r0, r0, r3
	and	r0, r0, #255
	rsb	r3, r3, r0
	str	r3, [r6, #-32]
	mov	lr, pc
	bx	sl
	mov	r2, r0, asr #31
	mov	r2, r2, lsr #24
	add	r3, r0, r2
	ldr	lr, [r6, #-32]
	and	r3, r3, #255
	ldr	r1, [r4, #0]
	ldr	ip, [r5, #0]
	rsb	r3, r2, r3
	rsb	r1, r1, lr
	rsb	r2, ip, r3
	cmp	r7, #8
	str	r3, [r6, #-28]
	str	r1, [r6, #-24]
	str	r2, [r6, #-20]
	str	r9, [r6, #-16]
	str	r9, [r6, #-12]
	str	r8, [r6, #-8]
	str	r8, [r6, #0]
	ble	.L51
	ldr	r3, [fp, #0]
	cmp	r3, r7
	movgt	r1, #1
	add	r7, r7, #1
	strgt	r1, [r6, #-4]
	cmp	r7, r3
	add	r6, r6, #36
	blt	.L48
.L45:
	ldr	r3, .L52+76
	mov	r5, #16
	mov	r4, #0
	mov	r6, #2
	mov	r2, #32
	str	r2, [r3, #16]
	str	r5, [r3, #20]
	str	r6, [r3, #8]
	str	r6, [r3, #12]
	str	r4, [r3, #24]
	str	r4, [r3, #28]
	bl	drawGameClock
	ldr	r3, .L52+80
	mov	r2, #36
	str	r2, [r3, #12]
	mov	r2, #56
	str	r2, [r3, #40]
	mov	r2, #76
	str	r5, [r3, #16]
	str	r5, [r3, #20]
	str	r6, [r3, #8]
	str	r4, [r3, #24]
	str	r5, [r3, #44]
	str	r5, [r3, #48]
	str	r6, [r3, #36]
	str	r4, [r3, #52]
	str	r5, [r3, #72]
	str	r5, [r3, #76]
	str	r6, [r3, #64]
	str	r2, [r3, #68]
	str	r4, [r3, #80]
	ldr	r3, .L52+84
	mov	r0, r4
	str	r4, [r3, #0]
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	drawResumes
.L53:
	.align	2
.L52:
	.word	buttons
	.word	hOff
	.word	vOff
	.word	numBadRecruitersFound
	.word	numGoodRecruitersFound
	.word	gameClockCounter
	.word	billReached
	.word	oldButtons
	.word	spriteSheetPal
	.word	DMANow
	.word	spriteSheetTiles
	.word	setupInterrupts
	.word	setupSounds
	.word	shadowOAM
	.word	player
	.word	rand
	.word	bill
	.word	.LANCHOR0
	.word	recruiters+32
	.word	gameClock
	.word	resumes
	.word	drawAllResumesFirst
	.size	initialize, .-initialize
	.align	2
	.global	drawBill
	.type	drawBill, %function
drawBill:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L55
	ldr	r0, [r2, #12]
	mov	r0, r0, asl #23
	ldr	r3, .L55+4
	ldrb	r1, [r2, #8]	@ zero_extendqisi2
	mvn	r2, r0, lsr #6
	mvn	r2, r2, lsr #17
	strh	r2, [r3, #154]	@ movhi
	mov	r2, #284	@ movhi
	strh	r1, [r3, #152]	@ movhi
	strh	r2, [r3, #156]	@ movhi
	bx	lr
.L56:
	.align	2
.L55:
	.word	bill
	.word	shadowOAM
	.size	drawBill, .-drawBill
	.align	2
	.global	checkForCollision
	.type	checkForCollision, %function
checkForCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r5, .L72
	ldr	r4, .L72+4
	ldr	sl, [r5, #24]
	ldr	r2, [r5, #4]
	ldr	r3, [r5, #0]
	ldr	ip, [r5, #28]
	ldr	r8, .L72+8
	ldr	r7, .L72+12
	ldr	fp, .L72+16
	add	r6, r4, #468
	b	.L64
.L71:
	ldr	r3, [fp, #0]
	ldr	r2, [r7, #0]
	add	r3, r3, #170
	add	r2, r2, #1
	str	r3, [fp, #0]
	str	r2, [r7, #0]
	bl	drawGameClock
	ldr	r3, [r7, #0]
	cmp	r3, #2
	ldrgt	r3, .L72+20
	movgt	r2, #5
	strgt	r2, [r3, #0]
.L63:
	mov	r1, #38912
	mov	r2, #11008
	ldr	r0, .L72+24
	sub	r1, r1, #123
	add	r2, r2, #17
	ldr	r3, .L72+28
	mov	lr, pc
	bx	r3
.L69:
	ldr	sl, [r5, #24]
	ldr	r2, [r5, #4]
	ldr	r3, [r5, #0]
	ldr	ip, [r5, #28]
.L59:
	add	r4, r4, #36
	cmp	r4, r6
	beq	.L70
.L64:
	ldr	r1, [r4, #32]
	cmp	r1, #0
	bne	.L69
	add	r0, r4, #12
	ldmia	r0, {r0, r9}	@ phole ldm
	add	r1, r0, #10
	add	r0, r0, r9
	sub	r0, r0, #10
	rsb	r1, sl, r1
	cmp	r1, r2
	movge	r1, #0
	movlt	r1, #1
	ldr	r9, [r4, #8]
	cmp	r0, r2
	ldr	r0, [r4, #20]
	add	r0, r9, r0
	addgt	r1, r1, #1
	rsb	r9, ip, r9
	cmp	r0, r3
	addgt	r1, r1, #1
	cmp	r9, r3
	bge	.L59
	cmp	r1, #3
	bne	.L59
	ldr	r3, [r4, #28]
	mov	r2, #1
	cmp	r3, #0
	str	r2, [r4, #32]
	beq	.L71
	ldr	r3, [r8, #0]
	add	r3, r3, #1
	mov	r0, r3
	str	r3, [r8, #0]
	bl	drawResumes
	ldr	r3, [r8, #0]
	cmp	r3, #2
	ldrgt	r3, .L72+20
	movgt	r2, #8
	strgt	r2, [r3, #0]
	b	.L63
.L70:
	ldr	r1, .L72+32
	add	r0, r1, #12
	ldmia	r0, {r0, r5}	@ phole ldm
	add	r4, r0, #10
	add	r0, r0, r5
	rsb	sl, sl, r4
	sub	r0, r0, #10
	cmp	sl, r2
	movge	sl, #0
	movlt	sl, #1
	cmp	r0, r2
	ldr	r2, [r1, #8]
	ldr	r1, [r1, #20]
	add	r1, r2, r1
	addgt	sl, sl, #1
	rsb	ip, ip, r2
	cmp	r1, r3
	addgt	sl, sl, #1
	cmp	ip, r3
	bge	.L57
	cmp	sl, #3
	ldreq	r3, .L72+36
	moveq	r2, #1
	streq	r2, [r3, #0]
.L57:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L73:
	.align	2
.L72:
	.word	player
	.word	recruiters
	.word	numGoodRecruitersFound
	.word	numBadRecruitersFound
	.word	gameClockCounter
	.word	state
	.word	dodgingSound
	.word	playSoundB
	.word	bill
	.word	billReached
	.size	checkForCollision, .-checkForCollision
	.align	2
	.global	levelTwo
	.type	levelTwo, %function
levelTwo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L116
	bl	initialize
	ldr	r3, [sl, #0]
	cmp	r3, #7
	bne	.L74
	ldr	r4, .L116+4
	ldr	r7, .L116+8
	ldr	r8, .L116+12
	ldr	fp, .L116+16
	ldr	r9, .L116+20
	mov	r6, r4
	mov	r5, #67108864
.L105:
	ldr	r3, [r4, #36]
	cmp	r3, #4
	strne	r3, [r6, #40]
	ldr	r3, [r5, #304]
	tst	r3, #64
	bne	.L77
	ldr	r3, [r5, #304]
	tst	r3, #128
	bne	.L77
	ldr	r3, [r5, #304]
	tst	r3, #32
	bne	.L77
	ldr	r3, [r5, #304]
	tst	r3, #16
	beq	.L78
.L77:
	mov	r3, #4
	str	r3, [r4, #36]
.L78:
	ldr	r3, [r4, #32]
	smull	r2, r1, r9, r3
	mov	r2, r3, asr #31
	rsb	r2, r2, r1, asr #3
	add	r2, r2, r2, asl #2
	subs	r3, r3, r2, asl #2
	bne	.L79
	ldr	r2, [r6, #44]
	cmp	r2, #2
	addne	r2, r2, #2
	moveq	r2, r3
	str	r2, [r6, #44]
.L79:
	ldr	r3, [r5, #304]
	tst	r3, #64
	bne	.L80
	ldr	r3, [r4, #24]
	add	r3, r3, r3, lsr #31
	ldr	r2, [r4, #0]
	mov	r3, r3, asr #1
	rsb	r3, r3, #80
	cmp	r2, r3
	mov	r3, #1
	str	r3, [r4, #36]
	bgt	.L111
	ldr	r1, .L116+24
	ldr	r3, [r1, #0]
	cmp	r3, #0
	ble	.L82
	ldr	r2, .L116+28
	ldr	r1, [r2, #0]
	ldr	r2, .L116+24
	sub	r3, r3, #1
	cmp	r1, #0
	str	r3, [r2, #0]
	ble	.L83
	ldr	r3, .L116+32
	add	r1, r1, r1, asl #3
	add	r1, r3, r1, asl #2
.L84:
	ldr	r2, [r3, #8]
	add	r2, r2, #1
	str	r2, [r3, #8]
	add	r3, r3, #36
	cmp	r3, r1
	bne	.L84
.L83:
	ldr	r3, [r7, #8]
	add	r3, r3, #1
	str	r3, [r7, #8]
.L80:
	ldr	r3, [r5, #304]
	tst	r3, #128
	bne	.L85
	ldr	r3, [r4, #24]
	add	r3, r3, r3, lsr #31
	ldr	r2, [r4, #0]
	mov	r3, r3, asr #1
	rsb	r3, r3, #79
	cmp	r3, r2
	mov	r3, #0
	str	r3, [r4, #36]
	bge	.L112
	ldr	r1, .L116+24
	ldr	r3, [r1, #0]
	cmp	r3, #95
	bgt	.L87
	ldr	r2, .L116+28
	ldr	r1, [r2, #0]
	ldr	r2, .L116+24
	add	r3, r3, #1
	cmp	r1, #0
	str	r3, [r2, #0]
	ble	.L88
	ldr	r3, .L116+32
	add	r1, r1, r1, asl #3
	add	r1, r3, r1, asl #2
.L89:
	ldr	r2, [r3, #8]
	sub	r2, r2, #1
	str	r2, [r3, #8]
	add	r3, r3, #36
	cmp	r3, r1
	bne	.L89
.L88:
	ldr	r3, [r7, #8]
	sub	r3, r3, #1
	str	r3, [r7, #8]
.L85:
	ldr	r3, [r5, #304]
	tst	r3, #32
	bne	.L90
	ldr	r3, [r4, #28]
	add	r3, r3, r3, lsr #31
	ldr	r2, [r4, #4]
	mov	r3, r3, asr #1
	rsb	r3, r3, #120
	cmp	r2, r3
	mov	r3, #3
	str	r3, [r4, #36]
	bgt	.L113
	ldr	r1, .L116+36
	ldr	r3, [r1, #0]
	cmp	r3, #0
	ble	.L92
	ldr	r2, .L116+28
	ldr	r1, [r2, #0]
	ldr	r2, .L116+36
	sub	r3, r3, #1
	cmp	r1, #0
	str	r3, [r2, #0]
	ble	.L93
	ldr	r3, .L116+32
	add	r1, r1, r1, asl #3
	add	r1, r3, r1, asl #2
.L94:
	ldr	r2, [r3, #12]
	add	r2, r2, #1
	str	r2, [r3, #12]
	add	r3, r3, #36
	cmp	r3, r1
	bne	.L94
.L93:
	ldr	r3, [r7, #12]
	add	r3, r3, #1
	str	r3, [r7, #12]
.L90:
	ldr	r3, [r5, #304]
	tst	r3, #16
	bne	.L95
	ldr	r3, [r4, #28]
	add	r3, r3, r3, lsr #31
	ldr	r2, [r4, #4]
	mov	r3, r3, asr #1
	rsb	r3, r3, #119
	cmp	r3, r2
	mov	r3, #2
	str	r3, [r4, #36]
	bge	.L114
	ldr	r1, .L116+36
	ldr	r3, [r1, #0]
	cmp	r3, #15
	bgt	.L97
	ldr	r2, .L116+28
	ldr	r1, [r2, #0]
	ldr	r2, .L116+36
	add	r3, r3, #1
	cmp	r1, #0
	str	r3, [r2, #0]
	ble	.L98
	ldr	r3, .L116+32
	add	r1, r1, r1, asl #3
	add	r1, r3, r1, asl #2
.L99:
	ldr	r2, [r3, #12]
	sub	r2, r2, #1
	str	r2, [r3, #12]
	add	r3, r3, #36
	cmp	r3, r1
	bne	.L99
.L98:
	ldr	r3, [r7, #12]
	sub	r3, r3, #1
	str	r3, [r7, #12]
.L95:
	ldr	r3, [r5, #304]
	tst	r3, #8
	beq	.L115
.L100:
	ldr	r3, [r5, #304]
	tst	r3, #2
	moveq	r3, #8
	streq	r3, [sl, #0]
	ldr	r3, [r5, #304]
	tst	r3, #256
	moveq	r3, #9
	streq	r3, [sl, #0]
	ldr	r3, [r4, #36]
	cmp	r3, #4
	ldrne	r3, [r6, #32]
	ldreq	r3, [r6, #40]
	moveq	r2, #0
	addne	r3, r3, #1
	streq	r2, [r6, #44]
	streq	r3, [r6, #36]
	strne	r3, [r6, #32]
	bl	drawRecruiters
	bl	drawPlayer
	bl	drawGameClock
	ldr	r3, [r7, #12]
	ldrb	r2, [r7, #8]	@ zero_extendqisi2
	mov	r3, r3, asl #23
	mvn	r3, r3, lsr #6
	mvn	r3, r3, lsr #17
	strh	r2, [r8, #152]	@ movhi
	mov	r2, #284	@ movhi
	strh	r3, [r8, #154]	@ movhi
	strh	r2, [r8, #156]	@ movhi
	bl	checkForCollision
	mov	lr, pc
	bx	fp
	ldr	r3, [sl, #0]
	cmp	r3, #7
	beq	.L105
.L74:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L97:
	cmp	r2, #224
	bgt	.L95
.L114:
	add	r2, r2, #1
	str	r2, [r6, #4]
	ldr	r3, [r5, #304]
	tst	r3, #8
	bne	.L100
.L115:
	ldr	r3, .L116+40
	mov	lr, pc
	bx	r3
	ldr	r1, .L116+44
	mov	r3, #7
	str	r3, [r1, #0]
	mov	r3, #3
	str	r3, [sl, #0]
	b	.L100
.L87:
	cmp	r2, #139
	bgt	.L85
.L112:
	add	r2, r2, #1
	str	r2, [r6, #0]
	b	.L85
.L92:
	cmp	r2, #1
	ble	.L90
.L113:
	sub	r2, r2, #1
	str	r2, [r6, #4]
	b	.L90
.L82:
	cmp	r2, #5
	ble	.L80
.L111:
	sub	r2, r2, #1
	str	r2, [r6, #0]
	b	.L80
.L117:
	.align	2
.L116:
	.word	state
	.word	player
	.word	bill
	.word	shadowOAM
	.word	waitForVblank
	.word	1717986919
	.word	vOff
	.word	.LANCHOR0
	.word	recruiters
	.word	hOff
	.word	pauseSound
	.word	prevState
	.size	levelTwo, .-levelTwo
	.global	numRecruiters
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	shadowOAM,1024,4
	.comm	hOff,4,4
	.comm	vOff,4,4
	.comm	numBadRecruitersFound,4,4
	.comm	numGoodRecruitersFound,4,4
	.comm	drawAllResumesFirst,4,4
	.comm	gameClockCounter,4,4
	.comm	billReached,4,4
	.comm	player,48,4
	.comm	recruiters,468,4
	.comm	gameClock,32,4
	.comm	resumes,84,4
	.comm	bill,24,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	numRecruiters, %object
	.size	numRecruiters, 4
numRecruiters:
	.word	13
	.ident	"GCC: (devkitARM release 31) 4.5.0"
