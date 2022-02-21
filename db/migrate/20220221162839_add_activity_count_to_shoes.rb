class AddActivityCountToShoes < ActiveRecord::Migration[6.0]
  def change
    add_column :shoes, :activities_count, :integer
  end
end
