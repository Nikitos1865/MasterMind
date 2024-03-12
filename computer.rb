require './const'

class Computer
    attr_accessor :computer_choice, :computer_guess
    

    def initialize
        @computer_choice = Constants::COLORS.sample(4)
    end 

    def exact_match(arr)
    exact_match = 0
        arr.each_index do |key|
            if arr[key] == computer_choice[key]
                exact_match += 1
            end
        end
        exact_match
    end 

    def color_match(arr)
        color_match = 0 
        arr.each do |key|
            if computer_choice.include?(key)
                color_match += 1
            end
        end 
        color_match
    end 

    def initial_guess 
        computer_guess = Constants::COLORS.sample(4)
    end 

end 

