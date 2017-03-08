json.extract! paper, :title, :id, :doc_url, :author, :track, :accepted, :created_at, :updated_at
json.url paper_url(paper, format: :json)
