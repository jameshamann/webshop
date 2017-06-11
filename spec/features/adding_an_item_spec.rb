require 'rails_helper'

feature 'items' do

  describe "No Items exist yet" do

    it 'Shows no Items are available and allows a user to add items' do
      visit '/items'
      expect(page).to have_content("No items yet!")
      expect(page).to have_link("Add a new Item")
    end

    it 'Allows a user to add items' do
      visit '/items'
      click_link ("Add a new Item")
      expect(current_path).to eq "/items/new"
      fill_in 'item_name', with: 'Sample Kit'
      fill_in 'item_description', with: 'A Sampling Kit to be used for sample analysis'
      fill_in 'item_price', with: '10'
      click_button 'Create Item'
      expect(current_path).to eq '/items'
      expect(page).to have_content 'Sample Kit'
    end
  end
end
