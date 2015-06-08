lines = [
  # Horizontal
  [[0, 0], [0, 1], [0, 2]]
  [[1, 0], [1, 1], [1, 2]]
  [[2, 0], [2, 1], [2, 2]]

  # Vertical
  [[0, 0], [1, 0], [2, 0]]
  [[0, 1], [1, 1], [2, 1]]
  [[0, 2], [1, 2], [2, 2]]

  # Diagonal
  [[0, 0], [1, 1], [2, 2]]
  [[0, 2], [1, 1], [2, 0]]
]

###
@name Game
@description
Represents a point of state in the game--a node in the graph of possible outcomes.
###

class Game

  ###
  @name Game~constructor

  @param {Player} player_a
  @param {Player} player_b
  @param {[Board]} board - A brand new game will omit this argument.
  ###

  constructor: (@player_a, @player_b, board = null) ->
    @board = [
      [null, null, null]
      [null, null, null]
      [null, null, null]
    ]

    @current_player = @player_a

    # We need to re-instantiate the board from its previous state
    if board?
      @eachSpace ([row, column], value) =>
        @board[row][column] = board[row][column]

  ###
  @name eachSpace
  @description
  Iterates over each space of the board

  @param {Function} callback

  @callback callback
  @param {[Row, Column]} coordinates
  @param {String|null} value
  ###

  eachSpace: (callback) ->
    for row, row_index in @board
      for column, column_index in row
        coordinates = [row_index, column_index]
        value = @getValue coordinates

        callback? coordinates, value

  ###
  @name getEmptySpaces
  @description
  Returns coordinates for empty spaces.

  @returns {Array} - Array of coordinates [Row, Column]
  ###

  getEmptySpaces: ->
    empty_spaces = []

    @eachSpace (coordinates, value) ->
      empty_spaces.push(coordinates) unless value?

    return empty_spaces

  ###
  @name getValue
  @description
  Returns the value at a particular coordinate

  @param {[Row, Column]}

  @returns {String|null} - 'x', 'o', or null
  ###

  getValue: ([row, column]) ->
    return @board[row][column]


  ###
  @name getWinner
  @description
  Returns the winning marker, or null if no winner found.

  @returns {String|null} - 'x', 'o', or null
  ###

  getWinner: ->
    winner = null

    for line in lines
      first_space = @getValue line[0]

      winner = line.reduce (memo, next) =>
        value = @getValue next

        if memo is value
          return value
        else
          return null

      , first_space

      # Exit the loop if we've found a winner
      break if winner

    return winner

  ###
  @name getResult
  @description
  Returns the game result, or null if game unfinished.

  @returns {String|null} - 'draw', 'x', 'o', or null
  ###

  getResult: ->
    # If all spaces in line are the same value,
    # we can determine a winner.
    winner = @getWinner()

    return winner if winner?
    return 'draw' if @isDraw()
    return null

  ###
  @name isDraw
  @description
  Traverses game tree from the current state to determine
  a draw as soon as possible, so we don't needlessly fill up the board.

  TODO: optimize

  @returns {Boolean}
  ###

  isDraw: ->
    possible_wins = 0

    # Our recursive function will traverse the graph of possible outcomes.
    # If there are any possible wins, then we know the game is not a draw.
    recurse = (game) ->
      spaces = game.getEmptySpaces()
      winner = game.getWinner()

      possible_wins++ if winner?

      # We can exit recursion if a winner was found
      return if possible_wins > 0

      for space in spaces
        child = game.duplicate()

        child.markSpace space, child.current_player

        recurse child

    recurse @

    return possible_wins is 0

  ###
  @name duplicate
  @description
  Returns a new instance of Game with the same state.
  This let's us traverse the game tree in `isDraw` and with Player's minimax
  algorithm so that we may evaluate state at each point in the tree.
  ###

  duplicate: ->
    next_player = if @current_player is @player_a then @player_b else @player_a

    return new @constructor @current_player, next_player, @board

  ###
  @name markSpace
  @description
  Marks a space on the board with player's marker,
  and sets current_player to next.
  ###

  markSpace: ([row, column], player) ->
    throw Error "It's not #{player.marker}'s turn!" unless player is @current_player

    @board[row][column] = player.marker

    @current_player =
      if @current_player is @player_a then @player_b else @player_a

    return @duplicate()

  ###
  @name nextMove
  @description
  Calls on the current player to make their move.
  ###

  nextMove: ->
    @current_player.move @

  ###
  @name play
  @description
  Automates play between two computers until a result is determined.

  Since `getResult()` calls on `isDraw()`, which is a
  recursive tree traversal method, this gets very expensive.

  TODO: refactor
  ###

  play: ->
    while not @getResult()?
      @nextMove()

  ###
  @name boardToString
  @description
  Returns a string representation of the current board state.

  @returns {String}
  ###

  boardToString: ->
    spaces = []

    # We want a single space instead of `null` for printing empty spaces.
    @eachSpace (coords, value) ->
      spaces.push value or ' '

    return ("""
      +---+---+---+
      | #{spaces[0]} | #{spaces[1]} | #{spaces[2]} |
      +---+---+---+
      | #{spaces[3]} | #{spaces[4]} | #{spaces[5]} |
      +---+---+---+
      | #{spaces[6]} | #{spaces[7]} | #{spaces[8]} |
      +---+---+---+
    """)

module.exports = Game
