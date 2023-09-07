# frozen_string_literal: true

# Connect Four Game

class ConnectFour
  attr_accessor :board

  def initialize
    @board = Array.new(6) { Array.new(7, '+')}
  end

  # prints the board on the screen
  def display_board
    b = @board
    column_nums = "| 1 | 2 | 3 | 4 | 5 | 6 | 7 |"
    separator = "|---|---|---|---|---|---|---|"
    row1 = "| #{b[0][0]} | #{b[0][1]} | #{b[0][2]} | #{b[0][3]} | #{b[0][4]} | #{b[0][5]} | #{b[0][6]} |"
    row2 = "| #{b[1][0]} | #{b[1][1]} | #{b[1][2]} | #{b[1][3]} | #{b[1][4]} | #{b[1][5]} | #{b[1][6]} |"
    row3 = "| #{b[2][0]} | #{b[2][1]} | #{b[2][2]} | #{b[2][3]} | #{b[2][4]} | #{b[2][5]} | #{b[2][6]} |"
    row4 = "| #{b[3][0]} | #{b[3][1]} | #{b[3][2]} | #{b[3][3]} | #{b[3][4]} | #{b[3][5]} | #{b[3][6]} |"
    row5 = "| #{b[4][0]} | #{b[4][1]} | #{b[4][2]} | #{b[4][3]} | #{b[4][4]} | #{b[4][5]} | #{b[4][6]} |"
    row6 = "| #{b[5][0]} | #{b[5][1]} | #{b[5][2]} | #{b[5][3]} | #{b[5][4]} | #{b[5][5]} | #{b[5][6]} |"
    last_row = "|---|---|---|---|---|---|---|"
    result = <<-Board
        #{column_nums}
        #{separator}
        #{row1}
        #{row2}
        #{row3}
        #{row4}
        #{row5}
        #{row6}
        #{last_row}
    Board
    puts result
  end
  
end
