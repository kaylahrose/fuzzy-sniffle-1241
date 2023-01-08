require 'rails_helper'

RSpec.describe 'dishes show page' do
  it 'shows dish name, description, ingredient list, calorie count, and chef name' do
    remy = Chef.create!(name: 'Remy')
    ratatouille = remy.dishes.create!(name: 'Ratatouille', description: 'Stewed summer vegetables')
    eggplant = Ingredient.create!(name: 'Eggplant', calories: 100)
    zucchini = Ingredient.create!(name: 'Zucchini', calories: 90)
    evoo = Ingredient.create!(name: 'Extra Virgin Olive Oil', calories: 300)
    recipe1 = Recipe.create!(ingredient_id: eggplant.id, dish_id: ratatouille.id)
    recipe2 = Recipe.create!(ingredient_id: zucchini.id, dish_id: ratatouille.id)
    recipe3 = Recipe.create!(ingredient_id: evoo.id, dish_id: ratatouille.id)

    visit dish_path(ratatouille)

    expect(page).to have_content(ratatouille.name)
    expect(page).to have_content(ratatouille.description)
    expect(page).to have_content(eggplant.name)
    expect(page).to have_content(zucchini.name)
    expect(page).to have_content(evoo.name)
    expect(page).to have_content(490)
    expect(page).to have_content(remy.name)
  end
end
