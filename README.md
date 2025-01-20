# CXX Project Template

This is a templated project structure for low/mid size C/C++ projects. The commands do assume you're running a 64 bit version of Linux, I do not intend to make a Windows version.

There is only a handful of things that need to change before proceeding:
- If you're working with a C project, change the src/main.cpp file to be src/main.c
- Change the "your_project_name" line in line 30 of the Makefile
- If using libraries, uncomment the LDFLAGS line on line 16 of the Makefile, and add the required libraries.

Commands can be found in the Makefile of course, but to briefly summarise:

```
make: Produce a quick, unoptimised executable in the bin/ directory of your project.

make production: Produce an optimised executable

make debug: Produce an executable with the -g flag for GDB

make clean: Clean the build and bin directories for a production build.

make run: Run the executable found in the bin/ directory. 

make install: Install the executable to /usr/local/bin (Requires Root Privilege)
```

Do as you please! :3
