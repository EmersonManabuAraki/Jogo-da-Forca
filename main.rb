load 'forca.rb' 
load 'category.rb'
load 'player.rb'
require 'json'

file = File.read("category.json")
categories = JSON.parse(file)
categories_array = []
i = 0

categories.each do |key, words| 
    categories_array[i] = Category.new(words)
    i += 1
end


puts "Select a category: \n 1 - Fruits\n 2 - Geometry\n 3 - Foods\n 4 - Electronics\n"

selector = gets.chomp

case selector
when "1"
    selector = categories_array[0].category
    puts "You've selected Fruits"
when "2"
    selector = categories_array[1].category
    puts "You've selected Geometry"
when "3"
    selector = categories_array[2].category
    puts "You've selected Foods"
when "4"
    selector = categories_array[3].category
    puts "You've selected Electronics"
else
    puts "You write something wrong, try again!"
end

forca_word = Forca.new
player = Player.new
forca_word = forca_word.random_elements(selector)
the_word_cripted = Forca.cript_word(forca_word.scan(/./))

while(player.chance > 0)
    puts "Chances left: #{player.chance}"
    puts "Words you attempted: #{player.letters}"
    puts "Word: #{the_word_cripted.inspect}"
    try = gets.chomp
    if try == forca_word
        puts "YOU WIN!"
        puts "SCORE: #{player.get_points_perfect}"
        break
    end
    if try.size > 1 && try != forca_word 
        puts "GAME OVER!"
        break
    end
    if forca_word.include?(try) 
        index = forca_word.scan(/./).each_with_index.select {|word, index| word == try}.map {|pair| pair[1]}
        index.each {|e| the_word_cripted[e] = try }
        player.play_count_hit
    else
        player.play_count_miss(try)
    end
    if the_word_cripted == forca_word.scan(/./) 
        puts "YOU WIN!"
        puts "SCORE: #{player.get_points}"
        break
    end
    if player.chance == 0 
        puts "GAME OVER!"
        break
    end
end 
