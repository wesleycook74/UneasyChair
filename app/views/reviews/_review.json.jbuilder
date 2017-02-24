json.extract! review, :id, :score, :date, :reviewer, :score, :rebuttal, :confidence, :created_at, :updated_at
json.url review_url(review, format: :json)
