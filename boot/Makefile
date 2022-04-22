OBJECTS  = kernel.o loader.o
ASFLAGS  = --32
CFLAGS = -m32 -nostdlib -fno-builtin -fno-exceptions -fno-leading-underscore
LDFLAGS  = -melf_i386

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<

%.o: %.s
	$(AS) $(ASFLAGS) -o $@ $<

kernel.bin: linker.ld $(OBJECTS)
	$(LD) $(LDFLAGS) -T $< -o $@ $(OBJECTS)
