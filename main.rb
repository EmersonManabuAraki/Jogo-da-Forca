load 'forca.rb' 
load 'category.rb'
load 'player.rb'
require 'json'

file = File.read("category.json")
categories_array = JSON.parse(file)
categories = []
i = 0

categories_array.each do |name, words| 
    categories[i] = Category.new(name, words)
    i += 1
end


puts "Select a category: \n"
categories.each do |category|
    puts "- #{category.name}\n"
end

puts "Write the category name"
selector = gets.chomp

categories.each do |category|
    if selector.capitalize == category.name 
        puts "You've selected #{category.name}"
        selector = category.words
        break
    end
end

forca_word = Forca.new
player = Player.new
forca_word = forca_word.random_elements(selector)
the_word_cripted = Forca.cript_word(forca_word.scan(/./))

while(player.chance > 0)
    puts "\n"
    puts "Chances left: #{player.chance}"
    puts "Words you attempted: #{player.letters}"
    puts "Word: #{the_word_cripted.inspect}"
    try = gets.chomp
    if try == forca_word
        puts "YOU WIN!"
        puts "SCORE: #{player.get_points(forca_word)}"
        break
    end
    if try.size > 1 && try != forca_word 
        puts "GAME OVER!"
        break
    end
    if forca_word.include?(try)
        if the_word_cripted.include?(try)
            puts "You already input this letter"
            next
        end 
        index = forca_word.scan(/./).each_with_index.select {|word, index| word == try}.map {|pair| pair[1]}
        index.each {|e| the_word_cripted[e] = try }
        player.play_count_hit
    elsif player.letters.include?(try) 
        puts "You already tried this letter"
        next
    elsif try == " "
        puts "You can't type blank space "
        next
    else
        player.play_count_miss(try)
    end
    if the_word_cripted == forca_word.scan(/./) 
        puts "YOU WIN!"
        puts "SCORE: #{player.get_points(forca_word)}"
        break
    end
    if player.chance == 0 
        puts "GAME OVER!"
        break
    end
end 
