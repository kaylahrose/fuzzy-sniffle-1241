require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
  end
  describe 'relationships' do
    it { should belong_to :chef }
    it { should have_many :recipes }
    it { should have_many(:ingredients).through(:recipes) }
  end
  describe 'instance methods' do
    it '#calories returns calorie count for dish' do
      remy = Chef.create!(name: 'Remy')
      ratatouille = remy.dishes.create!(name: 'Ratatouille', description: 'Stewed summer vegetables')
      eggplant = Ingredient.create!(name: 'Eggplant', calories: 100)
      zucchini = Ingredient.create!(name: 'Zucchini', calories: 90)
      evoo = Ingredient.create!(name: 'Extra Virgin Olive Oil', calories: 300)
      recipe1 = Recipe.create!(ingredient_id: eggplant.id, dish_id: ratatouille.id)
      recipe2 = Recipe.create!(ingredient_id: zucchini.id, dish_id: ratatouille.id)
      recipe3 = Recipe.create!(ingredient_id: evoo.id, dish_id: ratatouille.id)

      expect(ratatouille.calories).to eq(490)
    end
  end
end
