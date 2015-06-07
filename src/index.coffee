Game = require './Game'

games = []

score_board =
  x: 0
  o: 0
  draw: 0

start_time = new Date()

while score_board.x < 10 and score_board.o < 10
  game = new Game()

  games.push game

  result = game.getResult()

  console.log("""\n
  -------------

  Game #{games.length}: #{game.getResult()}

  #{game.boardToString()}
  """)

  score_board[result]++

end_time = new Date()

console.log("""\n\n
  ===================
  Simulation Complete
  ===================

  Games played: #{games.length}
  X wins: #{score_board.x}
  O Wins: #{score_board.o}
  Draws: #{score_board.draw}

  Time elapsed: #{end_time - start_time}ms
""")
