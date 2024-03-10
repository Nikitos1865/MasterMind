require './computer'
require './const'
require './player'
require './board'

class Game 
include Constants

    attr_accessor :computer, :board, :player 

    def initialize(name)
        @board = Board.new
        @player = Player.new(name)
        @computer = Computer.new

    end 

    def display_board(num)
        for num in 0..num do
            arr_to_check = board.get_row(num)
            puts "#{arr_to_check} Exact Match: #{computer.exact_match(arr_to_check)}, Color Match: #{computer.color_match(arr_to_check)-computer.exact_match(arr_to_check)}"
        end 
    end 

    def show_colors
        puts "The colors you may choose for your guess are as follows: "
        puts "red, blue, yellow, green, purple, orange"
    end
    
    def accept_guess(guess)
        guess = guess.downcase.chomp.split(" ")
        board.set_row(12-player.guesses_left, guess)
        player.guesses_left -= 1
    end 


end 



game = Game.new("Bibo")


p game.computer.computer_choice


game.show_colors

p game.player.guesses_left

p game.accept_guess(gets)
game.display_board(11-game.player.guesses_left)

p game.accept_guess(gets)
game.display_board(11-game.player.guesses_left)



#Exact Matches: #{@computer.exact_match(@board.get_row(num))}, Color Matches: #{@board.color_match(@board.get_row(num))}"