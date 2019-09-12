
/**
 * maze_klee.c
 * The maze from maze.c with Klee "symbolic execution" 
 * and "assertions" added.
 * 
 * Create LLVM bytecode: ./build_bc.sh
 * 
 * Run with Klee: ./run_klee.sh
 * 
 * Find solutions: ./show_solutions.sh
 */

#include <klee/klee.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

#define H 7
#define W 11
#define ITERS 28

char maze[H][W] = {
    "+-+---+---+",
    "| |     |#|",
    "| | --+ | |",
    "| |   | | |",
    "| +-- | | |",
    "|     |   |",
    "+-----+---+"
};

void draw ()
{
    int i, j;
    for (i = 0; i < H; i++)
    {
        for (j = 0; j < W; j++)
        {
            printf("%c", maze[i][j]);
        }
        printf("\n");
    }
    printf("\n");
}

int main (int argc, char *argv[])
{
    int x = 1, y = 1;    //Player position
    int ox, oy;          //Old player position
    int i = 0;           //Iteration number
    char program[ITERS];

    maze[y][x] = 'X';

    klee_make_symbolic(program, ITERS, "program");

    while(i < ITERS)
    {
        //Save old player position
        ox = x;
        oy = y;

        switch (program[i])
        {
        case 'w':
            y--;
            break;
        case 's':
            y++;
            break;
        case 'a':
            x--;
            break;
        case 'd':
            x++;
            break;
        default:
            printf("Wrong command!(only w,s,a,d accepted!)\n");
            printf("You lose!\n");
            exit(-1);
        }

        if (maze[y][x] == '#')
        {
            printf("You win!\n");
            printf("Your solution %s\n", program);
            klee_assert(0);
            exit(1);
        }

        if (maze[y][x] != ' ' && !((y == 2 && maze[y][x] == '|' && x > 0 && x < W)))
        {
            x = ox;
            y = oy;
        }

        if (ox==x && oy==y)
        {
            printf("You lose\n");
            exit(-2);
        }

        maze[y][x]='X';
        draw();    //draw it

        i++;
        sleep(1);    //wait for next input
    }

    printf("You lose\n");
}
