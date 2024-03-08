require "./game"
class Computer
    attr_accessor :computer_choice
    

    def initialize
        @computer_choice = Game::COLORS.sample(4)
    end 

    
end 

comp = Computer.new

puts comp.computer_choice