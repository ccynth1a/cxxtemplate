# CXX Project Template

```
.
├── bin
│   └── your-project-name
├── build
│   └── main.o
├── compile_commands.json
├── include
│   ├── extern_include
│   └── main.h
├── Makefile
├── README.md
└── src
    └── main.cpp

6 directories, 7 files
```

## Introduction 
This is a templated project structure for low/mid size C/C++ projects. The commands do assume you're running a 64 bit version of Linux, I do not intend to make a Windows version. The set of utilities are very focused around my development stack, but this structure is generic enough to be reformatted for most projects. Bear (a tool for generating compilation databases) my tool of choice to make clangd LSP recognise include paths. My debugger of choice is GDB, so theres also a handful of make commands focused around that

---

## Setup (Dependencies)
### Script
Included in the repository is a dependency installation script that works for the following Linux distributions:
- Debian/Ubuntu
- Fedora
- Arch Linux

```
chmod + x install_build_dependencies.sh 
./install_build_dependencies.sh
```
### Manual
For everyone else, the dependencies are as follows:
- C Build Essential 
- GNU Make
- [bear](https://github.com/rizsotto/Bear)

---

## Setup (Project)

There is only a handful of things that need to change before proceeding:
- If you're working with a C project, change the src/main.cpp file to be src/main.c
- Change the "your_project_name" line in line 30 of the Makefile
- If using libraries, uncomment the LDFLAGS line on line 16 of the Makefile, and add the required libraries.

For implicit imports (e.g `main.h` instead of `../include/main.h`), you will have to run the `make bear` command to keep clangd aware of newly created header files.

## Build Commands 

Commands can be found in the Makefile of course, but to briefly summarise:

```
make: Produce a quick, unoptimised executable in the bin/ directory of your project.

make production: Produce an optimised executable

make debug: Produce an executable with the -g flag for GDB

make gdb: Open the executable in GDB in TUI mode

make bear: Perform a clean compilation using Bear for LSP integration

make clean: Clean the build and bin directories for a production build.

make run: Run the executable found in the bin/ directory. 

make install: Install the executable to /usr/local/bin (Requires Root Privilege)
```

Do as you please! :3
