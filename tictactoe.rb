class Game
    def initialize
        board = [[1,2,3], [4,5,6], [7,8,9]]
        puts "Welcome to Tic Tac Toe! Let's play a game in the console."
        puts "What is player 1's name?" 
        @player_1_name = gets
        puts "What is player 2's name?" 
        @player_2_name = gets
        p board
    end

    def get_player_selection(number)
    end

end

newGame = Game.new
