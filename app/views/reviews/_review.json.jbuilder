json.extract! review, :id, :score, :date, :reviewer, :score, :rebuttle, :confidence, :created_at, :updated_at
json.url review_url(review, format: :json)
