CC = gcc
SRC = $(wildcard src/*.c)
OBJ = $(SRC:.c=.o)
BIN = hexdump

%.o: %.c
	$(CC) -O3 -c $< -o $@

$(BIN): $(OBJ)
	$(CC) -no-pie $(OBJ) -o $(BIN)

.PHONY: clean
clean:
	@rm $(OBJ)
	@rm $(BIN)
