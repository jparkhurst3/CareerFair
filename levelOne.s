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
	.file	"levelOne.c"
	.text
	.align	2
	.global	initializeLevelOne
	.type	initializeLevelOne, %function
initializeLevelOne:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	mov	r2, #24064	@ movhi
	mov	r5, #67108864
	mov	r3, #23296
	strh	r2, [r5, #8]	@ movhi
	add	r3, r3, #4
	mov	r2, #4864	@ movhi
	strh	r2, [r5, #0]	@ movhi
	strh	r3, [r5, #10]	@ movhi
	ldr	r0, .L2
	ldr	r3, .L2+4
	mov	lr, pc
	bx	r3
	mov	r7, #-2147483648
	mov	r3, #5696
	ldr	r4, .L2+8
	mov	r6, #100663296
	add	r7, r7, #2048
	mov	r0, #3
	ldr	r1, .L2+12
	mov	r2, #100663296
	add	r3, r3, #-2147483632
	mov	lr, pc
	bx	r4
	add	r2, r6, #61440
	mov	r3, r7
	mov	r0, #3
	ldr	r1, .L2+16
	mov	lr, pc
	bx	r4
	mov	r3, #4800
	add	r2, r6, #16384
	mov	r0, #3
	ldr	r1, .L2+20
	add	r3, r3, #-2147483616
	mov	lr, pc
	bx	r4
	add	r2, r6, #55296
	mov	r3, r7
	mov	r0, #3
	ldr	r1, .L2+24
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L2+28
	add	r2, r2, #512
	mov	r3, #16
	mov	lr, pc
	bx	r4
	add	r2, r6, #65536
	mov	r0, #3
	ldr	r1, .L2+32
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L2+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L2+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L2+44
	mov	lr, pc
	bx	r3
	mov	r1, #770048
	add	r1, r1, #3664
	mov	r2, #11008
	ldr	r0, .L2+48
	add	r1, r1, #7
	add	r2, r2, #17
	ldr	r3, .L2+52
	mov	lr, pc
	bx	r3
	ldr	r2, .L2+56
	mov	r8, #32
	ldr	sl, [r5, #304]
	str	r8, [r2, #16]
	str	r8, [r2, #20]
	mov	r8, #110
	mov	r3, #0
	str	r8, [r2, #0]
	ldr	ip, .L2+60
	mov	r4, #1
	mov	r8, #104
	str	r4, [r2, #8]
	str	r4, [r2, #12]
	str	r8, [r2, #4]
	str	r3, [r2, #24]
	str	r3, [r2, #36]
	str	r3, [r2, #28]
	str	r3, [r2, #40]
	mov	r2, #120
	str	r2, [ip, #0]
	ldr	r2, .L2+64
	ldr	r1, .L2+68
	str	r3, [r2, #0]
	mov	r5, #200
	mov	r7, #125
	ldr	r2, .L2+72
	str	r7, [r1, #0]
	str	r5, [r1, #4]
	str	r3, [r1, #12]
	str	r4, [r1, #8]
	str	r3, [r1, #16]
	mov	r1, #90
	str	r1, [r2, #0]
	ldr	r2, .L2+76
	str	sl, [r2, #0]
	ldr	r2, .L2+80
	mov	r6, #3
	str	r6, [r2, #0]
	ldr	r2, .L2+84
	ldr	r0, .L2+88
	str	r3, [r2, #0]
	ldr	r2, .L2+92
	str	r5, [ip, #4]
	str	r3, [ip, #12]
	str	r6, [ip, #8]
	str	r3, [ip, #16]
	str	r7, [r0, #0]
	str	r5, [r0, #4]
	str	r3, [r0, #12]
	str	r4, [r0, #8]
	str	r3, [r0, #16]
	str	r3, [r2, #0]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	levelOneCloserImagePal
	.word	loadPalette
	.word	DMANow
	.word	levelOneCloserImageTiles
	.word	levelOneCloserImageMap
	.word	levelOneFurtherImageTiles
	.word	levelOneFurtherImageMap
	.word	spriteSheetPal
	.word	spriteSheetTiles
	.word	hideSprites
	.word	setupInterrupts
	.word	setupSounds
	.word	missionImpossible
	.word	playSoundA
	.word	player
	.word	biker
	.word	hOff
	.word	flyer2
	.word	vOff
	.word	buttons
	.word	lives
	.word	distanceRun
	.word	flyer1
	.word	enemyCounter
	.size	initializeLevelOne, .-initializeLevelOne
	.align	2
	.global	checkButtons
	.type	checkButtons, %function
checkButtons:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r4, .L25
	ldr	r3, .L25+4
	ldr	r2, [r4, #28]
	ldr	ip, [r3, #0]
	mov	r1, #67108864
	ldr	r0, .L25+8
	ldr	r1, [r1, #304]
	cmp	r2, #5
	strne	r2, [r4, #32]
	str	ip, [r0, #0]
	str	r1, [r3, #0]
	mov	r3, #67108864
	ldr	r2, [r3, #304]
	tst	r2, #64
	bne	.L6
	ldr	r2, [r3, #304]
	tst	r2, #128
	beq	.L21
.L6:
	mov	r3, #5
	str	r3, [r4, #28]
.L7:
	ldr	r3, [r4, #24]
	ldr	r2, .L25+12
	smull	r1, r2, r3, r2
	mov	r1, r3, asr #31
	rsb	r2, r1, r2, asr #3
	add	r2, r2, r2, asl #2
	subs	r3, r3, r2, asl #2
	ldr	r1, .L25
	bne	.L8
	ldr	r2, [r1, #36]
	cmp	r2, #2
	addne	r2, r2, #2
	moveq	r2, r3
	str	r2, [r1, #36]
.L8:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #64
	beq	.L22
.L9:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	ldreq	r5, .L25+16
	ldreq	r3, [r5, #0]
	moveq	r2, #3
	subeq	r3, r3, #2
	streq	r3, [r5, #0]
	streq	r2, [r4, #28]
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	ldrne	r5, .L25+16
	tst	r3, #16
	bne	.L11
	ldr	r3, .L25+20
	ldr	r1, [r4, #12]
	ldr	r2, [r3, #0]
	add	r2, r1, r2
	ldr	r0, [r5, #0]
	cmp	r2, #1000
	str	r2, [r3, #0]
	ldrgt	r3, .L25+24
	add	r1, r0, r1, asl #1
	movgt	r2, #4
	mov	r0, #2
	str	r0, [r4, #28]
	str	r1, [r5, #0]
	strgt	r2, [r3, #0]
.L11:
	ldr	r3, .L25+28
	mov	lr, pc
	bx	r3
	ldr	r2, .L25+32
	ldr	r3, [r5, #0]
	ldrh	r2, [r2, #0]
	add	r0, r3, r3, lsr #31
	add	r1, r2, #45
	mov	ip, r3, asl #16
	mov	r0, r0, asl #15
	mov	r1, r1, asl #16
	mov	r3, #67108864
	mov	ip, ip, lsr #16
	mov	r0, r0, lsr #16
	mov	r1, r1, lsr #16
	strh	ip, [r3, #16]	@ movhi
	strh	r0, [r3, #20]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	strh	r1, [r3, #22]	@ movhi
	ldr	r3, [r3, #304]
	tst	r3, #8
	beq	.L23
.L12:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	mvn	r3, r3
	ands	r3, r3, #512
	bne	.L13
	ldr	r2, [r4, #28]
	cmp	r2, #5
	ldr	r2, .L25
	beq	.L24
.L15:
	ldr	r3, [r4, #24]
	add	r3, r3, #1
	str	r3, [r4, #24]
.L4:
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L13:
	ldr	r3, .L25+20
	ldr	r2, [r3, #0]
	ldr	r1, [r5, #0]
	mov	r0, #3
	add	r2, r2, #3
	str	r0, [r4, #12]
	mov	r0, #6
	add	r1, r1, #6
	str	r0, [r4, #36]
	cmp	r2, #1000
	mov	r0, #0
	str	r0, [r4, #28]
	str	r1, [r5, #0]
	str	r2, [r3, #0]
	ldrgt	r3, .L25+24
	movgt	r2, #4
	strgt	r2, [r3, #0]
	b	.L15
.L21:
	ldr	r2, [r3, #304]
	tst	r2, #32
	bne	.L6
	ldr	r3, [r3, #304]
	tst	r3, #16
	beq	.L7
	b	.L6
.L22:
	mov	r3, #4
	mov	r1, #38912
	mov	r2, #11008
	str	r3, [r4, #28]
	ldr	r0, .L25+36
	sub	r1, r1, #123
	add	r2, r2, #17
	ldr	r3, .L25+40
	mov	lr, pc
	bx	r3
	b	.L9
.L23:
	ldr	r3, .L25+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L25+24
	mov	r2, #3
	str	r2, [r3, #0]
	b	.L12
.L24:
	ldr	r1, [r2, #32]
	str	r3, [r2, #36]
	str	r1, [r2, #28]
	b	.L4
.L26:
	.align	2
.L25:
	.word	player
	.word	buttons
	.word	oldButtons
	.word	1717986919
	.word	hOff
	.word	distanceRun
	.word	state
	.word	waitForVblank
	.word	vOff
	.word	dodgingSound
	.word	playSoundB
	.word	pauseSound
	.size	checkButtons, .-checkButtons
	.align	2
	.global	drawSprites
	.type	drawSprites, %function
drawSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r5, .L49
	ldr	r3, [r5, #28]
	ldr	lr, [r5, #4]
	ldr	ip, [r5, #36]
	ldr	r4, .L49+4
	add	ip, r3, ip, asl #4
	ldrh	r6, [r5, #0]
	mvn	lr, lr, asl #17
	mvn	lr, lr, lsr #17
	mov	ip, ip, asl #2
	mov	r1, r4
	mov	r0, #3
	mov	r2, #117440512
	mov	r3, #512
	strh	ip, [r4, #36]	@ movhi
	strh	r6, [r4, #32]	@ movhi
	ldr	ip, .L49+8
	strh	lr, [r4, #34]	@ movhi
	mov	lr, pc
	bx	ip
	ldr	r2, .L49+12
	ldr	r3, [r2, #0]
	ldr	r0, .L49+16
	add	r3, r3, #1
	smull	r1, r0, r3, r0
	mov	r1, r3, asr #31
	rsb	r0, r1, r0, asr #5
	add	r0, r0, r0, asl #2
	add	r0, r0, r0, asl #2
	cmp	r3, r0, asl #2
	str	r3, [r2, #0]
	ldrne	ip, .L49+20
	bne	.L28
	ldr	ip, .L49+20
	ldr	r2, [ip, #12]
	cmp	r2, #0
	moveq	r2, #1
	streq	r2, [ip, #12]
	moveq	r2, #240
	streq	r2, [ip, #4]
.L28:
	ldr	r2, .L49+24
	smull	r6, r2, r3, r2
	rsb	r2, r1, r2, asr #6
	add	r0, r2, r2, asl #1
	rsb	r2, r2, r0, asl #3
	add	r2, r2, r2, asl #2
	cmp	r3, r2, asl #1
	ldrne	r0, .L49+28
	bne	.L29
	ldr	r0, .L49+28
	ldr	r2, [r0, #12]
	cmp	r2, #0
	moveq	r2, #1
	streq	r2, [r0, #12]
	moveq	r2, #240
	streq	r2, [r0, #4]
.L29:
	mvn	r2, #11328
	sub	r2, r2, #1073741830
	sub	r2, r2, #249561088
	smull	r6, r2, r3, r2
	add	r2, r2, r3
	rsb	r2, r1, r2, asr #8
	add	r1, r2, r2, asl #3
	add	r2, r2, r1, asl #2
	add	r2, r2, r2, asl #2
	cmp	r3, r2, asl #1
	ldrne	r3, .L49+32
	bne	.L30
	ldr	r3, .L49+32
	ldr	r2, [r3, #12]
	cmp	r2, #0
	moveq	r2, #1
	streq	r2, [r3, #12]
	moveq	r2, #240
	streq	r2, [r3, #4]
.L30:
	ldr	r2, [ip, #12]
	cmp	r2, #1
	ldr	r2, .L49+20
	beq	.L43
.L31:
	ldr	r2, [r0, #12]
	cmp	r2, #1
	ldr	r2, .L49+28
	beq	.L44
.L33:
	ldr	r3, [r3, #12]
	cmp	r3, #1
	ldr	r3, .L49+32
	beq	.L45
.L27:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L45:
	ldr	r1, [r5, #12]
	ldr	r0, [r3, #4]
	rsb	r1, r1, r1, asl #31
	add	r2, r0, r1, asl #1
	cmp	r2, #0
	str	r2, [r3, #4]
	blt	.L46
	ldrh	r3, [r3, #0]
	mvn	r2, r2, asl #17
	mvn	r2, r2, lsr #17
	strh	r3, [r4, #16]	@ movhi
	mov	r3, #408	@ movhi
	strh	r2, [r4, #18]	@ movhi
	strh	r3, [r4, #20]	@ movhi
	b	.L27
.L44:
	ldr	r0, [r5, #12]
	ldr	ip, [r2, #4]
	rsb	r0, r0, r0, asl #31
	add	r1, ip, r0, asl #1
	cmp	r1, #0
	str	r1, [r2, #4]
	blt	.L47
	ldrh	r2, [r2, #0]
	mvn	r1, r1, asl #17
	mvn	r1, r1, lsr #17
	strh	r2, [r4, #8]	@ movhi
	mov	r2, #280	@ movhi
	strh	r1, [r4, #10]	@ movhi
	strh	r2, [r4, #12]	@ movhi
	b	.L33
.L43:
	ldr	ip, [r5, #12]
	ldr	r1, [r2, #4]
	rsb	ip, ip, ip, asl #31
	add	r1, r1, ip, asl #1
	cmp	r1, #0
	str	r1, [r2, #4]
	blt	.L48
	mvn	r1, r1, asl #17
	mvn	r1, r1, lsr #17
	ldrh	r2, [r2, #0]
	strh	r1, [r4, #2]	@ movhi
	mov	r1, #20	@ movhi
	strh	r2, [r4, #0]	@ movhi
	strh	r1, [r4, #4]	@ movhi
	b	.L31
.L47:
	mov	r1, #0
	str	r1, [r2, #12]
	ldr	r2, .L49
	str	r1, [r2, #40]
	b	.L33
.L48:
	mov	r1, #0
	str	r1, [r2, #12]
	ldr	r2, .L49
	str	r1, [r2, #40]
	b	.L31
.L46:
	mov	r2, #0
	str	r2, [r3, #12]
	ldr	r3, .L49
	str	r2, [r3, #40]
	b	.L27
.L50:
	.align	2
.L49:
	.word	player
	.word	shadowOAM
	.word	DMANow
	.word	enemyCounter
	.word	1374389535
	.word	biker
	.word	1195121335
	.word	flyer1
	.word	flyer2
	.size	drawSprites, .-drawSprites
	.align	2
	.global	checkForCollisions
	.type	checkForCollisions, %function
checkForCollisions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L58
	ldr	r2, [r3, #36]
	cmp	r2, #6
	bxeq	lr
	ldr	r2, .L58+4
	ldr	r1, [r3, #4]
	ldr	r0, [r2, #4]
	add	r2, r1, #9
	cmp	r2, r0
	blt	.L53
	add	ip, r1, #5
	cmp	r0, ip
	ble	.L53
	ldr	r0, [r3, #28]
	cmp	r0, #4
	beq	.L53
	ldr	r0, [r3, #40]
	cmp	r0, #0
	bne	.L53
	ldr	r0, .L58+8
	ldr	ip, [r0, #0]
	sub	ip, ip, #1
	cmp	ip, #0
	str	ip, [r0, #0]
	ldrle	r0, .L58+12
	movle	ip, #5
	strle	ip, [r0, #0]
	mov	r0, #1
	str	r0, [r3, #40]
.L53:
	ldr	r0, .L58+16
	ldr	r0, [r0, #4]
	cmp	r2, r0
	blt	.L55
	add	ip, r1, #5
	cmp	r0, ip
	ble	.L55
	ldr	r0, [r3, #28]
	cmp	r0, #4
	beq	.L55
	ldr	r0, .L58
	ldr	r0, [r0, #40]
	cmp	r0, #0
	bne	.L55
	ldr	r0, .L58+8
	ldr	ip, [r0, #0]
	sub	ip, ip, #1
	cmp	ip, #0
	str	ip, [r0, #0]
	ldrle	r0, .L58+12
	movle	ip, #5
	strle	ip, [r0, #0]
	mov	r0, #1
	str	r0, [r3, #40]
.L55:
	ldr	r0, .L58+20
	ldr	r0, [r0, #4]
	cmp	r2, r0
	bxlt	lr
	add	r1, r1, #5
	cmp	r0, r1
	bxle	lr
	ldr	r2, [r3, #28]
	cmp	r2, #4
	bxeq	lr
	ldr	r2, .L58
	ldr	r2, [r2, #40]
	cmp	r2, #0
	bxne	lr
	ldr	r2, .L58+8
	ldr	r1, [r2, #0]
	sub	r1, r1, #1
	cmp	r1, #0
	str	r1, [r2, #0]
	ldrle	r2, .L58+12
	movle	r1, #5
	strle	r1, [r2, #0]
	mov	r2, #1
	str	r2, [r3, #40]
	bx	lr
.L59:
	.align	2
.L58:
	.word	player
	.word	biker
	.word	lives
	.word	state
	.word	flyer1
	.word	flyer2
	.size	checkForCollisions, .-checkForCollisions
	.align	2
	.global	levelOne
	.type	levelOne, %function
levelOne:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r4, .L64
	bl	initializeLevelOne
	ldr	r3, [r4, #0]
	cmp	r3, #2
	bne	.L60
	ldr	r5, .L64+4
.L62:
	bl	checkButtons
	bl	checkForCollisions
	bl	drawSprites
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #0]
	cmp	r3, #2
	beq	.L62
.L60:
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L65:
	.align	2
.L64:
	.word	state
	.word	waitForVblank
	.size	levelOne, .-levelOne
	.global	prevState
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	shadowOAM,1024,4
	.comm	player,44,4
	.comm	biker,20,4
	.comm	flyer1,20,4
	.comm	flyer2,20,4
	.comm	hOff,4,4
	.comm	vOff,4,4
	.comm	lives,4,4
	.comm	distanceRun,4,4
	.comm	enemyCounter,4,4
	.data
	.align	2
	.type	prevState, %object
	.size	prevState, 4
prevState:
	.word	2
	.ident	"GCC: (devkitARM release 31) 4.5.0"
