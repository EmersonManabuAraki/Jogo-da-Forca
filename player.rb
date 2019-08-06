class Player
    attr_accessor :play, :chance, :words, :hit, :points, :hit_combo

    def initialize
        @play = 0
        @chance = 3
        @hit = 0
        @letters = []
    end

    def play_count_miss(letter)
        @play += 1
        @letters << letter
        @chance -= 1
        if(@hit > 0)
            @hit = 0 
        end
        puts "You missed, #{@letters}"
    end

    def play_count_hit
        @play += 1
        @hit += 1
        if(@hit >= 2 && @chance < 3)
            @chance += 1
            @hit_combo += 1
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
