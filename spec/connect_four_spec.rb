# frozen_string_literal: true

require 'connect_four'
require 'spec_helper'

describe ConnectFour do
  describe '#display_board' do
    subject(:game_board) { described_class.new }
    context 'when invoked' do
      it 'should display the board' do
        board = <<-BOARD
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
        BOARD
        expect(game_board).to receive(:puts).with(board)
        game_board.display_board
      end
    end
  end

  describe '#place_piece' do
    subject(:game_piece) { described_class.new }
    context 'when given 1st gate' do
      it 'should place the piece(●) correctly on 1st column last line' do
        board = game_piece.instance_variable_get(:@board)
        column = 1
        piece = '●'
        target = board[column - 1][-1]
        expect(target).to eq(piece)
        game_board.place_piece(column, piece)
      end
    end

    context 'when given 4th gate' do
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

  describe '#verify' do
    subject(:game_verify) { described_class.new }
    context 'when given invalid column' do
      it 'returns nil' do
        invalid_column = 9
        result = game_board.verify(invalid_column)
        expect(result).to eq nil
      end
    end

    context 'when given invalid column' do
      it 'returns nil' do
        invalid_column = 'Q'
        result = game_board.verify(invalid_column)
        expect(result).to eq nil
      end
    end

    context 'when given valid column' do
      it 'returns given column' do
        valid_column = 5
        result = game_board.verify(valid_column)
        expect(result).to eq valid_column
      end
    end
  end

  describe '#game_over?' do
    subject(:game_over) { described_class.new }
    context "when method finds winning pattern in first column" do
      it "returns true" do
        board = [
          ['+', '●', '●', '●', '●', '+'],
          ['+', '+', '+', '+', '+', '+'],
          ['+', '+', '+', '+', '+', '+'],
          ['+', '+', '+', '+', '+', '+'],
          ['+', '+', '+', '+', '+', '+'],
          ['+', '+', '+', '+', '+', '+'],
          ['+', '+', '+', '+', '+', '+']
        ]
        expect(game_board.game_over?(board)).to be true
      end
    end

    context "when method finds winning pattern across column 3 & 6 horizontally" do
      it "returns true" do
        board = [
          ['+', '+', '+', '+', '+', '+'],
          ['+', '+', '+', '+', '+', '+'],
          ['+', '+', '●', '+', '+', '+'],
          ['+', '+', '●', '+', '+', '+'],
          ['+', '+', '●', '+', '+', '+'],
          ['+', '+', '●', '+', '+', '+'],
          ['+', '+', '+', '+', '+', '+']
        ]
        expect(game_board.game_over?(board)).to be true
      end
    end

    context "when method finds winning pattern across column 1 & 4 diagonally" do
      it "returns true" do
        board = [
          ['+', '●', '+', '+', '+', '+'],
          ['+', '+', '●', '+', '+', '+'],
          ['+', '+', '+', '●', '+', '+'],
          ['+', '+', '+', '+', '●', '+'],
          ['+', '+', '+', '+', '+', '+'],
          ['+', '+', '+', '+', '+', '+'],
          ['+', '+', '+', '+', '+', '+']
        ]
        expect(game_board.game_over?(board)).to be true
      end
    end

    context "when method finds no winning pattern " do
      it "returns false" do
        board = [
          ['+', '●', '+', '+', '+', '+'],
          ['+', '+', '○', '+', '+', '+'],
          ['+', '+', '+', '●', '+', '+'],
          ['+', '+', '+', '○', '○', '+'],
          ['+', '+', '+', '+', '+', '+'],
          ['+', '+', '+', '+', '+', '+'],
          ['+', '+', '+', '+', '+', '+']
        ]
        expect(game_board.game_over?(board)).to be false
      end
    end
  end
end
