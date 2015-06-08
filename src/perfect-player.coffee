Player = require './player'

class PerfectPlayer extends Player
  getMove: (game) ->
    scoreGame = (game, depth) =>
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

    minimax = (game, depth) =>
      empty_spaces = game.getEmptySpaces()

      if game.getWinner()? or empty_spaces.length is 0
        return score: scoreGame(game, depth)

      if game.current_player.marker is @marker
        best_score = Number.NEGATIVE_INFINITY
        best_space = [-1, -1]

        for space in empty_spaces
          child = game.duplicate()
          child.markSpace space, child.current_player

          score = minimax(child, depth + 1).score

          if score > best_score
            best_score = score
            best_space = space

        return {
          score: best_score
          space: best_space
        }

      else
        best_score = Number.POSITIVE_INFINITY
        best_space = [-1, -1]

        for space in empty_spaces
          child = game.duplicate()
          child.markSpace space, child.current_player

          score = minimax(child, depth + 1).score

          if score < best_score
            best_score = score
            best_space = space

        return {
          score: best_score
          space: best_space
        }

    result = minimax game, 0

    return result.space

module.exports = PerfectPlayer
