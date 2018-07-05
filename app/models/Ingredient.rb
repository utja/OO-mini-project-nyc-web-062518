class Ingredient
  attr_reader :allergen, :name, :users
  @@all = []

  def initialize(args = {})
    @name = args[:name]
    @@all << self
  end

  def self.all
    @@all
  end

  def allergens
    Allergen.all.select do |allergen|
      allergen.ingredient == self
    end
  end

  def users
    allergens.map do |allergen|
      allergen.user
    end
  end


  def self.most_common_allergen
    # Ingredient.all.sort_by do |ingredient|
    #   ingredient.users.length
    #   binding.pry
    # end.reverse
    all_ingredients = Allergen.all.map do |allergen|
      allergen.ingredient
    end
    all_hash = Hash.new 0
    all_ingredients.each do |ingredient|
      all_hash[ingredient] += 1
    end
    most_common = all_hash.max_by {|k,v| v}
    most_common[0]
  end

end
