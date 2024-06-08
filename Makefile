
GPPPARAMS = -m32
ASSPARAMS = --32
objects = loader.o kernel.o
LDPARRAMS = -melf_i386
%.o: %.cpp
        g++ $(GPPPARAMS) -o $@ -c $<

%.o: %.s
        as $(ASSPARAMS) -O $@ $< 


mykernel.bin: linker.ld $(objects)
	ld $(LDPARRAMS) -T $< -o $@ $(objects)


install: mykernel.bin 
	sudo cp $< /boot/mykernel.bin


