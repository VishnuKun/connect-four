# frozen_string_literal: true

require 'connect_four'
require 'spec_helper'

describe ConnectFour do
  describe '#display_board' do
    subject(:game_board) { described_class.new }
    context 'when invoked' do
      it 'should display the board' do
        board = <<-Board
        Current board status :-

        | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
        |---|---|---|---|---|---|---|
        | + | + | + | + | + | + | + |
        | + | + | + | + | + | + | + |
        | + | + | + | + | + | + | + |
        | + | + | + | + | + | + | + |
        | + | + | + | + | + | + | + |
        | + | + | + | + | + | + | + |
        |---|---|---|---|---|---|---|
        Board
        expect(game_board).to receive(:puts).with(board)
        game_board.display_board
      end
    end
  end
end
