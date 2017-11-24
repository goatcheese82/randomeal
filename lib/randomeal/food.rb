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
        
            recipe_links.sample
            
    end

    def scrape_ingredients
        recipe = Nokogiri::HTML(open("#{@url}"))

        title = recipe.css('.recipe-title').text.strip
        puts title
        title
    end

    def scrape_title
        recipe = Nokogiri::HTML(open("#{@url}"))

end