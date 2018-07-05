require "pry"

class Recipe
  attr_reader :name, :user, :ingredient, :allergen
  @@all = []

  def initialize(args={})
    @name = args[:name]
    @@all << self
  end

  def self.all
    @@all
  end

  def recipe_cards
    RecipeCard.all.select do |recipe_card|
      recipe_card.recipe == self
    end
  end

  def users
    recipe_cards.map do |recipe_card|
      recipe_card.user
    end
  end

  def recipe_ingredients
    RecipeIngredient.all.select do |recipe_ingredient|
      recipe_ingredient.recipe == self
    end
  end

  def ingredients
    recipe_ingredients.map do |recipe_ingredient|
      recipe_ingredient.ingredient
    end
  end

  def self.most_popular
    Recipe.all.sort_by do |recipe|
      recipe.users.length
    end.reverse.first
  end

  def add_ingredients(ingredients)
    ingredients.each do |ingredient|
      RecipeIngredient.new(ingredient:ingredient, recipe: self)
    end
  end

  def allergen_ingredients
    Allergen.all.map do |allergen|
      allergen.ingredient
    end
  end

  def allergens
    # self.ingredients & self.allergen_ingredients
    self.ingredients.select do |ingredient|
      self.allergen_ingredients.include?(ingredient)
    end
  end
end
