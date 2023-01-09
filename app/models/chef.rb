class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes
  # has_many :recipes, through: :dishes

  def ingredient_list
    ingredients.distinct
  end

  def top_3_ingredients
    # Ingredient.joins(:recipes).group(:id).order('count desc').limit(3)
  end
end
