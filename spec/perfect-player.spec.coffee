Game = require '../src/game'
Player = require '../src/player'
PerfectPlayer = require '../src/perfect-player'

game = null

x = new PerfectPlayer 'x'
o = new Player 'o'

describe 'PerfectPlayer:', ->
  beforeEach ->
    game = new Game x, o

  describe 'getMove:', ->
    it 'Should return the perfect move.', ->
      game.board = [
        ['x', null, null]
        [null, 'x', null]
        ['o', 'o', null]
      ]

      expect(x.getMove(game)).toEqual [2, 2]

    it 'Should return the obvious move.', ->
      game.board = [
        ['x', 'o', 'x']
        ['x', 'x', 'o']
        ['o', 'o', null]
      ]

      expect(x.getMove(game)).toEqual [2, 2]

    it 'Should return the winning move.', ->
      game.board = [
        ['x', 'o', null]
        ['x', 'x', 'o']
        ['o', 'o', null]
      ]

      expect(x.getMove(game)).toEqual [2, 2]

    it "Should block an opponent's branch.", ->
      game.board = [
        ['x', null, null]
        [null, 'o', null]
        [null, null, 'o']
      ]

      expect(x.getMove(game)).toEqual [0, 2]
      # [2, 1] would also attempt to block a branch.
      # Our AI picks the first choice when they are weighted the same.

    it "Should block an opponent's win.", ->
      game.board = [
        ['x', null, null]
        [null, 'x', 'o']
        [null, null, 'o']
      ]

      expect(x.getMove(game)).toEqual [0, 2]

    it 'Should pick the win.', ->
      game.board = [
        [null, null, 'x']
        [null, 'x', 'o']
        [null, null, 'o']
      ]

      expect(x.getMove(game)).toEqual [2, 0]

    it 'Should create two winning branches.', ->
      game.board = [
        [null, null, 'x']
        [null, 'x', 'o']
        ['o', null, null]
      ]

      expect(x.getMove(game)).toEqual [0, 0]
