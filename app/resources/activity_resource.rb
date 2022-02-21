class ActivityResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :created_by, :integer
  attribute :activity_type, :integer
  attribute :photo, :string
  attribute :distance, :float
  attribute :calories, :float
  attribute :shoes_used, :integer

  # Direct associations

  belongs_to :type,
             foreign_key: :activity_type

  belongs_to :shoes,
             resource: ShoeResource,
             foreign_key: :shoes_used

  belongs_to :owner,
             resource: UserResource,
             foreign_key: :created_by

  # Indirect associations
end
