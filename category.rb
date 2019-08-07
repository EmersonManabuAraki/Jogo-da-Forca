class Category
    attr_accessor :words, :name
    
    def initialize(name, words)
        @words = words
        @name = name
    end
end
