OUTPUT_ARCH(mips)
ENTRY(_start)
MEMORY
{
	ram	: ORIGIN = 0x80000000 , LENGTH = 0x100000
}

SECTIONS
{
	. = ALIGN(4);
	.text : { output/a320/head-a320.o(.text*) } > ram
	.text : { *(EXCLUDE_FILE (output/a320/head-a320.o) .text*) } > ram

	. = ALIGN(4);
	.rodata : { *(.rodata*) } > ram

	. = ALIGN(4);
	.sdata : { *(.sdata*) } > ram

	. = ALIGN(4);
	.data : { *(.data*) *(.scommon*) *(.reginfo*) } > ram

	_gp = ABSOLUTE(.); /* Base of small data */

	.got : { *(.got*) } > ram

	. = ALIGN(4);
	.sbss : { *(.sbss*) } > ram
	.bss : { *(.bss*) } > ram
	. = ALIGN (4);
}

