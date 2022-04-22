all: kernel.iso

.ONSHELL:
./iso/boot/kernel.bin:
	cd "./boot/" && make --makefile=./Makefile && cd ".."
	cp ./boot/kernel.bin ./iso/boot/kernel.bin

kernel.iso: ./iso/boot/kernel.bin
	grub-mkrescue -o kernel.iso iso

run: kernel.iso
	qemu-system-i386 -cdrom kernel.iso

clean:
	rm ./boot/*.o
	rm ./boot/kernel.bin
	rm ./iso/boot/kernel.bin
	rm ./kernel.iso
