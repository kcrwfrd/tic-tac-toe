Game = require '../src/Game'
game = null

describe 'Game:', ->
  beforeEach ->
    game = new Game()

  describe 'getResult:', ->
    # Current player defaults to 'x'

    describe 'Draws:', ->
      it 'Should return a draw if the final move results in a draw.', ->
        game.board = [
          ['x', 'o', 'x']
          ['o', 'o', null]
          ['x', 'x', 'o']
        ]

        expect(game.getResult()).toBe 'draw'

      it 'Should not return a draw if the final move can win the game.', ->
        game.board = [
          ['x', 'o', 'x']
          ['o', 'o', null]
          ['x', 'x', 'o']
        ]

        game.current_player = 'o'

        expect(game.getResult()).toBe null

      it 'Should return a draw if the final move is a draw, no matter whose turn it is.', ->
        game.board = [
          ['x', 'o', 'o']
          ['o', 'x', 'x']
          [null, 'x', 'o']
        ]

        expect(game.getResult()).toBe 'draw'

        game.current_player = 'o'

        expect(game.getResult()).toBe 'draw'

      it 'Should return a draw if both branches result in a draw.', ->
        game.board = [
          [null, 'x', 'o']
          [null, 'o', 'x']
          ['x', 'o', 'x']
        ]

        expect(game.getResult()).toBe 'draw'

        game.board = [
          ['o', 'x', 'o']
          [null, 'x', null]
          ['x', 'o', 'x']
        ]

        expect(game.getResult()).toBe 'draw'

        game.board = [
          ['x', 'o', null]
          ['o', 'o', 'x']
          ['x', 'x', null]
        ]

        expect(game.getResult()).toBe 'draw'

    describe 'Wins:', ->
      it 'Should return the result of a diagonal line.', ->
        game.board = [
          ['x', null, 'o']
          [null, 'x', 'o']
          [null, null, 'x']
        ]

        expect(game.getResult()).toBe 'x'

      it 'Should return the result of a reverse diagonal line.', ->
        game.board = [
          ['o', null, 'x']
          [null, 'x', 'o']
          ['x', null, null]
        ]

        expect(game.getResult()).toBe 'x'

      it 'Should return the result of a horizontal line.', ->
        game.board = [
          [null, 'x', 'x']
          ['o', 'o', 'o']
          [null, null, null]
        ]

        expect(game.getResult()).toBe 'o'

      it 'Should return the result of a vertical line.', ->
        game.board = [
          ['o', 'x', null]
          ['o', 'x', null]
          ['o', null, null]
        ]

        expect(game.getResult()).toBe 'o'

    describe 'Unfinished:', ->
      it 'Should return undefined for an unfinished game.', ->
        unfinished_boards = [
          [
            [null, null, null]
            [null, null, null]
            [null, null, null]
          ], [
            ['o', 'x', 'o']
            [null, 'x', null]
            ['x', 'o', null]
          ], [
            ['x', null, null]
            ['o', null, null]
            ['x', null, 'o']
          ], [
            ['o', 'x', 'o']
            [null, 'x', 'x']
            ['x', 'o', null]
          ]
        ]

        for board in unfinished_boards
          game.board = board

          expect(game.getResult()).toBe null
