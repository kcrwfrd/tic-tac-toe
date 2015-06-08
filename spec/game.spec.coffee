Game = require '../src/Game'
Player = require '../src/player'
game = null

x = new Player 'x'
o = new Player 'o'

describe 'Game:', ->
  beforeEach ->
    game = new Game x, o

  describe 'getEmptySpaces:', ->
    it 'Should return 9 spaces on an empty board.', ->
      game.board = [
        [null, null, null]
        [null, null, null]
        [null, null, null]
      ]

      spaces = game.getEmptySpaces()

      expect(spaces.length).toBe 9

    it 'Should return the empty spaces on a partially-filled board.', ->
      game.board = [
        [null, 'x', 'o']
        [null, 'o', null]
        ['x', 'o', 'x']
      ]

      expect(game.getEmptySpaces().length).toBe 3

  describe 'isDraw:', ->
    it 'Should return true if the final move results in a draw.', ->
      game.board = [
        ['x', 'o', 'x']
        ['o', 'o', null]
        ['x', 'x', 'o']
      ]

      expect(game.isDraw()).toBe true

    it 'Should return false if the final move can win the game.', ->
      game.board = [
        ['x', 'o', 'x']
        ['o', 'o', null]
        ['x', 'x', 'o']
      ]

      game.current_player = o

      expect(game.isDraw()).toBe false

    it 'Should return true if both branches result in a draw.', ->
      game.board = [
        [null, 'x', 'o']
        [null, 'o', 'x']
        ['x', 'o', 'x']
      ]

      expect(game.isDraw()).toBe true

      game.board = [
        ['o', 'x', 'o']
        [null, 'x', null]
        ['x', 'o', 'x']
      ]

      expect(game.isDraw()).toBe true

    it 'Should return false if the outcome is hopeless for current player.', ->
      game.board = [
        [null, null, 'x']
        ['x', 'o', 'x']
        [null, 'o', 'o']
      ]

      expect(game.isDraw()).toBe false

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
      it 'Should return null if the board is empty.', ->
        game.board = [
          [null, null, null]
          [null, null, null]
          [null, null, null]
        ]

        expect(game.getResult()).toBe null

      it 'Should return null for an unfinished game.', ->
        game.board = [
          ['o', 'x', 'o']
          [null, 'x', 'x']
          ['x', 'o', null]
        ]

        expect(game.getResult()).toBe null

      it 'Should return null for an unfinished game.', ->
        unfinished_boards = [
          [
            ['o', 'x', 'o']
            [null, 'x', null]
            ['x', 'o', null]
          ], [
            ['x', null, null]
            ['o', null, null]
            ['x', null, 'o']
          ]
        ]

        for board in unfinished_boards
          game.board = board

          expect(game.getResult()).toBe null
