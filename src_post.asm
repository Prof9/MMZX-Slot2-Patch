.nds

.open "temp/arm9.bin",0x02000000
.org 0x02000B4C + 0x14
	.dw filesize("temp/arm9.bin") + 0x02000000
.close
