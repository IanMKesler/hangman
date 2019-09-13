require_relative "game"

def import_wordlist(filename)
    wordlist = []
    #using .each is more memory efficient
    File.open(filename).each { |line| 
      wordlist << line[0..-3].downcase
    }
    wordlist.uniq
end

def save_game(game)
    yaml = YAML::dump(game)
    game_file = File.open("save.txt", "w") 
    game_file.puts yaml
    game_file.close
end

def load_game
    yaml = File.read("save.txt")
    YAML::load(yaml)
end 

game = Game.new(import_wordlist("5desk.txt"))
game.play