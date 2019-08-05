load 'forca.rb' 
load 'category.rb'
load 'player.rb'

fruits = Category.new("Apple", "Pineapple", "Blueberry", "Orange", "Lemon")
geometry = Category.new("Square", "Triangle", "Circunference", "Pentagon", "Rectangle")
foods = Category.new("Stroganoff", "Curry", "Spaghetti", "French Fries", "Steak")
electronics = Category.new("Computer", "Smartphone", "Notebook", "Videogame", "Microwave")

puts "Select a category: \n 1 - Fruits\n 2 - Geometry\n 3 - Foods\n 4 - Electronics\n"

selector = gets.chomp

case selector
when "1"
    selector = fruits.get_category
    puts "You've selected Fruits"
when "2"
    selector = geometry.get_category
    puts "You've selected Geometry"
when "3"
    selector = foods.get_category
    puts "You've selected Foods"
when "4"
    selector = electronics.get_category
    puts "You've selected Electronics"
else
    puts "You write something wrong, try again!"
end

the_word = Forca.new
player = Player.new
the_word = the_word.random_elements(selector)
the_word_cripted = Forca.cript_word(the_word.scan(/./))

while(player.get_chance > 0)
    puts "Chances left: #{player.get_chance}"
    puts "Words you attempted: #{player.get_words}"
    puts "Word: #{the_word_cripted.inspect}"
    try = gets.chomp
    if(try == the_word)
        puts "YOU WIN!"
        break
    end
    if(try.size == the_word.size && try != the_word)
        puts "GAME OVER!"
        break
    end
    if(the_word.include?(try))
        index = the_word.scan(/./).each_with_index.select {|word, index| word == try}.map {|pair| pair[1]}
        index.each {|e| the_word_cripted[e] = try }
        player.play_count_hit(try)
    else
        player.play_count_miss(try)
    end
    if(the_word_cripted == the_word.scan(/./))
        puts "YOU WIN!"
        puts "SCORE: #{player.get_points}""
        break
    end
    if(player.get_chance == 0)
        puts "GAME OVER!"
        break
    end
end 
