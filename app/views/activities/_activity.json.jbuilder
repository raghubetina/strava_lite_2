json.extract! activity, :id, :created_by, :activity_type, :photo, :distance,
              :calories, :shoes_used, :created_at, :updated_at
json.url activity_url(activity, format: :json)
