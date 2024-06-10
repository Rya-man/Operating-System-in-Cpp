void printf(char* str)
{
	unsigned short* VideoMemory = (unsigned short*)0xb8000;

	for(int i =0;str[i]!='\0';++i)
		VideoMemory[i] = (VideoMemory[i] & 0xFF00) | str[i];
}	

extern "C" void kernelMain(void* multiboot_structure, unsigned int magicnumber)
{
    if (magicnumber != 0x2BADB002) {
        printf("Error: Invalid Multiboot header\n");
        while (1);
    }


    printf("Hello");

    while(1);
}

