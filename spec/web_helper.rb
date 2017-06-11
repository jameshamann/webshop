def add_item
  click_link ("Add a new Item")
  expect(current_path).to eq "/items/new"
  fill_in 'item_name', with: 'Sample Kit'
  fill_in 'item_description', with: 'A Sampling Kit to be used for sample analysis'
  fill_in 'item_price', with: '10'
  click_button 'Create Item'
end
