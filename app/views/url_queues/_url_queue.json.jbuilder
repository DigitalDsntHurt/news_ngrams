json.extract! url_queue, :id, :date_added_to_queue, :publication, :url, :date_scraped, :created_at, :updated_at
json.url url_queue_url(url_queue, format: :json)
