json.extract! survey, :id, :title, :is_useful, :is_request, :category_id, :crop_id, :user_id, :created_at, :updated_at
json.url survey_url(survey, format: :json)
