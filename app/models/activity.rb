class Activity < ApplicationRecord
  mount_base64_uploader :photo, PhotoUploader

  # Direct associations

  belongs_to :type,
             foreign_key: "activity_type"

  belongs_to :shoes,
             class_name: "Shoe",
             foreign_key: "shoes_used",
             counter_cache: true

  belongs_to :owner,
             class_name: "User",
             foreign_key: "created_by"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    owner.to_s
  end
end
