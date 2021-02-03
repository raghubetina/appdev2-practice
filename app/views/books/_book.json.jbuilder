json.extract! book, :id, :title, :description, :released_at, :popular, :created_at, :updated_at
json.url book_url(book, format: :json)
