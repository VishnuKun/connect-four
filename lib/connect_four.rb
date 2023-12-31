# frozen_string_literal: true

# Connect Four Game
# ConnectFour
class ConnectFour
  attr_accessor :board

  def initialize
    @board = Array.new(6) { Array.new(7, '+') }
  end

  # prints the board on the screen
  def display_board
    b = @board
    column_nums = '| 1 | 2 | 3 | 4 | 5 | 6 | 7 |'
    separator = '|---|---|---|---|---|---|---|'
    row1 = "| #{b[0][0]} | #{b[0][1]} | #{b[0][2]} | #{b[0][3]} | #{b[0][4]} | #{b[0][5]} | #{b[0][6]} |"
    row2 = "| #{b[1][0]} | #{b[1][1]} | #{b[1][2]} | #{b[1][3]} | #{b[1][4]} | #{b[1][5]} | #{b[1][6]} |"
    row3 = "| #{b[2][0]} | #{b[2][1]} | #{b[2][2]} | #{b[2][3]} | #{b[2][4]} | #{b[2][5]} | #{b[2][6]} |"
    row4 = "| #{b[3][0]} | #{b[3][1]} | #{b[3][2]} | #{b[3][3]} | #{b[3][4]} | #{b[3][5]} | #{b[3][6]} |"
    row5 = "| #{b[4][0]} | #{b[4][1]} | #{b[4][2]} | #{b[4][3]} | #{b[4][4]} | #{b[4][5]} | #{b[4][6]} |"
    row6 = "| #{b[5][0]} | #{b[5][1]} | #{b[5][2]} | #{b[5][3]} | #{b[5][4]} | #{b[5][5]} | #{b[5][6]} |"
    last_row = '|---|---|---|---|---|---|---|'
    result = <<-BOARD
        #{column_nums}
        #{separator}
        #{row1}
        #{row2}
        #{row3}
        #{row4}
        #{row5}
        #{row6}
        #{last_row}
    BOARD
    puts result
  end

  # adds the player's respective mark/piece on the board
  def place_piece(column, piece)
    @board.reverse!.each_index do |row|
      target = @board[row][column - 1]
      next unless target == '+'

      @board[row][column - 1] = piece
      @board.reverse!
      break
    end
  end

  # verifies the column given by players
  def verify(column)
    return unless column.is_a?(Integer)

    column.between?(1, 7) ? column : nil
  end

  # checks for any winning patterns in the current board
  def game_over?(board)
    winning_combinations = [
      # rows -
      [[0, 0], [0, 1], [0, 2], [0, 3]], # first row
      [[0, 1], [0, 2], [0, 3], [0, 4]],
      [[0, 2], [0, 3], [0, 4], [0, 5]],
      [[0, 3], [0, 4], [0, 5], [0, 6]],

      [[1, 0], [1, 1], [1, 2], [1, 3]], # second row
      [[1, 1], [1, 2], [1, 3], [1, 4]],
      [[1, 2], [1, 3], [1, 4], [1, 5]],
      [[1, 3], [1, 4], [1, 5], [1, 6]],

      [[2, 0], [2, 1], [2, 2], [2, 3]], # third row
      [[2, 1], [2, 2], [2, 3], [2, 4]],
      [[2, 2], [2, 3], [2, 4], [2, 5]],
      [[2, 3], [2, 4], [2, 5], [2, 6]],

      [[3, 0], [3, 1], [3, 2], [3, 3]], # fourth row
      [[3, 1], [3, 2], [3, 3], [3, 4]],
      [[3, 2], [3, 3], [3, 4], [3, 5]],
      [[3, 3], [3, 4], [3, 5], [3, 6]],

      [[4, 0], [4, 1], [4, 2], [4, 3]], # fifth row
      [[4, 1], [4, 2], [4, 3], [4, 4]],
      [[4, 2], [4, 3], [4, 4], [4, 5]],
      [[4, 3], [4, 4], [4, 5], [4, 6]],

      [[5, 0], [5, 1], [5, 2], [5, 3]], # sixth row
      [[5, 1], [5, 2], [5, 3], [5, 4]],
      [[5, 2], [5, 3], [5, 4], [5, 5]],
      [[5, 3], [5, 4], [5, 5], [5, 6]],

      # columns
      [[0, 0], [1, 0], [2, 0], [3, 0]], # first column
      [[1, 0], [2, 0], [3, 0], [4, 0]],
      [[2, 0], [3, 0], [4, 0], [5, 0]],

      [[0, 1], [1, 1], [2, 1], [3, 1]], # second column
      [[1, 1], [2, 1], [3, 1], [4, 1]],
      [[2, 1], [3, 1], [4, 1], [5, 1]],

      [[0, 2], [1, 2], [2, 2], [3, 2]], # third column
      [[1, 2], [2, 2], [3, 2], [4, 2]],
      [[2, 2], [3, 2], [4, 2], [5, 2]],

      [[0, 3], [1, 3], [2, 3], [3, 3]], # fourth column
      [[1, 3], [2, 3], [3, 3], [4, 3]],
      [[2, 3], [3, 3], [4, 3], [5, 3]],

      [[0, 4], [1, 4], [2, 4], [3, 4]], # fifth column
      [[1, 4], [2, 4], [3, 4], [4, 4]],
      [[2, 4], [3, 4], [4, 4], [5, 4]],

      [[0, 5], [1, 5], [2, 5], [3, 5]], # sixth column
      [[1, 5], [2, 5], [3, 5], [4, 5]],
      [[2, 5], [3, 5], [4, 5], [5, 5]],

      [[0, 6], [1, 6], [2, 6], [3, 6]], # seventh column
      [[1, 6], [2, 6], [3, 6], [4, 6]],
      [[2, 6], [3, 6], [4, 6], [5, 6]],

      # diagonals
      [[0, 0], [1, 1], [2, 2], [3, 3]], # from first row
      [[0, 1], [1, 2], [2, 3], [3, 4]],
      [[0, 2], [1, 3], [2, 4], [3, 5]],
      [[0, 3], [1, 4], [2, 5], [3, 6]],

      [[0, 3], [1, 2], [2, 1], [3, 0]],
      [[0, 4], [1, 3], [2, 2], [3, 1]],
      [[0, 5], [1, 4], [2, 3], [3, 2]],
      [[0, 6], [1, 5], [2, 4], [3, 3]],

      [[1, 0], [2, 1], [3, 2], [4, 3]], # from second row
      [[1, 1], [2, 2], [3, 3], [4, 4]],
      [[1, 2], [2, 3], [3, 4], [4, 5]],
      [[1, 3], [2, 4], [3, 5], [4, 6]],

      [[1, 3], [2, 2], [3, 1], [4, 0]],
      [[1, 4], [2, 3], [3, 2], [4, 1]],
      [[1, 5], [2, 4], [3, 3], [4, 2]],
      [[1, 6], [2, 5], [3, 4], [4, 3]],

      [[2, 0], [3, 1], [4, 2], [5, 3]], # from third row
      [[2, 1], [3, 2], [4, 3], [5, 4]],
      [[2, 2], [3, 3], [4, 4], [5, 5]],
      [[2, 3], [3, 4], [4, 5], [5, 6]],

      [[2, 3], [3, 2], [4, 1], [5, 0]],
      [[2, 4], [3, 3], [4, 2], [5, 1]],
      [[2, 5], [3, 4], [4, 3], [5, 2]],
      [[2, 6], [3, 5], [4, 4], [5, 3]]
    ]

    winning_combinations.each do |combination|
      marks = combination.map { |row_index, column_index| board[row_index][column_index] }
      return true if marks.uniq.length == 1 && marks[0] != '+'
    end
    false
  end

  # Checks whether one column is completely  filled or not
  def vacant?(column)
    marks = []
    row_index = 0
    while row_index < 6
      marks << @board[row_index][column - 1]
      row_index += 1
    end
    return false if marks.all? { |mark| mark == marks[0] && mark[0] != '+' }

    true
  end

  # starts the game
  def play_game
    intro
    display_board
    puts ''
    puts '    > Well then lets start the game!'
    puts ''
    print '    > ● Enter your name player1 : '
    player1 = gets.chomp
    print '    > ○ Enter your name player2 : '
    player2 = gets.chomp
    puts ''

    turns = 1
    current_player = nil
    current_mark = nil
    while turns < 43
      turns.odd? ? ((current_player = player1) && (current_mark = '●')) : ((current_player = player2) && (current_mark = '○'))

      print "    #{current_player} select a column to drop your piece(#{current_mark}) into : "
      column = gets.chomp
      puts ''
      while true
        column = column.to_i
        break if column.between?(1, 7)

        puts '    Invalid column! Please enter a number between 1 and 7 only!'
        puts ''
        print "   #{current_player} select a column to drop your piece(#{current_mark}) into : "
        column = gets.chomp

      end

      place_piece(column, current_mark)
      display_board
      result = game_over?(@board)
      if result
        puts ''
        puts "    Game Over! #{current_player} won! "
        break
      end
      turns += 1
    end
  end

  # provides a brief introduction
  def intro
    intro = <<-INTRODUCTION
    > Welcome to the game Connect Four!
    > In this game both of the players takes turns dropping their pieces into the board.#{' '}
    > To drop your piece into a column just give the column number at your turn.
    > Player who manages to drop 4 consecutive pieces, either horizontally, vertically or diagonally wins the game.
    > The board will look like this:#{' '}

    INTRODUCTION
    puts intro
  end
end
