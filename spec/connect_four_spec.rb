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

  describe "#place_piece" do 
    subject(:game_piece) { described_class.new }
    context "when given 1st gate" do 
      it 'should place the piece(●) correctly on 1st column last line' do 
        board = game_piece.instance_variable_get(:@board)
        column = 1
        piece = '●'
        target = board[column - 1][-1]
        expect(target).to eq(piece)
        game_board.place_piece(column, piece)
      end
    end

    context "when given 4th gate" do 
      it 'should place the piece(○) correctly on 4th column 3rd line' do 
        board = game_piece.instance_variable_get(:@board)
        column = 4
        piece = '○'
        target = board[column - 1][2]
        expect(target).to eq(piece)
        game_board.place_piece(column, piece)
      end
    end
  end
end
