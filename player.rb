

class Player 
    attr_accessor :name, :guesses_left, :points, :code

    def initialize(name)
        @name = name
        @guesses_left = 12
        @points = 0
        @code = []
    end

    def code_make(arr)
        @code = arr 
    end 

end
