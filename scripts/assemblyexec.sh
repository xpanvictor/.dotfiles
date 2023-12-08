
if test -f compile
then
  rm compile
fi

# create object file
nasm -f elf $1 -o compile.o
# machine code
ld -m elf_i386 -s -o compile compile.o

# run
./compile $2

