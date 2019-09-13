class Game
    require "yaml"
    require_relative "player"
    require_relative "board"

    def initialize(wordlist)
        @player = Player.new(true)
        @computer = Player.new(false)

        @board = Board.new(generate_word(wordlist))
    end

    def play
        puts "Welcome to Hangman!"
        until @player.won || @player.turn == 8
            play_round
        end
        won_message
        @board.show
        puts "Thanks for playing!"
    end 

    private

    def generate_word(wordlist)
        wordlist.sample.downcase
    end

    def won_message
        puts @player.won ? "You won!" : "The computer got the best of you this time."
    end

    def find_all_indexes(letter)
        indexes = []
        word_check = @board.word.dup
        while word_check.include?(letter)
            index = word_check.index(letter)
            indexes << index
            word_check[index] = nil
        end
        indexes
    end

    def play_round
        @board.show

        @player.get_guess
        while @board.board[0].include?(@player.guess) || @board.board[1].include?(@player.guess)
            puts "You've already guessed that one! Try another letter."
            @player.get_guess
        end

        field = @board.word.include?(@player.guess) ? 0 : 1
        indexes = field == 0 ? find_all_indexes(@player.guess) : [-1] #need to return array of all occurences
        @board.draw(@player.guess, field, indexes)

        @player.won = @board.win_check
        
        @player.turn += 1 if field == 1
        puts "#{8-@player.turn} more incorrect guesses."
    end

end