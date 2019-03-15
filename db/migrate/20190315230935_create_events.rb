class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.time :time
      t.text :description
      t.string :addressLine1
      t.string :addressLine2
      t.references :member, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
