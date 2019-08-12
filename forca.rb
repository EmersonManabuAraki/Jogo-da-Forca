load 'player.rb'
load 'category.rb'

class Forca 
    attr_accessor :word, :words

    def initialize
        @words = []
    end

    def random_elements(categories)
        @words = categories.sample.downcase
    end

    def self.cript_word(letter)
        @word = letter.map do |char| 
            if char ==  " "
                char = " "
            else
                char = "_"
            end
        end
    end
end
