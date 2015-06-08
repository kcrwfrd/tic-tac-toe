class Player
  constructor: (@marker) ->
    @wins = []
    @losses = []

  ###
  @name getMove
  @description
  Returns a random move for computer to take.
  Override this method in a subclass to provide AI.

  @param {Game} game - Instance of game

  @returns [Row, Column]
  ###

  getMove: (game) ->
    empty_spaces = game.getEmptySpaces()

    index = Math.floor(Math.random() * (empty_spaces.length))

    return empty_spaces[index]

  ###
  @name move
  @description
  Marks space on the board with the chosen move.
  ###

  move: (game) ->
    game.markSpace @getMove(game), @

module.exports = Player
