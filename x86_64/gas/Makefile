ASM = gcc
SRC = $(wildcard src/*.s)
OBJ = $(SRC:.s=.o)
BIN = hexdump

%.o: %.c
	$(ASM) -g -c $< -o $@

$(BIN): $(OBJ)
	$(ASM) -no-pie $(OBJ) -o $(BIN)

.PHONY: clean
clean:
	@rm $(OBJ)
	@rm $(BIN)
