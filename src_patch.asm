.erroronwarning on

.if readascii("temp/header.bin", 12, 4) == "ARZJ"
	.include "symbols_jp.asm"
.elseif readascii("temp/header.bin", 12, 4) == "ARZE"
	.include "symbols_us.asm"
.elseif readascii("temp/header.bin", 12, 4) == "ARZP"
	.include "symbols_eu.asm"
.endif

.include "arm9.asm"
.include "gbafile.asm"
