class RemoveMemberColumnFromEvents3 < ActiveRecord::Migration[5.2]
  def change
    remove_reference :events, :member, foreign_key: true
  end
end
