class AddReferenceColumnToNestedComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :nested_comments, :comment, foreign_key: true
  end
end
