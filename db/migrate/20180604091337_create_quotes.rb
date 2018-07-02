class CreateQuotes < ActiveRecord::Migration[5.1]
  def change
    create_table :quotes do |t|
      t.references :user, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.date :schengen_end_date
      t.integer :duration
      t.references :destination_class, foreign_key: true
      t.references :traveller_type, foreign_key: true
      t.integer :travellers_count
      t.integer :policies_count
      t.references :travel_prem, foreign_key: true
      t.decimal :base_prem, precision: 10, scale: 2
      t.decimal :total_charges, precision: 10, scale: 2
      t.decimal :gross_prem, precision: 10, scale: 2
      t.date :policy_issued

      t.timestamps
    end
  end
end
