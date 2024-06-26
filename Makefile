
GPPPARAMS = -m32 -fno-use-cxa-atexit -nostdlib -fno-builtin -fno-builtin -fno-rtti -fno-exceptions -fno-leading-underscore
ASSPARAMS = --32
objects = loader.o kernel.o
LDPARRAMS = -melf_i386
%.o: %.cpp
	g++ $(GPPPARAMS) -o $@ -c $<

%.o: %.s
	as $(ASSPARAMS) -o $@ $< 


mykernel.bin: linker.ld $(objects)
	ld $(LDPARRAMS) -T $< -o $@ $(objects)


install: mykernel.bin 
	sudo cp $< /boot/mykernel.bin


