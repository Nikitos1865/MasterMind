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
            puts "#{arr_to_check} Exact Match: #{computer.exact_match(arr_to_check, computer.computer_choice)}, Color Match: #{computer.color_match(arr_to_check, computer.computer_choice)-computer.exact_match(arr_to_check, computer.computer_choice)}"
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
            display_board(11-player.guesses_left)
            return 0
        else puts "Invalid guess, the guess must from the set colors"
            return 1
        end
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
        b
    end 
    
    def computer_round(arr)
        guesses = 11
        computer.initial_guess
        while guesses >= 0 && computer.exact_match(arr, computer.guess) != 4
            puts "Guess # #{12-guesses}: ".chomp+"#{computer_guess(computer_guess(arr))}"
            guesses -= 1  
        end 
        player.points =+ 12-guesses
         if guesses > 0 
            puts "The computer has guessed your code in #{11-guesses} tries, you get #{11-guesses} points"
         else puts "The computer lost the round, you get 12 points"
         end
         player.points += 12-guesses
    end 

    def computer_guess(arr_to_guess)
        computer.exact_match_index(arr_to_guess, computer.guess)[0].each do |index|
            computer.set_guess_index(index, arr_to_guess[index])
        end 
        computer.exact_match_index(arr_to_guess, computer.guess)[1].each do |index|
            computer.set_guess_index(index, Constants::COLORS.sample)
        end
        computer.guess
    end 

    def computer_round_output(num)
        if num > 11
            puts "The computer has run out of guesses"
        else puts "The computer has guessed your code in #{num} guesses"
        end
    end

    def flip_coin
        if rand < 0.5
            @code_breaker = player
            puts "The code breaker will first be the player"
        else
            @code_breaker = computer
            puts "The code breaker will first be the computer"
        end
    end 

    def player_round
        player.guesses_left = 12
        while player.guesses_left > 0 && computer.exact_match(board.get_row(11-player.guesses_left), computer.computer_choice) != 4
            player_turn
        end
        if player.guesses_left > 0 
            puts "You guessed correctly! The computer gets #{12-player.guesses_left} points"
        else puts "You lost, the computer gets 12 points"
        end
        computer.points += 13-player.guesses_left
    end 
    
    def play
        flip_coin
        while computer.points <= 12 || player.points <= 12
            if code_breaker == player
                @code_breaker = computer
                puts "The code breaker is now the player"
                player_round
            else
                @code_breaker = player
                puts "It's the computer's turn now... Make the code!"
                computer_round(player_makes_code)
            end
        end
        
    end 


end 

game = Game.new("Bibo")

game.play

=begin
#game.computer_guesses(['red', 'blue', 'green', 'yellow'])

#p game.computer.exact_match_index(['red', 'blue', 'green', 'yellow'],['red', 'green', 'purple', 'yellow'])

#p game.computer.set_guess_index(0,"blue")
#p game.computer.set_guess_index(1, "red")
p game.computer.set_guess_index(2, "green")
p game.computer.set_guess_index(3, "purple")

p game.computer.guess

p  game.computer.exact_match_index(['red', 'blue', 'green', 'yellow'], game.computer.guess)

players_code = ['red', 'blue', 'green', 'yellow']

game.computer.exact_match_index(players_code, game.computer.guess)[0].each do |index|
    game.computer.set_guess_index(index, players_code[index])
end 
game.computer.exact_match_index(players_code, game.computer.guess)[1].each do |index|
    game.computer.set_guess_index(index, Constants::COLORS.sample(1) )
end

p game.computer.set_guess_index(0,"blue")
p game.computer.set_guess_index(1, "red")
p game.computer.set_guess_index(2, "green")
p game.computer.set_guess_index(3, "purple")
=end

puts game.flip_coin

#12.times {p game.computer_guess(game.computer_guess(['red', 'blue', 'green', 'yellow']))}





#puts game.computer_guesses(['red', 'blue', 'green', 'yellow'])



#Exact Matches: #{@computer.exact_match(@board.get_row(num))}, Color Matches: #{@board.color_match(@board.get_row(num))}"

