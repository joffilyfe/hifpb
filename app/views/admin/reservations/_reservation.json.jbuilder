json.extract! reservation, :id, :reservation_id, :date_reservation, :status, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
