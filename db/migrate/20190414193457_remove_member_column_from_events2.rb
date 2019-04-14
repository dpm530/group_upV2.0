class RemoveMemberColumnFromEvents2 < ActiveRecord::Migration[5.2]
  def change
    remove_reference :events, :memeber, foreign_key: true
  end
end
