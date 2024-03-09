

class Player 
    attr_accessor :name, :guesses_left

    def initialize(name)
        @name = name
        @guesses_left = 12
    end

end
