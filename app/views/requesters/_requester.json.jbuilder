json.extract! requester, :id, :name, :email, :phone, :depart, :active, :created_at, :updated_at
json.url requester_url(requester, format: :json)
