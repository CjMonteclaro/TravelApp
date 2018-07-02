class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.date :birthdate
      t.string :address1
      t.string :address2
      t.integer :city_id
      t.integer :province_id
      t.integer :zip_code
      t.integer :area_code
      t.integer :phone

      t.timestamps
    end
  end
end
