

class Board
    attr_accessor :board_arr

    ROWS = 12.freeze 
    COLUMNS = 4.freeze 

    def initialize
        @board_arr = Array.new(ROWS){Array.new(COLUMNS)}
    end 

    def get_row(num)
        board_arr[num]
    end 

    def set_row(num, arr)
        board_arr[num] = arr
    end 
end 
 

board = Board.new





