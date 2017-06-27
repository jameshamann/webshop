require "rails_helper"

feature "user login" do
  let!(:user) {User.create(email: "test@ex.com", password: "1234567", password_confirmation: "1234567", first_name: "James", superadmin_role: false)}


  context "user not signed in" do
    scenario "login and logout links are present" do
      visit "/"
      expect(page).to have_content("Sign up")
      expect(page).to have_content("Login")
    end
  end

  scenario "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Logout')
    end

  context "user signed in on the homepage" do

    before do
      sign_in_user(email: user.email, password: user.password, superadmin_role: false)
    end

    scenario "should see 'sign out' link and user email in nav bar" do
      visit '/'
      expect(page).to have_link('Logout')
      expect(page).to have_css("li", text: "Hello ")
    end
  end
end
