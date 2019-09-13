require_relative "game"

def import_wordlist(filename)
    wordlist = []
    #using .each is more memory efficient
    File.open(filename).each { |line| 
      wordlist << line[0..-3].downcase
    }
    wordlist.uniq
end

def load_game
    yaml = File.read("save.txt")
    File.delete("save.txt")
    YAML::load(yaml)
end 


puts "Welcome to Hangman!"
if File.exist? "save.txt"
    puts "(N)ew Game"
    puts "(L)oad"
    input = gets.strip.downcase
    until input.match(/[nl]/)
        puts "Type N for new game or L for load game."
        input = gets.strip.downcase
    end
    game = input == "l" ? load_game : Game.new(import_wordlist("5desk.txt"))
end

loop do
  game ||= Game.new(import_wordlist("5desk.txt"))
  game.play
  game = nil
  puts "Play again? Y/N" 
  input = gets.strip.downcase
  until input.match(/[yn]/)
    puts "Type Y to play again or N to quit."
    input = gets.strip.downcase
  end
  break if input == 'n'
end
