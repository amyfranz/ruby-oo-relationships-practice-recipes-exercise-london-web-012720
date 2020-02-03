class Ingredients
    attr_reader :ingredient

    @@all = []

    def initialize (ingredient)
        @ingredient = ingredient

        @@all << self
    end

    def self.all
        @@all
    end

    def self.most_common_allergen
        aller = Allergy.all.map{|a|a.ingredients.ingredient}
        aller_hash = Hash.new(0)
        aller.map{|l|aller_hash[l] += 1}
        aller_hash = aller_hash.max_by{|i| i[1]}
        Ingredients.all.select{|i| i.ingredient == aller_hash[0]}
    end
end
