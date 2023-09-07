# frozen_string_literal: true

# Connect Four Game

class ConnectFour
  attr_accessor :board
  def initialize
    @board = Array.new(6) { Array.new(7, '+')}
  end
end
