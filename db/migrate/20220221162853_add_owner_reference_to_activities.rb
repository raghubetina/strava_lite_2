class AddOwnerReferenceToActivities < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :activities, :users, column: :created_by
    add_index :activities, :created_by
    change_column_null :activities, :created_by, false
  end
end
