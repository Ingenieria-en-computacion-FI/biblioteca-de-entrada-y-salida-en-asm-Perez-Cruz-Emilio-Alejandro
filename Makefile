NASM = nasm 
FLAGS = -f elf32
LD = LD
LDFLAGS = -m elf_i386

SRC = $(wildcard src/*.asm)
OBJS = $(SRCS: .asm=.o)
TEST_MAIN = tests/main.o 

all: program

program: $(OBJS) $(TEST_MAIN)
	$(LD) $(LDFLAGS) $(OBJS) $(TEST_MAIN) -o program

src%.o: src%.asm
	$(NAMS) $(FLAGS) $< -o $@

tests/%.o: tests/%.asm
	$(NASM) $(FLAGS) $< -o $@

clean:
	rm -f src/*.o tests/*.o 
