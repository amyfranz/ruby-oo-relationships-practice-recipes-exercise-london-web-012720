require_relative '../config/environment.rb'

user1_jeff = User.new ("jeff")
user2_liz = User.new ("liz")
user3_bill = User.new ("bill")
user4_bob = User.new ("bob")

rec_1 = Recipe.new("cake")
rec_2 = Recipe.new("eggs_benedict")
rec_3 = Recipe.new("shortbread")
rec_4 = Recipe.new("flapjack")

ing_1 = Ingredients.new("milk")
ing_2 = Ingredients.new("flour")
ing_3 = Ingredients.new("butter")
ing_4 = Ingredients.new("bread")
ing_5 = Ingredients.new("egg")

#ingredient, recipe
ri_1 = RecipeIngredient.new(ing_1, rec_2)
ri_2 = RecipeIngredient.new(ing_3, rec_2)
ri_5 = RecipeIngredient.new(ing_5, rec_2)
ri_3 = RecipeIngredient.new(ing_5, rec_3)
ri_4 = RecipeIngredient.new(ing_4, rec_4)
ri_6 = RecipeIngredient.new(ing_3, rec_4)


a1 = Allergy.new( user1_jeff, ing_1, )
a2 = Allergy.new( user2_liz, ing_2, )
a3 = Allergy.new( user3_bill, ing_3 )
a4 = Allergy.new( user3_bill, ing_1 )
#user, recipe)
rc1 = RecipeCard.new(user1_jeff, rec_1, Time.now, 3)
rc2 = RecipeCard.new(user1_jeff, rec_3, Time.now, 2)
rc3 = RecipeCard.new(user3_bill, rec_4, Time.now, 3)
rc4 = RecipeCard.new(user4_bob, rec_4, Time.now, 1)
rc3 = RecipeCard.new(user3_bill, rec_2, Time.now, 3)
binding.pry
