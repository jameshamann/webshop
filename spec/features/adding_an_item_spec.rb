require 'rails_helper'

feature 'items' do

  let!(:user) {User.create(email: "test@example.com", password: "1234567", password_confirmation: "1234567", superadmin_role: true)}



  describe "No Items exist yet" do

    before do
      sign_in_admin(email: user.email, password: user.password, superadmin_role: true)
    end

    it 'Shows no Items are available and allows a user to add items' do
      visit '/items'
      expect(page).to have_content("No items yet!")
      expect(page).to have_link("Add a new Item")
    end

    it 'Allows a user to add items' do
      visit '/items'
      add_item
      expect(current_path).to eq '/items'
      expect(page).to have_content 'Sample Kit'
    end
  end
end
