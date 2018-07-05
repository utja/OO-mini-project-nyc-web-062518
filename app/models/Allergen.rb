class Allergen
  attr_reader :user, :ingredient
  @@all = []

  def initialize(args = {})
    @name = args[:name]
    @user = args[:user]
    @ingredient = args[:ingredient]
    @@all << self
  end

  def self.all
    @@all
  end

end
