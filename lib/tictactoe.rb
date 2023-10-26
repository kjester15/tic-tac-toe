# the Game class represents the current game of Tic Tac Toe
class Game
  attr_accessor :board, :winner, :player_turn, :win, :game_finished, :draw

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

while
    # initialize new game - DONE
    new_game = Game.new
    puts "Welcome to Tic Tac Toe! Let's play a game in the console."

    # create players - DONE
    puts "What is player 1's name?"
    player_name = gets.chomp
    puts "What letter would you like to use for your game marker, #{player_name}?"
    player_symbol = gets.chomp
    until player_symbol.length == 1 && player_symbol.match(/[A-Za-z]/)
      puts 'Please choose a letter that is only 1 character long, and is a valid alphabetical letter.'
      player_symbol = gets.chomp
    end
    player1 = Player.new(player_name, player_symbol)

    puts "What is player 2's name?"
    player_name = gets.chomp
    puts "What letter would you like to use for your game marker, #{player_name}?"
    player_symbol = gets.chomp
    until player_symbol.length == 1 && player_symbol.match(/[A-Za-z]/)
      puts 'Please choose a letter that is only 1 character long, and is a valid alphabetical letter.'
      player_symbol = gets.chomp
    end
    until player_symbol != player1.print_symbol
      puts 'Please select a different letter/symbol'
      player_symbol = gets.chomp
    end
    player2 = Player.new(player_name, player_symbol)

    # print game board - DONE
    puts new_game.print_board

    # loop and let players make choices until game is over - DONE
    while not new_game.game_finished
      # first player makes selection, then check if game is over
      new_game.player_turn = player1.name
      selection = player1.make_selection(player1.name)
      new_game.replace_number(new_game.board, selection, player1.print_symbol)
      new_game.check_win(player1.print_symbol)
      new_game.print_board
      # if the game isn't over, player 2 can select, then check if game is over
      if not new_game.game_finished
        new_game.player_turn = player2.name
        selection = player2.make_selection(player2.name)
        new_game.replace_number(new_game.board, selection, player2.print_symbol)
        new_game.check_win(player2.print_symbol)
        new_game.print_board
      end
    end

    # return the winner - DONE
    if new_game.draw == true
      puts "It's a draw!"
    else
      new_game.print_winner
    end

    # ask to play another game - DONE
    answer = ''
    until answer == "yes" || answer == "no"
      puts "Would you like to play again?"
      answer = gets.chomp.downcase
      if answer == "yes" || answer == "no"
        break
      else
        puts "Please answer with 'yes' or 'no'"
      end
    end
    if answer == 'no'
      break
    end
end
