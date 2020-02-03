class RecipeCard

    attr_reader :user, :recipe, :date, :rating

    @@all = []

    def initialize (user, recipe, date, rating)
        @user = user
        @recipe = recipe
        @date = date
        @rating = rating

        @@all << self
    end

    def self.all
        @@all
    end

    def date
        #should return the date of the entry
        @date
    end
    
    def rating
        #should return the rating (an integer) a user has given their entry
        @rating
    end
    
    def user
        #should return the user to which the entry belongs
        @user
    end
     
    def recipe
        #should return the recipe to which the entry belongs
        @recipe
    end
end