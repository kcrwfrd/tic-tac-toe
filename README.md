# Tic-Tac-Toe
Two computers play each other in an automated game of Tic-Tac-Toe. When the game finishes, print the board and the game result--a win for X, a win for O, or a draw.

A full board should never be printed unless the final move is a game-winning move. If the game is going to end in a draw, end the game and print the board.

The program should run until X or O has won 10 games, and then finally output the amount of time it took to run the simulation.

# The Implementation
I solved this with the following modules:

* `Game` represents the state of a game
* `Player` randomly chooses its moves
* `PerfectPlayer` extends `Player` with a minimax algorithm to play with perfect strategy
* `index.coffee` orchestrates the simulation

# Getting Started

```bash
# Clone the repo
git clone git@github.com:kvcrawford/tic-tac-toe.git
cd tic-tac-toe

# Install dependencies
npm install

# Run tests
npm test

# Development mode: run tests and watch for changes
npm run develop

# Run the simulation
npm start

# Run the simulation with X using a perfect strategy
npm start -- --perfect
```

# Example Simulation

```
$ npm start

> tic-tac-toe@0.1.0 start /Users/kvcrawford/git/tic-tac-toe
> ./node_modules/coffee-script/bin/coffee ./src/index.coffee



-------------
Game 1: draw

+---+---+---+
| o |   |   |
+---+---+---+
| x | x | o |
+---+---+---+
| o | o | x |
+---+---+---+


-------------
Game 2: o

+---+---+---+
| o | x |   |
+---+---+---+
| x | o |   |
+---+---+---+
| x |   | o |
+---+---+---+


-------------
Game 3: draw

+---+---+---+
| x | o | x |
+---+---+---+
| x | o |   |
+---+---+---+
| o | x | o |
+---+---+---+


-------------
Game 4: x

+---+---+---+
| x | x | o |
+---+---+---+
| x | x | o |
+---+---+---+
| o | o | x |
+---+---+---+


-------------
Game 5: o

+---+---+---+
| o |   | o |
+---+---+---+
| o |   | x |
+---+---+---+
| o | x | x |
+---+---+---+


-------------
Game 6: x

+---+---+---+
| o | o | x |
+---+---+---+
| x | o | x |
+---+---+---+
| o | x | x |
+---+---+---+


-------------
Game 7: o

+---+---+---+
| x | o | x |
+---+---+---+
| o | o | o |
+---+---+---+
| o | x | x |
+---+---+---+


-------------
Game 8: x

+---+---+---+
| x | o | o |
+---+---+---+
| o | x | x |
+---+---+---+
| o | x | x |
+---+---+---+


-------------
Game 9: draw

+---+---+---+
| x |   | o |
+---+---+---+
| o | o | x |
+---+---+---+
| x | x | o |
+---+---+---+


-------------
Game 10: x

+---+---+---+
| x | o | o |
+---+---+---+
|   | x |   |
+---+---+---+
| x | o | x |
+---+---+---+


-------------
Game 11: draw

+---+---+---+
| x | x |   |
+---+---+---+
| o | o | x |
+---+---+---+
| x | o | o |
+---+---+---+


-------------
Game 12: x

+---+---+---+
|   | o | x |
+---+---+---+
| o | o |   |
+---+---+---+
| x | x | x |
+---+---+---+


-------------
Game 13: o

+---+---+---+
| x | x | o |
+---+---+---+
|   | o | o |
+---+---+---+
| x |   | o |
+---+---+---+


-------------
Game 14: x

+---+---+---+
| x | o | x |
+---+---+---+
| o | x | o |
+---+---+---+
| o | x | x |
+---+---+---+


-------------
Game 15: x

+---+---+---+
|   | o | o |
+---+---+---+
| x | x | x |
+---+---+---+
| x | o | o |
+---+---+---+


-------------
Game 16: x

+---+---+---+
|   | x | o |
+---+---+---+
| x | x | o |
+---+---+---+
| o | x |   |
+---+---+---+


-------------
Game 17: o

+---+---+---+
|   | x | x |
+---+---+---+
| o | o | o |
+---+---+---+
| o |   | x |
+---+---+---+


-------------
Game 18: x

+---+---+---+
| x | o | x |
+---+---+---+
| o | o | x |
+---+---+---+
|   |   | x |
+---+---+---+


-------------
Game 19: o

+---+---+---+
| o | o | o |
+---+---+---+
| x | o | x |
+---+---+---+
| x | x | o |
+---+---+---+


-------------
Game 20: x

+---+---+---+
| x |   | o |
+---+---+---+
| x | x |   |
+---+---+---+
| o | o | x |
+---+---+---+



===================
Simulation Complete
===================

Games played: 20
X wins: 10
O Wins: 6
Draws: 4

Time elapsed: 189ms
```
