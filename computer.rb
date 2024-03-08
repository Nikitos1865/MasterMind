require './const'




class Computer
    attr_accessor :computer_choice
    

    def initialize
        @computer_choice = ["green", "purple", "yellow", "red"]
        #Colors::COLORS.sample(4)
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

    def feedback(arr)
        return [exact_match(arr), color_match(arr) - exact_match(arr)]
    end 


end 

comp = Computer.new





p comp.feedback(["yellow", "blue", "green", "red"])
