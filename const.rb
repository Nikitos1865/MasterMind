module Constants 

    COLORS = ["red", "blue", "yellow", "green", "purple", "orange"] unless const_defined?(:COLORS)

    def welcome
        puts "Welcome to Master Mind, please enter your name"
    end 
    

end 


