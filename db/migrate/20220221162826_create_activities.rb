class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.integer :created_by
      t.integer :activity_type
      t.string :photo
      t.float :distance
      t.float :calories
      t.integer :shoes_used

      t.timestamps
    end
  end
end
