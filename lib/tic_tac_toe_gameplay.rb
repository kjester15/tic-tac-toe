require_relative '../lib/tictactoe'

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