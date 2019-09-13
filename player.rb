class Player
    require_relative "board"

    attr_accessor :turn, :won
    attr_reader :player, :guess

    def initialize(player)
        @player = player
        @turn = 0
        @guess = ""
        @won = false
    end

    def get_guess
        puts "Please input your letter guess:"
        input = gets.strip.downcase
        until input.match(/[a-z]/)
            puts "Input any letter and press enter"
            input = gets.strip.downcase
        end
        @guess = input
    end
end