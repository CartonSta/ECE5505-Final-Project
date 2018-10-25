CC = g++
SRC := circuit.cpp
BIN = project1

.PHONY: clean

build: $(SRC)
	$(CC) $^ -o $(BIN)

O3: $(SRC)
	$(CC) $^ -o $(BIN) -O3

clean:
	rm -rf $(BIN) *.o
