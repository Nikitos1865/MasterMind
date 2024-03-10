

class Player 
    attr_accessor :name, :guesses_left, :points, :latest_guess

    def initialize(name)
        @name = name
        @guesses_left = 12
        @points = 0
    end

end
