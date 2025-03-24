# set the compiler
CC = gcc
CFLAGS=-Wall -g 

# define the target program
TARGETS = ex1 test


# default target 
all: $(TARGETS)

# compile ex1.c program
ex1: ex1.c
	$(CC) $(CFALGS) $^ -o $@

# compile test program
test: test.c
	$(CC) $(CFALGS) $^ -o $@

# clean 
clean:	
	rm -f $(TARGETS)


# declare false target   (Make clean a special name)
.PHONY: clean





