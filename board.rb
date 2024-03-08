class Board
    attr_accessor :board_arr

    ROWS = 12.freeze 
    COLUMNS = 4.freeze 

    def initialize
        @board_arr = Array.new(ROWS){Array.new(COLUMNS)}
    end 

    def show_row(num)
        board_arr[num]
    end 

    def set_row(num, arr)
        board_arr[num] = arr
    end 
end 
 
b = Board.new

b.set_row(3,["green", "purple", "red", "yellow"])

p b.show_row(3)

p b.board_arr