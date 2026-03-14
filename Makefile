NASM = nasm 
FLAGS = -f elf32
LD = LD
LDFLAGS = -m elf_i386

SRC = $(wildcard src/*.asm)
OBJ = $(SRC: .asm=.o)

all: $(OBJ)

src%.o: src%.asm
	$(NAMS) $(FLAGS) $< -o $@

clean:
	rm -f src/*.o tests/*.o 
	