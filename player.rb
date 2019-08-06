class Player
    attr_accessor :play, :chance, :words, :hit, :points

    def initialize
        @play = 0
        @chance = 3
        @hit = 0
        @words = []
    end

    def play_count_miss(word)
        @play += 1
        @words << word
        @chance -= 1
        if(@hit > 0)
            @hit = 0 
        end
        puts "You missed, #{@words}"
    end

    def play_count_hit(word)
        @play += 1
        @hit += 1
        if(@hit >= 2 && @chance < 3)
            @chance += 1
            @hit = 0
        end
    end

    def calculate
        @points = (@hit + 1) * @chance
    end

    def get_points
        calculate
        @points
    end

    def get_points_perfect
        @points = (@chance**3)
        @points
    end
end
