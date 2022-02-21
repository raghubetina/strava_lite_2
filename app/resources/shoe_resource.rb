class ShoeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :owner, :integer
  attribute :name, :string
  attribute :make, :string
  attribute :model, :string

  # Direct associations

  has_many   :activities,
             foreign_key: :shoes_used

  # Indirect associations
end
