# klee-maze

Maze Example for Klee Symbolic Execution

## Install/Setup

- [Install Docker](https://docs.docker.com/get-started/)
- Install Klee Docker Image: `docker pull klee/klee:2.0`
- Run Klee Container: `docker run --rm -ti --ulimit='stack=-1:-1' klee/klee:2.0`
- Update aptitude: `sudo apt-get update`
- Install git: `sudo apt-get install git-core`
- Download maze: `git clone https://github.com/grese/klee-maze.git`
- (Optional) Save your Docker container (run in another terminal - OUTSIDE THE DOCKER CONTAINER): `docker commit <CONTAINER_ID> klee-maze`
  - If you save your docker container, it can be restored later by running `docker run -it klee-maze`

## Usage

### Build & Run Maze

The original maze program (without klee). Source is in [maze.c](https://github.com/grese/klee-maze/blob/master/maze.c).

- `cd klee-maze`
- Build: `gcc maze.c -o maze`
- Run manually: `./maze`
  - (enter a string of "moves" and press "enter")
- Run w/solution: `cat solution.txt | ./maze`

### Build & Run Maze w/Klee

The maze program using Klee symbolic execution and assertions.  When klee evaluates the maze, it will discover the "actual solution", and any "hidden solutions" (which exist due to "bugs" in the maze). Source is in [maze_klee.c](https://github.com/grese/klee-maze/blob/master/maze_klee.c)

- Build LLVM Bytecode: `./build_bc.sh` (builds "maze_klee.bc")
- Run Klee on Bytecode: `./run_klee.sh` (runs klee on "maze_klee.bc")
- Show solutions: `./show_solutions.sh` (evaluates klee test results & prints solutions)
