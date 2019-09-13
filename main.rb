require_relative "game"

def import_wordlist(filename)
    wordlist = []
    #using .each is more memory efficient
    File.open(filename).each { |line| 
      wordlist << line[0..-3].downcase
    }
    wordlist.uniq
end

game = Game.new(import_wordlist("5desk.txt"))
game.play