#!/bin/bash

# Runs klee on maze bytecode file
klee --emit-all-errors /home/klee/maze/maze_klee.bc
