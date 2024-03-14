require './const'

class Computer
    attr_accessor :computer_choice, :guess, :points 
    

    def initialize
        @computer_choice = Constants::COLORS.sample(4)
        @guess = []
        @points = 0
    end 

    def exact_match(arr, arr2)
    exact_match = 0
        arr.each_index do |key|
            if arr[key] == arr2[key]
                exact_match += 1
            end
        end
        exact_match
    end 

    def color_match(arr, arr2)
        color_match = 0 
        arr.each do |key|
            if arr2.include?(key)
                color_match += 1
            end
        end 
        color_match
    end 

    def exact_match_index(arr, arr2)
    indexes = []
    non_indexes = []
        arr.each_index do |index|
            if arr[index] == arr2[index]
                indexes.push(index) 
            else non_indexes.push(index)
            end
        end
        [indexes, non_indexes]
    end 

    def initial_guess 
        @guess = Constants::COLORS.sample(4)
    end 

    def get_guess_index(num)
        @guess[num]
    end

    def set_guess_index(num, string)
        @guess[num] = string
    end 


end 

