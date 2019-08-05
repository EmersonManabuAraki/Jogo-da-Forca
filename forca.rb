load 'player.rb'
load 'category.rb'

class Forca 
    attr_accessor :word, :words

    def initialize
        @word
        @words = []
    end

    def random_elements(category)
        @word = category[rand(0...5)]
        @word.downcase
    end

    def self.cript_word(word)
        @words = word.map {|e| e = "_"}
    end
end
