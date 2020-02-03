class Recipe
    attr_reader :recipe_name
    @@all = []
    def initialize(recipe_name)
        @recipe_name = recipe_name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.most_popular #=> <recipie_obj>
        #should return the recipe instance with the highest number of users (the recipe that has the most recipe cards)
        recipe_array = RecipeCard.all.map{|rc| rc.recipe.recipe_name}
        recipe_hesh = Hash.new(0)
        recipe_array.map{|rn| recipe_hesh[rn] += 1}
        result = recipe_hesh.max_by{|a|a[1]}
        Recipe.all.select{|r| r.recipe_name == result[0]}
    end

    def users #=> [<rc1>...<rc2>]
        #should return the user instances who have recipe cards with this recipe
       RecipeCard.all.select{|rc| rc.recipe == self}.map{|rc| rc.user} 
    end
     
    def ingredients #=> [<i1>..<i2>]
        #should return all of the ingredients in this recipe
        RecipeIngredient.all.select{|ri| ri.recipe == self}.map{|ri|ri.ingredient}
    end
    
    def allergens #=> [<i1>..<i2>]
        #should return all of the `Ingredient`s in this recipe that are allergens for `User`s in our system.
        var_1 = ingredients
        var_2 = Allergy.all.map{|a| a.ingredients}
        var_1 & var_2
    end
     
    def add_ingredients(ingr_array) #=> nil
        #should take an array of ingredient instances as an argument, and associate each of those ingredients with this recipe
        i = ingr_array.each{|i| RecipeIngredient.new(i, self)}
        i
    end
end