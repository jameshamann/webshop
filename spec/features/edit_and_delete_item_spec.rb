require 'rails_helper'

feature 'editing, viewing and deleting items' do

  let!(:item) {Item.create(name: 'Sampling Kit', description: 'Kit used for Sampling', price: "10") }
  let!(:admin_user) {User.create(email: "test@example.com", password: "1234567", password_confirmation: "1234567", superadmin_role: true)}
  let!(:user) {User.create(email: "test@ex.com", password: "1234567", password_confirmation: "1234567", superadmin_role: false)}


  context "An Admin user is Logged in" do

    before do
      sign_in_admin(email: admin_user.email, password: admin_user.password)
    end

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

  context "A Normal User is Logged in" do
    before do
      sign_in_user(email: user.email, password: user.password, superadmin_role: false)
    end

    it 'A user cannot edit or delete an Item' do
      visit '/items'
      click_link "#{item.name}"
      expect(page).to_not have_content 'Edit Item'
    end
  end


end
