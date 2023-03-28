class Game
    def initialize
        board = [[1,2,3], [4,5,6], [7,8,9]]
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
end


puts "Welcome to Tic Tac Toe! Let's play a game in the console."

# create player 1 class
puts "What is player 1's name?" 
player_name = gets.chomp
puts "What is player 1's symbol?" 
player_symbol = gets.chomp
player1 = Player.new(player_name, player_symbol)

# create player 2 class
puts "What is player 2's name?" 
player_name = gets.chomp
player_symbol = gets.chomp
player2 = Player.new(player_name, player_symbol)


puts player1.get_name_symbol
puts player2.get_name_symbol

newGame = Game.new
