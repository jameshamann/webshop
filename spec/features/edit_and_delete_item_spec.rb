require 'rails_helper'

feature 'editing, viewing and deleting items' do

  let!(:item) {Item.create(name: 'Sampling Kit', description: 'Kit used for Sampling', price: "10") }

  it 'a user can visit a specific item' do
    visit '/items'
    click_link "#{item.name}"
    expect(current_path).to eq "/items/#{item.id}"
    expect(page).to have_content('Kit used for Sampling')
  end

  it 'A user can edit a specific item' do
    visit '/items'
    click_link "#{item.name}"
    click_link("Edit Item")
    expect(current_path).to eq "/items/#{item.id}/edit"
    fill_in 'item_name', with: "Coverter Bobbin"
    fill_in 'item_description', with: "Testing"
    fill_in 'item_price', with: "30"
    click_button("Update Item")
    expect(current_path).to eq "/items/#{item.id}"
  end

  it 'a user can delete a photo they created' do
    visit '/items'
    click_link "#{item.name}"
    click_link("Edit Item")
    click_link("Delete #{item.name}")
    expect(current_path).to eq '/items'
    expect(page).to_not have_content('Sampling Kit')
  end

end
