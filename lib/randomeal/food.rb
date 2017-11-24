class Randomeal::Food

    attr_accessor :ingredients, :title, :directions,  :url, :option

    def initialize(option)
        @option = option
        self.scrape_url
        @title = "#{self.scrape_title}"
        @directions = []
        @ingredients = []
        self.scrape_directions
        self.scrape_ingredients

    end


    ## scrapes each option to object
    def scrape_ingredients
        @new_food = "http://seriouseats.com/tags/recipes/#{@option}"
        recipe = Nokogiri::HTML(open("#{@new_food}"))

        ingredient = recipe.css('.recipe-ingredients')
        ingredient.each{|i| @ingredients << recipe.text.strip}

        puts @ingredients
    end
    def scrape_url        
            recipe_url = Nokogiri::HTML(open("#{@option}"))
        
            recipe_links = []
            links = recipe_url.css('.module__link')
            links.each{|link| recipe_links << link['href']}
        
            recipe_links.sample
            
    end

end