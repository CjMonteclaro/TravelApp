json.extract! profile, :id, :user_id, :first_name, :middle_name, :last_name, :birthdate, :address1, :address2, :city_id, :province_id, :zip_code, :area_code, :phone, :created_at, :updated_at
json.url profile_url(profile, format: :json)
