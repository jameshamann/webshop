require 'rails_helper'

feature 'editing, viewing and deleting items' do

  let!(:item) {Item.create(name: 'Sampling Kit', description: 'Kit used for Sampling') }

  it 'a user can visit a specific item' do
    visit '/items'
    click_link "#{item.name}"
    expect(current_path).to eq "/items/#{item.id}"
    expect(page).to have_content('Kit used for Sampling')
  end

end
