class Game
    attr_accessor :board, :winner, :player_turn, :win, :game_finished

    def initialize
        @board = " 1 | 2 | 3 \n---+---+---\n 4 | 5 | 6 \n---+---+---\n 7 | 8 | 9 "
        @winner = ""
        @player_turn = ""
        @win = false
        @game_finished = false
    end

    def print_board
        puts @board
    end

    # method to replace number on board with player's symbol - SHOULD THIS BE IN HERE? OR IN PLAYER?
    # def replace_number(board, selection, character)
    #     board.gsub(selection, character)
    # end

    def check_win
        #check if their is a winning streak on the board

        # logic to check if there are three in a row - if so, update @win to true
        if @win == true
            puts "You win!"
            @game_finished = true
        end
    end
            
end

class Player
    def initialize(name, symbol)
        @name = name
        @symbol = symbol
    end

    def get_name_symbol
        puts "#{@name}'s symbol is #{@symbol}"
    end

    def make_selection
        puts "Choose a number on the board to make a move"
        @selection = gets
        puts "You chose #{@selection}"
    end
end

while
    # initialize new game
    new_game = Game.new
    puts "Welcome to Tic Tac Toe! Let's play a game in the console."
    
    # create player 1 class
    puts "What is player 1's name?" 
    player_name = gets.chomp
    puts "What letter/symbol would you like to use for your game marker, #{player_name}?" 
    player_symbol = gets.chomp
    player1 = Player.new(player_name, player_symbol)
    
    # create player 2 class
    puts "What is player 2's name?" 
    player_name = gets.chomp
    puts "What letter/symbol would you like to use for your game marker, #{player_name}?"
    player_symbol = gets.chomp
    player2 = Player.new(player_name, player_symbol)
    
    # print player names and symbols, game board, and game_finished value, for error checking - CAN EVENTUALLY DELETE
    puts player1.get_name_symbol
    puts player2.get_name_symbol
    puts new_game.print_board
    puts new_game.game_finished

    # loop and let players make choices until game is over
    while not new_game.game_finished
        # first player makes selection, then check if game is over
        player1.make_selection
        new_game.check_win
        new_game.print_board
        # if the game isn't over, player 2 can select, then check if game is over
        if not new_game.game_finished
            player2.make_selection
            new_game.check_win
            new_game.print_board
        end
    end

    # calculate and return the winner

    # ask to play another game
end


