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

    fill_in 'Name', with: 'Croissant'
    fill_in 'Description', with: 'flaky butter pastry with layers'
    click_button 'Create Dish'

    expect(current_path).to eq(chef_path(remy))
    expect(page).to have_content('Croissant')
  end
end
