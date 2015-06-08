Game = require './game'
Player = require './player'

x = new Player 'x'
o = new Player 'o'

games = []

score_board =
  x: 0
  o: 0
  draw: 0

start_time = new Date()

# First player has the advantage, so let's switch each turn
player_order = [x, o]

while score_board.x < 10 and score_board.o < 10
  player_order.reverse()

  game = new Game player_order[0], player_order[1]

  game.play()
  games.push game

  result = game.getResult()

  score_board[result]++

  console.log("""\n
    -------------
    Game #{games.length}: #{result}

    #{game.boardToString()}
  """)

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
