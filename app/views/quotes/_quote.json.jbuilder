json.extract! quote, :id, :user_id, :start_date, :end_date, :schengen_end_date, :duration, :destination_class_id, :traveller_type_id, :travellers_count, :policies_count, :travel_prem_id, :base_prem, :total_charges, :gross_prem, :policy_issued, :created_at, :updated_at
json.url quote_url(quote, format: :json)
