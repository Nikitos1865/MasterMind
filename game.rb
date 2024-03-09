require './computer'
require './const'
require './player'
require './board'

class Game 
include Constants

    attr_accessor :computer, :board

    def initialize(name)
        @board = Board.new
        @player = Player.new(name)
        @computer = Computer.new

    end 

    def display_board(num)
        for num in 0..num do
            puts "#{board.get_row(num)} Exact Match: #{computer.exact_match(board.get_row(num))}, Color Match: #{computer.color_match(board.get_row(num))}"
        end 
    end 
end 



game = Game.new("Bibo")


p game.computer.computer_choice

game.board.set_row(1, ["blue", "green", "yellow", "purple"])

game.display_board(3)

#Exact Matches: #{@computer.exact_match(@board.get_row(num))}, Color Matches: #{@board.color_match(@board.get_row(num))}"