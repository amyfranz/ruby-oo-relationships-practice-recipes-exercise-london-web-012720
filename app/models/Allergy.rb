class Allergy

    attr_reader :user, :ingredients

    @@all = []

    def initialize (user, ingredients)
        @user = user
        @ingredients = ingredients

        @@all << self
    end

    def self.all
        @@all
    end
end