class RemoveMemberColumnFromEvenst < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :references, :member
  end
end
