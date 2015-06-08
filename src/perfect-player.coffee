Player = require './player'

class PerfectPlayer extends Player
  getMove: (game) ->
    choice = null

    score = (game, depth) =>
      winner = game.getWinner()

      # I win
      if winner? and winner is @marker
        return 100 - depth

      # Opponent wins
      else if winner?
        return depth - 100

      # Draw
      else
        return 0

    minimax = (game, depth, maximizing_player) =>
      return score(game, depth) if game.getResult()?

      empty_spaces = game.getEmptySpaces()

      for space in empty_spaces
        child = game.duplicate()

        child.markSpace space, child.current_player

        if maximizing_player
          best_value = Number.NEGATIVE_INFINITY
          value = minimax child, depth + 1, false

          if value > best_value
            best_value = value

            choice =
              move: space
              value: value

          return best_value

        else
          best_value = Number.POSITIVE_INFINITY
          value = minimax child, depth + 1, true

          if value < best_value
            best_value = value

            choice =
              move: space
              value: value

          return best_value

    minimax game, 0, true

    return choice.move

module.exports = PerfectPlayer
