def add_item(name: "Sample Kit", description: "A Sampling Kit to be used for sample analysis", price: "10")
  click_link ("Add a new Item")
  expect(current_path).to eq "/items/new"
  fill_in 'item_name', with: name
  fill_in 'item_description', with: description
  fill_in 'item_price', with: price
  click_button 'Create Item'
end
