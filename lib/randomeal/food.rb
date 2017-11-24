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
    def scrape_url        
            recipe_url = Nokogiri::HTML(open("http://seriouseats.com/tags/recipes/#{@option}"))
        
            recipe_links = []
            links = recipe_url.css('.module__link')
            links.each{|link| recipe_links << link['href']}
        
            @url = recipe_links.sample
            @url
    end

    def scrape_ingredients
        recipe = Nokogiri::HTML(open("#{@url}"))

        ingredient = recipe.css('.recipe-ingredients')
        ingredient.each{|i| @ingredients << recipe.text.strip}
    end

    def scrape_title
        recipe = Nokogiri::HTML(open("#{@url}"))

        title = recipe.css('.recipe-title').text.strip
        puts title
        title
    end

    def scrape_directions
        recipe = Nokogiri::HTML(open("#{@url}"))

        direction_list = recipe_direction.css('.recipe-procedures-list.instructions')
        direction_list.each{|step| @directions << step.text.strip}

    end

end