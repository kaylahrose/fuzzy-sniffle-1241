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

#   As a visitor
# When I visit a chef's show page
# I see a link to view a list of all ingredients that this chef uses in their dishes.
# When I click on that link
# I'm taken to a chef's ingredients index page
# and I can see a unique list of names of all the ingredients that this chef uses.
  it 'link to chef ingredient index' do
    remy = Chef.create!(name: 'Remy') 
    visit chef_path(remy)

    click_link "View ingredients list"

    expect(current_path).to eq(chef_ingredients_path(remy))
  end
end
