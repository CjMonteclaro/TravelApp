class CreateTravelPrems < ActiveRecord::Migration[5.1]
  def change
    create_table :travel_prems do |t|
      t.references :destination_class, foreign_key: true
      t.references :travel_period, foreign_key: true
      t.decimal :premium, precision: 10, scale: 2
      t.string :prem_type
      t.date :from
      t.date :to

      t.timestamps
    end
  end
end
