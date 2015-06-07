class Player
  constructor: (@marker) ->
    @wins = []
    @losses = []

  # TODO: determine optimal move, rather than random
  getMove: (game) ->
    spaces = game.getEmptySpaces()

    index = Math.floor(Math.random() * (empty_spaces.length))

    return empty_spaces[index]

  move: (game) ->
    game.markSpace @getMove(), @marker

module.exports = Player
