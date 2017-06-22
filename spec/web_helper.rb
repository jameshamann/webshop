def sign_in_admin(email: "test@example.com", password: "12345678", superadmin_role: true)
  visit('/')
  click_link('Login')
  fill_in('user_email', with: email)
  fill_in('user_password', with: password)
  click_button('Log in')
end

def sign_up_admin(email: "test@example.com", password: "12345678", password_confirmation: "12345678", superadmin_role: true)
  visit('/')
  click_link('Sign up')
  fill_in('user_email', with: email)
  fill_in('user_password', with: password)
  fill_in('user_password_confirmation', with: password)
  click_button('Sign Up')
end

def add_item(name: "Sample Kit", description: "A Sampling Kit to be used for sample analysis", price: "10")
  visit ('/items')
  click_link ("Add a new Item")
  expect(current_path).to eq "/items/new"
  fill_in 'item_name', with: name
  fill_in 'item_description', with: description
  fill_in 'item_price', with: price
  click_button 'Create Item'
end
