#!/bin/bash

# Builds the llvm bytecode from maze_klee.c source
clang -c -I/home/klee/klee_src/include -emit-llvm /home/klee/maze/maze_klee.c -o /home/klee/maze/maze_klee.bc
