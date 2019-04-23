class AddCategoryColumnToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :category, :string
  end
end
