# This is a templated makefile for both C and CPP projects. Below is the expected file structure
#.
#├── bin
#├── build
#├── include
#│   └── extern_include
#├── lib

# To include library files, uncomment the LD flags and link in your static libraries

# compiler rules
CC = gcc
CXX = g++
CFLAGS = -Wall -Wno-builtin-declaration-mismatch -Wno-unused-but-set-variable -Iinclude -Iinclude/extern_include
CXXFLAGS = -Wall -Iinclude -Iinclude/extern_include
# LDFLAGS = -Llib -llibnamegoeshere

# directories
BUILD_DIR = build
BIN_DIR = bin
SRC_DIR = src

# get compile sources
C_SOURCES = $(wildcard $(SRC_DIR)/*.c)
CPP_SOURCES = $(wildcard $(SRC_DIR)/*.cpp)
C_OBJECTS = $(C_SOURCES:$(SRC_DIR)/%.c=$(BUILD_DIR)/%.o)
CPP_OBJECTS = $(CPP_SOURCES:$(SRC_DIR)/%.cpp=$(BUILD_DIR)/%.o)
OBJECTS = $(C_OBJECTS) $(CPP_OBJECTS)

EXECUTABLE = $(BIN_DIR)/your-project-name

# Default Target
all: $(EXECUTABLE)

# Production Target
production: CFLAGS += -O2
production: CXXFLAGS += -O2
production: $(EXECUTABLE)

# Debug Target (GDB)
debug: CFLAGS += -g 
debug: CXX += -g 
debug: $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	@mkdir -p $(BIN_DIR)
	$(CXX) -o $@ $^ $(LDFLAGS)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

run: $(EXECUTABLE)
	./$(EXECUTABLE)

install: $(EXECUTABLE)
	cp $(EXECUTABLE) /usr/local/bin

clean:
	rm -rf $(BUILD_DIR) $(BIN_DIR)

gdb:
	gdb -tui $(EXECUTABLE)

.PHONY: all clean install production
