class Player
    attr_accessor :play, :chance, :letters, :hit, :points, :hit_combo

    def initialize
        @hit = 0
        @chance = 3
        @hit_count = 0
        @letters = []
        @hit_combo = 0
    end

    def play_count_miss(letter)
        @letters << letter
        @chance -= 1
        if(@hit > 0)
            @hit = 0 
        end
        puts "You missed, #{@letters}"
    end

    def play_count_hit
        @hit_count += 1
        @hit += 1
        if(@hit >= 2 && @chance < 3)
            @chance += 1
            @hit_combo += 1
            @hit = 0
        end
    end

    def calculate(word)
        @points =  (1 + @hit_combo) * (1 + word.size - @hit_count) * @chance
    end

    def get_points(word)
        calculate(word)
    end
end
