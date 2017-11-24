class Randomeal::CLI

    def call
        puts "Thank you for using Randomeal!  Your options are loading."
        Randomeal::Food.scrape
        menu
    end

    def options
        puts <<-MENU

        What would you like to eat?

        1. Chicken
        2. Burgers
        3. Pasta
        4. Salad
        5. Dessert
        MENU

    end

    def menu

        options

        input = gets.strip.downcase

        if input == "1" || "chicken"
            chicken
        elsif input == "2" || "burgers"
            burgers
        elsif input == "3" || "pasta"
            pasta
        elsif input == "4" || "salad"
            salad
        elsif input == "5" || "desert"
            dessert
        else puts "That selection is not valid, please select from the list or 'exit'"
        end

    end

    def chicken
    end



end