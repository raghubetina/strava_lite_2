class Shoe < ApplicationRecord
  # Direct associations

  has_many   :activities,
             foreign_key: "shoes_used",
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    owner
  end
end
