// ARM9 binary

.nds
.thumb
.open "temp\arm9.dec",0x02000000

// Zero 3 always inserted
.org IsZero3Inserted
.area 0x38
	mov	r0,0x1
	bx	lr
.endarea

// Zero 4 always inserted
.org IsZero4Inserted
.area 0x38
	mov	r0,0x1
	bx	lr
.endarea

// Load data from GBA
.org LoadGbaFile
.area 0x528
	push	r4,lr
	sub	sp,(0xC+0x4C)	// Header, FSFile
	mov	r4,r3

	// Build filename
	add	r1,=fileName
	add	r0,0x31	// '1'
	strb	r0,[r1,0x2]

	lsr	r0,r2,0x4
	cmp	r0,0xA
	blt	@@num1
	add	r0,0x57	// 'a'-0xA
	b	@@set1
@@num1:
	add	r0,0x30	// '0'
@@set1:
	strb	r0,[r1,0x4]

	lsl	r0,r2,0x1C
	lsr	r0,r0,0x1C
	cmp	r0,0xA
	blt	@@num2
	add	r0,0x57	// 'a'-0xA
	b	@@set2
@@num2:
	add	r0,0x30	// '0'
@@set2:
	strb	r0,[r1,0x5]

	// Initialize file
	add	r0,sp,0xC
	blx	FS_InitFile

	// Open file with filename
	add	r0,sp,0xC
	add	r1,=fileName
	blx	FS_OpenFile

	// Read header
	add	r0,sp,0xC
	mov	r1,sp
	mov	r2,0xC
	blx	FS_ReadFile

	// Set destination offsets
	ldr	r1,[sp,(0x8+0xC+0x4C)]
	str	r4,[r1]
	ldr	r0,[sp]
	add	r0,r4,r0
	str	r0,[r1,0x4]
	ldr	r0,[sp,0x4]
	add	r0,r4,r0
	str	r0,[r1,0x8]

	// Read file
	add	r0,sp,0xC
	mov	r1,r4
	ldr	r2,[sp,0x8]
	blx	FS_ReadFile

	// Close file
	add	r0,sp,0xC
	blx	FS_CloseFile

	// Return filesize
	ldr	r0,[sp,0x8]
	add	sp,(0xC+0x4C)
	pop	r4,pc

	.pool

fileName:
	.asciiz	"w00_00.bin"

.endarea

.close
