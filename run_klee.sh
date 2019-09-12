#!/bin/bash

# Runs klee on maze bytecode file
klee --emit-all-errors maze_klee.bc
