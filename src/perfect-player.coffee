Player = require './player'

class PerfectPlayer extends Player

  ###
  @name getMove
  @description
  Overrides base class method with minimax algorithm
  to always choose the perfect strategy.

  @param {Game} game

  @returns [Row, Column]
  ###

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

      best_score =
        if game.current_player.marker is @marker
          Number.NEGATIVE_INFINITY
        else
          Number.POSITIVE_INFINITY

      best_space = null

      for space in empty_spaces
        child = game.duplicate()
        child.markSpace space, child.current_player

        score = minimax(child, depth + 1).score

        if game.current_player.marker is @marker
          if score > best_score
            best_score = score
            best_space = space

        else
          if score < best_score
            best_score = score
            best_space = space

      return {
        score: best_score
        space: best_space
      }

    return minimax(game, 0).space

module.exports = PerfectPlayer
