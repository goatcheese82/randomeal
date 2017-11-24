class Randomeal::Food

    attr_accessor :ingredients, :title, :directions, :food

    @@food = []
    @@categories = ["Chicken", "Burgers", "Pasta", "Salad", "Dessert"]


    ## scrapes each option to object
    def self.scrape
        @ingredients = []
        @url = "http://seriouseats.com/tags/recipes/chicken"
        recipe = Nokogiri::HTML(open("#{@url}"))

        ingredient = recipe.css('.recipe-ingredients')
        ingredient.each{|i| @ingredients << recipe.text.strip}

        @ingredients

    end
end