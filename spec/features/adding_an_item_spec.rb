require 'rails_helper'

feature 'items' do

  describe "No Items exist yet" do

    it 'Shows no Items are available and allows a user to add items' do
      visit '/items'
      expect(page).to have_content("No items available")
      expect(page).to have_link("Add Item")
    end
  end
end
