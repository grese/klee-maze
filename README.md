# klee-maze

Maze Example for Klee Symbolic Execution. This repo's maze is based on [this klee maze tutorial](https://feliam.wordpress.com/2010/10/07/the-symbolic-maze/), with a few updates and convenience features.

## Install/Setup

### Prerequisites

- [Install Docker](https://docs.docker.com/get-started/) (if you don't have it already)

### Option 1: Use ready-made "klee-maze" docker image

- docker pull grese/klee-maze
- docker run -it grese/klee-maze

### Option 2: Manually install & setup docker image

- Install Klee Docker Image: `docker pull klee/klee:2.0`
- Run Klee Container: `docker run --rm -ti --ulimit='stack=-1:-1' klee/klee:2.0`
- Update aptitude: `sudo apt-get update`
- Install git: `sudo apt-get install -y git-core`
- Download maze: `git clone https://github.com/grese/klee-maze.git ~/maze`

## Usage

### Build & Run Maze

The original maze program (without symbolic execution). Source is in [maze.c](https://github.com/grese/klee-maze/blob/master/maze.c).

- `cd ~/maze`
- Build: `gcc maze.c -o maze`
- Run manually: `./maze`
  - Input a string of "moves" and press "enter"
  - Allowed moves: w (up), d (right), s (down), a (left)
  - Example solution: ssssddddwwaawwddddssssddwwww
- Run w/solution: `cat solution.txt | ./maze`

### Build & Run Maze w/Klee

The maze program using Klee symbolic execution and assertions.  When klee evaluates the maze, it will discover the "actual solution", and any "hidden solutions" (which exist due to "bugs" in the maze). Source is in [maze_klee.c](https://github.com/grese/klee-maze/blob/master/maze_klee.c)

- `cd ~/maze`
- Build LLVM Bytecode: `./scripts/build_bc.sh` (builds "maze_klee.bc" using "clang -emit-llvm")
  - Ignore the "implicit declaration of function '__assert_fail'" warning.
- Run Klee on Bytecode: `./scripts/run_klee.sh` (runs klee on "maze_klee.bc" using "--emit-all-errors")
- Show solutions: `./scripts/show_solutions.sh` (gets klee test results from "ktest-tool", and prints maze solutions)
