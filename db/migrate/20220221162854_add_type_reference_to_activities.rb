class AddTypeReferenceToActivities < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :activities, :types, column: :activity_type
    add_index :activities, :activity_type
    change_column_null :activities, :activity_type, false
  end
end
