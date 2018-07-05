class RecipeIngredient
  attr_reader :ingredient, :recipe
  @@all = []

  def initialize(args = {})
    @name = args[:name]
    @recipe = args[:recipe]
    @ingredient = args[:ingredient]
    @@all << self
  end

  def self.all
    @@all
  end
end
