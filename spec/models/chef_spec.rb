require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end
  describe 'relationships' do
    it { should have_many :dishes }
    it { should have_many(:ingredients).through(:dishes) }
  end
  describe 'instance methods' do
    describe '#ingredient_list' do
      it 'lists distinct ingredients for a chef' do
        remy = Chef.create!(name: 'Remy')
        ratatouille = remy.dishes.create!(name: 'Ratatouille', description: 'Stewed summer vegetables')
        eggplant = Ingredient.create!(name: 'Eggplant', calories: 100)
        zucchini = Ingredient.create!(name: 'Zucchini', calories: 90)
        evoo = Ingredient.create!(name: 'Extra Virgin Olive Oil', calories: 300)
        Recipe.create!(ingredient_id: eggplant.id, dish_id: ratatouille.id)
        Recipe.create!(ingredient_id: zucchini.id, dish_id: ratatouille.id)
        Recipe.create!(ingredient_id: evoo.id, dish_id: ratatouille.id)
        tapenade = remy.dishes.create!(name: 'Tapenade', description: 'Olive dish')
        olives = Ingredient.create!(name: 'Olives', calories: 40)
        Recipe.create!(ingredient_id: evoo.id, dish_id: tapenade.id)
        Recipe.create!(ingredient_id: olives.id, dish_id: tapenade.id)

        expect(remy.ingredients.count).to eq(5)
        expect(remy.ingredient_list.count).to eq(4)
        
      end
    end
  end
end
