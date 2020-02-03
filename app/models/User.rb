class User

    attr_reader :user_name

    @@all = []

    def initialize (user_name)
        @user_name = user_name

        @@all << self
    end

    def self.all
        @@all
    end

    def rec_card
        RecipeCard.all.select{|rc| rc.user == self}
    end
    def recipes
    #should return all of the recipes this user has recipe cards for
        rec_card.map(&:recipe)
    end

    def add_recipe_card(recipe, date, rating)
    #should accept a recipe instance as an argument, as well as a date and rating, and create a new recipe card for this user and the given recipe
        RecipeCard.new(self, recipe, date, rating)
    end

    def declare_allergy(ing)
    #should accept an`Ingredient` instance as an argument, and create a new `Allergy` instance for this `User` and the given `Ingredient`
        Allergy.new(self, ing)
    end
    
    def allergens
    #should return all of the ingredients this user is allergic to
        Allergy.all.select{|a| a.user == self}.map{|a| a.ingredients}
    end

    def top_three_recipes
    #should return the top three highest rated recipes for this user.
        rec = rec_card
        sorted = rec.sort_by{|i| i.rating}
        top3 = [sorted[-1], sorted[-2], sorted[-3]]
    end
    
    def most_recent_recipe
    #should return the recipe most recently added to the user's cookbook.
        rec_card.max_by{|rc| rc.date}
    end
    
    def safe_recipes
        recipes_to_return = []
        #select the ingredients this user is allergic to
        allergies = Allergy.all.select{|a|a.user == self}
        allergies = allergies.map{|a| a.ingredients}
        puts "the #{self.user_name} is alergic to #{allergies}"
        #getting all the recipes
        recipes = Recipe.all
        # puts "all recipes: #{recipes}"
        # #iterate trhoguh recipes
        # puts "iterate trhoruh recipes"
        recipes.each do |r|
            ingredients_in_recipe = RecipeIngredient.all.select{|ri| ri.recipe == r}.map{|ri| ri.ingredient}
            # puts "the recipe is #{r.recipe_name}"
            # puts "the ingredients are #{ingredients_in_recipe}"
            is_ingredient_within_recipe = allergies & ingredients_in_recipe
            # if ingredients_in_recipe
            #     puts "\n\n TAKE IT OUT #{r}"
            # else
            #     puts "\n\nthe recipe #{r} is in"
            # end
            if is_ingredient_within_recipe.empty?
                recipes_to_return << r
            end
        end
        #get all recipes
    recipes_to_return
    end
end