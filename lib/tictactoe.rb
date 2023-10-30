# the Game class represents the current game of Tic Tac Toe
class Game
  attr_accessor :board, :winner, :player_turn, :win, :game_finished, :draw, :board_array

  def initialize
    @board = " 1 | 2 | 3 \n---+---+---\n 4 | 5 | 6 \n---+---+---\n 7 | 8 | 9 "
    @board_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @winner = ''
    @player_turn = ''
    @draw = ''
    @win = false
    @game_finished = false
  end

  def print_board
    puts @board
  end

  # method to replace number on board with player's symbol
  def replace_number(board, selection, character)
    @board = board.gsub(selection, character)
    @board_array.map! { |x| x == selection.to_i ? character : x }
  end

  def check_win(character)
    # check if their is a winning streak on the board
    # if 3 in a row equal the players character, set @win to true
    if (@board_array[0] == character && @board_array[1] == character && @board_array[2] == character) ||
      (@board_array[3] == character && @board_array[4] == character && @board_array[5] == character) ||
      (@board_array[6] == character && @board_array[7] == character && @board_array[8] == character) ||
      (@board_array[0] == character && @board_array[3] == character && @board_array[6] == character) ||
      (@board_array[1] == character && @board_array[4] == character && @board_array[7] == character) ||
      (@board_array[2] == character && @board_array[5] == character && @board_array[8] == character) ||
      (@board_array[2] == character && @board_array[5] == character && @board_array[8] == character) ||
      (@board_array[0] == character && @board_array[4] == character && @board_array[8] == character) ||
      (@board_array[2] == character && @board_array[4] == character && @board_array[6] == character)
      @win = true
      @game_finished = true
      @winner = @player_turn
    end
    # check for a draw
    if @board_array.none? { |x| x.is_a?(Integer) }
      @game_finished = true
      @draw = true
    end
  end

  def print_winner
    puts "#{@winner} wins!"
  end
end

# the Player class represents the user playing the game
class Player
  attr_accessor :selection, :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def print_symbol
    @symbol
  end

  def make_selection(name)
    puts "#{name}, choose a number on the board to make a move."
    @selection = gets.chomp
    until @selection.match(/[1-9]/)
      puts 'Please choose a valid selection from the remaining numbers on the board.'
      @selection = gets.chomp
    end
    @selection
  end
end
