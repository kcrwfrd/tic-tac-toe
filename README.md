# Tic-Tac-Toe
Two computers play each other in an automated game of Tic-Tac-Toe. When the game finishes, print the board and the game result--a win for X, a win for O, or a draw.

A full board should never be printed unless the final move is a game-winning move. If the game is going to end in a draw, end the game and print the board.

The program should run until X or O has won 10 games, and then finally output the amount of time it took to run the simulation.

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
```

# Example Simulation

```
$ npm start

> tic-tac-toe@0.0.0 start /Users/kvcrawford/git/tic-tac-toe
> ./node_modules/coffee-script/bin/coffee ./src/index.coffee



-------------

Game 1: x

+---+---+---+
| x | o |   |
+---+---+---+
| x | o | o |
+---+---+---+
| x | x |   |
+---+---+---+


-------------

Game 2: o

+---+---+---+
| o | x | x |
+---+---+---+
| o |   | x |
+---+---+---+
| o | x | o |
+---+---+---+


-------------

Game 3: o

+---+---+---+
| o | o | o |
+---+---+---+
| o | x | x |
+---+---+---+
| x | x |   |
+---+---+---+


-------------

Game 4: x

+---+---+---+
| x | x | x |
+---+---+---+
| x |   | o |
+---+---+---+
| o | o |   |
+---+---+---+


-------------

Game 5: o

+---+---+---+
| o | o | o |
+---+---+---+
| x |   | x |
+---+---+---+
| x | o | x |
+---+---+---+


-------------

Game 6: o

+---+---+---+
| x | x | o |
+---+---+---+
|   | x | x |
+---+---+---+
| o | o | o |
+---+---+---+


-------------

Game 7: o

+---+---+---+
| o | o | o |
+---+---+---+
| x | o | x |
+---+---+---+
|   | x | x |
+---+---+---+


-------------

Game 8: o

+---+---+---+
| o |   | x |
+---+---+---+
| o | x | x |
+---+---+---+
| o | x | o |
+---+---+---+


-------------

Game 9: x

+---+---+---+
| x | x | x |
+---+---+---+
| x | o | o |
+---+---+---+
| o | o | x |
+---+---+---+


-------------

Game 10: x

+---+---+---+
| o |   | x |
+---+---+---+
|   | x | o |
+---+---+---+
| x | o | x |
+---+---+---+


-------------

Game 11: o

+---+---+---+
| o |   | x |
+---+---+---+
| o | x | x |
+---+---+---+
| o | x | o |
+---+---+---+


-------------

Game 12: x

+---+---+---+
|   | o | x |
+---+---+---+
| x |   | x |
+---+---+---+
| o | o | x |
+---+---+---+


-------------

Game 13: x

+---+---+---+
| x | o | x |
+---+---+---+
| o | x | o |
+---+---+---+
| o | x | x |
+---+---+---+


-------------

Game 14: x

+---+---+---+
| x | x | x |
+---+---+---+
| x |   | o |
+---+---+---+
| o | o |   |
+---+---+---+


-------------

Game 15: draw

+---+---+---+
| x | o | x |
+---+---+---+
|   | o | x |
+---+---+---+
| o | x | o |
+---+---+---+


-------------

Game 16: draw

+---+---+---+
| o | x | x |
+---+---+---+
| x | o | o |
+---+---+---+
| o | x | x |
+---+---+---+


-------------

Game 17: o

+---+---+---+
| o |   | x |
+---+---+---+
| x | o | x |
+---+---+---+
| o | x | o |
+---+---+---+


-------------

Game 18: x

+---+---+---+
| x | o | x |
+---+---+---+
| o | x |   |
+---+---+---+
|   | o | x |
+---+---+---+


-------------

Game 19: o

+---+---+---+
| o | o |   |
+---+---+---+
| x | o | x |
+---+---+---+
| x | o | x |
+---+---+---+


-------------

Game 20: o

+---+---+---+
| o | o | x |
+---+---+---+
| x | o | x |
+---+---+---+
|   | x | o |
+---+---+---+



===================
Simulation Complete
===================

Games played: 20
X wins: 8
O Wins: 10
Draws: 2

Time elapsed: 10ms
```
