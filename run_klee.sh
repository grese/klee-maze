#!/bin/bash

# Runs klee on maze bytecode file & collects all assertion errors.
klee --emit-all-errors maze_klee.bc
