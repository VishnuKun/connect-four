# frozen_string_literal: true

# spec/connect_four_spec.rb

require 'connect_four'
require 'spec_helper'

describe ConnectFour do
  describe '#display_board' do
    subject(:game_board) { described_class.new }
    context 'when invoked' do
      it 'should display the board' do
        board = <<-BOARD
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
        target = board[5][0]
        expect(target).to eq(piece)
        game_board.place_piece(column, piece)
      end
    end

    context 'when given 4th gate' do
      it 'should place the piece(○) correctly on 4th column 3rd line' do
        board = game_piece.instance_variable_get(:@board)
        column = 4
        piece = '○'
        target = board[2][3]
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
    context 'when method finds winning pattern in first column' do
      it 'returns true' do
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

    context 'when method finds winning pattern across column 3 & 6 horizontally' do
      it 'returns true' do
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

    context 'when method finds winning pattern across column 1 & 4 diagonally' do
      it 'returns true' do
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

    context 'when method finds no winning pattern ' do
      it 'returns false' do
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

  describe '#vacant?' do
    subject(:game_columns) { described_class.new }
    context 'when a column is fully filled' do
      before do
        column = 3
        board = game_columns.instance_variable_get(:@board)
        board[column - 1].each_index { |i| board[column - 1][i] = '●' }
      end
      it 'returns true' do
        column = 3
        target = game_columns.vacant?(column)
        expect(target).to be false
      end
    end

    context 'when a column is in-completely filled' do
      before do
        column = 4
        board = game_columns.instance_variable_get(:@board)
        board[column - 1].each_index { |i| board[column - 1][i] = '●' if i < 4 }
      end
      it 'returns true' do
        column = 4
        target = game_columns.vacant?(column)
        expect(target).to be true
      end
    end
  end
end
