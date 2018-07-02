class CreateTravellers < ActiveRecord::Migration[5.1]
  def change
    create_table :travellers do |t|
      t.references :quote, foreign_key: true
      t.references :policy#, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.date :birthdate
      t.integer :age
      t.string :beneficiary
      t.boolean :privacy_opt_in
      t.references :travel_prem, foreign_key: true
      t.decimal :base_prem, precision: 10, scale: 2
      t.decimal :total_charges, precision: 10, scale: 2
      t.decimal :gross_prem, precision: 10, scale: 2

      t.timestamps
    end
  end
end
