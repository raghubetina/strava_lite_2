class CreateShoes < ActiveRecord::Migration[6.0]
  def change
    create_table :shoes do |t|
      t.integer :owner
      t.string :name
      t.string :make
      t.string :model

      t.timestamps
    end
  end
end
