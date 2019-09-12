# Maze Example for KLEE Symbolic Execution

## Maze

The original maze program (without klee).  Source is in "maze.c"

- Build: `gcc maze.c -o maze`
- Run manually: `./maze`
  - (enter a string of "moves" and press "enter")
- Run w/solution: `cat solution.txt | ./maze`

## Maze with Klee

The maze program using Klee symbolic execution and assertions.  When klee evaluates the maze, it will discover the "actual solution", and any "hidden solutions" (which exist due to "bugs" in the maze).  Source is in "maze_klee.c"

- Build LLVM Bytecode: `./build_bc.sh` (builds "maze_klee.bc")
- Run Klee on Bytecode: `./run_klee.sh` (runs klee on "maze_klee.bc")
- Show solutions: `./show_solutions.sh` (evaluates klee test results & prints solutions)
