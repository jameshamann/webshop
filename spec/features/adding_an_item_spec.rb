require 'rails_helper'

feature 'items' do

  let!(:admin_user) {User.create(email: "test@example.com", password: "1234567", password_confirmation: "1234567", superadmin_role: true)}
  let!(:user) {User.create(email: "test@ex.com", password: "1234567", password_confirmation: "1234567", superadmin_role: false)}



  describe "No Items exist yet" do

    context "Browsing as an Admin User" do

      before do
        sign_in_admin(email: admin_user.email, password: admin_user.password)
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

    context "Browsing as a Normal User" do

      before do
        sign_in_user(email: user.email, password: user.password)
      end

      it 'Does not show the option to Add new Items' do
        visit '/items'
        expect(page).to_not have_content 'Add a new Item'
      end
    end

  end
end
