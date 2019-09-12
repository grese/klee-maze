#!/bin/bash

# Builds the bytecode from maze_klee.c source
clang -c -I../klee_src/include -emit-llvm ./maze_klee.c -o maze_klee.bc
