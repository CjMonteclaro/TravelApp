json.extract! travel_prem, :id, :destination_class_id, :travel_period_id, :premium, :prem_type, :from, :to, :created_at, :updated_at
json.url travel_prem_url(travel_prem, format: :json)
