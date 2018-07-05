require 'date'
class User
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(user: self, recipe: recipe, date: date, rating: rating)
  end

  def recipe_cards
    RecipeCard.all.select do |recipe_card|
      recipe_card.user == self
    end
  end

  def recipes
    recipe_cards.map do |recipe_card|
      recipe_card.recipe
    end
  end

  def declare_allergen(ingredient)
    Allergen.new(ingredient: ingredient, user: self)
  end

  def allergens
    Allergen.all.select do |allergen|
      allergen.user == self
    end
  end

  def top_three_recipes
    recipe_order = self.recipe_cards.sort_by {|recipe_card| recipe_card.rating}.reverse.first(3)
  end

  def most_recent_recipe
    most_recent = self.recipe_cards.sort_by {|recipe_card| DateTime.parse(recipe_card.date)}.reverse.first
  end
end
