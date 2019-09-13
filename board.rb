class Board
    attr_accessor :word
    attr_reader :board

    def initialize(word)
        @word = word.downcase.split("")
        @board = [[], []]
        @word.length.times {@board[0] << "_"}
    end

    def show
        puts
        @board.each { |field| puts field.join("")}
        puts
    end

    def draw(letter, field, indexes)
        indexes.each { |index| 
            index >= 0 ? @board[field][index] = letter : @board[field] << letter
        }
    end

    def win_check
        @board[0].include?("_") ? false : true
    end
end