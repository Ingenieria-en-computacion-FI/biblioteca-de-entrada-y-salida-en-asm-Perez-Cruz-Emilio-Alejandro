NASM = nasm
NASM_FLAGS = -f elf32 -I./include/   # <-- Agregamos esta bandera
LD = ld
LD_FLAGS = -m elf_i386

SRCS = $(wildcard src/*.asm)
OBJS = $(SRCS:.asm=.o)
TEST_MAIN = tests/main.o

all: program

program: $(OBJS) $(TEST_MAIN)
	$(LD) $(LD_FLAGS) $(OBJS) $(TEST_MAIN) -o program

src/%.o: src/%.asm
	$(NASM) $(NASM_FLAGS) $< -o $@

tests/%.o: tests/%.asm
	$(NASM) $(NASM_FLAGS) $< -o $@

clean:
	rm -f src/*.o tests/*.o program
