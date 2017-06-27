class AddActiveColumnToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :active, :boolean, defualt: true
  end
end
