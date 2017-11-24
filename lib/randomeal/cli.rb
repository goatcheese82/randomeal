class Randomeal::CLI

    attr_accessor :selection

    def call
        puts "Thank you for using Randomeal!  Your options are loading."
        options
        menu
        secondary_menu_options
        secondary_menu
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

        input = gets.strip.downcase

        if input == "1" || input == "chicken"
            @selection = Randomeal::Food.new("chicken")
        elsif input == "2" || input == "burgers"
            @selection = Randomeal::Food.new("burger")
        elsif input == "3" || input ==  "pasta"
            @selection = Randomeal::Food.new("pasta")            
        elsif input == "4" || input == "salad"
            @selection = Randomeal::Food.new("salad")            
        elsif input == "5" || input == "dessert"
            @selection = Randomeal::Food.new("dessert")            
        else puts "That selection is not valid, please select from the list or 'exit'"
        end

    end

    def secondary_menu_options
        puts <<-SECONDARY
        Your meal is #{@selection.title}
        1. For ingredients
        2. For directions
        3. If you don't want to eat #{@selection.title}
        'exit' to exit
        SECONDARY
    end


    def secondary_menu
        input = gets.strip.downcase

        if input == "1"
            puts @selection.ingredients
        elsif input == "2"
            puts @selection.directions
        elsif input == "3"
            self.menu
        else
            puts "please make a selection"
        end

        puts "Would you like to make another selection?"
    end



end