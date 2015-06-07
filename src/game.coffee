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

class Game
  constructor: (@player_a, @player_b) ->
    @board = [
      [null, null, null]
      [null, null, null]
      [null, null, null]
    ]

    @current_player = @player_a

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

  getEmptySpaces: ->
    empty_spaces = []

    @eachSpace (coordinates, value) ->
      empty_spaces.push(coordinates) unless value?

    return empty_spaces

  getValue: ([row, column]) ->
    return @board[row][column]

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

  # TODO: this does not take into consideration the next player's move
  # We'll need to implement a recursive algorithm (minimax) to fully take
  # into account all possible scenarios.
  getResult: ->
    # If all spaces in line are the same value,
    # we can determine a winner.
    winner = null

    has_unblocked_line = false

    for line in lines
      # If a line is unblocked, the game is not yet a draw
      blocked = false

      first_found_value = null
      matching_value_count = 0

      for space in line
        value = @getValue space

        if value? and not first_found_value?
          first_found_value = value
          matching_value_count++

        else if value? and first_found_value?
          if value is first_found_value
            matching_value_count++
          else
            blocked = true

      if matching_value_count is 3
        winner = first_found_value
        break

      else if not blocked
        has_unblocked_line = true

    return winner if winner?
    return 'draw' unless has_unblocked_line
    return null

  markSpace: ([row, column], player) ->
    throw Error "It's not #{player.marker}'s turn!" unless player is @current_player

    @board[row][column] = player.marker

    @current_player =
      if @current_player is @player_a then @player_b else @player_a

  nextMove: ->
    @current_player.move @

  play: ->
    while not @getResult()?
      @nextMove()

  boardToString: ->
    spaces = []

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
