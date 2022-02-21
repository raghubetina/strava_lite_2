class Type < ApplicationRecord
  # Direct associations

  has_many   :activities,
             foreign_key: "activity_type",
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end
end
