require 'rails_helper'

RSpec.describe 'Chef show page' do
  it 'lists chef name, dishes and form to add dish to chef' do
    remy = Chef.create!(name: 'Remy')
    ratatouille = remy.dishes.create!(name: 'Ratatouille', description: 'Stewed summer vegetables')

    visit chef_path(remy)

    expect(page).to have_content(remy.name)
    expect(page).to have_content(ratatouille.name)
  end

  it 'creates new chef dish' do
    remy = Chef.create!(name: 'Remy')
    ratatouille = remy.dishes.create!(name: 'Ratatouille', description: 'Stewed summer vegetables')

    visit chef_path(remy)

    fill_in 'Name', with: 'Croissant'
    fill_in 'Description', with: 'flaky butter pastry with layers'
    click_button 'Create Dish'

    expect(current_path).to eq(chef_path(remy))
    expect(page).to have_content('Croissant')
  end

  it 'link to chef ingredient index' do
    remy = Chef.create!(name: 'Remy') 
    visit chef_path(remy)

    click_link "View ingredients list"

    expect(current_path).to eq(chef_ingredient_index_path(remy))
  end
#   As a visitor
# When I visit a chef's show page
# I see the three most popular ingredients that the chef uses in their dishes
# (Popularity is based off of how many dishes use that ingredient)
  
end
