class AddShoesReferenceToActivities < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :activities, :shoes, column: :shoes_used
    add_index :activities, :shoes_used
    change_column_null :activities, :shoes_used, false
  end
end
