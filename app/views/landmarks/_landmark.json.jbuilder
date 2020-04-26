json.extract! landmark, :id, :name, :hiragana, :latitude, :longitude, :url, :question, :answer1, :answer2, :answer3, :correct, :author, :created_at, :updated_at
json.url landmark_url(landmark, format: :json)
