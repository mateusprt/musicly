json.extract! artist, :id, :name, :birth_date, :biography, :created_at, :updated_at
json.url artist_url(artist, format: :json)
