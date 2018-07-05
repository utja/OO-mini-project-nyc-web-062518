class RecipeCard
  attr_reader :user, :recipe, :name, :date, :rating
  @@all = []

  def initialize(args = {})
    @user = args[:user]
    @recipe = args[:recipe]
    @date = args[:date]
    @rating = args[:rating]
    @@all << self
  end

  def self.all
    @@all
  end

end
