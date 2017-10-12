class Board
    def initialize(slots, colors)
        @board = (1..slots).to_a
        @colors = colors.to_i
        @slots = slots
        create_board
    end

    def get_num_of_slots
        @slots
    end

    def create_board
        number_range = Random.new(12345)
        @board = @board.collect {|x| x = number_range.rand(1..@colors)}
    end
    
    def display_board
        @board.inspect
    end

    def get_board
        @board
    end
end