class AddContentColumnToDiscussions < ActiveRecord::Migration[5.2]
  def change
    add_column :discussions, :content, :text
  end
end
