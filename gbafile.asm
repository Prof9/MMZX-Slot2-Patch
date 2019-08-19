.macro gbafile,name,offset1,offset2
.create "temp/data/"+name,0
	.dw	offset1
	.dw	offset2
	.dw	filesize("include/"+name)

	.import	"include/"+name
.close
.endmacro

gbafile	"w01_24.bin",	 0x78,	 0x230
gbafile	"w01_25.bin",	 0x2C,	 0x124
gbafile	"w01_26.bin",	 0x20,	  0x90
gbafile	"w01_36.bin",	 0x24,	  0x54
gbafile	"w01_37.bin",	 0x48,	 0x17C
gbafile	"w01_a2.bin",	0x170,	 0xE6C
gbafile	"w01_a3.bin",	 0x50,	 0x178
gbafile	"w01_a4.bin",	0x140,	 0xC70
gbafile	"w01_a7.bin",	0x31C,	0x2294
gbafile	"w01_a8.bin",	 0xD0,	 0x864
gbafile	"w01_a9.bin",	 0xA4,	 0x258
gbafile	"w01_aa.bin",	 0x2C,	  0xB4
gbafile	"w02_3a.bin",	 0x44,	 0x194
gbafile	"w02_3b.bin",	 0x84,	 0x240
gbafile	"w02_3c.bin",	 0xD0,	 0x340
gbafile	"w02_3d.bin",	 0x40,	 0x144
gbafile	"w02_3e.bin",	 0x24,	  0x98
gbafile	"w02_3f.bin",	 0xB4,	 0x51C
gbafile	"w02_45.bin",	 0x44,	 0x134
gbafile	"w02_46.bin",	 0x28,	 0x1A0
gbafile	"w02_47.bin",	 0x28,	 0x1B0
gbafile	"w02_48.bin",	 0x34,	 0x11C
gbafile	"w02_49.bin",	 0x34,	 0x198
gbafile	"w02_6a.bin",	 0x48,	  0xC0
gbafile	"w02_7d.bin",	 0x1C,	  0xD0
gbafile	"w02_85.bin",	 0x10,	  0x38
gbafile	"w02_a0.bin",	0x160,	0x1B20
gbafile	"w02_a1.bin",	0x20C,	0x12A4
gbafile	"w02_a3.bin",	 0xAC,	 0x464
gbafile	"w02_a4.bin",	 0xF4,	 0xE78
gbafile	"w02_aa.bin",	0x18C,	0x1AD0
gbafile	"w02_ab.bin",	 0x78,	 0x810