require './computer'
require './const'
require './player'
require './board'

class Game 
include Constants

    attr_accessor :computer, :board, :player, :code_breaker

    def initialize(name)
        @board = Board.new
        @player = Player.new(name)
        @computer = Computer.new
        @code_breaker = player 

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
        if valid_guess?(guess)
            board.set_row(12-player.guesses_left, guess)
            player.guesses_left -= 1
            return 0
        else puts "Invalid guess, the guess must from the set colors"
            return 1
        end
    end 

    def string_to_array(string)
        string.downcase.chomp.split(" ")
    end

    def valid_guess?(guess)
        output = true
        guess.each do |val|
            if !Constants::COLORS.include?(val)
                output = false
            end
        end 
        output
    end 

    def player_turn
        valid_turn = false 
        while valid_turn == false
            b = accept_guess(gets)
            if b == 0
                valid_turn = true 
            end
        end
    end 

    def player_makes_code 
        valid_code = false 
        while valid_code == false 
            b = gets.downcase.chomp.split(" ")
            if valid_guess?(b)
                valid_code = true 
                player.code_make(b)
            else puts "Invalid code, must be of the colors here: #{Constants::COLORS}"  
            end 
        end 
    end 


end 



game = Game.new("Bibo")



game.player_makes_code

p game.player.code 




#Exact Matches: #{@computer.exact_match(@board.get_row(num))}, Color Matches: #{@board.color_match(@board.get_row(num))}"

